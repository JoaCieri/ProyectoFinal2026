# -*- coding: utf-8 -*-
import sys
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5 import uic

from driver import Driver


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        # Cargar interfaz
        uic.loadUi("MainWindow.ui", self)

        # Crear driver
        self.driver = Driver()

        # Estado inicial
        #self.label_estado.setText("Desconectado")

        # Conectar botones (IMPORTANTE: nombres del .ui)
        #self.btn_conectar.clicked.connect(self.conectar)
        #self.btn_desconectar.clicked.connect(self.desconectar)

    # ---------------- CONECTAR ----------------
    def conectar(self):
        self.label_estado.setText("Conectando...")

        if self.driver.conectar():
            self.label_estado.setText("Conectado - Leyendo...")
        else:
            self.label_estado.setText("Error de conexión")

    # ---------------- DESCONECTAR ----------------
    def desconectar(self):
        self.driver.desconectar()
        self.label_estado.setText("Desconectado")
        
    def cerrar(self):
        pass


# ---------------- MAIN ----------------
if __name__ == "__main__":
    app = QApplication(sys.argv)

    window = MainWindow()
    window.show()

    sys.exit(app.exec())