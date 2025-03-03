import socket

# Adresse et port du serveur
HOST = "127.0.0.1"
PORT = 65432

# Création du socket serveur
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
    server_socket.bind((HOST, PORT))
    server_socket.listen()

    print(f"Serveur en attente de connexion sur {HOST}:{PORT}...")

    while True:
        conn, addr = server_socket.accept()
        with conn:
            data = conn.recv(1024)
            if data:
                print("Touche reçue :", data.decode())
