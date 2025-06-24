use Postgram;

INSERT INTO User (UserID, Email, Address_street, Address_city, Address_state, Pincode, Mobile) VALUES
(1, 'rohan.sharma@gmail.com', 'MG Road', 'Mumbai', 'Maharashtra', 400001, '9876543210'),
(2, 'priya.verma@yahoo.com', 'Brigade Road', 'Bangalore', 'Karnataka', 560001, '9812345678'),
(3, 'anil.kumar@rediffmail.com', 'Connaught Place', 'Delhi', 'Delhi', 110001, '9922334455'),
(4, 'sneha.mehta@outlook.com', 'Salt Lake', 'Kolkata', 'West Bengal', 700091, '9933445566'),
(5, 'vishal.patel@gmail.com', 'Satellite Road', 'Ahmedabad', 'Gujarat', 380015, '9871234567'),
(6, 'meera.nair@gmail.com', 'Marine Drive', 'Mumbai', 'Maharashtra', 400002, '9898765432'),
(7, 'rahul.jain@live.com', 'T Nagar', 'Chennai', 'Tamil Nadu', 600017, '9955667788'),
(8, 'deepika.singh@icloud.com', 'Banjara Hills', 'Hyderabad', 'Telangana', 500034, '9776655443'),
(9, 'amit.yadav@xyz.com', 'Park Street', 'Kolkata', 'West Bengal', 700016, '9667788990'),
(10, 'neha.kapoor@abc.com', 'Sector 62', 'Noida', 'Uttar Pradesh', 201301, '9888877665');

INSERT INTO User (UserID, Email, Address_street, Address_city, Address_state, Pincode, Mobile) VALUES
(11, 'arjun.reddy@gmail.com', 'Jubilee Hills', 'Hyderabad', 'Telangana', 500033, '9123456789'),
(12, 'kavita.singh@yahoo.com', 'Gomti Nagar', 'Lucknow', 'Uttar Pradesh', 226010, '9111223344'),
(13, 'rajesh.malhotra@gmail.com', 'Sector 17', 'Chandigarh', 'Punjab', 160017, '9988776655'),
(14, 'pooja.gupta@outlook.com', 'Vaishali Nagar', 'Jaipur', 'Rajasthan', 302021, '9876541230'),
(15, 'suresh.rao@rediffmail.com', 'MG Road', 'Pune', 'Maharashtra', 411001, '9871236540'),
(16, 'ananya.desai@gmail.com', 'Law Garden', 'Ahmedabad', 'Gujarat', 380006, '9876543211'),
(17, 'vikram.singh@yahoo.com', 'Sector 18', 'Noida', 'Uttar Pradesh', 201301, '9876543212'),
(18, 'divya.sharma@live.com', 'Bandra West', 'Mumbai', 'Maharashtra', 400050, '9876543213'),
(19, 'karan.jain@gmail.com', 'Anna Nagar', 'Chennai', 'Tamil Nadu', 600040, '9876543214'),
(20, 'shreya.verma@icloud.com', 'Salt Lake', 'Kolkata', 'West Bengal', 700091, '9876543215'),
(21, 'aditya.kapoor@xyz.com', 'Sector 22', 'Gurgaon', 'Haryana', 122001, '9876543216'),
(22, 'nisha.yadav@abc.com', 'Rajajinagar', 'Bangalore', 'Karnataka', 560010, '9876543217'),
(23, 'mohit.sharma@gmail.com', 'Sector 45', 'Chandigarh', 'Punjab', 160047, '9876543218'),
(24, 'ritu.gupta@yahoo.com', 'Vasant Kunj', 'Delhi', 'Delhi', 110070, '9876543219'),
(25, 'akash.patel@outlook.com', 'Ambawadi', 'Ahmedabad', 'Gujarat', 380015, '9876543220');



