-- Musical instrument store database
-- 1. We create the database:
-- 2. We use the database:
DROP DATABASE IF exists shop_instruments;
create database shop_instruments;
use shop_instruments;

CREATE TABLE Suppliers (
    ID_Supplier INT PRIMARY KEY,
    Name VARCHAR(255),
    Addres VARCHAR(255),
    Phone VARCHAR(20)
);
-- Relation table -   Suppliers - instruments:
-- A supplier may supply multiple instruments, but an instrument may only be supplied by one supplier.

CREATE TABLE Instruments (
    ID_Instrument INT PRIMARY KEY,
    Name VARCHAR(255),
    Typee VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10,2),
    ID_Supplier INT, -- Column for the foreign key
    FOREIGN KEY (ID_Supplier) REFERENCES Suppliers (ID_Supplier) -- the Supplier_ID foreign key in the Instruments table, which references the Supplier_ID primary key in the Suppliers table. 
);

CREATE TABLE Sales (
    ID_Sale INT PRIMARY KEY,
    Datee DATE,
    Total DECIMAL(10,2)
);

-- Relation table - sales - details_sales:
-- A sale may include multiple sales details (for example, different instruments and their quantities), but each sales detail is associated with a single sale.

-- Relation table -   instruments - details_sales:
-- An instrument may appear in several sales details, a specific instrument may be sold on several occasions, but each sales detail refers to a single instrument.
Example in sales detail: 1 Fender-type guitar, 1 Yamaha-type guitar, etc.
-- Creating the table for the one-to-one relationship
CREATE TABLE Details_Sales (
    ID_Detail INT PRIMARY KEY,
    ID_Sale INT,
    ID_Instrument INT,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (ID_Sale) REFERENCES Sales(ID_Sale), --Sales_ID in Sales_Details is a foreign key that references Sales_ID in the Sales table.
    FOREIGN KEY (ID_Instrument) REFERENCES Instruments(ID_Instrument) -- Instrument_ID in Sales_Details is a foreign key that references Instrument_ID in the Instrument table.
);

CREATE TABLE Customers (
    ID_Customer INT PRIMARY KEY,
    Name VARCHAR(255),
    Addres VARCHAR(255),
    Phone VARCHAR(20)
);

-- Relation table -   customers - customers_sales_favourites:
-- Each customer can have only one favorite sale, and each favorite sale is assigned to only one customer.
CREATE TABLE Customers_Sales_Favourites (
    ID_Customer INT,
    ID_Sale INT,
    FOREIGN KEY (ID_Customer) REFERENCES Customers(ID_Customer),
    FOREIGN KEY (ID_Sale) REFERENCES Sales(ID_Sale),
    PRIMARY KEY (ID_Customer, ID_Sale),
    UNIQUE (ID_Customer) -- UNIQUE (Customer_ID) ensures one-to-one relationship between customers - customers_sales_favourites tables
);

-- 5. Table content:
INSERT INTO Suppliers values
(1, 'Yamaha Corporation', 'Hamamatsu, Shizuoka, Japan', '+81 53-460-2511'),
(2, 'Gibson Brands, Inc.', 'Nashville, Tennessee, USA', '+1 615-871-4500'),
(3, 'Fender Musical Instruments Corporation', 'Scottsdale, Arizona, USA', '+1 480-596-9690'),
(4, 'Roland Corporation', 'Hamamatsu, Shizuoka, Japan', '+81 53-428-3200'),
(5, 'Kawai Musical Instruments Manufacturing Co., Ltd.', 'Hamamatsu, Shizuoka, Japan', '+81 53-452-2211'),
(6, 'Steinway & Sons', 'Hamburg, Germany', '+49 40 307030'),
(7, 'Casio Computer Co., Ltd.', 'Tokyo, Japan', '+81 3-3342-1111'),
(8, 'Yamaha Music London', 'London, UK', '+44 20 8563 3434'),
(9, 'Gibson Guitar Corp.', 'Nashville, Tennessee, USA', '+1 615-871-4500'),
(10, 'Fender Europe GmbH', 'Düsseldorf, Germany', '+49 211 5406-0');

