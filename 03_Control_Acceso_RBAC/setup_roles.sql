CREATE ROLE 'Rol_Administrador';
CREATE ROLE 'Rol_Docente';
CREATE ROLE 'Rol_Finanzas';

GRANT SELECT ON Alumnos TO 'Rol_Docente';
GRANT SELECT, UPDATE ON Calificaciones TO 'Rol_Docente';
REVOKE ALL ON Pagos FROM 'Rol_Docente';

GRANT SELECT, INSERT, UPDATE ON Pagos TO 'Rol_Finanzas';
GRANT SELECT ON Alumnos TO 'Rol_Finanzas';
DENY UPDATE ON Calificaciones TO 'Rol_Finanzas';

CREATE USER 'Auditor_Interno' IDENTIFIED BY 'StrongPass!2025';
GRANT SELECT ON System_Logs TO 'Auditor_Interno';