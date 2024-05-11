#!/bin/bash

# skrypt.sh --date
if [ "$1" = "--date" ]; then
    date +"Dzisiejsza data: %Y-%m-%d"
fi

# skrypt.sh --logs
if [ "$1" = "--logs" ]; then
    for ((i=1; i<=100; i++)); do
        filename="log${i}.txt"
        content="Nazwa pliku: $filename\nUtworzono przez: skrypt.sh\nData: $(date +"%Y-%m-%d %H:%M:%S")\n"
        echo -e "$content" > "$filename"
    done
    echo "Utworzono 100 plików log."
fi
