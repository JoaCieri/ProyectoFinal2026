from cx_Freeze import setup, Executable

setup(
    name="Medición de Regulación",
    version="1.0",
    description="Regulación de Linea y de Carga",
    executables=[Executable("app.py")]
)