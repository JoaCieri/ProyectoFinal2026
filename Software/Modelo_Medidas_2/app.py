import sys
import locale
# Idioma "es-ES" (código para el español de España)
locale.setlocale(locale.LC_ALL,"") #'es-ES') 

#PyQt5
from PyQt6 import QtGui, QtCore
from PyQt6.QtWidgets import ( QApplication, QMainWindow, QTableWidgetItem, QAbstractItemView, QAbstractScrollArea, QMessageBox, QDialog, QFileDialog, QProgressDialog, QHeaderView, QTableWidget, QWidget )        
#from PyQt5.QtWebEngineWidgets import QWebEngineView
from PyQt6.QtCore import QUrl, QFile, Qt, QTimer, QTime
from PyQt6.QtGui import QPalette, QBrush, QPixmap, QFontMetrics

import json
import pandas as pd
from math import sqrt

#Recursos
import resources_rc
import webbrowser

#Clases propias
from MainWindow_ui  import Ui_MainWindow
from LineWindow_ui  import Ui_LineWindow
from LoadWindow_ui  import Ui_LoadWindow
from Driver import Driver



#Rutas
PROFILES_PATH = "./profiles.json"
MANUAL_INCERTIDUMBRES_PATH = "Incertidumbres.pdf"

#Clase ventana principal
class MainWindow(QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        super(MainWindow, self).__init__(parent)
        self.setupUi(self) 
        self.initWindow()

    def initWindow(self):
        self.LE_dropout.setVisible(False)
        self.label_32.setVisible(False)
        #General
        self.connectSignalsSlots()
        self.driver = Driver()
        #Pestaña Configuración
        self.TW_dispositivosConectados.setEditTriggers(QAbstractItemView.EditTrigger.NoEditTriggers)
        self.cargar_perfiles()
        self.TW_instrumentos.resizeColumnsToContents()
        self.TW_instrumentos.resizeRowsToContents()

    def connectSignalsSlots(self):
        #Ventana principal
        self.tabWidget.currentChanged.connect(self.on_tabWidget_currentChanged)
        #Pestaña Configuración
        self.BTN_actualizar.clicked.connect(self.on_BTN_actualizar_clicked)
        self.CB_perfilRegulador.currentTextChanged.connect(self.cargar_datos_perfil)
        self.BTN_guardarPerfil.clicked.connect(self.guardar_perfil)
        #Pestaña Efecto de Linea
        self.CB_lineaRegulador.currentTextChanged.connect(self.cargarRequerimientosLinea)
        self.BTN_lineaIniciarMedicion.clicked.connect(self.iniciarMedicionLinea)
        #Pestaña Efecto de Carga
        self.CB_cargaRegulador.currentTextChanged.connect(self.cargarRequerimientosCarga)
        self.BTN_cargaIniciarMedicion.clicked.connect(self.iniciarMedicionCarga)
        #Manual de incertidumbres
        self.BTN_manualIncertidumbres.clicked.connect(self.abrirManualIncertidumbre)

####### FUNCIONES
    def abrirManualIncertidumbre(self):
        webbrowser.open(MANUAL_INCERTIDUMBRES_PATH)

    def cargar_perfiles(self):
        """Carga los nombres de los perfiles a todos los comboBox desde el archivo."""
        self.CB_perfilRegulador.clear()
        try:
            with open(PROFILES_PATH, 'r') as f:
                self.perfiles = json.load(f)
        except (FileNotFoundError, json.JSONDecodeError):
            self.perfiles = {}
        self.CB_perfilRegulador.addItems(self.perfiles.keys())
        self.CB_lineaRegulador.addItems(self.perfiles.keys())
        self.CB_cargaRegulador.addItems(self.perfiles.keys())

    def cargar_datos_perfil(self, nombre_perfil):
        """Carga los datos del perfil seleccionado."""
        if nombre_perfil in self.perfiles:
            perfil = self.perfiles[nombre_perfil]
            self.LE_modeloRegulador.setText(perfil.get("modelo", ""))
            self.LE_fabricanteRegulador.setText(perfil.get("fabricante", ""))
            self.LE_tensionRegulador.setText(perfil.get("tension", ""))
            self.LE_corrienteRegulador.setText(perfil.get("corriente", ""))
            self.LE_dropout.setText(perfil.get("dropout",""))
            self.LE_cargaRegulador.setText(perfil.get("reg_carga", ""))
            self.LE_lineaRegulador.setText(perfil.get("reg_linea", ""))
        else:
            # Limpiar si no hay datos
            self.LE_modeloRegulador.clear()
            self.LE_fabricanteRegulador.clear()
            self.LE_tensionRegulador.clear()
            self.LE_corrienteRegulador.clear()
            self.LE_cargaRegulador.clear()
            self.LE_lineaRegulador.clear()
            self.LE_dropout.clear()

    def guardar_perfil(self):
        """Guarda los datos actuales como perfil (nuevo o sobrescribe)."""
        nuevo_nombre = self.LE_modeloRegulador.text().strip()
        if not nuevo_nombre:
            QMessageBox.warning(None, "Error", "Debe ingresar un nombre de perfil.")
            return

        datos = {
            "modelo": self.LE_modeloRegulador.text(),
            "fabricante": self.LE_fabricanteRegulador.text(),
            "tension": self.LE_tensionRegulador.text(),
            "corriente": self.LE_corrienteRegulador.text(),
            "reg_carga": self.LE_cargaRegulador.text(),
            "reg_linea": self.LE_lineaRegulador.text()
        }

        self.perfiles[nuevo_nombre] = datos

        # Guardar en archivo
        with open(PROFILES_PATH, 'w') as f:
            json.dump(self.perfiles, f, indent=4)

        # Recargar combo por si se renombró o agregó nuevo
        self.cargar_perfiles()
        self.CB_perfilRegulador.setCurrentText(nuevo_nombre)
        QMessageBox.information(None, "Guardado", f"Perfil '{nuevo_nombre}' guardado correctamente.")

    def cargarRequerimientosLinea(self, perfil):
        #
        vnominal = float(self.perfiles[perfil]['tension']) 
        #La tensión minima de entrada para que funcione el regulador es la v nominal mas la v de dropout
        v_min = vnominal - float(self.perfiles[perfil]['tension'])*.1
        v_max = vnominal + float(self.perfiles[perfil]['tension'])*.1
        #Le sumamos 1 V como factor de seguridad
 #       v_min += 1
        self.LE_lineaRequerimientos.setText("Requerimientos: " +
                                            "Rango: " + f"{v_min:.2f}" + "-" + f"{v_max:.2f}" + 'V' )

    def iniciarMedicionLinea(self):
        
        #Comprobar campos que ingresó el usuario
        if self.CB_lineaVoltimetroEntrada.currentText()=="":
            QMessageBox.information(None,'Multímetro de Entrada','Debe seleccionar un instrumento de medición.')
            return 
        if self.CB_lineaVoltimetroSalida.currentText()=="":
            QMessageBox.information(None,'Multímetro de Salida','Debe seleccionar un instrumento de medición.')
            return 
        if self.CB_lineaVoltimetroSalida.currentText() == self.CB_lineaVoltimetroEntrada.currentText():
            QMessageBox.information(None,'Multmetros','Debe seleccionar dispositivos diferentes para la entrada y la salda.')
            return   
        if self.CB_lineaRegulador.currentText()=="":
            QMessageBox.information(None,'Fuente de alimentación','Debe seleccionar/crear un perfil nuevo en la pestaña de configuración.')
            return 
        
        #Comprobar conectividad con los dispositivos seleccionados e identificarlos
        multimetro_entrada = ""
        multimetro_salida  = ""
        dispositivos_conectados = self.driver.listar_dispositivos()
        #Identificar dispositivo de entrada
        nserie = self.CB_lineaVoltimetroEntrada.currentText().split(' ')[-1].replace(' ','').replace('2110','') #TESTING
        for disp_id in dispositivos_conectados:
            info = self.driver.leer_info(disp_id)
            if nserie in info:
                multimetro_entrada = disp_id
                break
        #Identificar dispositivo de salida
        nserie = self.CB_lineaVoltimetroSalida.currentText().split(' ')[-1].replace(' ','').replace('2110','') #TESTING
        for disp_id in dispositivos_conectados:
            info = self.driver.leer_info(disp_id)
            if nserie in info:
                multimetro_salida = disp_id 
                break
        if (multimetro_entrada =="") | (multimetro_salida =="")  :
            QMessageBox.critical(None,'Error de conexión','No se pudo establecer conexión con alguno de los dispositivos' +  
                        '\nActualice los dispositivos desde la pestaña de configuración.')
            return   
        #Configurar funcion en multimetro entrada
        if self.driver.configurar_modo(multimetro_entrada,'VOLT:AC') != 'OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar como voltímetro el dispositivo: ' + multimetro_entrada +    
                '\nActualice los dispositivos desde la pestaña de configuración.')
            return 
        #Configurar funcion en multimetro salida
        if self.driver.configurar_modo(multimetro_salida,'VOLT:DC') != 'OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar como voltímetro el dispositivo: ' + multimetro_salida +    
                '\nActualice los dispositivos desde la pestaña de configuración.')
            return 
    
    

        #Setear el rango que debe utilizar el multimetro de entrada
        requerimientos = self.LE_lineaRequerimientos.text().replace('V','').split(' ')[-1].split('-')
        """
        if float(requerimientos[0])<10:
            rango_entrada = 10
        elif float(requerimientos[0])>=10 & float(requerimientos[0])<100:
            rango_entrada = 100 
        else:
            rango_entrada = 1000
        """
        rango_entrada = 750
        if self.driver.setear_rango(multimetro_entrada, funcion="VOLT:AC", rango=rango_entrada)!='OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar el rango en el dispositivo: ' + multimetro_entrada +    
                        '\nActualice los dispositivos desde la pestaña de configuración.')
            return
    
        #Setear el rango que debe utilizar el multimetro de salida
        """if float(requerimientos[1])<10:
            rango_salida = 10
        elif float(requerimientos[1])>=10 & float(requerimientos[1])<100:
            rango_salida = 100
        else:
            rango_salida = 1000
        """
        rango_salida = 10
        if self.driver.setear_rango(multimetro_salida, rango=rango_salida) != 'OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar el rango en el dispositivo: ' + multimetro_salida +    
                '\nActualice los dispositivos desde la pestaña de configuración.')
            return

        #Datos de los instrumentos
        info_instrumento = tablewidget_to_dataframe(self.TW_instrumentos)
        errores_entrada = info_instrumento[info_instrumento['Rango[V]']==str(rango_entrada)]
        cant_digitos = int(errores_entrada.iloc[0]['Cantidad de digitos'])
        error_lectura_entrada = float(errores_entrada.iloc[0]['Error de lectura[%]'])
        error_rango_entrada = float(errores_entrada.iloc[0]['Error de rango[%]'])
        errores_salida = info_instrumento[info_instrumento['Rango[V]']==str(rango_salida)]
        error_lectura_salida = float(errores_salida.iloc[0]['Error de lectura[%]'])
        error_rango_salida = float(errores_salida.iloc[0]['Error de rango[%]'])

        #Abrir ventana 
        lineWindow = LineWindow(self.driver, 
                                multimetro_entrada,
                                multimetro_salida,
                                int(self.LE_tiempoMedicion.text()), 
                                int(self.LE_tiempoMuestreo.text()),
                                float(self.LE_sensibilidadTension.text()),
                                self.LE_lineaRequerimientos.text(),
                                self.perfiles[self.CB_lineaRegulador.currentText()],
                                cant_digitos
                              )
        lineWindow.exec()

        #Si el usuario canceló
        if lineWindow.estado!='FINALIZADO':
            return

        #Calculo de incertidumbres en variación de entrada V_sup_in - V_inf_in        
        #Estadisticas 
        stats_entrada_sup = lineWindow.mediciones[lineWindow.mediciones['medicion']=='superior']['entrada_V'].describe()
        stats_entrada_inf = lineWindow.mediciones[lineWindow.mediciones['medicion']=='inferior']['entrada_V'].describe()
        #Incertidumbres tipo A: estandar/raiz(mediciones)
        incertidumbreA_sup_entrada = (stats_entrada_sup['std'] / sqrt((stats_entrada_sup.loc['count'])))/stats_entrada_sup['mean']  
        incertidumbreA_inf_entrada = (stats_entrada_inf['std'] / sqrt((stats_entrada_inf.loc['count'])))/stats_entrada_inf['mean']  
        #Incertidumbres tipo B: 0,012%/100% * valor medido + 0,004%/100% * maximo_del_rango 
        incertidumbreB_sup_entrada = ((error_lectura_entrada/100)*stats_entrada_sup['mean'] + (error_rango_entrada/100)*rango_entrada)/(sqrt(3)*stats_entrada_sup['mean'])
        incertidumbreB_inf_entrada = ((error_lectura_entrada/100)*stats_entrada_inf['mean'] + (error_rango_entrada/100)*rango_entrada)/(sqrt(3)*stats_entrada_inf['mean'])
        #Incertidumbres combinadas:
        incertidumbreA_combinada_entrada = sqrt((incertidumbreA_inf_entrada**2)+(incertidumbreA_sup_entrada**2)) 
        incertidumbreB_combinada_entrada = sqrt((incertidumbreB_inf_entrada**2)+(incertidumbreB_sup_entrada**2))        
        incertidumbre_entrada = sqrt((incertidumbreA_combinada_entrada**2)+(incertidumbreB_combinada_entrada**2))
        
        #Calculo de incertidumbres en variación de salida V_sup_out - V_inf_out        
        #Estadisticas 
        stats_salida_sup = lineWindow.mediciones[lineWindow.mediciones['medicion']=='superior']['salida_V'].describe()
        stats_salida_inf = lineWindow.mediciones[lineWindow.mediciones['medicion']=='inferior']['salida_V'].describe()
        #Incertidumbres tipo A: estandar/raiz(mediciones)
        incertidumbreA_sup_salida = (stats_salida_sup['std'] / sqrt((stats_salida_sup.loc['count'])))/stats_entrada_sup['mean']    
        incertidumbreA_inf_salida = (stats_salida_inf['std'] / sqrt((stats_salida_inf.loc['count'])))/stats_salida_inf['mean']     
        #Incertidumbres tipo B: 0,012%/100% * valor medido + 0,004%/100% * maximo_del_rango 
        incertidumbreB_sup_salida = ((error_lectura_salida/100) * stats_salida_sup['mean'] + (error_rango_salida/100)*rango_salida)/(sqrt(3)*stats_salida_sup['mean'])
        incertidumbreB_inf_salida = ((error_lectura_salida/100) * stats_salida_inf['mean'] + (error_rango_salida/100)*rango_salida)/(sqrt(3)*stats_salida_inf['mean'])
        #Incertidumbres combinadas:
        incertidumbreA_combinada_salida = sqrt((incertidumbreA_inf_salida**2)+(incertidumbreA_sup_salida**2)) 
        incertidumbreB_combinada_salida = sqrt((incertidumbreB_inf_salida**2)+(incertidumbreB_sup_salida**2))        
        incertidumbre_salida = sqrt((incertidumbreA_combinada_salida**2)+(incertidumbreB_combinada_salida**2))
         
        #Calculo de coeficientes de sensibilidad 
        coef_sens_entrada = -1#-(deltaVout)/(deltaVin**2)  # derivada de EL con respecto a Delta V entrada
        coef_sens_salida = 1#1/deltaVin  # derivada de EL con respecto a Delta V salida

        #Incertidumbre combinada: entrada y salida
        incertidumbre_combinada = sqrt( (coef_sens_entrada*incertidumbre_entrada)**2 + (coef_sens_salida*incertidumbre_salida)**2 )

        #Grados de libertad efectivos
        summ = 0
        for incertA in [incertidumbreA_sup_entrada, incertidumbreA_inf_entrada, incertidumbreA_sup_salida, incertidumbreA_inf_salida]:
            summ+= (incertA**4)/((stats_entrada_sup.loc['count'])-1)
        veff = (incertidumbre_combinada**4)/summ

        print(f"veff: {veff}")
        
        #Incertidumbre expandida:
        intervalo = self.CB_intervaloConfianza.currentText() 
        if intervalo=='68.3%':
            k = K_t_student(0.683,veff)
        elif intervalo=="90%":
            k = K_t_student(0.9,veff)
        elif intervalo=="95%":
            k = K_t_student(0.95,veff)
        else:
            k = K_t_student(0.9545,veff)
            
        incertidumbre_expandida = incertidumbre_combinada*k

        #Expresion de valor final: Variacion de la V de salida: Vin+10%-Vin-10% / Variacion de la V de entrada Vout+10% - Vin-10%     
        deltaVin  = stats_entrada_sup['mean']-stats_entrada_inf['mean']
        deltaVout = stats_salida_sup['mean']-stats_salida_inf['mean']
        valor_final = deltaVout/deltaVin
        
        #Corroborar si cumple con lo garantizado por el fabricante
