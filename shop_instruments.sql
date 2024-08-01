-- Musical instrument store database

DROP DATABASE IF exists shop_instruments;
create database shop_instruments;
use shop_instruments;

CREATE TABLE Suppliers (
    ID_Supplier INT PRIMARY KEY,
    Name VARCHAR(255),
    Addres VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE Instruments (
    ID_Instrument INT PRIMARY KEY,
    Name VARCHAR(255),
    Typee VARCHAR(255),
    Brand VARCHAR(255),
    Price DECIMAL(10,2),
    ID_Supplier INT, 
    FOREIGN KEY (ID_Supplier) REFERENCES Suppliers (ID_Supplier)
);

CREATE TABLE Sales (
    ID_Sale INT PRIMARY KEY,
    Datee DATE,
    Total DECIMAL(10,2)
);

CREATE TABLE Details_Sales (
    ID_Detail INT PRIMARY KEY,
    ID_Sale INT,
    ID_Instrument INT,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (ID_Sale) REFERENCES Sales(ID_Sale),
    FOREIGN KEY (ID_Instrument) REFERENCES Instruments(ID_Instrument)
);

CREATE TABLE Customers (
    ID_Customer INT PRIMARY KEY,
    Name VARCHAR(255),
    Addres VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE Customers_Sales_Favourites (
    ID_Customer INT,
    ID_Sale INT,
    FOREIGN KEY (ID_Customer) REFERENCES Customers(ID_Customer),
    FOREIGN KEY (ID_Sale) REFERENCES Sales(ID_Sale),
    PRIMARY KEY (ID_Customer, ID_Sale),
    UNIQUE (ID_Customer) 
);

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
