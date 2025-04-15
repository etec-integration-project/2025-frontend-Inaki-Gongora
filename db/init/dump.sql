-- Dump of database "zephyr"
-- Generated example dump

CREATE DATABASE IF NOT EXISTS zephyr;
USE zephyr;

-- Table structure for table `productos`
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Example data for table `productos`
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Laptop', 'Laptop de alta gama con 16GB RAM y 512GB SSD', 1200.99, 10),
('Smartphone', 'Smartphone con pantalla AMOLED y 128GB de almacenamiento', 699.50, 25),
('Auriculares', 'Auriculares inalámbricos con cancelación de ruido', 199.99, 50),
('Monitor', 'Monitor 4K UHD de 27 pulgadas', 349.99, 15),
('Teclado Mecánico', 'Teclado mecánico retroiluminado RGB', 89.99, 30);