#        reg_linea = float(self.perfiles[self.CB_lineaRegulador.currentText()]['reg_linea'])
        v_nominal = float(self.perfiles[self.CB_lineaRegulador.currentText()]['salida'])

        valor_final_mv = abs(valor_final) * v_nominal * 1000
        incertidumbre_expandida_mv = abs(incertidumbre_expandida) * v_nominal * 1000 
#        resultado="Cumple con el dato garantizado por el fabricante."
#        if valor_final_mv+incertidumbre_expandida_mv > reg_linea:
#            resultado= "No cumple con el dato garantizado por el fabricante."

        #Setear cuadro de incertidumbre a la entrada
        self.LBL_lineaIncertAsuperiorEntrada.setText(f"Incertidumbre tipo A de valor superior: {incertidumbreA_sup_entrada*1000:.3} mV" )
        self.LBL_lineaIncertAinferiorEntrada.setText(f"Incertidumbre tipo A de valor inferior: {incertidumbreA_inf_entrada*1000:.3} mV" )
        self.LBL_lineaIncertAcombinadaEntrada.setText(f"Incertidumbre tipo A combinada: {incertidumbreA_combinada_entrada*1000:.3} mV" )
        self.LBL_lineaIncertBsuperiorEntrada.setText(f"Incertidumbre tipo B de valor superior: {incertidumbreB_sup_entrada*1000:.3} mV" )
        self.LBL_lineaIncertBinferiorEntrada.setText(f"Incertidumbre tipo B de valor inferior: {incertidumbreB_inf_entrada*1000:.3} mV" )
        self.LBL_lineaIncertBcombinadaEntrada.setText(f"Incertidumbre tipo B combinada: {incertidumbreB_combinada_entrada*1000:.3} mV" )
        self.LBL_lineaIncertEntrada.setText(f"Incertidumbre de tensión a la entrada: {incertidumbre_entrada*1000:.3} mV" )

        #Setear cuadro de incertidumbre a la salida
        self.LBL_lineaIncertAsuperiorSalida.setText(f"Incertidumbre tipo A de valor superior: {incertidumbreA_sup_salida*1000:.3} mV" )
        self.LBL_lineaIncertAinferiorSalida.setText(f"Incertidumbre tipo A de valor inferior: {incertidumbreA_inf_salida*1000:.3} mV" )
        self.LBL_lineaIncertAcombinadaSalida.setText(f"Incertidumbre tipo A combinada: {incertidumbreA_combinada_salida*1000:.3} mV" )
        self.LBL_lineaIncertBsuperiorSalida.setText(f"Incertidumbre tipo B de valor superior: {incertidumbreB_sup_salida*1000:.3} mV" )
        self.LBL_lineaIncertBinferiorSalida.setText(f"Incertidumbre tipo B de valor inferior: {incertidumbreB_inf_salida*1000:.3} mV" )
        self.LBL_lineaIncertBcombinadaSalida.setText(f"Incertidumbre tipo B combinada: {incertidumbreB_combinada_salida*1000:.3} mV" )
        self.LBL_lineaIncertSalida.setText(f"Incertidumbre de tensión a la salida: {incertidumbre_salida*1000:.3} mV" )

        self.LBL_lineaResultado.setText("La fuente de alimentación presentó un efecto de línea de \n"
                f"{valor_final_mv:.4} mV ± {incertidumbre_expandida*100:.4} % para un intervalo de confianza del " + intervalo ) 
        
        #Setear Tabla de valores medidos
        fill_tablewidget_from_dataframe( lineWindow.mediciones[lineWindow.mediciones['medicion']=='superior'], self.TW_valoresRegistradosSup)
        fill_tablewidget_from_dataframe( lineWindow.mediciones[lineWindow.mediciones['medicion']=='inferior'], self.TW_valoresRegistradosInf)

        #Presentar resultado
        QMessageBox.information(None, 'Efecto de Línea', "Finalizó la medición!\nPara visualizar más detalles dirijase a la pestaña Mediciones.")

    def cargarRequerimientosCarga(self, perfil):
        #La tensión minima de entrada para que funcione el regulador es la v nominal mas la v de dropout y le sumamos 1 V como factor de seguridad
        v_min = 220#float(self.perfiles[perfil]['tension']) + float(self.perfiles[perfil]['dropout']) + 1
        #La corriente máxima es la del regulador + 500mA como factor de seguridad
        i_max = float(self.perfiles[perfil]['corriente']) + 0.5
        self.LE_cargaRequerimientos.setText("Requerimientos: " +
                                            f"Vmin: {v_min} V - " + f"Imax: {i_max} A"    )

    def iniciarMedicionCarga(self):
        
        
        #Comprobar campos que ingresó el usuario
        if self.CB_cargaVoltimetroSalida.currentText()=="":
            QMessageBox.information(None,'Multímetro de Entrada','Debe seleccionar un instrumento de medición.')
            return 
        if self.CB_cargaAmperimetro.currentText()=="":
            QMessageBox.information(None,'Multímetro de Salida','Debe seleccionar un instrumento de medición.')
            return 
        if self.CB_cargaVoltimetroSalida.currentText() == self.CB_cargaAmperimetro.currentText():
            QMessageBox.information(None,'Multmetros','Debe seleccionar dispositivos diferentes para la entrada y la salda.')
            return   
        if self.CB_cargaRegulador.currentText()=="":
            QMessageBox.information(None,'Regulador de tensión','Debe seleccionar un regulador o crear un perfil nuevo en la pestaña de configuración.')
            return 
        
        #Comprobar conectividad con los dispositivos seleccionados e identificarlos
        amperimetro  = ""
        voltimetro = ""
        dispositivos_conectados = self.driver.listar_dispositivos()
        #Identificar amperimetro
        nserie = self.CB_cargaAmperimetro.currentText().split(' ')[-1].replace(' ','').replace('2110','') #TESTING
        for disp_id in dispositivos_conectados:
            info = self.driver.leer_info(disp_id)
            if nserie in info:
                amperimetro = disp_id
                break
        #Identificar dispositivo de salida
        nserie = self.CB_cargaVoltimetroSalida.currentText().split(' ')[-1].replace(' ','').replace('2110','') #TESTING
        for disp_id in dispositivos_conectados:
            info = self.driver.leer_info(disp_id)
            if nserie in info:
                voltimetro = disp_id 
                break
        if (amperimetro =="") | (voltimetro =="")  :
            QMessageBox.critical(None,'Error de conexión','No se pudo establecer conexión con alguno de los dispositivos' +  
                        '\nActualice los dispositivos desde la pestaña de configuración.')
            return    
        #Configurar funcion en amperimetro
        if self.driver.configurar_modo(amperimetro,'CURR:DC') != 'OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar como amperímetro el dispositivo: ' + amperimetro +    
                '\nActualice los dispositivos desde la pestaña de configuración.')
            return 
        #Configurar funcion en voltimetro
        if self.driver.configurar_modo(voltimetro, 'VOLT:DC') != 'OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar como voltímetro el dispositivo: ' + voltimetro +    
                '\nActualice los dispositivos desde la pestaña de configuración.')
            return 
        #Setear el rango que debe utilizar el amperimetro (3A)
        if self.driver.setear_rango(amperimetro, funcion="CURR:DC" , rango=1) != 'OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar el rango en el dispositivo: ' + amperimetro +    
                '\nActualice los dispositivos desde la pestaña de configuración.')
            return
        #Setear el rango que debe utilizar el voltimetro
        vmin = self.LE_cargaRequerimientos.text().split(' ')[2]
        if float(vmin)<10:
            rango_voltimetro = 10
        else:
            rango_voltimetro = 100
        rango_voltimetro=10
        if self.driver.setear_rango(voltimetro, rango=rango_voltimetro) != 'OK':
            QMessageBox.critical(None,'Error de configuración','No se pudo configurar el rango en el dispositivo: ' + voltimetro +    
                '\nActualice los dispositivos desde la pestaña de configuración.')
            return
        
        
        #Datos del voltimetro
        info_voltimetro = tablewidget_to_dataframe(self.TW_instrumentos)
        errores_voltimetro = info_voltimetro[info_voltimetro['Rango[V]']==str(rango_voltimetro)]
        cant_digitos = int(errores_voltimetro.iloc[0]['Cantidad de digitos'])
        error_lectura_voltimetro = float(errores_voltimetro.iloc[0]['Error de lectura[%]'])
        error_rango_voltimetro = float(errores_voltimetro.iloc[0]['Error de rango[%]'])
        #Datos del amperimetro
        info_amperimetro = tablewidget_to_dataframe(self.TW_instrumentosAmperimetro)
        errores_amperimetro = info_amperimetro[info_amperimetro['Rango[A]']==str(1)]
        error_lectura_amperimetro = float(errores_amperimetro.iloc[0]['Error de lectura[%]'])
        error_rango_amperimetro = float(errores_amperimetro.iloc[0]['Error de rango[%]'])


        #Abrir ventana 
        loadWindow = LoadWindow(self.driver, 
                                voltimetro,
                                amperimetro,
                                int(self.LE_tiempoMedicion.text()), 
                                int(self.LE_tiempoMuestreo.text()),
                                float(self.LE_sensibilidadTension.text()),
                                float(self.LE_sensibilidadCorriente.text()),
                                self.perfiles[self.CB_cargaRegulador.currentText()],
                                cant_digitos
                              )
        loadWindow.exec()

        #Si el usuario canceló
        if loadWindow.estado!='FINALIZADO':
            return

        #Expresión de Calculo de Efecto de Carga:  (Tension_sin_carga - Tension_con_carga)/Tension_sin_carga

        #Calculo de incertidumbres de Tension_sin_carga
        #Estadisticas 
        stats_Vsincarga = loadWindow.mediciones['V_sin_carga'].describe()
        #Incertidumbre tipo A: estandar/raiz(mediciones)
        incertidumbreA_Vsincarga = (stats_Vsincarga['std'] / sqrt((stats_Vsincarga.loc['count'])))/stats_Vsincarga['mean']  
        #Incertidumbre tipo B: 0,012%/100% * valor medido + 0,004%/100% * maximo_del_rango 
        incertidumbreB_Vsincarga = ((error_lectura_voltimetro/100) * stats_Vsincarga['mean'] + (error_rango_voltimetro/100)*rango_voltimetro)/(sqrt(3)*stats_Vsincarga['mean'])
        #Incertidumbre combinada:
        incertidumbre_Vsincarga = sqrt((incertidumbreA_Vsincarga**2)+(incertidumbreB_Vsincarga**2))
        
        #Calculo de incertidumbres de Tension_con_carga
        #Estadisticas 
        stats_Vconcarga = loadWindow.mediciones['V_con_carga'].describe()
        #Incertidumbre tipo A: estandar/raiz(mediciones)
        incertidumbreA_Vconcarga = (stats_Vconcarga['std'] / sqrt((stats_Vconcarga.loc['count'])))/stats_Vconcarga['mean']
        #Incertidumbre tipo B: 0,012%/100% * valor medido + 0,004%/100% * maximo_del_rango 
        incertidumbreB_Vconcarga = ((error_lectura_voltimetro/100) * stats_Vconcarga['mean'] + (error_rango_voltimetro/100)*rango_voltimetro)/(sqrt(3)*stats_Vconcarga['mean'])
        #Incertidumbre combinada:
        incertidumbre_Vconcarga = sqrt((incertidumbreA_Vconcarga**2)+(incertidumbreB_Vconcarga**2))
        
        #Calculo de coeficientes de sensibilidad 
        Vsincarga_mean = stats_Vsincarga['mean']
        Vconcarga_mean = stats_Vconcarga['mean']
        coef_sens_Vsincarga = Vconcarga_mean/(Vsincarga_mean-Vconcarga_mean)   # derivada de EC con respecto a Vsincarga
        coef_sens_Vconcarga = -Vconcarga_mean/(Vsincarga_mean-Vconcarga_mean)   # derivada de EC con respecto a Vconcarga

        #Incertidumbre combinada: Vsincarga y Vconcarga
        incertidumbre_combinada = sqrt( (coef_sens_Vsincarga*incertidumbre_Vsincarga)**2 + (coef_sens_Vconcarga*incertidumbre_Vconcarga)**2 )

       #Grados de libertad efectivos
       # summ = 0
       # for incertA in [incertidumbreA_sup_entrada, incertidumbreA_inf_entrada, incertidumbreA_sup_salida, incertidumbreA_inf_salida]:
       #     summ+= (incertA**4)/((stats_entrada_sup.loc['count'])-1)
       # veff = (incertidumbre_combinada**4)/summ

        #print(f"veff: {veff}")
        veff = 1000

        #Incertidumbre expandida:
        intervalo = self.CB_intervaloConfianza.currentText() 
        k=2
        if intervalo=='68.3%':
            K_t_student(0.683,veff)
        elif intervalo=="90%":
            K_t_student(0.9,veff)
        elif intervalo=="95%":
            K_t_student(0.95,veff)
        else:
            K_t_student(0.9545,veff)
        incertidumbre_expandida = incertidumbre_combinada*k

        #Expresion de valor final: Variacion de la V de salida: Vin+10%-Vin-10% / Variacion de la V de entrada Vout+10% - Vin-10%
        valor_final = (Vsincarga_mean-Vconcarga_mean)/Vconcarga_mean

        #Corroborar si cumple con lo garantizado por el fabricante
        v_nominal = float(self.perfiles[self.CB_cargaRegulador.currentText()]['salida'])
