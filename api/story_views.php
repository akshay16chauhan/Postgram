<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
require_once '../config.php';

try {
    $stmt = $pdo->query("SELECT * FROM story_views");
    $story_views = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($story_views);
} catch(PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?> 