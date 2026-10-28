CREATE DATABASE IF NOT EXISTS Shopping_Management;
USE Shopping_Management;
CREATE TABLE Customers(
     Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
	 Customer_Name VARCHAR(100),
     Email VARCHAR(100) UNIQUE,
     Phone_No CHAR(10) NOT NULL UNIQUE,
     Age TINYINT CHECK(Age > 0),
	 Gender ENUM('Male','Female','Other'),
     Country VARCHAR(50) DEFAULT 'India',
     City VARCHAR(50) NOT NULL,
     Pin_Code Char(6) DEFAULT '201303',
     Registration_Date DATE DEFAULT (CURRENT_DATE),
	 Registraion_Time TIME DEFAULT (CURRENT_TIME),
     Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
     Address VARCHAR(250),
     Customer_Status ENUM('Active','Inactive','Blocked') DEFAULT 'Active',
     Customer_Notes TINYINT
	
);
INSERT INTO Customers(Customer_Name,Email,Phone_No,Age,Gender,City,Address,Customer_Notes)
VALUES
('Kashyap','kashyap9939@gmail.com','7549793862',24,'Male','Noida','Sector 15',3),
('Kashu','kashu9925@gmail.com','7549796532',22,'Female','Greater Noida','ADM',2);


SELECT * FROM Customers;
     CREATE TABLE Orders(
     Order_Id INT AUTO_INCREMENT,
     Customer_Id INT,
     Order_Date DATE DEFAULT(CURRENT_DATE),
     Order_Amount DECIMAL(10,2) NOT NULL,
     Order_Status ENUM('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
	 Payment_Method ENUM('Cash','Card','UPI','Net Banking'),
     Payment_Status ENUM('Pending','Paid','Failed') DEFAULT 'Pending',
     Shipping_Address VARCHAR(250) NOT NULL,
     Delivery_Pincode CHAR(6),
	 Quantity INT CHECK(Quantity > 0),
     Discount_Amount DECIMAL(10,2) DEFAULT '0',
     Delivery_Date DATE DEFAULT (CURRENT_DATE),
     Created_At DATETIME DEFAULT (CURRENT_TIMESTAMP),
     Tracking_Number VARCHAR(30) UNIQUE NOT NULL,
     Delivery_Status VARCHAR(20) DEFAULT 'Not Dispatched' 
     CHECK (
     Delivery_Status IN ('Not Dispatched','In Transit','Delivered','Returned')
     ),
     Order_Notes TINYINT,
     PRIMARY KEY (Order_Id),
     FOREIGN KEY (Customer_Id) 
     REFERENCES Customers(Customer_Id)
     ON DELETE CASCADE
     ON UPDATE CASCADE
     
);
INSERT INTO Orders(Customer_Id,Order_Amount,Payment_Method,Shipping_Address,
Delivery_Pincode,Quantity,Tracking_Number, Order_Notes)
VALUES
(1,2600.00,'UPI','Sector 15','726453',2,'637477380',2),
(1,2900.00,'Cash','Greater Noida','726728',4,'872892867',0);
SELECT * FROM Orders;




     
     
     
     

