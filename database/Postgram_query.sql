use Postgram;

-- 1. Find all the users who lives in the state Maharashtra
select U.UserID, UP.First_Name, UP.Last_Name, UP.Username, U.Email, U.Mobile 
from User U JOIN User_Profile UP on U.UserID = UP.UserID 
where U.Address_state = 'Maharashtra';


-- 2. Find all the users whose Age is less than 20 years
select UserProfileID, First_Name, Last_Name, Username, Age
from user_profile where Age < 20;


-- 3. Find the average no. of post posted by users
SELECT AVG(num) AS AvgPostsPerUser
FROM ( SELECT UP.UserID, COUNT(UPost.Post_id) AS num
    FROM User_Post UPost JOIN User_Profile UP ON UPost.UserProfileID = UP.UserProfileID
    GROUP BY UP.UserID ) AS Average_Post;


-- 4. Find the users who have not liked any post
SELECT UP.UserProfileID, UP.First_Name, UP.Last_Name, UP.Username
FROM User_Profile UP
LEFT JOIN Post_Like PL ON UP.UserProfileID = PL.UserProfileID
WHERE PL.UserProfileID IS NULL;


-- 5. Find all the users whose likes on their story are greater than the average story likes
SELECT S.UserProfileID, U.Username, U.First_Name, U.Last_Name, S.Likes
FROM Story S JOIN User_Profile U ON S.UserProfileID = U.UserProfileID
WHERE S.Likes > (
    SELECT SUM(S2.Likes) / COUNT(S2.Story_ID) FROM Story S2
);


-- 6. Remove the video from post which has song name as rain.mp4
UPDATE User_Post SET Video = NULL
WHERE Video = 'rain.mp4';

select * FROM User_Post;


-- 7. Find the username which has youngest friend circle
SELECT UP.Username, AVG(FriendProfile.Age) AS Avg_Friend_Age
FROM Friendship F
JOIN User_Profile UP ON UP.UserProfileID = F.UserProfileID1
JOIN User_Profile FriendProfile ON FriendProfile.UserProfileID = F.UserProfileID2
GROUP BY UP.Username ORDER BY Avg_Friend_Age ASC
LIMIT 1;


-- 8. Find the Oldest and Newest Post uploaded by each User
SELECT UP.Username, UP.First_Name, UP.Last_Name,
MIN(U.Created_timestamp) AS Oldest_Post, 
MAX(U.Created_timestamp) AS Newest_Post
FROM User_Post U
JOIN User_Profile UP ON U.UserProfileID = UP.UserProfileID
GROUP BY UP.Username;


-- 9. Find User post which has minimum no. of likes 
-- if there are multiple, then select the top 3 posts
SELECT U.Post_id
FROM User_Post U
LEFT JOIN Post_Like PL ON U.Post_id = PL.Post_id
GROUP BY U.Post_id
ORDER BY COUNT(PL.Post_Like_ID) ASC
LIMIT 3;


-- 10. Find all the users who have never uploaded a story
SELECT UP.Username, UP.First_Name, UP.Last_Name
FROM Story S RIGHT JOIN User_Profile UP 
ON UP.UserProfileID = S.UserProfileID
WHERE S.Story_ID IS NULL;


-- 11. Delete all those comments in which User commented about rain
DELETE FROM Post_Comment 
WHERE Text_commented LIKE '%rain%';
 
select * from Post_Comment;


 -- 12. Find the Most and Least Active Users in Terms of Posts and Likes
  
SELECT 
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
     LIMIT 1) LeastActive;
    




-- LLM generated Queries

-- 1. Find the total number of users who have made at least one post in the last 30 days

-- Incorrect query
SELECT COUNT(up.Username) AS TotalUsers
FROM User_Profile up
JOIN User_Post p ON up.UserProfileID = p.UserProfileID
WHERE p.Created_timestamp >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- Corrected query
SELECT COUNT(DISTINCT UserProfileID) AS TotalUsers
FROM User_Post 
WHERE Created_timestamp >= NOW() - INTERVAL 30 DAY;



-- 2. Retrieve all users who have never commented on a post but have liked at least one post

-- Incorrect query
SELECT u.UserID, u.Email
FROM User u
JOIN User_Profile up ON u.UserID = up.UserID
JOIN Post_Like pl ON up.UserProfileID = pl.UserProfileID
LEFT JOIN Post_Comment pc ON up.UserProfileID = pc.UserProfileID
WHERE pc.UserProfileID IS NOT NULL;

-- Corrected query
SELECT DISTINCT p.UserProfileID 
FROM Post_Like p 
LEFT JOIN Post_Comment c ON p.UserProfileID = c.UserProfileID 
WHERE c.UserProfileID IS NULL;




-- 3. Find all the users who have posted more than 10 posts. If not found, then return NULL.

-- Incorrect query
SELECT up.Username, up.First_Name, up.Last_Name
FROM User_Profile up 
JOIN User_Post p ON up.UserProfileID = p.UserProfileID
GROUP BY up.UserProfileID
HAVING COUNT(p.Post_id) > 10;

-- Correct query
SELECT up.Username, up.First_Name, up.Last_Name
FROM User_Profile up 
JOIN User_Post p ON up.UserProfileID = p.UserProfileID
GROUP BY up.UserProfileID
HAVING COUNT(p.Post_id) > 10
UNION
SELECT NULL, NULL, NULL
WHERE NOT EXISTS (
    SELECT 1 FROM User_Profile up 
	JOIN User_Post p ON up.UserProfileID = p.UserProfileID
	GROUP BY up.UserProfileID
    HAVING COUNT(p.Post_id) > 10
);

