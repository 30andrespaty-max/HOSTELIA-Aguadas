Cdiff --git a/c:\Users\Usuario\OneDrive\Desktop\HOSTELIA\SQL/index.sql b/c:\Users\Usuario\OneDrive\Desktop\HOSTELIA\SQL/index.sql
--- a/c:\Users\Usuario\OneDrive\Desktop\HOSTELIA\SQL/index.sql
+++ b/c:\Users\Usuario\OneDrive\Desktop\HOSTELIA\SQL/index.sql
@@ -1,14 +1,41 @@
-CREATE DATABASE IF NOT EXISTS nombre_tu_bd
-  CHARACTER SET utf8mb4
-  COLLATE utf8mb4_unicode_ci;
+-- Base de datos principal
+CREATE DATABASE IF NOT EXISTS hostelia
+  DEFAULT CHARACTER SET utf8mb4
+  DEFAULT COLLATE utf8mb4_unicode_ci;
+
+USE hostelia;
 
-USE nombre_tu_bd;
+-- Hoteles disponibles (para los menús y fichas)
+CREATE TABLE IF NOT EXISTS hoteles (
+  id INT AUTO_INCREMENT PRIMARY KEY,
+  nombre VARCHAR(120) NOT NULL,
+  slug VARCHAR(80) NOT NULL UNIQUE,
+  descripcion TEXT,
+  direccion VARCHAR(160),
+  telefono VARCHAR(40),
+  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
+) ENGINE=InnoDB;
 
+-- Reservas hechas desde la web
 CREATE TABLE IF NOT EXISTS reservas (
   id INT AUTO_INCREMENT PRIMARY KEY,
+  hotel_id INT NULL,
   nombre VARCHAR(120) NOT NULL,
-  telefono VARCHAR(30) NOT NULL,
-  fecha DATE NOT NULL,
+  correo VARCHAR(160),
+  telefono VARCHAR(40),
+  fecha_llegada DATE NOT NULL,
+  fecha_salida DATE NULL,
   mensaje TEXT,
-  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-);
+  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
+  CONSTRAINT fk_reservas_hotel
+    FOREIGN KEY (hotel_id) REFERENCES hoteles(id)
+      ON UPDATE CASCADE
+      ON DELETE SET NULL
+) ENGINE=InnoDB;
+
+-- Datos mínimos de ejemplo para probar rápidamente
+INSERT IGNORE INTO hoteles (nombre, slug, descripcion, direccion, telefono) VALUES
+  ('Hostelia Aguadas', 'hostelia-aguadas', 'Casa anfitriona en el centro.', 'Calle 9 #4-33, Centro histórico', '+57 310 390 2795'),
+  ('Hotel Casa Blanca', 'hotel-casa-blanca', 'Ambiente clásico y tour al casco histórico.', 'A una cuadra del parque principal', '+57 320 000 1122'),
+  ('Hotel El Dorado', 'hotel-el-dorado', 'Estilo colonial y atención familiar.', 'Av. Real #12-45, Centro', '+57 310 390 2795'),
+  ('Hotel Entre Brumas', 'hotel-entre-brumas', 'Vistas de montaña y tranquilidad.', 'Vía panorámica, sector La Bruma', '+57 311 555 8899');

