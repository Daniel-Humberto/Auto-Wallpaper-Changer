#!/bin/bash

# Verificar que DISPLAY esté configurado
# Esto asegura que el script se está ejecutando en un entorno gráfico.
if [ -z "$DISPLAY" ]; then
    echo "ERROR: DISPLAY no está configurado. Asegúrate de que estás en un entorno gráfico."
    exit 1
fi

# Archivo de log donde se registrarán las acciones y errores del script.
LOGFILE=~/wallpapers/wallpapers.log

# Definición de intervalos de tiempo para cambiar los wallpapers
# Intervalo de tiempo diurno: de 08:00 a 17:59
START_TIME1="08:00"
END_TIME1="17:59"

# Intervalo de tiempo nocturno: de 18:00 a 07:59
START_TIME2="18:00"
END_TIME2="07:59"

# Definición de los wallpapers para los diferentes intervalos de tiempo
# Wallpaper diurno
WALLPAPER1="/home/usuario/wallpapers/wallpaper1.png"

# Wallpaper nocturno
WALLPAPER2="/home/usuario/wallpapers/wallpaper2.png"

# Obtener la hora actual en formato HH:MM
CURRENT_TIME=$(date +"%H:%M")

# Comparar la hora actual con los intervalos definidos
# Si la hora actual está dentro del intervalo diurno, se aplica el wallpaper diurno.
if [[ "$CURRENT_TIME" > "$START_TIME1" && "$CURRENT_TIME" < "$END_TIME1" ]]; then
    # Horario de 08:00 a 17:59
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER1" >> $LOGFILE 2>&1
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER1" >> $LOGFILE 2>&1

# Si la hora actual está dentro del intervalo nocturno, se aplica el wallpaper nocturno.
elif [[ "$CURRENT_TIME" > "$START_TIME2" || "$CURRENT_TIME" < "$END_TIME2" ]]; then
    # Horario de 18:00 a 07:59 (cubre noche y madrugada)
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER2" >> $LOGFILE 2>&1
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER2" >> $LOGFILE 2>&1

# Si la hora actual no encaja en ninguno de los intervalos (lo cual no debería suceder),
# se registra un error en el archivo de log.
else
    echo "ERROR: La hora actual no se encuentra dentro de los rangos esperados." >> $LOGFILE
    exit 1
fi