#        reg_carga = float(self.perfiles[self.CB_cargaRegulador.currentText()]['reg_carga'])
#        resultado="Cumple con el dato garantizado por el fabricante."
#        if valor_final*v_nominal/1000+incertidumbre_expandida*v_nominal/1000 > reg_carga:
#            resultado= "No cumple con el dato garantizado por el fabricante."

        #Setear cuadro de incertidumbre sin carga
        self.LBL_IncertAsincarga.setText(f"Incertidumbre tipo A: {incertidumbreA_Vsincarga:.3} mV" )
        self.LBL_IncertBsincarga.setText(f"Incertidumbre tipo B: {incertidumbreB_Vsincarga:.3} mV" )
        self.LBL_IncertCombsincarga.setText(f"Incertidumbre combinada: {incertidumbre_Vsincarga:.3} mV" )

        #Setear cuadro de incertidumbre con carga
        self.LBL_IncertAconcarga.setText(f"Incertidumbre tipo A: {incertidumbreA_Vconcarga:.3} mV" )
        self.LBL_IncertBconcarga.setText(f"Incertidumbre tipo B: {incertidumbreB_Vconcarga:.3} mV" )
        self.LBL_IncertCombconcarga.setText(f"Incertidumbre combinada: {incertidumbre_Vconcarga:.3} mV" )

        #Resultado
        self.LBL_cargaResultado.setText("La fuente de alimentación presentó un efecto de regulación de carga de \n"
                f"{valor_final*100:.4} % ± {100*incertidumbre_expandida:.4} % para un intervalo de confianza del " + intervalo ) 
        
        #Setear Tabla de valores medidos
        fill_tablewidget_from_dataframe( loadWindow.mediciones, self.TW_valoresRegistrados)

        #Presentar resultado
        QMessageBox.information(None, 'Efecto de Carga', "Finalizó la medición"+ 
                "\n\nPara visualizar más detalles dirijase a la pestaña Mediciones.")



