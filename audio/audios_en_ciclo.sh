#!/bin/sh

# Script para convertir audios (.oga) de Telegram a .mp3 automaticamente a medida que llegan a la carpeta base
# alejo@riseup.net

# Carpeta base
BASEDIR=/home/pi/Telegramgram2Icecast/audio/
#PID=$(pidof liquidsoap)
#CAT=$(cat 1.m3u)

conv() {
	for i in *.oga; do ffmpeg -i "$i" -ac 2 "${i%.*}.mp3"; rm *.oga; done
}


###########################################################
cd $BASEDIR         ### va a la carpeta base donde se va hacer el trabajo

while :             ### ciclo infinito para reproducir los audios que van llegando a $DIRBASE
do
#	ffmpeg -nostdin -i *.oga -ac 2 "${i%.*}.mp3" && rm *.oga
#	sleep 1
#	for i in *.oga; do ffmpeg -i "$i" -ac 2 "${i%.*}.mp3"; rm *.oga; done
	conv
	sleep 1
#	echo convirtiendo_audios
	ls -1v |grep .mp3 > 1.m3u
	echo playlist_creado
	echo $CAT
	sleep 1
#	echo pid_de_liquidsoap
#	echo $PID
	sleep 3
done
