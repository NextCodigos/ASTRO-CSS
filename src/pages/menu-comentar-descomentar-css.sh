#!/bin/bash

archivo="index.astro"

while true; do
    # Mostrar opciones al usuario
    echo "Seleccione una opción:"
    echo "1. Mostrar contenido del archivo con números de línea"
    echo "2. Comentar una línea específica"
    echo "3. Comentar un rango de líneas"
    echo "4. Descomentar una línea específica"
    echo "5. Descomentar un rango de líneas"
    echo "6. Salir"

    # Leer la opción del usuario
    read opcion

    case $opcion in
        1)
            # Mostrar contenido del archivo con números de línea
            nl "$archivo"
            ;;
        2)
            # Comentar una línea específica
            echo "Ingrese el número de línea que desea comentar:"
            read num_linea
            sed -i "${num_linea}s/^/\/\*/" "$archivo"
            sed -i "${num_linea}s/$/\*\//" "$archivo"
            echo "Línea $num_linea comentada."
            ;;
        3)
            # Comentar un rango de líneas
            echo "Ingrese el rango de líneas que desea comentar (ej. 5,10):"
            read rango_lineas
            sed -i "${rango_lineas}s/^/\/\*/; ${rango_lineas}s/$/\*\//" "$archivo"
            echo "Líneas $rango_lineas comentadas."
            ;;
        4)
            # Descomentar una línea específica
            echo "Ingrese el número de línea que desea descomentar:"
            read num_linea
            sed -i "${num_linea}s/\/\*//; ${num_linea}s/\*\///" "$archivo"
            echo "Línea $num_linea descomentada."
            ;;
        5)
            # Descomentar un rango de líneas
            echo "Ingrese el rango de líneas que desea descomentar (ej. 5,10):"
            read -r rango_lineas
            sed -i "${rango_lineas}s/\/\*//; ${rango_lineas}s/\*\///" "$archivo"
            echo "Líneas $rango_lineas descomentadas."
            ;;
        6)
            # Salir del script
            echo "Saliendo del script."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione una opción válida."
            ;;
    esac
done