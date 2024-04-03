#!/bin/bash

converte_imagem(){

cd ~/curso-shell-script/imagens-livros

if [ $? -eq 1 ]; then
	echo "diretório nao existe" 
	[ $? = 1 ];
else
	echo "diretório criado"
	if [ ! -d png ]; then
		mkdir png
	fi
	for imagem in *.jpg; do
		local imagem_sem_extensao=$(ls $imagem | awk -F. '{print $1}')
		convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
	done
fi
}

converte_imagem

if [ $? -eq 0 ]; then
	echo "Conversão realizada com sucesso"
elif [ $? -eq 1 ]; then
	echo "Houve uma falha no processo"
fi
