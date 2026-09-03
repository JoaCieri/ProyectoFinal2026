from collections import deque
from datetime import datetime

class Historico:

    def __init__(self, max_muestras=2880):
        self.datos = deque(maxlen=max_muestras)

    def agregar(self, medicion):

        muestra = {
            "timestamp": datetime.now(),
            "datos": medicion
        }

        self.datos.append(muestra)

    def obtener_ultima(self):

        if len(self.datos) == 0:
            return None

        return self.datos[-1]

    def cantidad(self):

        return len(self.datos)
