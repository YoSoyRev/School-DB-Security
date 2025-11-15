# Clasificación de Datos - Sistema Escolar

| Campo | Descripción | Clasificación | Requisito de Seguridad |
| :--- | :--- | :--- | :--- |
| `id_alumno` | Matrícula interna | Interno | Solo lectura para Docentes |
| `curp_alumno` | Identificador gubernamental | **Confidencial** | Enmascaramiento (Masking) |
| `calificaciones` | Historial académico | Interno | Integridad (No modificable sin log) |
| `tarjeta_credito` | Datos de pago padres | **Restringido** | Cifrado en reposo (AES-256) + PCI DSS |
| `direccion` | Domicilio físico | Confidencial | Acceso solo Administración |
| `password_hash` | Contraseña de acceso | **Crítico** | Hashing (Bcrypt/Argon2) |