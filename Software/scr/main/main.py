# -*- coding: utf-8 -*-
import sys
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5 import uic
from PyQt5.QtCore import QTimer
from datetime import datetime
from PyQt5.QtWidgets import QFileDialog

from driver import driver
from historico import Historico

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        # Timer reloj
        self.timer_hora = QTimer()
        self.timer_hora.timeout.connect(self.actualizar_hora)
        self.timer_hora.start(1000)

        # Cargar interfaz
        uic.loadUi("MainWindow.ui", self)
        
        # TIMER
        self.timer = QTimer()
        self.timer.timeout.connect(self.actualizar_mediciones)

        # Crear driver
        self.driver = driver()
        self.historico = Historico()

        #Estado inicial
        self.estudio_activo = False
        self.consola.setText("Desconectado")
        self.comenzar.setEnabled(False)
        self.finalizar.setEnabled(False)
        self.proceso.setEnabled(True)
        self.fin_proceso.setEnabled(False)

        # Conectar botones (IMPORTANTE: nombres del .ui)
        self.btn_conectar.clicked.connect(self.conectar)
        self.btn_desconectar.clicked.connect(self.desconectar)
        self.btn_salir.clicked.connect(self.cerrar)
        self.comenzar.clicked.connect(self.temporizador)
        self.finalizar.clicked.connect(self.detener)
        self.proceso.clicked.connect(self.proceso_estudio)
        self.fin_proceso.clicked.connect(self.fin_proceso_estudio)
        self.btn_ruta.clicked.connect(self.examinar)
        
        
    # ---------------- HORARIO RELOS ----------------
    def actualizar_hora(self):    
        ahora = datetime.now()    
        self.lbl_hora.setText(
            ahora.strftime("%d/%m/%Y %H:%M:%S")
        )

    # ---------------- CONECTAR ----------------
    def conectar(self):
        self.consola.setText("Conectando...")

        if self.driver.conectar():
            self.consola_2.setText("Conectado - Leyendo...")
            self.comenzar.setEnabled(True)
            self.proceso.setEnabled(True)
        else:
            self.consola_2.setText("Error de conexión")


    # ---------------- DESCONECTAR ----------------
    def desconectar(self):
        self.driver.desconectar()
        self.consola_2.setText("Desconectado")
        self.comenzar.setEnabled(False)
        self.proceso.setEnabled(False)   
        
        
     # ---------------- Temporizador ----------------    
        
    def temporizador(self):
        print("Timer iniciado")
        self.timer.start(2000) # 2000 ms = 2 segundos
        self.consola_2.setText("Monitoreo iniciado")
        self.finalizar.setEnabled(True)
        self.comenzar.setEnabled(False)
        
    def detener(self): 
        print("ENTRO A DETENER")
        self.timer.stop()    
        self.consola_2.setText("Monitoreo detenido")
        self.finalizar.setEnabled(False)
        self.comenzar.setEnabled(True)
        
        
    # ---------------- PRUEBA EN TIEMPO REAL ----------------   
    def actualizar_mediciones(self):
    
        print("ACTUALIZANDO")
        
        if not self.driver.connected:
            return
        
        datos = self.driver.leer_datos()
            
        if datos is None:
            return
    
        # ---- SISTEMA ----
    
        self.lbl_frecuencia.setText(
            f"{datos['sistema']['frecuencia']} Hz"
        )
    
        topologias = {
            1: "Monofásica",
            2: "Bifásica",
            3: "Trifásica"
        }
    
        self.lbl_topologia.setText(
            topologias.get(
                datos["sistema"]["topologia"],
                "Desconocida"
            )
        )
    
        # ---- L1 ----
    
        self.lbl_V_L1.setText(str(datos["L1"]["Vrms"]))
        self.lbl_I_L1.setText(str(datos["L1"]["Irms"]))
        self.lbl_P_L1.setText(str(datos["L1"]["P"]))
        self.lbl_Q_L1.setText(str(datos["L1"]["Q"]))
        self.lbl_FP_L1.setText(str(datos["L1"]["FP"]))
        self.lbl_THDV_L1.setText(str(datos["L1"]["THD_V"]))
        self.lbl_THDI_L1.setText(str(datos["L1"]["THD_I"]))
    
        # ---- L2 ----
    
        self.lbl_V_L2.setText(str(datos["L2"]["Vrms"]))
        self.lbl_I_L2.setText(str(datos["L2"]["Irms"]))
        self.lbl_P_L2.setText(str(datos["L2"]["P"]))
        self.lbl_Q_L2.setText(str(datos["L2"]["Q"]))
        self.lbl_FP_L2.setText(str(datos["L2"]["FP"]))
        self.lbl_THDV_L2.setText(str(datos["L2"]["THD_V"]))
        self.lbl_THDI_L2.setText(str(datos["L2"]["THD_I"]))
    
        # ---- L3 ----
    
        self.lbl_V_L3.setText(str(datos["L3"]["Vrms"]))
        self.lbl_I_L3.setText(str(datos["L3"]["Irms"]))
        self.lbl_P_L3.setText(str(datos["L3"]["P"]))
        self.lbl_Q_L3.setText(str(datos["L3"]["Q"]))
        self.lbl_FP_L3.setText(str(datos["L3"]["FP"]))
        self.lbl_THDV_L3.setText(str(datos["L3"]["THD_V"]))
        self.lbl_THDI_L3.setText(str(datos["L3"]["THD_I"]))
    
        # ---- TOTALES ----
    
        self.lbl_P_total.setText(
            str(datos["totales"]["P_total"])
        )
    
        self.lbl_FP_total.setText(
            str(datos["totales"]["FP_total"])
        ) 
        
        # Guardar solo si hay un estudio activo
        if self.estudio_activo:
            self.historico.guardar_muestra(datos)
            self.muestras += 1
            self.lbl_muestras.setText(
                str(self.muestras)
            )
        
        # ---------------- OBTENER DIRECCION DE GUARDADO ----------------        
    def examinar(self):
        carpeta = QFileDialog.getExistingDirectory(
            self,
            "Seleccionar carpeta para guardar el estudio"
        )
    
        if carpeta:
            self.txt_ruta.setText(carpeta)
            self.consola.setText(
                f"Carpeta seleccionada:\n{carpeta}"
            )
            
    # ---------------- PROCESO ----------------
    def proceso_estudio(self):
    
        self.fin_proceso.setEnabled(True)
    
        self.consola.setText("PROCESO INICIADO")
    
        ruta = self.txt_ruta.text()
        nombre = self.txt_nombre.text()
    
        archivo = self.historico.iniciar(
            ruta,
            nombre
        )
    
        # ----------------------------
        # Duración
        # ----------------------------
        duracion = int(self.Combobox_duracion.currentText())
        unidad_duracion = self.Combobox_unidad_duracion.currentText()
    
        if unidad_duracion == "Segundos":
            duracion_seg = duracion
    
        elif unidad_duracion == "Minutos":
            duracion_seg = duracion * 60
    
        elif unidad_duracion == "Horas":
            duracion_seg = duracion * 3600
    
        else:
            duracion_seg = duracion
    
        # ----------------------------
        # Intervalo
        # ----------------------------
        intervalo = int(self.Combobox_intervalo.currentText())
        unidad_intervalo = self.Combobox_unidad_intervalo.currentText()
    
        if unidad_intervalo == "Segundos":
            intervalo_ms = intervalo * 1000
    
        elif unidad_intervalo == "Minutos":
            intervalo_ms = intervalo * 60 * 1000
    
        elif unidad_intervalo == "Horas":
            intervalo_ms = intervalo * 3600 * 1000
    
        else:
            intervalo_ms = intervalo * 1000
    
        # ----------------------------
        # Configuración estudio
        # ----------------------------
        self.estudio_activo = True
    
        self.muestras = 0
    
        self.timer_estudio = QTimer()
    
        self.timer_estudio.timeout.connect(
            self.actualizar_mediciones
        )
    
        self.timer_estudio.start(intervalo_ms)
    
        # Timer para finalizar automáticamente
        self.timer_fin_estudio = QTimer()
    
        self.timer_fin_estudio.setSingleShot(True)
    
        self.timer_fin_estudio.timeout.connect(
            self.fin_proceso_estudio
        )
    
        self.timer_fin_estudio.start(
            duracion_seg * 1000
        )
    
        self.consola.setText(
            f"Estudio iniciado\n{archivo}"
        )
        
    def fin_proceso_estudio(self):
        self.timer_fin_estudio.stop()
        self.historico.finalizar()
        self.consola.setText(
            "Estudio finalizado"
        )
    # ---------------- CERRAR LA GUI ----------------
            
    def cerrar(self):
        if self.driver:
            self.driver.desconectar()
            
        self.close()

# ---------------- MAIN ----------------
if __name__ == "__main__":
    app = QApplication(sys.argv)

    window = MainWindow()
    window.show()

    sys.exit(app.exec())