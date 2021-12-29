#!/bin/bash

echo -e '	¿Qué dominios desea buscar?\n-----------------------------------------------\n'
continuar='y'

while [[ $continuar == 'y' || $continuar == 'yes' ]]
do
	echo '*** Introduzca su dominio:'
	echo -n '> '
	read nuevo

	DOMAIN_LIST+=" $nuevo"

	echo "*** Para añadir otro dominio [yes/no]"
	echo -n '> '
	read continuar
done

echo "*** ¿Quiere filtrar por parámetros? [yes/no]"
echo -n '> '
read filtrar

if [[ $filtrar == 'y' || $filtrar == 'yes' ]]
then
	echo '*** Introduzca el parámetro:'
	echo -n '> '
	read parametro

	for domain in $DOMAIN_LIST
	do
        echo -n '[ '$domain' ] ---> '
        whois $domain | grep $parametro
	done

else
	for domain in $DOMAIN_LIST
        do
                echo -n $domain': '
                whois $domain
        done
fi
