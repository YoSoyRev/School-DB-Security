# Guía de Implementación: Transparent Data Encryption (TDE)

**Objetivo:** Proteger los archivos físicos de la base de datos mediante cifrado en reposo. Si un atacante roba el disco duro del servidor, no podrá restaurar ni leer la base de datos sin el certificado de seguridad.

**Algoritmo:** AES-256.

## Procedimiento de Implementación (Ejemplo T-SQL)

### Paso 1: Crear la Llave Maestra del Servidor (Master Key)
Esta llave protege a todas las demás llaves en el servidor.
```sql
USE master;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password_Extremadamente_Seguro_2025!';
GO