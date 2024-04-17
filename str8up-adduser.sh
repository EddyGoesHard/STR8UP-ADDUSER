#!/bin/bash

# Functie om een nieuwe gebruiker toe te voegen
add_new_user() {
    read -p "Geef de gebruikersnaam van de nieuwe gebruiker op: " username
    sudo adduser "$username"
}

# Functie om gebruikersgroepen weer te geven
list_groups() {
    echo "Beschikbare gebruikersgroepen:"
    echo "-----------------------------"
    cat /etc/group
    echo "-----------------------------"
}

# Functie om een gebruiker toe te voegen aan een groep
add_user_to_group() {
    read -p "Geef de gebruikersnaam op: " username
    read -p "Geef de groep waaraan je de gebruiker wilt toevoegen: " groupname
    sudo usermod -aG "$groupname" "$username"
    echo "Gebruiker '$username' is toegevoegd aan de groep '$groupname'."
}

# Hoofdmenu
main_menu() {
    echo "Welkom bij het gebruikersbeheerscript"
    echo "-------------------------------------"
    echo "1. Nieuwe gebruiker toevoegen"
    echo "2. Gebruikersgroepen weergeven"
    echo "3. Gebruiker toevoegen aan een groep"
    echo "4. Exit"
    echo "-------------------------------------"
    read -p "Selecteer een optie: " choice

    case $choice in
        1) add_new_user ;;
        2) list_groups ;;
        3) add_user_to_group ;;
        4) echo "Exit." ;;
        *) echo "Ongeldige keuze. Probeer opnieuw." ;;
    esac
}

# Roep het hoofdmenu aan
main_menu