INSERT INTO Login (Login_id, Login_username, Login_password, UserID) VALUES
(1, 'rohan123', 'pass1234', 1),
(2, 'priya_v', 'securepass1', 2),
(3, 'anil_kr', 'mypass2024', 3),
(4, 'sneha_m', 'snehapass', 4),
(5, 'vishal_p', 'patelpass', 5),
(6, 'meera_n', 'nairpassword', 6),
(7, 'rahul_j', 'jainsecure', 7),
(8, 'deepika_s', 'deepikapass', 8),
(9, 'amit_y', 'yadavpass', 9),
(10, 'neha_k', 'kapoorpass', 10);

INSERT INTO Login (Login_id, Login_username, Login_password, UserID) VALUES
(11, 'arjun_r', 'reddypass', 11),
(12, 'kavita_s', 'kavitapass', 12),
(13, 'rajesh_m', 'malhotrapass', 13),
(14, 'pooja_g', 'poojapass', 14),
(15, 'suresh_r', 'raopass', 15),
(16, 'ananya_d', 'desaipass', 16),
(17, 'vikram_s', 'vikrampass', 17),
(18, 'divya_s', 'divyapass', 18),
(19, 'karan_j', 'karanpass', 19),
(20, 'shreya_v', 'shreyapass', 20),
(21, 'aditya_k', 'adityapass', 21),
(22, 'nisha_y', 'nishapass', 22),
(23, 'mohit_s', 'mohitpass', 23),
(24, 'ritu_g', 'ritupass', 24),
(25, 'akash_p', 'akashpass', 25);



INSERT INTO User_Profile (UserProfileID, UserID, Username, First_Name, Last_Name, DOB, Age) VALUES
(1, 1, 'rohan123', 'Rohan', 'Sharma', '2006-06-12', 29),
(2, 2, 'priya_verma', 'Priya', 'Verma', '1998-03-22', 26),
(3, 3, 'anil_kr', 'Anil', 'Kumar', '2002-08-15', 34),
(4, 4, 'sneha_mehta', 'Sneha', 'Mehta', '2003-12-05', 27),
(5, 5, 'vishal_p.55', 'Vishal', 'Patel', '2007-09-30', 31),
(6, 6, 'meera_n66', 'Meera', 'Nair', '1998-07-19', 28),
(7, 7, 'rahul_j678', 'Rahul', 'Jain', '1999-05-08', 25),
(8, 8, 'deepika_s22', 'Deepika', 'Singh', '2005-11-25', 30),
(9, 9, 'amit_y', 'Amit', 'Yadav', '2001-04-14', 32),
(10, 10, 'neha_kk69', 'Neha', 'Kapoor', '2000-01-10', 33);

INSERT INTO User_Profile (UserProfileID, UserID, Username, First_Name, Last_Name, DOB, Age) VALUES
(11, 11, 'arjun_r', 'Arjun', 'Reddy', '1990-02-18', 34),
(12, 12, 'kavita_s', 'Kavita', 'Singh', '1997-07-25', 27),
(13, 13, 'rajesh_m', 'Rajesh', 'Malhotra', '1989-09-09', 35),
(14, 14, 'pooja_g', 'Pooja', 'Gupta', '1996-03-14', 28),
(15, 15, 'suresh_r', 'Suresh', 'Rao', '1994-11-30', 30),
(16, 16, 'ananya_d', 'Ananya', 'Desai', '1998-05-20', 26),
(17, 17, 'vikram_s', 'Vikram', 'Singh', '1993-08-12', 31),
(18, 18, 'divya_s', 'Divya', 'Sharma', '1997-12-01', 27),
(19, 19, 'karan_j', 'Karan', 'Jain', '1995-04-05', 29),
(20, 20, 'shreya_v', 'Shreya', 'Verma', '1996-06-18', 28),
(21, 21, 'aditya_k', 'Aditya', 'Kapoor', '1992-10-22', 32),
(22, 22, 'nisha_y', 'Nisha', 'Yadav', '1999-02-28', 25),
(23, 23, 'mohit_s', 'Mohit', 'Sharma', '1994-07-15', 30),
(24, 24, 'ritu_g', 'Ritu', 'Gupta', '1998-09-10', 26),
(25, 25, 'akash_p', 'Akash', 'Patel', '1993-03-25', 31);

SET SQL_SAFE_UPDATES = 0;
UPDATE User_Profile SET Age = DATEDIFF(CURDATE(), DOB) / 365;   -- Age is derived attribute from DOB



