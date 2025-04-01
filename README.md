# 🌄 Wallpaper Switcher Script 🌙

Este repositorio contiene un script en Bash, `wallpapers.sh`, diseñado para cambiar automáticamente el fondo de pantalla en entornos Linux con **GNOME** según la hora del día. El script alterna entre dos fondos de pantalla diferentes: uno para el día y otro para la noche. 🌞🌙

---

## 📂 Estructura del Proyecto

La estructura de carpetas es la siguiente:

```
/home/usuario/
└── wallpapers/
    ├── wallpapers.sh
    ├── wallpaper1.png
    └── wallpaper2.png
```

📌 **Explicación:**
- **`/home/usuario/`**: Carpeta personal del usuario.
- **`wallpapers/`**: Contiene tanto el script como las imágenes de fondo de pantalla.
  - **`wallpapers.sh`**: Script en Bash que gestiona el cambio de fondo de pantalla.
  - **`wallpaper1.png`**: Imagen utilizada como fondo de pantalla durante el día. ☀️
  - **`wallpaper2.png`**: Imagen utilizada como fondo de pantalla durante la noche. 🌙

---

## ⚙️ Funcionamiento del Script

El script `wallpapers.sh` funciona de la siguiente manera:

1. **🔍 Verificación del Entorno Gráfico**
   - Antes de realizar cualquier acción, el script verifica que la variable de entorno `DISPLAY` esté configurada, asegurando que se ejecuta en un entorno gráfico.

2. **⏰ Definición de Intervalos de Tiempo**
   - De **07:00 a 18:59**, se aplica `wallpaper1.png`.
   - De **19:00 a 06:59**, se aplica `wallpaper2.png`.

3. **🖼️ Cambio de Fondo de Pantalla**
   - Basado en la hora actual, el script selecciona el fondo de pantalla correspondiente y lo aplica usando `gsettings`, específico de GNOME.

4. **📜 Registro de Logs**
   - Cualquier error o acción realizada se registra en `wallpapers.log` dentro de la carpeta `wallpapers/`.

---

## 🔧 Requisitos

✅ **Sistema Operativo**: Ubuntu 24.04 (probado y verificado).  
✅ **Entorno de Escritorio**: GNOME.  
✅ **Imágenes de Fondo**: Asegúrate de que `wallpaper1.png` y `wallpaper2.png` estén ubicados en la carpeta `wallpapers/`.

---

## 🚀 Ejecución del Script

Inicialmente, se planeaba automatizar la ejecución con `crontab -e`, pero debido a problemas con **D-Bus** y la variable `DISPLAY` en entornos no interactivos, no se pudo ejecutar correctamente desde `cron`.

❌ **Errores comunes:**
- `"No se puede lanzar D-Bus automáticamente sin X11 $DISPLAY"`
- `"Error al lanzar («spawn») el comando «dbus-launch --autolaunch=ec70324ee4884dc7ab087f9f81235cd6 --binary-syntax --close-stderr»: El proceso hijo terminó con el código 1"`

✅ **Solución:** Se recomienda ejecutar el script manualmente:

```bash
bash ~/wallpapers/wallpapers.sh
```

---

## 📝 Conclusión

Debido a los errores mencionados, el script puede funcionar en otros entornos gráficos o distribuciones de Linux donde **D-Bus** y `DISPLAY` estén correctamente configurados en entornos no interactivos. Sin embargo, se recomienda ejecutarlo manualmente en **GNOME bajo Ubuntu 24.04** para asegurar su correcto funcionamiento. 🚀

---
