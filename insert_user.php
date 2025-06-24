<?php
header('Content-Type: application/json');

try {
        
    $conn = mysqli_connect('localhost', 'root', '', 'postgram');

    // Check connection
    if ($conn->connect_error) {
        die(json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]));
    }

    // Get POST data
    $userID = $_POST['UserID'];
    $email = $_POST['Email'];
    $street = $_POST['Address_street'];
    $city = $_POST['Address_city'];
    $state = $_POST['Address_state'];
    $pincode = $_POST['Pincode'];
    $mobile = $_POST['Mobile'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO user (UserID, Email, Address_street, Address_city, Address_state, Pincode, Mobile) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("issssis", $userID, $email, $street, $city, $state, $pincode, $mobile);

    // Execute
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'User added successfully']);
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