INSERT INTO User_Post (Post_id, UserProfileID, Caption, Created_timestamp, Image, Video) VALUES
(1, 1, 'Sunset at Marine Drive', NOW(), 'sunset.jpg', NULL),
(2, 2, 'Bangalore weather is amazing!', '2024-02-14 12:45:30', NULL, 'rain.mp4'),
(3, 3, 'Delhi’s street food is the best!', NOW(), 'chaat.jpg', NULL),
(4, 4, 'Victoria Memorial in Kolkata', NOW(), 'victoria.jpg', NULL),
(5, 5, 'Ahmedabad Kite Festival', NOW(), NULL, 'kite_festival.mp4'),
(6, 6, 'Gateway of India vibes!', '2024-06-22 09:45:30', 'gateway.jpg', NULL),
(7, 7, 'Chennai Marina Beach!', NOW(), 'marina.jpg', NULL),
(8, 8, 'Hyderabad Biryani is unbeatable!', NOW(), 'biryani.jpg', NULL),
(9, 9, 'Kolkata Durga Puja','2025-02-14 13:45:30', 'durga_puja.jpg', NULL),
(10, 10, 'Taj Mahal visit after ages!', NOW(), 'tajmahal.jpg', NULL),
(11, 5, 'Manali is heaven', NOW(), 'mountain.png', NULL),
(12, 1, 'First day at my College with friends', '2025-01-28 17:05:22', NULL, 'college.mp4'),
(13, 8, 'Kashmir is love', NOW(), 'pic.jpg', NULL);

INSERT INTO User_Post (Post_id, UserProfileID, Caption, Created_timestamp, Image, Video) VALUES
(14, 14, 'Jaipur Fort visit', NOW(), 'jaipur_fort.jpg', NULL),
(15, 15, 'Pune monsoon vibes', NOW(), NULL, 'monsoon.mp4'),
(16, 5, 'Ahmedabad Heritage Walk', NOW(), 'heritage.jpg', NULL),
(17, 17, 'Noida Metro Ride', NOW(), 'metro.jpg', NULL),
(18, 18, 'Mumbai Local Train', NOW(), 'local_train.jpg', NULL),
(19, 9, 'Chennai Temple Visit', NOW(), 'temple.jpg', NULL),
(20, 20, 'Kolkata Howrah Bridge', NOW(), 'howrah.jpg', NULL),
(21, 21, 'Gurgaon Nightlife', NOW(), 'nightlife.jpg', NULL),
(22, 22, 'Bangalore Tech Park', NOW(), 'tech_park.jpg', NULL),
(23, 20, 'Chandigarh Rose Garden', NOW(), 'rose_garden.jpg', NULL),
(24, 22, 'Delhi Qutub Minar', NOW(), 'qutub_minar.jpg', NULL),
(25, 25, 'Ahmedabad Sabarmati Ashram', NOW(), 'ashram.jpg', NULL);



INSERT INTO Friendship (UserProfileID1, UserProfileID2) VALUES
(1, 2),
(3, 8),
(5, 1),
(7, 8),
(9, 10),
(2,10);

INSERT INTO Friendship (UserProfileID1, UserProfileID2) VALUES
(11, 12), (13, 14), (15, 16), (17, 18),(19, 20), (21, 22), (23, 24), 
(25, 1), (2, 3), (4, 5), (6, 7), (8, 9), (10, 11), (12, 13),(14, 15), 
(16, 17), (18, 19), (20, 21), (22, 23);



INSERT INTO Post_Like (Post_Like_ID, Post_id, UserProfileID, Time_stamp) VALUES
(1, 1, 2, NOW()),
(2, 2, 3, NOW()),
(3, 3, 4, NOW()),
(4, 4, 5, NOW()),
(5, 5, 6, NOW()),
(6, 6, 7, NOW()),
(7, 7, 8, NOW());

