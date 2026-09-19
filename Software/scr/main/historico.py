from datetime import datetime
import csv
import os


class Historico:

    def __init__(self):

        self.archivo = None
        self.writer = None
        self.registrando = False

    # ----------------------------------
    # Crear estudio
    # ----------------------------------

    def iniciar(self, carpeta, nombre_estudio):

        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

        nombre_archivo = f"{timestamp}_{nombre_estudio}.csv"

        ruta_archivo = os.path.join(
            carpeta,
            nombre_archivo
        )

        self.archivo = open(
            ruta_archivo,
            mode="w",
            newline="",
            encoding="utf-8"
        )

        self.writer = csv.writer(self.archivo)

        self.writer.writerow([
            "Timestamp",

            "Vrms_L1",
            "Irms_L1",
            "P_L1",
            "Q_L1",
            "FP_L1",
            "THDv_L1",
            "THDi_L1",

            "Vrms_L2",
            "Irms_L2",
            "P_L2",
            "Q_L2",
            "FP_L2",
            "THDv_L2",
            "THDi_L2",

            "Vrms_L3",
            "Irms_L3",
            "P_L3",
            "Q_L3",
            "FP_L3",
            "THDv_L3",
            "THDi_L3",

            "P_total",
            "FP_total",

            "Frecuencia",
            "Topologia"
        ])

        self.registrando = True

        return ruta_archivo

    # ----------------------------------
    # Guardar una muestra
    # ----------------------------------

    def guardar_muestra(self, datos):

        if not self.registrando:
            return

        timestamp = datetime.now().strftime(
            "%Y-%m-%d %H:%M:%S"
        )

        self.writer.writerow([

            timestamp,

            datos["L1"]["Vrms"],
            datos["L1"]["Irms"],
            datos["L1"]["P"],
            datos["L1"]["Q"],
            datos["L1"]["FP"],
            datos["L1"]["THD_V"],
            datos["L1"]["THD_I"],

            datos["L2"]["Vrms"],
            datos["L2"]["Irms"],
            datos["L2"]["P"],
            datos["L2"]["Q"],
            datos["L2"]["FP"],
            datos["L2"]["THD_V"],
            datos["L2"]["THD_I"],

            datos["L3"]["Vrms"],
            datos["L3"]["Irms"],
            datos["L3"]["P"],
            datos["L3"]["Q"],
            datos["L3"]["FP"],
            datos["L3"]["THD_V"],
            datos["L3"]["THD_I"],

            datos["totales"]["P_total"],
            datos["totales"]["FP_total"],

            datos["sistema"]["frecuencia"],
            datos["sistema"]["topologia"]
        ])

        self.archivo.flush()

    # ----------------------------------
    # Finalizar estudio
    # ----------------------------------

    def finalizar(self):

        if self.archivo:

            self.archivo.close()

            self.archivo = None
            self.writer = None

        self.registrando = False