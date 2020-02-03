OLDIFS=$IFS
IFS=","

cat register.csv | while read lastname firstname userid password;
do
        echo "Adding: ${firstname} ${lastname} ${userid} ${password}"
        useradd -m -p "$(echo -n ${password} | openssl passwd -crypt -stdin)" -c "${firstname} ${lastname}" -g users -s /bin/bash "${userid}"
        passwd -e "${userid}"
done
