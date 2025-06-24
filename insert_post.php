<?php
header('Content-Type: application/json');

try {
    // Create connection
    $conn = mysqli_connect('localhost', 'root', '', 'postgram');

    // Check connection
    if ($conn->connect_error) {
        die(json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]));
    }

    // Get POST data
    $postID = $_POST['Post_id'];
    $userProfileID = $_POST['UserProfileID'];
    $caption = $_POST['Caption'];
    $image = $_POST['Image'];
    $video = $_POST['Video'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO User_Post (Post_id, UserProfileID, Caption, Image, Video) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("iisss", $postID, $userProfileID, $caption, $image, $video);

    // Execute
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Post added successfully']);
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