INSERT INTO Instruments VALUES
(1, 'Classic Piano', 'Keyboard', 'Yamaha', 50000.00, 1),
(2, 'Les Paul Electric Guitar', 'String', 'Gibson', 2000.00, 2),
(3, 'Jazz Bass', 'String', 'Fender', 1500.00, 3),
(4, 'Electronic Organ', 'Keyboard', 'Roland', 1200.00, 4),
(5, 'Digital Piano', 'Keyboard', 'Kawai', 3000.00, 5),
(6, 'Grand Piano', 'Keyboard', 'Steinway & Sons', 70000.00, 6),
(7, 'Portable Keyboard', 'Keyboard', 'Casio', 400.00, 7),
(8, 'Classic Violin', 'String', 'Yamaha', 800.00, 1),
(9, 'Ukulele', 'String', 'Gibson', 100.00, 2),
(10, 'Harmonica', 'Wind', 'Fender', 50.00, 3);

INSERT INTO  Sales VALUES
(1, '2024-01-01', 50000.00),
(2, '2024-01-02', 2000.00),
(3, '2024-01-03', 1500.00),
(4, '2024-01-04', 1200.00),
(5, '2024-01-05', 3000.00),
(6, '2024-01-06', 70000.00),
(7, '2024-01-07', 400.00),
(8, '2024-01-08', 800.00),
(9, '2024-01-09', 100.00),
(10, '2024-01-10', 50.00);

INSERT INTO Details_Sales VALUES
(1, 1, 1, 1, 50000.00),
(2, 2, 2, 1, 2000.00),
(3, 3, 3, 1, 1500.00),
(4, 4, 4, 1, 1200.00),
(5, 5, 5, 1, 3000.00),
(6, 6, 6, 1, 70000.00),
(7, 7, 7, 1, 400.00),
(8, 8, 8, 1, 800.00),
(9, 9, 9, 1, 100.00),
(10, 10, 10, 1, 50.00);


INSERT INTO Customers VALUES
(1, 'Juan Pérez', 'Calle Falsa 123', '+34 612345678'),
(2, 'María García', 'Avenida Siempre Viva 456', '+34 623456789'),
(3, 'Pedro Rodríguez', 'Paseo de Gracia 789', '+34 634567890'),
(4, 'Ana López', 'Calle de la Amargura 101', '+34 645678901'),
(5, 'Carlos Martínez', 'Plaza del Sol 23', '+34 656789012'),
(6, 'Sofía Ramírez', 'Calle de la Luna 45', '+34 667890123'),
(7, 'Miguel Torres', 'Paseo de las Estrellas 67', '+34 678901234'),
(8, 'Laura Sánchez', 'Avenida de los Sueños 89', '+34 689012345'),
(9, 'Rafael Jiménez', 'Calle del Desierto 10', '+34 690123456'),
(10, 'Elena Morales', 'Plaza de la Esperanza 11', '+34 691234567');

INSERT INTO Customers_Sales_Favourites VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- 6.1 --- 10 Simple Queries:

-- 1. Select all elements from a table
SELECT * FROM Instruments;


-- 2. Select elements from a table with a specific condition (even ID), will show the even IDs:
SELECT * FROM Instruments WHERE ID_Instrument % 2 = 0;


-- 3. Sort the results of a query (by price in descending order):
SELECT * FROM Instruments ORDER BY Price DESC;

-- 4. Limit the number of results (show only the first 5 results):
SELECT * FROM Instruments LIMIT 5;

-- 5. Search for elements that meet multiple conditions using logical operators (price greater than 1000 and type "String"):
SELECT * FROM Instruments WHERE Price > 1000 AND Typee = 'String';

-- 6. Search for elements that meet range conditions (price between 1000 and 5000):
SELECT * FROM Instruments WHERE Price BETWEEN 1000 AND 5000;

