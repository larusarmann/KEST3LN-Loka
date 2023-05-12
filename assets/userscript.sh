#!/usr/bin/bash
input="/home/larusarmann/users.csv"
declare -a name
declare -a fname
declare -a lname
declare -a uname
declare -a email
declare -a dept
declare -a emplId
declare -a pass

while IFS=, read -r Name FirstName LastName Username Email Department EmployeeID Password;
do
        name+=("$Name")
        fname+=("$FirstName")
        lname+=("$LastName")
        uname+=("$Username")
        email+=("$Email")
        dept+=("$Department")
        emplId+=("$EmployeeID")
        pass+=("$Password")

done<$input

for index in "${!uname[@]}";
do
        sudo groupadd "${dept[$index]}";
        sudo useradd -g "${dept[$index]}" \
                     -d "/home/${uname[$index]}" \
                     -s "/bin/bash" \
                     -p "$(echo "${pass[$index]}" | openssl passwd -1 -stdin)" "$uname[index]}"
                done


