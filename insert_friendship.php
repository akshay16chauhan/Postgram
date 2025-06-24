<?php
header('Content-Type: application/json');

try {
    // Connect to database
    $conn = new mysqli('localhost', 'root', '', 'postgram');

    // Check connection
    if ($conn->connect_error) {
        die(json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]));
    }

    // Get POST data
    $userProfileID1 = $_POST['f1'];
    $userProfileID2 = $_POST['f2'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO Friendship (UserProfileID1, UserProfileID2) VALUES (?, ?)");
    $stmt->bind_param("ii", $userProfileID1, $userProfileID2);

    // Execute
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Friendship added successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Error: ' . $stmt->error]);
    }

    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage()
    ]);
}
?>
