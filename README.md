# School-DB-Security
Diseño de arquitectura segura para gestión de datos académicos, aplicando principios de 'Privacidad por Diseño', hardening de servidores SQL y mitigación de vulnerabilidades como Inyección SQL

```mermaid
graph TD
    subgraph "Nivel 1: Red & Transporte"
        A[Usuario Remoto] -- "TLS 1.2 (Canal Seguro)" --> B(Firewall / WAF)
        B -- "Puerto No Estándar" --> C[Servidor SQL]
    end

    subgraph "Nivel 2: Aplicación & Autenticación"
        C --> D{Login Seguro}
        D -- "Bcrypt (Hashing)" --> E[Validación de Password]
        E -- "Prepared Statements" --> F[Prevención SQL Injection]
    end

    subgraph "Nivel 3: Base de Datos & Autorización"
        F --> G{RBAC: Roles}
        G -- "Rol Docente" --> H[(Datos Académicos)]
        G -- "Rol Finanzas" --> I[(Datos Pagos)]
        G -- "Rol Admin" --> J[(Configuración)]
    end

    subgraph "Nivel 4: Protección de Datos"
        H -.-> K[Auditoría de Logs]
        I -.-> K
        I --- L["Cifrado TDE (AES-256)"]
    end

    style A fill:#f9f,stroke:#333,stroke-width:2px
    style L fill:#ffcccb,stroke:#f00,stroke-width:2px
    style K fill:#ccf,stroke:#333,stroke-width:2px
```
