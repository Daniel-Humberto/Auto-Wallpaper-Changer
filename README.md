# Wallpaper Switcher Script

Este repositorio contiene un script en Bash, `wallpapers.sh`, diseñado para cambiar automáticamente el fondo de pantalla en entornos linux con GNOME según la hora del día. El script alterna entre dos fondos de pantalla diferentes: uno para el día y otro para la noche.


## Estructura del Proyecto

La estructura del carpetas es la siguiente:

/home/usuario/
└── wallpapers/
├── wallpapers.sh
├── wallpaper1.png
└── wallpaper2.png

- **`/home/usuario/`**: Carpeta personal del usuario.
- **`wallpapers/`**: Carpeta que contiene tanto el script como las imágenes de fondo de pantalla.
  - **`wallpapers.sh`**: Script en Bash que gestiona el cambio de fondo de pantalla.
  - **`wallpaper1.png`**: Imagen que se usa como fondo de pantalla durante el día.
  - **`wallpaper2.png`**: Imagen que se usa como fondo de pantalla durante la noche.


## Funcionamiento del Script

El script `wallpapers.sh` funciona de la siguiente manera:

1. **Verificación del Entorno Gráfico**: Antes de realizar cualquier acción, el script verifica que la variable de entorno `DISPLAY` esté configurada. Esto asegura que se está ejecutando en un entorno gráfico.

2. **Definición de Intervalos de Tiempo**: El script define dos intervalos de tiempo:
   - De 07:00 a 18:59, donde se aplica el fondo de pantalla `wallpaper1.png`.
   - De 19:00 a 06:59, donde se aplica el fondo de pantalla `wallpaper2.png`.

3. **Cambio de Fondo de Pantalla**: Basado en la hora actual, el script selecciona el fondo de pantalla correspondiente y lo aplica usando el comando `gsettings`, que es específico de GNOME.

4. **Registro de Logs**: Cualquier error o acción realizada se registra en un archivo de log `wallpapers.log` dentro de la carpeta `wallpapers/`.


## Requisitos

- **Sistema Operativo**: El script fue diseñado y probado en Ubuntu 24.04.
- **Entorno de Escritorio**: GNOME.
- **Imágenes de Fondo**: Debes tener las imágenes `wallpaper1.png` y `wallpaper2.png` ubicadas en la carpeta `wallpapers/`.


## Ejecución del Script

El script estaba originalmente destinado a ser automatizado utilizando `crontab -e` para ejecutarse automáticamente a intervalos regulares. Sin embargo, debido a problemas con D-Bus y la variable `DISPLAY` en entornos no interactivos, no se pudo ejecutar correctamente desde `cron`. Errores comunes incluyen:

- `"No se puede lanzar D-Bus automáticamente sin X11 $DISPLAY"`
- `"Error al lanzar («spawn») el comando «dbus-launch --autolaunch=ec70324ee4884dc7ab087f9f81235cd6 --binary-syntax --close-stderr»: El proceso hijo terminó con el código 1"`

Por lo tanto, **el script debe ejecutarse manualmente** para realizar el cambio de fondo de pantalla según el horario.


### Conclusión

Debido a los errores mencionados, es posible que el script funcione en otros entornos gráficos o distribuciones de Linux donde D-Bus y DISPLAY estén correctamente configurados en entornos no interactivos. Sin embargo, se recomienda ejecutar el script manualmente en GNOME bajo Ubuntu 24.04 para asegurar su correcto funcionamiento.