-- 7. Search for elements using patterns (names that contain "Piano"):
SELECT * FROM Instruments WHERE Name LIKE '%Piano%';

-- 8. Count the number of elements that meet a condition (number of string instruments):
SELECT COUNT(*) FROM Instruments WHERE Typee = 'String';

-- 9. Select elements with a simple join between two tables (information of instruments and their suppliers):
SELECT i.Name AS Instrument, i.Brand, s.Name AS Supplier, s.Addres 
FROM Instruments i 
JOIN Suppliers s ON i.ID_Supplier = s.ID_Supplier;

-- 10. Search for elements with null values (if there was a column that could have null values, for example, a "Price" column):
SELECT * FROM Instruments WHERE Price IS NULL;

-- 6.2 -- 10 Types of Complex Queries:


-- 1. Query with subquery: Find the names of the instruments sold in the favorite sale of the customer "Juan Pérez":
SELECT Name
FROM Instruments
WHERE ID_Instrument IN (
    SELECT ID_Instrument
    FROM Details_Sales
    WHERE ID_Sale = (SELECT ID_Sale FROM  customers_sales_favourites WHERE ID_Customer = (SELECT ID_Customer FROM Customers WHERE Name = 'Juan Pérez'))
);

-- 2. Query with JOIN: List all sales along with the details of the instruments sold:
SELECT V.ID_Sale, V.Datee, V.Total, I.Name AS Instrument, I.Brand, DV.Quantity, DV.Subtotal
FROM Sales V
JOIN details_sales DV ON V.ID_Sale = DV.ID_Sale
JOIN Instruments I ON DV.ID_Instrument = I.ID_Instrument;

-- 3. Aggregation (SUM): Calculate the total sales made by each supplier:
SELECT P.Name AS Supplier, SUM(DV.Subtotal) AS Total
FROM Suppliers P
JOIN Instruments I ON P.ID_Supplier = I.ID_Supplier
JOIN details_sales DV ON I.ID_Instrument = DV.ID_Instrument
GROUP BY P.Name;

-- 4. Aggregation (AVG): Calculate the average price of instruments by type:
SELECT Typee, AVG(Price) AS Average_Price
FROM Instruments
GROUP BY Typee;

-- 5. Aggregation (MIN and MAX): Find the minimum and maximum price of instruments sold in each sale:
SELECT DV.ID_Sale, MIN(I.Price) AS Minimum_Price, MAX(I.Price) AS Maximum_Price
FROM details_sales DV
JOIN Instruments I ON 	DV.ID_Instrument = I.ID_Instrument
GROUP BY DV.ID_Sale;

-- 6. Group filtering (HAVING): List the suppliers that have sold more than 10000 euros in total:
SELECT P.Name AS Supplier, SUM(DV.Subtotal) AS Total_Sales
FROM Suppliers P
JOIN Instruments I ON P.ID_Supplier = I.ID_Supplier
JOIN details_sales DV ON I.ID_Instrument = DV.ID_Instrument
GROUP BY P.Name
HAVING SUM(DV.Subtotal) > 10000;

-- 7. Query with combinations of JOINs and subqueries: Find the customers who have bought any instrument made by "Fender":
SELECT DISTINCT C.Name
FROM Customers C
JOIN customers_sales_favourites CSF ON C.ID_Customer = CSF.ID_Customer
JOIN details_sales DV ON CSF.ID_Sale = DV.ID_Sale
JOIN Instruments I ON DV.ID_Instrument = I.ID_Instrument
WHERE I.Brand = 'Fender';

-- 8. Subquery in the WHERE clause: List the instruments that have a price greater than the average price of all instruments:
SELECT Name, Price
FROM Instruments
WHERE Price > (SELECT AVG(Price) FROM Instruments);