####### SLOTS
    def on_tabWidget_currentChanged(self, index):
        #Pestaña de Efecto de Linea
        if index==0:
            pass
    
    def on_BTN_actualizar_clicked(self):
        #Borrar tabla y limpiar combobox
        self.TW_dispositivosConectados.setRowCount(0)
        self.CB_lineaVoltimetroEntrada.clear()
        self.CB_lineaVoltimetroSalida.clear()
        self.CB_cargaAmperimetro.clear()
        self.CB_cargaVoltimetroSalida.clear()
        #Por cada dispositivo detectado presentar información
        for disp_id in self.driver.listar_dispositivos():
            if "ASRL" not in disp_id:
                info = self.driver.leer_info(disp_id).split(',')
                #Agregar fila y escribir datos en tabla
                row_index = self.TW_dispositivosConectados.rowCount()
                self.TW_dispositivosConectados.insertRow(row_index)     
                for col_index, valor in enumerate(info):
                    item = QTableWidgetItem(valor)
                    item.setFlags(item.flags() & ~Qt.ItemFlag.ItemIsEditable)  # Solo lectura por ítem
                    self.TW_dispositivosConectados.setItem(row_index, col_index, item)
                self.TW_dispositivosConectados.resizeColumnsToContents()
                #Agregar item a todos los combobox 
                self.CB_lineaVoltimetroEntrada.addItem(info[0] + info[1] + info[2])
                self.CB_lineaVoltimetroSalida.addItem(info[0] + info[1] + info[2])
                self.CB_cargaAmperimetro.addItem(info[0] + info[1] + info[2])
                self.CB_cargaVoltimetroSalida.addItem(info[0] + info[1] + info[2])

