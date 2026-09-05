# -*- coding: utf-8 -*-
import sys
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5 import uic

from driver import driver
from historico import Historico


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        # Cargar interfaz
        uic.loadUi("MainWindow.ui", self)

        # Crear driver
        self.driver = driver()
        self.historico = Historico()

        #Estado inicial
        self.consola.setText("Desconectado")
        self.prueba.setEnabled(False)
        self.proceso.setEnabled(False)

        # Conectar botones (IMPORTANTE: nombres del .ui)
        self.btn_conectar.clicked.connect(self.conectar)
        self.btn_desconectar.clicked.connect(self.desconectar)
        self.btn_salir.clicked.connect(self.cerrar)
        self.prueba.clicked.connect(self.prueba_1)
        self.proceso.clicked.connect(self.proceso_1)

    # ---------------- CONECTAR ----------------
    def conectar(self):
        self.consola.setText("Conectando...")

        if self.driver.conectar():
            self.consola.setText("Conectado - Leyendo...")
            self.prueba.setEnabled(True)
            self.proceso.setEnabled(True)
        else:
            self.consola.setText("Error de conexión")


    # ---------------- DESCONECTAR ----------------
    def desconectar(self):
        self.driver.desconectar()
        self.consola.setText("Desconectado")
        self.prueba.setEnabled(False)
        self.proceso.setEnabled(False)
 
    # ---------------- PRUEBA EN TIEMPO REAL ----------------
    def prueba_1(self):
        self.consola.setText("PRUEBA en TIEMPO REAL ")
        datos = self.driver.leer_datos()
        self.consola.setText(str(datos))
 
    # ---------------- PROCESO ----------------
    def proceso_1(self):
        self.consola.setText("PROCESO INICIADO")    
 
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