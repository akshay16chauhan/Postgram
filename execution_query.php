<?php

header('Content-Type: application/json');

// Connect to your MySQL database
$host = 'localhost';
$db   = 'Postgram';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // ✅ Changed from FETCH_NUM to FETCH_ASSOC
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    echo json_encode(['error' => 'Database connection failed: ' . $e->getMessage()]);
    exit;
}

$query = $_POST['query'] ?? '';
$results = [];

$customQuery = $_POST['customQuery'] ?? '';
if (!empty($customQuery)) {
    try {
        $stmt = $pdo->query($customQuery);
        $results = $stmt->fetchAll();
        echo json_encode($results);
        exit;
    } catch (\PDOException $e) {
        echo json_encode(['error' => 'Invalid custom query: ' . $e->getMessage()]);
        exit;
    }
}

switch ($query) {
    case 'getAllPosts':
        $stmt = $pdo->query("SELECT Caption, Created_timestamp, Username 
                             FROM User_Post 
                             JOIN User_Profile USING(UserProfileID)");
        $results = $stmt->fetchAll();
        break;

    case 'getUserDetails':
        $stmt = $pdo->query("SELECT Username, Email, DOB 
                             FROM User_Profile 
                             JOIN User USING(UserID)");
        $results = $stmt->fetchAll();
        break;

    case 'getRecentPosts':
        $stmt = $pdo->query("SELECT Caption, Created_timestamp, Username
                             FROM User_Post
                             JOIN User_Profile USING(UserProfileID)
                             ORDER BY Created_timestamp DESC
                             LIMIT 10");
        $results = $stmt->fetchAll();
        break;

    case 'queryUsersInMaharashtra':
        $stmt = $pdo->query("SELECT U.UserID, UP.First_Name, UP.Last_Name, UP.Username, U.Email, U.Mobile 
                             FROM User U 
                             JOIN User_Profile UP ON U.UserID = UP.UserID 
                             WHERE U.Address_state = 'Maharashtra'");
        $results = $stmt->fetchAll();
        break;

    case 'queryUsersUnder20':
        $stmt = $pdo->query("SELECT UserProfileID, First_Name, Last_Name, Username, Age 
                             FROM User_Profile 
                             WHERE Age < 20");
        $results = $stmt->fetchAll();
        break;

    case 'queryAvgPosts':
        $stmt = $pdo->query("SELECT AVG(num) AS AvgPostsPerUser FROM (
                                SELECT UP.UserID, COUNT(UPost.Post_id) AS num
                                FROM User_Post UPost 
                                JOIN User_Profile UP ON UPost.UserProfileID = UP.UserProfileID
                                GROUP BY UP.UserID ) AS Average_Post");
        $results = $stmt->fetchAll();
        break;

    case 'queryUsersNoLikes':
        $stmt = $pdo->query("SELECT UP.UserProfileID, UP.First_Name, UP.Last_Name, UP.Username
                             FROM User_Profile UP
                             LEFT JOIN Post_Like PL ON UP.UserProfileID = PL.UserProfileID
                             WHERE PL.UserProfileID IS NULL");
        $results = $stmt->fetchAll();
        break;

    case 'queryStoryAboveAvgLikes':
        $stmt = $pdo->query("SELECT S.UserProfileID, U.Username, U.First_Name, U.Last_Name, S.Likes
                             FROM Story S 
                             JOIN User_Profile U ON S.UserProfileID = U.UserProfileID
                             WHERE S.Likes > (
                                 SELECT SUM(S2.Likes) / COUNT(S2.Story_ID) 
                                 FROM Story S2)");
        $results = $stmt->fetchAll();
        break;

    case 'queryYoungestFriendCircle':
        $stmt = $pdo->query("SELECT UP.Username, AVG(FriendProfile.Age) AS Avg_Friend_Age
                             FROM Friendship F
                             JOIN User_Profile UP ON UP.UserProfileID = F.UserProfileID1
                             JOIN User_Profile FriendProfile ON FriendProfile.UserProfileID = F.UserProfileID2
                             GROUP BY UP.Username 
                             ORDER BY Avg_Friend_Age ASC 
                             LIMIT 1");
        $results = $stmt->fetchAll();
        break;

    case 'queryOldestNewestPosts':
        $stmt = $pdo->query("SELECT UP.Username, UP.First_Name, UP.Last_Name,
                             MIN(U.Created_timestamp) AS Oldest_Post, 
                             MAX(U.Created_timestamp) AS Newest_Post
                             FROM User_Post U
                             JOIN User_Profile UP ON U.UserProfileID = UP.UserProfileID
                             GROUP BY UP.Username");
        $results = $stmt->fetchAll();
        break;

    case 'queryLeastLikedPosts':
        $stmt = $pdo->query("SELECT U.Post_id
                             FROM User_Post U
                             LEFT JOIN Post_Like PL ON U.Post_id = PL.Post_id
                             GROUP BY U.Post_id
                             ORDER BY COUNT(PL.Post_Like_ID) ASC
                             LIMIT 3");
        $results = $stmt->fetchAll();
        break;

    case 'queryUsersNoStory':
        $stmt = $pdo->query("SELECT UP.Username, UP.First_Name, UP.Last_Name
                             FROM Story S 
                             RIGHT JOIN User_Profile UP ON UP.UserProfileID = S.UserProfileID
                             WHERE S.Story_ID IS NULL");
        $results = $stmt->fetchAll();
        break;

    case 'queryActiveUsers':
        $stmt = $pdo->query("SELECT 
                                MostActive.Username AS Most_Active_User,
                                MostActive.Total_Posts,
                                LeastActive.Username AS Least_Active_User,
                                LeastActive.Total_Posts
                             FROM 
                                (SELECT UP.Username, COUNT(U.Post_id) AS Total_Posts
                                 FROM User_Post U
                                 JOIN User_Profile UP ON U.UserProfileID = UP.UserProfileID
                                 GROUP BY UP.Username
                                 ORDER BY COUNT(U.Post_id) DESC
                                 LIMIT 1) MostActive
                             CROSS JOIN 
                                (SELECT UP.Username, COUNT(U.Post_id) AS Total_Posts
                                 FROM User_Post U
                                 JOIN User_Profile UP ON U.UserProfileID = UP.UserProfileID
                                 GROUP BY UP.Username
                                 ORDER BY COUNT(U.Post_id) ASC
                                 LIMIT 1) LeastActive");
        $results = $stmt->fetchAll();
        break;

    default:
        echo json_encode(['error' => 'Invalid query']);
        exit;
}

echo json_encode($results);

?>
