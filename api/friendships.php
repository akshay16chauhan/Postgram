<?php
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

require_once '../config.php';

try {
    $sql = "
        SELECT 
            f.UserProfileID1,
            u1.username AS Username1,
            f.UserProfileID2,
            u2.username AS Username2
        FROM friendship f
        JOIN user_profile u1 ON f.UserProfileID1 = u1.UserProfileID
        JOIN user_profile u2 ON f.UserProfileID2 = u2.UserProfileID
    ";
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    
    $friendships = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($friendships, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}
?>
