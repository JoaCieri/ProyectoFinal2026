import pyvisa


# Clase para manejar los dispositivos conectados
class Driver:

    def __init__(self):
        # Crear gestor de dispositivos
        self.rm = pyvisa.ResourceManager()

        # Conexiones abiertas (cache)
        self.handles = {}

        # Mostrar dispositivos conectados vía USB
        self.devices = self.listar_dispositivos()
        print("Dispositivos conectados:")
        for dev in self.devices:
            print(dev)

    def conectar(self, device_id):
        """Abre una sola vez el recurso y reutiliza la conexión."""
        if device_id not in self.handles:
            dev = self.rm.open_resource(device_id)
            dev.timeout = 3000
            dev.read_termination = '\n'
            dev.write_termination = '\n'
            self.handles[device_id] = dev
        return self.handles[device_id]

    def listar_dispositivos(self):
        return self.rm.list_resources()

    def enviar_comando(self, device_id, command, timeout=3000):
        """Envía un comando."""
        try:
            device = self.conectar(device_id)
            device.timeout = timeout
            device.write(command)
            return "OK"
        except Exception as e:
            print(f"Error al enviar comando a dispositivo {device_id}: {e}")
            return None

    def recibir_comando(self, device_id):
        """Recibe la respuesta al comando enviado."""
        try:
            device = self.conectar(device_id)
            return device.read()
        except Exception as e:
            print(f"Error al intentar leer dispositivo {device_id}: {e}")
            return None

    def leer_info(self, device_id):
        if self.enviar_comando(device_id, "*IDN?") != None:
            return self.recibir_comando(device_id)

    def leer_medicion(self, device_id):
        """Realiza una medición única con READ?"""
        if self.enviar_comando(device_id, "READ?") != None:
            return float(self.recibir_comando(device_id))

    def configurar_modo(self, device_id, modo="VOLT:DC"):
        """
        Configura el modo de medición del multímetro.

        :param modo: 'VOLT:DC', 'VOLT:AC', 'CURR:DC', 'CURR:AC', 'RES'
        """
        comandos_validos = ["VOLT:DC", "VOLT:AC", "CURR:DC", "CURR:AC", "RES"]

        if modo not in comandos_validos:
            print(f"[ERROR] Modo inválido. Opciones válidas: {comandos_validos}")
            return

        try:
            self.enviar_comando(device_id, f":CONF:{modo}")
            print(f"[OK] Modo de medición configurado: {modo}")
            return "OK"
        except Exception as e:
            print(f"[ERROR] No se pudo configurar el modo: {e}")
            return "ERROR"

    def setear_rango(self, device_id, funcion="VOLT:DC", rango=10, auto=False):
        """
        Configura el rango de medición del multímetro Keithley 2110.
        """
        try:
            if auto:
                comando = f":SENS:{funcion}:RANG:AUTO ON"
            else:
                comando = f":SENS:{funcion}:RANG {rango}"

            respuesta = self.enviar_comando(device_id, comando)

            if respuesta is not None:
                return 'OK'
            else:
                return 'ERROR'
        except Exception as e:
            print(f"Error al setear rango: {e}")
            return 'ERROR'
