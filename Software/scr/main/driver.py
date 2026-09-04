import random


class driver:

    def __init__(self):
        self.connected = False

    # ---------------- CONEXIÓN ----------------

    def conectar(self):

        self.connected = True

        print("Driver simulado conectado")

        return True

    # ---------------- DESCONEXIÓN ----------------

    def desconectar(self):

        self.connected = False

        print("Driver simulado desconectado")

    # ---------------- LECTURA ----------------

    def leer_datos(self):

        if not self.connected:
            print("No conectado")
            return None

        datos = {

            "L1": {

                "Vrms": round(random.uniform(220, 235), 1),
                "Irms": round(random.uniform(5, 20), 2),

                "P": round(random.uniform(1000, 4000), 1),
                "Q": round(random.uniform(150, 1200), 1),
                "S": round(random.uniform(1200, 4500), 1),

                "FP": round(random.uniform(0.85, 0.99), 3),

                "THD_V": round(random.uniform(1, 6), 1),
                "THD_I": round(random.uniform(2, 20), 1)

            },

            "L2": {

                "Vrms": round(random.uniform(220, 235), 1),
                "Irms": round(random.uniform(5, 20), 2),

                "P": round(random.uniform(1000, 4000), 1),
                "Q": round(random.uniform(150, 1200), 1),
                "S": round(random.uniform(1200, 4500), 1),

                "FP": round(random.uniform(0.85, 0.99), 3),

                "THD_V": round(random.uniform(1, 6), 1),
                "THD_I": round(random.uniform(2, 20), 1)

            },

            "L3": {

                "Vrms": round(random.uniform(220, 235), 1),
                "Irms": round(random.uniform(5, 20), 2),

                "P": round(random.uniform(1000, 4000), 1),
                "Q": round(random.uniform(150, 1200), 1),
                "S": round(random.uniform(1200, 4500), 1),

                "FP": round(random.uniform(0.85, 0.99), 3),

                "THD_V": round(random.uniform(1, 6), 1),
                "THD_I": round(random.uniform(2, 20), 1)

            },

            "totales": {

                "P_total": round(random.uniform(3000, 12000), 1),
                "Q_total": round(random.uniform(500, 3500), 1),
                "S_total": round(random.uniform(3500, 13000), 1),
                "FP_total": round(random.uniform(0.88, 0.99), 3)

            },

            "sistema": {

                "frecuencia": round(random.uniform(49.8, 50.2), 2),
                "topologia": 3

            }

        }

        return datos