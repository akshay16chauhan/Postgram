<?php
header('Content-Type: application/json');

try {
        
    $conn = mysqli_connect('localhost', 'root', '', 'postgram');

    // Check connection
    if ($conn->connect_error) {
        die(json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]));
    }

    // Get POST data
    $loginID = $_POST['Login_id'];
    $username = $_POST['Login_username'];
    $password = $_POST['Login_password'];
    $userID = $_POST['UserID'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO login (Login_id, Login_username, Login_password, UserID) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("issi", $loginID, $username, $password, $userID);
    
    // Execute
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Login credentials added successfully']);
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

