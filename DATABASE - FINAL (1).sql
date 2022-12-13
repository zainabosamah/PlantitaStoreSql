create database Plantita_Store;
use Plantita_Store;

-- to show user privileges --
Show grants;

-- id start from 1 --
CREATE TABLE Employee (
  Fname char(20) NOT NULL,
  Lname char(30) NOT NULL,
  Employee_ID int NOT NULL,
  Working_Hours double DEFAULT NULL,
  Month_Salary double  DEFAULT NULL,
  Phone_number int  DEFAULT NULL,
  supervises_ID int  DEFAULT NULL,
  PRIMARY KEY (Employee_ID)
);
select * from Employee ; 


-- id start from 2 --
CREATE TABLE Vendor (
  Vendor_ID int  NOT NULL,
  Phone_number int  DEFAULT NULL,
  Salary double  DEFAULT NULL,
  Employee_ID int NOT NULL,
  PRIMARY KEY (Vendor_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID)
);
select * from Vendor ; 

-- relation Provides between Vendor and Products (M-N) --
CREATE TABLE Provides (
  Vendor_ID int  NOT NULL,
  Product_ID int  NOT NULL,
  FOREIGN KEY (Vendor_ID) REFERENCES Vendor (Vendor_ID),
  FOREIGN KEY (Product_ID) REFERENCES Products (Product_ID),
  primary key (Vendor_ID,Product_ID)
) ;
Select* from Provides; 


-- id start from 3 --
CREATE TABLE Products (
  Product_ID int  NOT NULL,
  Product_type char(30),
  Product_cost double  DEFAULT NULL,
  Product_stock int  DEFAULT NULL,
  Costumer_ID int  NOT NULL,
  FOREIGN KEY (Costumer_ID) REFERENCES Costumers (Costumer_ID),
  PRIMARY KEY (Product_ID)
);
select * From Products;

-- id start from 4 --
CREATE TABLE Costumers (
  Fname char(20) NOT NULL,
  Lname char(30) NOT NULL,
  Costumer_ID int  NOT NULL,
  -- are we gonna have the address as multi ? --
  Phone_number int  DEFAULT NULL,
  PRIMARY KEY (Costumer_ID)
) ;
select * from Costumers ;

-- need to make insert and fill this table --
-- cheack--
CREATE TABLE Costumer_Delivery_Address (
 Delivary_Address char(100) NOT NULL,
 Costumer_ID int  NOT NULL,
 FOREIGN KEY (Costumer_ID) REFERENCES Costumers (Costumer_ID),
 PRIMARY KEY (Delivary_Address) 
 );
select * from Costumer_Delivery_Address;

 
-- id start from 6 --
CREATE TABLE Payment (
  Payment_ID int  NOT NULL,
  Amount int  DEFAULT NULL,
  Credit char(30),
  Costumer_ID int  NOT NULL,
  FOREIGN KEY (Costumer_ID) REFERENCES Costumers (Costumer_ID),
  PRIMARY KEY (Payment_ID)
);
Select * from Payment;


-- id start from 7 --
-- Make sure about the cost & amount-- 
CREATE TABLE Shopping_Cart (
ShoppingCart_ID int  NOT NULL,
Order_Date date NOT NULL,
Product_ID int  NOT NULL,
Payment_ID int  NOT NULL,
SC_Amount int NOT NULL,
SC_Cost int NOT NULL,

PRIMARY KEY (ShoppingCart_ID,Product_ID,Payment_ID),
FOREIGN KEY (Product_ID) REFERENCES Products (Product_ID),
FOREIGN KEY (Payment_ID) REFERENCES Payment (Payment_ID)
);
Select * from Shopping_Cart ;


