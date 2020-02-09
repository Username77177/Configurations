#!/usr/bin/env python3
import os, os.path
def package_man():
    packagemanager = ""
    while True:
        print("Ваш пакетный менеджер: [A]pt, [P]acman, [D]nf: ", end="")
        packagemanager = input()
        if packagemanager.lower() in {"a","p","d"}:
            break
    if packagemanager.lower() == "a":
        packagemanager = "sudo apt install "
    elif packagemanager.lower() == "p":
        packagemanager = "sudo pacman -Sy "
    else:
        packagemanager = "sudo dnf install "

    return(packagemanager)

def install_programming_languages(packagemanager):
        print("""
\t _
\t| |      __ _  _ __    __ _  _   _   __ _   __ _   ___  ___
\t| |     / _` || '_ \  / _` || | | | / _` | / _` | / _ \/ __|
\t| |___ | (_| || | | || (_| || |_| || (_| || (_| ||  __/\__ \\
\t|_____| \__,_||_| |_| \__, | \__,_| \__,_| \__, | \___||___/
\t                      |___/                |___/
        """)
        print("Выберите язык, с которым собираетесь вести работу: ")
        print("""
1. C++
2. Python3
3. Java
4. Go
5. Rust
0. Я не хочу устанавливать компиляторы, отладчики, интерпретаторы
        """)
        language=""
        while True:
            language = input("Введите цифру: ")
            if language in {"1","2","3","4","5","0"}:
                 break
        if language == "1":
            print("\nУстанавливаю GCC\n")
            os.system(packagemanager + "gcc")
            print("\nУстанавливаю GDB\n")
            os.system(packagemanager + "gdb")
        elif language == "2":
            print("Устанавливаю интерпретатор Python3")
            os.system(packagemanager + "python3")
            os.system("pip3 install pylint")
            os.system("pip3 install black")
        elif language == "3":
            print("Устанавливаю JDK")
            if packagemanager == "sudo apt install ":
                os.system("sudo apt install default-jdk")
            elif packagemanager == "sudo pacman -Sy ":
                os.system("sudo pacman -Sy jdk-openjdk")
            else:
                os.system("sudo dnf install java-latest-openjdk.x86_64")
        elif language == "4":
            print("Устанавливаю GO Language")
            os.system(packagemanager + "golang")
        elif language == "5":
            print("Устанавливаю Rust")
            os.system(packagemanager + "rustc")

def install_editors(packagemanager):
    print("""
\t _____      _  _  _
\t| ____|  __| |(_)| |_   ___   _ __  ___
\t|  _|   / _` || || __| / _ \ | '__|/ __|
\t| |___ | (_| || || |_ | (_) || |   \__ \\
\t|_____| \__,_||_| \__| \___/ |_|   |___/
        """)

    print("""
1. VSCode (установка возможна только с использованием менеджера пакетов Snap)
2. Vim
3. NeoVim
4. Atom (аналогично, только со Snap)
5. Emacs
6. Doom Emacs
7. Spacemacs
0. Ничего не устанавливать
        """)
    editor = ""
    os.system(packagemanager + "git")
    if editor != "0":
        if editor == "2":
            os.system(packagemanager + "vim")
            print("Скачать конфигурационные файлы к Vim?")
            inp = input("y/n: ").lower()
            if inp == "y":
                os.system("mv ~/.vimrc ~/.vimrc.old & curl -fLo ~/.vimrc https://raw.githubusercontent.com/username77177/FastProgrammingEnvironment/master/.vimrc")
                print("\nУстанавливаю Vim-Plug\n")
                os.system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
            elif editor == "3":
                os.system(packagemanager + "neovim")
                print("Скачать конфигурационные файлы к Vim?")
                inp = input("y/n: ").lower()
                if inp == "y":
                    os.system("mv ~/.vimrc ~/.vimrc.old & curl -fLo ~/.vimrc https://raw.githubusercontent.com/username77177/FastProgrammingEnvironment/master/.vimrc")
                    print("\nУстанавливаю Vim-Plug\n")
                    os.system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
                elif editor == "5":
                    os.system(packagemanager + "emacs")
                elif editor == "1":
                    os.system("sudo snap install code --classic")
                elif editor == "4":
                    os.system("sudo snap install atom --classic")
                elif editor == "5":
                    os.system(packagemanager + "emacs")
                elif editor == "6":
                    os.system("sudo add-apt-repository ppa:kelleyk/emacs")
                    os.system("sudo apt install emacs26")
                    os.system("git clone https://github.com/hlissner/doom-emacs ~/.emacs.d && ~/.emacs.d/bin/doom install")
                else:
                    os.system("sudo add-apt-repository ppa:kelleyk/emacs")
                    os.system("sudo apt install emacs26")
                    os.system("git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d")
    return(packagemanager)

def install_fonts(packagemanager):
        print("""
\t _____                _
\t|  ___|  ___   _ __  | |_  ___
\t| |_    / _ \ | '_ \ | __|/ __|
\t|  _|  | (_) || | | || |_ \__ \\
\t|_|     \___/ |_| |_| \__||___/

        """)
        print("Нужно ли устанавливать шрифты? [y/n]: ", end="")
        fonts = input().lower()
        if fonts == "y":
            print("""
1. Fira Code
2. Source Code Pro
3. JetBrains Mono
            """)
            print("1,2 или 3: ", end = "")
            fonts = input()
            if "1" in fonts:
                os.system(packagemanager + "fonts-firacode")
            if "2" in fonts:
                os.system(packagemanager + "")
            if "3" in fonts:
                os.system(packagemanager + "")