#Clase ventana Efecto de carga
class LoadWindow(QDialog, Ui_LoadWindow):
    def __init__(self, driver, voltimetro, amperimetro, tiempo_medicion, tiempo_muestreo, sens_v, sens_i, regulador, cant_digitos, parent=None):
        super(LoadWindow, self).__init__(parent)
        self.setupUi(self)
        #Muestreo y medición
        self.tiempo_medicion = tiempo_medicion
        self.tiempo_muestreo = tiempo_muestreo*1000 #ms
        self.sens_v = sens_v #mV
        self.sens_i = sens_i
        self.regulador = regulador
        self.cant_digitos = cant_digitos
        #Conexión y configuración
        self.driver = driver
        self.voltimetro = voltimetro
        self.amperimetro  = amperimetro 
        #Timer
        self.timer = QTimer()
        self.timer.start(self.tiempo_muestreo)
        self.estado = 'INICIO'
        #Inicializar ventana
        self.initWindow()
        
    def initWindow(self):
        self.connectSignalsSlots()
        self.setWindowTitle("Medición de Efecto de Carga" + self.regulador['modelo'])
        #Setear maximo de digitos en multimetros
        self.LBL_voltimetro.setDigitCount(self.cant_digitos+1)
        self.LBL_amperimetro.setDigitCount(self.cant_digitos+1)

    def connectSignalsSlots(self):
        self.BTN_cancelar.clicked.connect(self.close)        
        self.timer.timeout.connect(self.medirInstrumentos)

    def closeEvent(self, event):
        pass

    def medirInstrumentos(self):
        
        #Medir y mostrar tensiones
        valor_voltimetro  =  self.driver.leer_medicion(self.voltimetro)
        valor_amperimetro =  self.driver.leer_medicion(self.amperimetro)

        self.LBL_voltimetro.display(valor_voltimetro)
        self.LBL_amperimetro.display(valor_amperimetro)

        ################################## MAQUINA DE ESTADOS ###################################
        if self.estado=='CANCELAR':
            self.timer.stop()

        elif self.estado=='INICIO':
            self.LBL_mensaje.setText('Incremente lentamente la tensión de la fuente hasta visualizar en el voltímetro la tensión nominal de la fuente ' +
            str(self.regulador['salida']) + ' V')
            #Si alcanzó el valor nominal dentro de una cierta sensibilidad en mV
            if (valor_voltimetro>=float(self.regulador['salida'])-0.1-float(self.sens_v)/1000) & (valor_voltimetro<=float(self.regulador['salida'])+0.1+float(self.sens_v)/1000):
                self.estado='MEDIR'  
                self.V_sin_carga = []

        elif (self.estado=='MEDIR'):
            #Tomar mediciones en condiciones de repetibilidad durante tiempo_medicion
            self.LBL_mensaje.setText('Tomando mediciones de tensión en condiciones de repetibilidad, no modifique la tensión de la fuente.')
            #Si se sale del rango volver al INICIO
            if (valor_voltimetro<float(self.regulador['salida'])-0.1-float(self.sens_v)/1000) | (valor_voltimetro>float(self.regulador['salida'])+0.1+float(self.sens_v)/1000):
                self.estado='INICIO'  
            #Almacenar medicion
            elif len(self.V_sin_carga) < self.tiempo_medicion:
                self.V_sin_carga.append(valor_voltimetro)
            #Si terminó de medir
            else:
                self.estado='AUMENTAR_CORRIENTE'

        elif (self.estado=='AUMENTAR_CORRIENTE'):
            #I de ensayo 
            self.i_ensayo = float(self.regulador['corriente'])
            self.LBL_mensaje.setText(f'Conecte la carga y varíe el valor del potenciometro hasta visualizar en el amperimetro una corriente de {self.i_ensayo} A')
            #Si alcanzó el valor nominal dentro de una cierta sensibilidad en mA
            if (valor_amperimetro>=self.i_ensayo-float(self.sens_i)/1000) & (valor_amperimetro<=self.i_ensayo+float(self.sens_i)/1000):
                self.estado='MEDIR_CORRIENTE'      
                self.I_carga = []

        elif (self.estado=='MEDIR_CORRIENTE'):
            #Tomar mediciones en condiciones de repetibilidad durante tiempo_medicion
            self.LBL_mensaje.setText('Tomando mediciones de corriente en condiciones de repetibilidad, no modifique la tensión de la fuente ni la corriente de carga.')
            #Si se sale del rango volver a Aumentar corriente
            if (valor_amperimetro<self.i_ensayo-float(self.sens_i)/1000) | (valor_amperimetro>self.i_ensayo+float(self.sens_i)/1000):
                self.estado='AUMENTAR_CORRIENTE'  
            #Almacenar medicion
            elif len(self.I_carga) < self.tiempo_medicion:
               self.I_carga.append(valor_amperimetro)
            #Si terminó de medir
            else:
                self.estado='MEDIR_CARGA'
                self.V_con_carga = []
        
        elif (self.estado=='MEDIR_CARGA'):
            #Tomar mediciones en condiciones de repetibilidad durante tiempo_medicion
            self.LBL_mensaje.setText('Tomando mediciones de tensión en condiciones de repetibilidad, no modifique la tensión de la fuente ni la corriente de carga.')
            #Almacenar medicion
            if len(self.V_con_carga) < self.tiempo_medicion:
                self.V_con_carga.append(valor_voltimetro)
            #Si terminó de medir
            else:
                self.estado='FINALIZADO'

        elif (self.estado=='FINALIZADO'):
            self.mediciones = pd.DataFrame({"V_sin_carga":self.V_sin_carga, "I_carga_A": self.I_carga, "V_con_carga": self.V_con_carga})                  
            self.timer.stop()
            self.LBL_mensaje.setText('Medición Finalizada.')
            QMessageBox.information(None, 'Medición Finalizada', 'La medición se realizó de forma exitosa.')
            self.close()