INSERT INTO Post_Like (Post_Like_ID, Post_id, UserProfileID, Time_stamp) VALUES
(8, 8, 9, NOW()), (9, 9, 10, NOW()), (10, 10, 11, NOW()),
(11, 11, 8, NOW()), (12, 12, 13, NOW()), (13, 2, 8, NOW()), (14, 14, 15, NOW()), (15, 15, 16, NOW()),
(16, 16, 11, NOW()), (17, 17, 18, NOW()), (18, 18, 19, NOW()), (19, 24, 4, NOW()), (20, 20, 21, NOW()),
(21, 21, 22, NOW()), (22, 18, 23, NOW()), (23, 23, 24, NOW()), (24, 24, 20, NOW()), (25, 25, 1, NOW());



INSERT INTO Post_Comment (Post_Comment_ID, Post_id, UserProfileID, Text_commented, Time_stamp) VALUES
(1, 1, 3, 'Beautiful view!', NOW()),
(2, 2, 4, 'Love the rain in Bangalore!', NOW()),
(3, 3, 5, 'Nothing beats Delhi chaat!', NOW()),
(4, 4, 6, 'Kolkata looks amazing!', NOW()),
(5, 5, 7, 'Kite festival is so much fun!', NOW()),
(6, 6, 8, 'Mumbai never disappoints!', NOW()),
(7, 7, 9, 'Great beach vibes!', NOW());

INSERT INTO Post_Comment (Post_Comment_ID, Post_id, UserProfileID, Text_commented, Time_stamp) VALUES
(8, 8, 10, 'Biryani is love!', NOW()),(9, 9, 11, 'Durga Puja is the best!', NOW()), 
(10, 10, 12, 'Taj Mahal is breathtaking!', NOW()),
(11, 11, 13, 'Manali is magical!', NOW()), (12, 12, 14, 'College memories!', NOW()),
(13, 13, 15, 'Kashmir is heaven!', NOW()), (14, 14, 16, 'Jaipur Fort is stunning!', NOW()),
(15, 15, 17, 'Pune rains are amazing!', NOW()), (16, 16, 18, 'Heritage walk was fun!', NOW()),
(17, 17, 19, 'Noida Metro is so convenient!', NOW()), (18, 18, 20, 'Mumbai locals are iconic!', NOW()),
(19, 19, 21, 'Chennai temples are peaceful!', NOW()), (20, 20, 22, 'Howrah Bridge is majestic!', NOW()),
(21, 21, 23, 'Gurgaon nightlife is lit!', NOW()), (22, 22, 24, 'Tech parks are futuristic!', NOW()),
(23, 23, 25, 'Rose Garden is beautiful!', NOW()), (24, 24, 1, 'Qutub Minar is historic!', NOW()),
(25, 25, 2, 'Sabarmati Ashram is inspiring!', NOW());



INSERT INTO Story (Story_ID, UserProfileID, Upload_time, Likes, Shares, Comments) VALUES
(1, 1, NOW(), 5, 2, 3),
(2, 2, NOW(), 7, 0, 4),
(3, 8, NOW(), 10, 3, 6),
(4, 3, NOW(), 2, 0, 1),
(5, 5, NOW(), 6, 2, 0);

INSERT INTO Story (Story_ID, UserProfileID, Upload_time, Likes, Shares, Comments) VALUES
(6, 6, NOW(), 8, 1, 5), (7, 7, NOW(), 9, 4, 7), (8, 8, NOW(), 12, 5, 8),
(9, 5, NOW(), 3, 0, 2), (10, 2, NOW(), 15, 6, 10), (11, 11, NOW(), 4, 1, 3), (12, 12, NOW(), 7, 2, 4),
(13, 13, NOW(), 11, 3, 6), (14, 14, NOW(), 5, 0, 2), (15, 15, NOW(), 9, 4, 5), (16, 16, NOW(), 6, 1, 3),
(17, 17, NOW(), 8, 2, 4), (18, 18, NOW(), 10, 3, 6), (19, 19, NOW(), 12, 5, 7), (20, 20, NOW(), 14, 6, 8),
(21, 21, NOW(), 7, 1, 4), (22, 20, NOW(), 9, 2, 5), (23, 4, NOW(), 11, 3, 6), (24, 24, NOW(), 13, 4, 7),
(25, 10, NOW(), 15, 5, 9);

