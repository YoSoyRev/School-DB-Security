USE master;
GO

CREATE SERVER AUDIT [Audit_Escuela_Security]
TO FILE 
(
    FILEPATH = 'C:\Auditoria_SQL\Logs\',
    MAXSIZE = 1024 MB,
    MAX_ROLLOVER_FILES = 5,
    RESERVE_DISK_SPACE = OFF
)
WITH
(
    QUEUE_DELAY = 1000,
    ON_FAILURE = CONTINUE
);
GO

ALTER SERVER AUDIT [Audit_Escuela_Security] WITH (STATE = ON);
GO

USE SchoolSystemDB;
GO

CREATE DATABASE AUDIT SPECIFICATION [Audit_Spec_DatosSensibles]
FOR SERVER AUDIT [Audit_Escuela_Security]
    ADD (FAILED_LOGIN_GROUP),
    ADD (SCHEMA_OBJECT_CHANGE_GROUP),
    ADD (DATABASE_PRINCIPAL_CHANGE_GROUP),
    ADD (UPDATE ON OBJECT::dbo.Calificaciones BY [public]),
    ADD (SELECT ON OBJECT::dbo.Pagos BY [public])
WITH (STATE = ON);
GO