-- INSERT--
INSERT INTO Employee(Fname,Lname,Employee_ID,Working_Hours,Month_Salary,Phone_number,supervises_ID) VALUES
-- Supervisor id --
('sarah','alabbas','1006','10','7000','0550076115','1002'),
('Hala','Hamed','1000','5','7000','0555576453','1006'),
('Lama',' Aqahtani','1001','8', '8000','0508628881','1000'),
('Zainab','Albugeaey','1002','7','7000','0548573390','1001'),
('Maysa','Almontashri', '1003','8', '8000','0583088391','1001'),
('Ghadeer','Alqattan','1004','8','5000','0538805653','1006'),
('Madhawi','Safar','1005','8','7000','0583784984','1006'),
('Samar','Ali','1007','8','7000','0583784933','1001'),
('Shahad','Salman','1008','8','7000','0583785633','1001'),
('Bashyer','Almashaan','1009','7','5000','0583784000','1006');

-- end for Employee --

-- why don't we repeat here? --
INSERT INTO Vendor(Vendor_ID,Phone_number,Salary,Employee_ID) VALUES
('2000','0550376336','3500','1000'),
('2001','0528765361','3500','1000'),
('2002','0514892345','3500','1005'),
('2003','0583186746','3500','1002'),
('2004','0514236446','3500','1004'),
('2005','0574286076','3500','1008'),
('2006','0593524889','3500','1003'),
('2007','0572534926','3500','1003'),
('2008','0516373726','3500','1004'),
('2009','0510272537','3500','1006');
-- end for Vendor --

INSERT INTO  Provides ( Vendor_ID , Product_ID) VALUES
('2000', '3000'),('2000', '3001'),('2000', '3002'),('2000', '3003'),('2000', '3004'),
('2000', '3005'),('2000', '3006'),('2000', '3007'),('2000', '3008'),('2000', '3009'),
('2001', '3000'),('2001', '3001'),('2001', '3002'),('2001', '3003'),('2001', '3004'),
('2001', '3005'),('2001', '3006'),('2001', '3007'),('2001', '3008'),('2001', '3009'),
('2002', '3000'),('2002', '3001'),('2002', '3002'),('2002', '3003'),('2002', '3004'),
('2002', '3005'),('2002', '3006'),('2002', '3007'),('2002', '3008'),('2002', '3009');
-- end for Provides --

-- from here and down why don't we repeat the foreign keys? --
 -- here we need to add Costumer_ID --
INSERT INTO Products(Product_ID,Product_type,Product_cost,Product_stock,Costumer_ID) VALUES
('3000','dragon arum','250','70','4000'),
('3001','iris','230','20','4002'),
('3002','Rose','100','30','4003'),
('3003','African starfish','105','80','4006'),
('3004','lily','100','150','4008'),
('3005','orchid','150','150','4007'),
('3006','Anthurium','325','80','4005'),
('3007','zamia','190','150','4004'),
('3008','infernal','200','150','4009'),
('3009','snake plant','100','150','4001');
-- end for Products --

INSERT INTO Costumers(Fname,Lname,Costumer_ID,Phone_number) VALUES
('sarah','mohammad','4000','0583640395'),
('Haya','ahmed','4001','0567576453'),
('Layan','Aldamigh','4002','0583640395'),
('Mona','Salem','4003','0559639183'),
('Latifa','Alsulaiman','4004','0594759304'),
('Leen','Khalid','4005','0502302241'),
('Shahad','Alotaibi','4006','0583678293'),
('Shatha','Altamimi','4007','0563628693'),
('nouf','Alhamad','4008','0593748938'),
('Rahaf','mohammed','4009','0552479147');
INSERT INTO Costumers(Fname,Lname,Costumer_ID,Phone_number) VALUES
('Haifa','Safar','4010','0550344560');
-- end for Costumers --

--  fill this table --
INSERT INTO Payment(Payment_ID,Amount,Credit,Costumer_ID) VALUES
('6000','2','9847','4000'),
('6001','1','9743','4002'),
('6002','4','9749','4003'),
('6003','2','9028','4006'),
('6004','1','9950','4008'),
('6005','3','9826','4007'),
('6006','4','9297','4005'),
('6007','1','9764','4004'),
('6008','2','9947','4009'),
('6009','3','9204','4001');
-- end for Costumers --

