Notas:
En configuración poner una parte de prueba y una consola para testear comandos
Graficar mediciones
Pestaña con tabla de registros historicos? 
Que pasa si se interrumpe la conexion mientras esta midiendo
Barra de progreso en medicion
Comentar todas las funciones de la clase Driver (parametros, retorno y descripcion)
Si da muy raro ver interpretacion del resultado
Verificar calculo de incertidumbres


Compilación de archivos (ui->py)

pyuic6 -o MainWindow_ui.py MainWindow.ui

pyuic6 -o LineWindow_ui.py LineWindow.ui

pyuic6 -o LoadWindow_ui.py LoadWindow.ui

pyside6-rcc resources.qrc -o resources_rc.py



Construcción de ejecutable

python setup.py build
