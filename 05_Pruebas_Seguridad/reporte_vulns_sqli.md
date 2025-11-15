# Reporte de Pruebas de Seguridad: Inyección SQL

**Fecha:** 15 Noviembre 2025  
**Objetivo:** Verificar vulnerabilidad de Inyección SQL en módulo de Login.

## 1. Hallazgo
Se detectó que el formulario de entrada de docentes no sanitizaba las entradas.
* **Vector de prueba:** `' OR '1'='1`
* **Resultado:** El sistema permitió el acceso sin contraseña (Bypass de autenticación).
* **Riesgo:** Crítico. Acceso total a la base de datos.

## 2. Remediación Implementada (Código Seguro)
Se modificó el código legacy para utilizar **Consultas Preparadas (Prepared Statements)**.

**Código Vulnerable (Antes):**
```python
query = "SELECT * FROM users WHERE user = '" + user + "'"

Código Seguro (Ahora):
 cursor.execute("SELECT * FROM users WHERE user = %s", (user,))