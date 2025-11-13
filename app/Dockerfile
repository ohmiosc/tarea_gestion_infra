# Imagen base ligera de Python
FROM python:3.10-slim

# Crea un directorio de trabajo
WORKDIR /app

# Copia los archivos
COPY app.py .

# Instala Flask
RUN pip install --no-cache-dir flask

# Expone el puerto donde correrá la app
EXPOSE 80

# Comando de arranque
CMD ["python", "app.py"]