#Clase ventana Efecto de linea
class LineWindow(QDialog, Ui_LineWindow):
    def __init__(self, driver, multimetro_entrada, multimetro_salida, tiempo_medicion, tiempo_muestreo, sens, req, regulador, cant_digitos, parent=None):
        super(LineWindow, self).__init__(parent)
        self.setupUi(self)
        #Muestreo y medición
        self.tiempo_medicion = tiempo_medicion
        self.tiempo_muestreo = tiempo_muestreo*1000 #ms
        self.sensibilidad = sens #mV
        self.requerimientos = req.replace('V','').split(' ')[-1].split('-')
        self.regulador = regulador
        self.cant_digitos = cant_digitos
        #Conexión y configuración
        self.driver = driver
        self.multimetro_entrada = multimetro_entrada
        self.multimetro_salida  = multimetro_salida 
        #Timer
        self.timer = QTimer()
        self.timer.start(self.tiempo_muestreo)
        self.estado = 'INICIO'
        #Inicializar ventana
        self.initWindow()
        
    def initWindow(self):
        self.connectSignalsSlots()
        self.setWindowTitle("Medición de Efecto de Línea de regulador " + self.regulador['modelo'])
        #Setear maximo de digitos en multimetros
        self.LBL_multimetroEntrada.setDigitCount(self.cant_digitos+1)
        self.LBL_multimetroSalida.setDigitCount(self.cant_digitos+1)

    def connectSignalsSlots(self):
        self.BTN_cancelar.clicked.connect(self.close)        
        self.timer.timeout.connect(self.medirVoltimetros)

    def closeEvent(self, event):
        pass

    def medirVoltimetros(self):
        
        #Medir y mostrar tensiones
        valor_entrada = self.driver.leer_medicion(self.multimetro_entrada)
        valor_salida =  self.driver.leer_medicion(self.multimetro_salida)

        self.LBL_multimetroEntrada.display(valor_entrada)
        self.LBL_multimetroSalida.display(valor_salida)

        #Maquina de estados:
        if self.estado=='CANCELAR':
            self.timer.stop()

        elif self.estado=='INICIO':
            self.LBL_mensaje.setText('Incremente lentamente la tensión de la fuente hasta alcanzar los ' + self.requerimientos[1] + ' V'
            ' que corresponden con un 10% de aumento de la tensión nominal de la fuente de alimentación. ')
            #Si alcanzó el valor nominal más el 10% dentro de una cierta sensibilidad en mV
            if (valor_entrada>=float(self.requerimientos[1])-float(self.sensibilidad)/1000) & (valor_entrada<=float(self.requerimientos[1])+float(self.sensibilidad)/1000):
                self.estado='MEDIR_SUPERIOR'  
                self.mediciones = pd.DataFrame(columns=["entrada_V","salida_V",'medicion']) 

        elif (self.estado=='MEDIR_SUPERIOR'):
            #Tomar mediciones en condiciones de repetibilidad durante tiempo_medicion
            self.LBL_mensaje.setText('Tomando mediciones en condiciones de repetibilidad, no modifique la tensión de la fuente.')
            #Si se sale del rango volver al INICIO
            if (valor_entrada<float(self.requerimientos[1])-float(self.sensibilidad)/1000) | (valor_entrada>float(self.requerimientos[1])+float(self.sensibilidad)/1000):
                self.estado='INICIO'  
            #Almacenar medicion
            elif len(self.mediciones) < self.tiempo_medicion:
                self.mediciones.loc[len(self.mediciones)] = [valor_entrada, valor_salida, 'superior']
            #Si terminó de medir
            else:
                self.estado='BAJAR_TENSION'

        elif (self.estado=='BAJAR_TENSION'):
            self.LBL_mensaje.setText('Disminuya lentamente la tensión de la fuente hasta alcanzar los ' + self.requerimientos[0] + ' V'
            ' que corresponden con un 10% de reducción de la tensión nominal de la fuente de alimentación. ')
            #Si alcanzó el valor nominal menos el 10% dentro de una cierta sensibilidad en mV
            if (valor_entrada>=float(self.requerimientos[0])-float(self.sensibilidad)/1000) & (valor_entrada<=float(self.requerimientos[0])+float(self.sensibilidad)/1000):
                self.estado='MEDIR_INFERIOR'      
                self.mediciones = self.mediciones[self.mediciones['medicion']=='superior']

        elif (self.estado=='MEDIR_INFERIOR'):
            #Tomar mediciones en condiciones de repetibilidad durante tiempo_medicion
            self.LBL_mensaje.setText('Tomando mediciones en condiciones de repetibilidad, no modifique la tensión de la fuente.')
            #Si se sale del rango volver a BAJAR TENSION
            if (valor_entrada<float(self.requerimientos[0])-float(self.sensibilidad)/1000) | (valor_entrada>float(self.requerimientos[0])+float(self.sensibilidad)/1000):
                self.estado='BAJAR_TENSION'  
            #Almacenar medicion
            elif len(self.mediciones) < self.tiempo_medicion*2:
                self.mediciones.loc[len(self.mediciones)] = [valor_entrada, valor_salida, 'inferior']
            #Si terminó de medir
            else:
                self.estado='FINALIZADO'
        
        elif (self.estado=='FINALIZADO'):
            self.timer.stop()
            self.LBL_mensaje.setText('Medición Finalizada.')
            QMessageBox.information(None, 'Medición Finalizada', 'La medición se realizó de forma exitosa.')
            self.close()

