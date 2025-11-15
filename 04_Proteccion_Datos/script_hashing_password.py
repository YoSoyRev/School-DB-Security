import bcrypt

def registrar_usuario(password_plano):
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(password_plano.encode('utf-8'), salt)
    return hashed_password

def verificar_login(password_ingresado, hash_guardado):
    if bcrypt.checkpw(password_ingresado.encode('utf-8'), hash_guardado):
        return True
    else:
        return False

if __name__ == "__main__":
    password_real = "EscuelaSegura2025!"
    
    print(f"[*] Registrando usuario con password: {password_real}")
    hash_db = registrar_usuario(password_real)
    print(f"[+] Password guardado en BD (Hash): {hash_db}")
    
    intento = "EscuelaSegura2025!"
    if verificar_login(intento, hash_db):
        print(f"[OK] Acceso Concedido para: {intento}")
    else:
        print(f"[X] Acceso Denegado")