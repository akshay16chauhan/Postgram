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
    $storyID = $_POST['Story_ID'];
    $userProfileID = $_POST['UserProfileID'];
    $likes = $_POST['Likes'];
    $shares = $_POST['Shares'];
    $comments = $_POST['Comments'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO Story (Story_ID, UserProfileID, Likes, Shares, Comments) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("iiiii", $storyID, $userProfileID, $likes, $shares, $comments);

    // Execute
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Story added successfully']);
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
