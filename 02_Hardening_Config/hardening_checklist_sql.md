# Checklist de Hardening para Servidor de Base de Datos (SQL)

Este documento detalla los controles de seguridad aplicados al servidor DBMS (Database Management System) antes de ponerlo en producción.

## 1. Configuración de Red y Sistema Operativo
- [ ] **Puertos:** Se cambió el puerto por defecto (ej. 1433/3306) a uno no estándar.
- [ ] **Firewall:** Solo se permiten conexiones entrantes desde la IP del Servidor de Aplicaciones y la VPN de Administradores.
- [ ] **Servicios:** Se deshabilitaron servicios innecesarios (ej. SQL Browser, xp_cmdshell).

## 2. Autenticación y Usuarios
- [ ] **Usuario SA/Root:** La cuenta `sa` o `root` está renombrada o deshabilitada para acceso remoto.
- [ ] **Contraseñas:** Se aplica política de complejidad (Mínimo 12 caracteres, alfanumérico + símbolos).
- [ ] **Cuentas huérfanas:** Se eliminaron usuarios de prueba y cuentas de empleados que ya no laboran.

## 3. Cifrado y Transporte
- [ ] **TLS:** Se fuerza el uso de TLS 1.2 o 1.3 para todas las conexiones cliente-servidor.
- [ ] **Datos en Reposo:** TDE (Transparent Data Encryption) habilitado para bases de datos críticas.

## 4. Parcheo y Mantenimiento
- [ ] **Versión:** El motor de base de datos tiene instalado el último Service Pack / Parche de seguridad.
- [ ] **Backups:** Los archivos de respaldo están cifrados y almacenados fuera del servidor principal.