--  fill this table --
INSERT INTO Shopping_Cart(ShoppingCart_ID,Order_Date,SC_Amount,SC_Cost,Product_ID,Payment_ID) VALUES
('7000','2022-4-19','2','250','3000','6000'),
('7001','2022-4-20','1','230','3001','6001'),
('7002','2022-4-20','4','100','3002','6002'),
('7003','2022-4-21','2','105','3003','6003'),
('7004','2022-4-22','1','100','3004','6004'),
('7005','2022-4-23','3','150','3005','6005'),
('7006','2022-4-22','4','325','3006','6006'),
('7007','2022-4-26','1','190','3007','6007'),
('7008','2022-4-29','2','200','3008','6008'),
('7009','2022-5-1','3','100','3009','6009');
-- end for Shopping_Cart --


INSERT INTO Costumer_Delivery_Address (Costumer_ID,Delivary_Address) VALUES
('4000','20 Rwadah st'),
('4001','17 Lahore st'),
('4002','23 Uroubah st'),
('4003','34 Peace st'),
('4004','48 Abu Bakr st'),
('4005','70 Najeeb Alzamil st'),
('4006','65 Othman Bin Affan st'),
('4007','83 Omar Bin ALkhattab st'),
('4008','65 King faisal road'),
('4009','88 Alziziah st');
-- Costumer_Delivery_Address --


-- DML Language -- 




-- transaction --
start transaction;
-- DELETE --
SET FOREIGN_KEY_CHECKS=0;
SET SQL_SAFE_UPDATES = 1;
-- Delete the Customer with an customer_id = 4010 [Primary key] --
delete from costumers
where Costumer_ID='4010';
select * from Costumers ;

-- Delete the product_id from table Shopping_Cart[Foreign key]--
delete from Shopping_Cart 
WHERE Product_ID='3000';
select * from Shopping_Cart ;
-- UPDATE --
UPDATE EMPLOYEE
SET Lname ='Alqattan'
WHERE Employee_ID ='1004';
SELECT* FROM EMPLOYEE;
rollback; -- or commit if we want the change to really happen -- 
-- end transaction --


-- to check transaction --
select * from Costumers ;
select * from Shopping_Cart ;
select * from EMPLOYEE ;


-- Basic Query --

-- Display the salary and phone number of vendores who contact with employee who have id 1000. --
SELECT Salary,Phone_number
FROM Vendor
Where Employee_ID like '1000';

-- Display Products price in descending order. --
   SELECT *
   FROM Products
   ORDER BY Product_cost desc;
   
  -- Display all information of Employee who doesn’t have a superviser. --
   SELECT * 
   FROM Employee
   where supervises_ID IS NUll;
   
   -- BETWEEN--
SELECT Product_type, Product_cost FROM products
WHERE Product_cost BETWEEN 100 and 250;
   
   
-- STORED PROCEDURE --
-- Create a simple Stored Procedure that returns some column from table Employee in some specific order --

DROP PROCEDURE IF EXISTS GetEmployee

DELIMITER $$
CREATE PROCEDURE GetEmployee()
    BEGIN
        SELECT 
        Employee_ID, 
        Fname, 
        Lname, 
        Working_Hours, 
        Month_Salary,
        Phone_number        
        FROM
        Employee
        ORDER BY Fname ;
    END $$
DELIMITER ;

Call GetEmployee();

DROP PROCEDURE IF EXISTS find_employee

OR 
Take Employee ID as an input and display all his\her information
USE plantita
Delimiter &&
CREATE PROCEDURE find_employee(IN Emp_ID int)
BEGIN
SELECT * FROM Employee 
WHERE Employee_ID = Emp_ID;
END &&
Delimiter ;

-- FUNCTIONS --
-- Display the number of products in plantita store --

DROP FUNCTION number_of_product

DELIMITER $$
CREATE FUNCTION number_of_product ()
RETURNS INTEGER
Deterministic

BEGIN
return(
select count(Product_ID)
From Products);
END $$
DELIMITER ;

-- VIEWS --

Drop view  if exists v_computedEmployee;

-- to compute the yearly salary -- 
CREATE VIEW v_computedEmployee AS
SELECT
Fname, 
Lname, 
Employee_ID, 
Working_Hours,
Month_Salary,
Phone_number,
supervises_ID,
(Month_Salary * 12) as Yearly_Salary
FROM Employee;