-- 9. JOIN between multiple tables: List all sales details including the customer information who made the purchase:
SELECT V.ID_Sale, V.Datee, C.Name AS Customer, I.Name AS Instrument, SD.Quantity, SD.Subtotal
FROM Sales V
JOIN details_sales SD ON V.ID_Sale = SD.ID_Sale
JOIN Instruments I ON SD.ID_Instrument = I.ID_Instrument
JOIN customers_sales_favourites csf  ON V.ID_Sale = CSF.ID_Sale
JOIN Customers C ON CSF.ID_Customer = C.ID_Customer;


-- 10. Query with multiple JOINs and aggregation functions: Find the total number of instruments sold and the total sales by type of instrument:
SELECT I.Typee, COUNT(DS.ID_Instrument) AS Total_Instruments_Sold, SUM(DS.Subtotal) AS Total_Sales
FROM details_sales DS 
JOIN Instruments I ON DS.ID_Instrument = I.ID_Instrument
GROUP BY I.Typee;

-- 7. Triggers:

-- 7.1 Trigger to prevent sales with negative total:
DELIMITER //
CREATE TRIGGER Before_Insert_Sales
BEFORE INSERT ON Sales
FOR EACH ROW
BEGIN
    IF NEW.Total < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The sale total cannot be negative.';
    END IF;
END;
//
DELIMITER ;

-- 7.2 Trigger to update the subtotal in Sales_Details when the quantity is updated
DELIMITER //
CREATE TRIGGER Before_Update_Quantity
BEFORE UPDATE ON details_sales
FOR EACH ROW
BEGIN
    SET NEW.Subtotal = NEW.Quantity * (SELECT Price FROM Instruments WHERE ID_Instrument = NEW.ID_Instrument);
END;
//
DELIMITER ;


-- 8. Transactions
-- Implement a transaction that includes several data manipulation operations: insert a sale, update the total of the sale, and add the sales details:

-- Transaction that includes several data manipulation operations
START TRANSACTION;

-- Insert a new sale
INSERT INTO Sales (ID_Sale, Datee, Total) VALUES (11, '2024-08-01', 0.00);

-- Update the total of the sale after adding the details
UPDATE Sales SET Total = 3500.00 WHERE ID_Sale = 11;

-- Add sales details
INSERT INTO details_sales (ID_Detail, ID_Sale, ID_Instrument, Quantity, Subtotal)
VALUES (11, 11, 5, 1, 3500.00);

COMMIT;

-- 9. Functions:
-- Create at least 3 user-defined functions and ensure they are used in database operations:

-- Function to calculate the total of a sale
-- CalculateTotalSale: This function sums the subtotals of a specific sale and returns the total
DELIMITER //
CREATE FUNCTION CalculateSaleTotal(ID_Sale INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Subtotal) INTO total
    FROM details_sales 
    WHERE ID_Sale = ID_sale;
    RETURN total;
END;
//
DELIMITER ;

-- Function to get the supplier name of an instrument
-- GetSupplierName: Returns the name of the supplier who supplied a specific instrument
DELIMITER //
CREATE FUNCTION GetSupplierName(ID_Instrument INT) RETURNS VARCHAR(255)
BEGIN
    DECLARE supplier_name VARCHAR(255);
    SELECT s.Name INTO supplier_name
    FROM Suppliers s
    JOIN Instruments i ON s.ID_Supplier = i.ID_Supplier
    WHERE i.ID_Instrument = ID_instrument;
    RETURN supplier_name;
END;
//
DELIMITER ;

-- Function to get the total quantity of an instrument sold
-- Get Total Sold Quantity: Calculates the total quantity of a specific instrument that has been sold
DELIMITER //
CREATE FUNCTION GetTotalQuantitySold(i_ID_Instrument INT) RETURNS INT
BEGIN
    DECLARE total_quantity INT;
    SELECT SUM(Quantity) INTO total_quantity
    FROM details_sales
    WHERE ID_Instrument = i_ID_instrument;
    RETURN total_quantity;
END;
//
DELIMITER ;
