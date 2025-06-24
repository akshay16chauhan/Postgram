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
    $profileID = $_POST['UserProfileID'];
    $userID = $_POST['UserID'];
    $username = $_POST['Username'];
    $firstName = $_POST['First_Name'];
    $lastName = $_POST['Last_Name'];
    $dob = $_POST['DOB'];
    $age = $_POST['Age'];

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO User_Profile (UserProfileID, UserID, Username, First_Name, Last_Name, DOB, Age) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("iissssi", $profileID, $userID, $username, $firstName, $lastName, $dob, $age);

    // Execute
    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Profile added successfully']);
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
