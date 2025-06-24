<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
require_once '../config.php';

try {
    $stmt = $pdo->query("SELECT * FROM story");
    $stories = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($stories);
} catch(PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?> 