#Funciones homogeneas
def tablewidget_to_dataframe(table: QTableWidget) -> pd.DataFrame:
    """Convierte una QTable en un dataframe"""

    rows = table.rowCount()
    cols = table.columnCount()

    # Obtener nombres de columnas
    headers = [table.horizontalHeaderItem(i).text() if table.horizontalHeaderItem(i) else f"Col{i}" for i in range(cols)]

    data = []
    for row in range(rows):
        row_data = []
        for col in range(cols):
            item = table.item(row, col)
            row_data.append(item.text() if item else "")
        data.append(row_data)

    return pd.DataFrame(data, columns=headers)

def fill_tablewidget_from_dataframe(df: pd.DataFrame, table: QTableWidget):
    # Limpiar tabla
    table.clear()
    table.setRowCount(0)
    table.setColumnCount(0)

    # Setear dimensiones
    table.setRowCount(df.shape[0])
    table.setColumnCount(df.shape[1])

    # Setear encabezados de columna
    table.setHorizontalHeaderLabels(df.columns.astype(str).tolist())

    # Cargar datos
    for row in range(df.shape[0]):
        for col in range(df.shape[1]):
            value = str(df.iat[row, col])
            table.setItem(row, col, QTableWidgetItem(value))

    # Ajustar tamaño de columnas y filas al contenido
    table.resizeColumnsToContents()
    table.resizeRowsToContents()
    table.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeMode.Stretch)

def K_t_student(p_total=0.9545, v=10): 

    """ 

    p_total= Área total (la de la tabla) 

    v= Grados de libertad     

    Devuelve el valor K de la distribución t de Student para un nivel de confianza y grados de libertad dados 

    """     

    from scipy import stats 

    # convertir a prob acumulada 

    p_cdf = (1 + p_total) / 2     

    K=stats.t.ppf(p_cdf, v) 

    return K 

################### MAIN #####################T
if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = MainWindow()
    win.showMaximized()
    app.exec()


        