Drop view  if exists v_computedTotalCost;

-- to compute the total cost -- 
CREATE VIEW v_computedTotalCost AS
SELECT
ShoppingCart_ID, 
Order_Date,
Product_ID,
Payment_ID,
SC_Amount,
SC_Cost,
(SC_Cost * SC_Amount) as Total_Cost
FROM Shopping_Cart ;

-- to show each customer informations with their payment information -- 

drop view if exists view_customerr_payment;

CREATE VIEW view_customerr_payment AS
select costumers.Costumer_ID AS Costumer_ID,
costumers.Fname AS Fname,
costumers.Lname AS Lname,
Phone_number AS Phone_number,
payment.Payment_ID AS Payment_ID,
payment.Amount AS Amount,
payment.Credit AS Credit
 from ( costumers  left join payment on(payment.Costumer_ID = costumers.Costumer_ID));




-- Complex Query --

-- To retrieve Employee ID who conntact with vendors --

-- INTERSECTION --
SELECT Vendor_ID, Phone_number, Salary , Employee_ID
   FROM vendor
 WHERE Employee_ID IN (
    SELECT employee.Employee_ID
     FROM employee );


-- EXCEPT --
SELECT Employee.Fname,Employee.Lname
    FROM Employee
    WHERE Employee.Employee_ID NOT IN (
    SELECT Vendor.Employee_ID
    FROM Vendor);

-- UNION --
SELECT Employee_ID ,Month_Salary FROM Employee
where Month_Salary>7000 and Working_Hours=8
UNION
select Vendor_ID,Salary From Vendor 
where Salary>3000;

-- Aggregate Functions -Group by- Having --
SELECT 
    Employee.Employee_ID, Vendor_ID
FROM
    Employee
        INNER JOIN
    Vendor
WHERE
    Employee.Employee_ID = Vendor.Employee_ID
GROUP BY Vendor.Employee_ID
HAVING Vendor.Employee_ID = '1000';

--  Function (Aggregate -Group by- Having)  --
Select Employee.Employee_ID , Vendor_ID
from Employee Inner join Vendor
where Employee.Employee_ID=Vendor.Employee_ID
group by Vendor.Employee_ID
having Vendor.Employee_ID='1000';
        
-- To retrieve information about costumers and their delivery address --
-- Natural join --
SELECT *
FROM Costumers
NATURAL JOIN Costumer_Delivery_Address;

-- To retrieve information about  costumers names and the  their payment ID --
-- outer join --
SELECT Costumers.Fname, Payment.Payment_ID
FROM Costumers 
LEFT JOIN Payment
ON Costumers.Costumer_ID = Payment.Costumer_ID 
ORDER BY Costumers.Fname;

-- a trigger ahow a massage when trying to insert a record from Employee table that have working hours more than 8 hours--

delimiter $$
CREATE TRIGGER Max_WorkingHours
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
IF NEW.Working_Hours > '8'
THEN
SIGNAL SQLSTATE VALUE '02000' 
-- SIGNAL SQLSTATE '45000' --
SET MESSAGE_TEXT = 'Error: Tha max value of Employee working hours should should not be more than 8 hours';
END IF;
END$$
delimiter ;
drop TRIGGER Max_WorkingHours; 


-- insert valid working hours --
INSERT INTO Employee Value ('nourah','Saleh','1060','7','6000','0598849910','1002');
-- insert invalid working hours --
INSERT INTO Employee Value ('nourah','Saleh','1070','12','6000','0590840310','1006');
select * from EMPLOYEE ;



-- Nested queries --

-- To retrieve the shopping cart information for each order --
SELECT *
 FROM shopping_cart
  WHERE EXISTS(  SELECT *
    FROM products
 WHERE shopping_cart.Product_ID=products.Product_ID );
 

-- Retrieves the first and last names of the customers who ordered any product --

select Fname, Lname
from costumers AS C
where Costumer_ID IN( select Costumer_ID from products AS P
 where C.Costumer_ID = P.Costumer_ID);
