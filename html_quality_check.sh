#!/bin/bash

# Buscar todos los archivos HTML en la rama
HTML_FILES=$(find . -name "*.html")

if [ -z "$HTML_FILES" ]; then
    echo "No se encontraron archivos HTML en la rama."
    exit 1
fi

# Reglas de calidad de HTML
for FILE in $HTML_FILES; do
    echo "Escaneando archivo: $FILE"

    # Ejemplo de regla: Verificar que todas las imágenes tengan el atributo alt
    if grep -q "<img src=.*>" "$FILE"; then
        grep -q "<img src=.* alt=.*>" "$FILE" || {
            echo "Error en $FILE: Falta el atributo alt en una o más imágenes."
            exit 1
        }
    fi

    # Añadir más reglas según sea necesario...
done

echo "Aprobado: Todos los archivos HTML cumplen con los estándares de calidad."
