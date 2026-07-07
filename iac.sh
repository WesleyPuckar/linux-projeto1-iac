#!/bin/bash

echo "Limpando a estrutura anterior (se houver)..."

# Excluindo diretórios antigos
rm -rf /publico
rm -rf /adm
rm -rf /ven
rm -rf /sec

# Excluindo usuários antigos
userdel -r carlos
userdel -r maria
userdel -r joao
userdel -r debora
userdel -r sebastiana
userdel -r roberto
userdel -r josefina
userdel -r amanda
userdel -r rogerio

# Excluindo grupos antigos
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "---"
echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

# Criando usuários do setor ADM
useradd carlos -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_ADM

# Criando usuários do setor VEN
useradd debora -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_VEN

# Criando usuários do setor SEC
useradd josefina -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -6 Senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios..."

# Definindo o root como dono e os respectivos grupos (atendendo ao requisito)
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chown root:root /publico

# Permissões: Dono (root)=total, Grupo=total, Outros=nada (770)
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

# Permissão total para todos no público (777)
chmod 777 /publico

echo "Processo finalizado com sucesso!"