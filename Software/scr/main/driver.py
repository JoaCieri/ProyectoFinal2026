from pymodbus.client import ModbusTcpClient

class Driver:

    def __init__(self):
        self.client = None

    def conectar(self):
        self.client = ModbusTcpClient("192.168.0.50")

        return self.client.connect()

    def desconectar(self):
        if self.client:
            self.client.close()


    # ---------------- LECTURA ----------------
    def leer_datos(self):
        if self.client is None:
            print("No conectado")
            return None

        rr = self.client.read_holding_registers(address=0, count=31)

        if rr.isError():
            print("Error en lectura Modbus")
            return None

        r = rr.registers

        # ----------- PARSEO -----------
        datos = {
            "L1": {
                "Vrms": r[0] / 10,
                "Irms": r[1] / 100,
                "P": r[2] / 10,
                "Q": r[3] / 10,
                "S": r[4] / 10,
                "FP": r[5] / 1000,
                "THD_V": r[6] / 10,
                "THD_I": r[7] / 10
            },
            "L2": {
                "Vrms": r[8] / 10,
                "Irms": r[9] / 100,
                "P": r[10] / 10,
                "Q": r[11] / 10,
                "S": r[12] / 10,
                "FP": r[13] / 1000,
                "THD_V": r[14] / 10,
                "THD_I": r[15] / 10
            },
            "L3": {
                "Vrms": r[16] / 10,
                "Irms": r[17] / 100,
                "P": r[18] / 10,
                "Q": r[19] / 10,
                "S": r[20] / 10,
                "FP": r[21] / 1000,
                "THD_V": r[22] / 10,
                "THD_I": r[23] / 10
            },
            "totales": {
                "P_total": r[24] / 10,
                "Q_total": r[25] / 10,
                "S_total": r[26] / 10,
                "FP_total": r[27] / 1000
            },
            "sistema": {
                "frecuencia": r[28] / 10,
                "topologia": r[29]
            }
        }

        return datos

    # ---------------- CERRAR ----------------
    def desconectar(self):
        if self.client:
            self.client.close()
            print("Conexión cerrada")