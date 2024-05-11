#!/bin/bash

# skrypt.sh --date
if [ "$1" = "--date" ]; then
    date +"Dzisiejsza data: %Y-%m-%d"
# skrypt.sh --logs
elif [ "$1" = "--logs" ]; then
    if [ -n "$2" ]; then
        num_logs=$2
    else
        num_logs=100
    fi
    for ((i=1; i<=num_logs; i++)); do
        filename="log${i}.txt"
        content="Nazwa pliku: $filename\nUtworzono przez: skrypt.sh\nData: $(date +"%Y-%m-%d %H:%M:%S")\n"
        echo -e "$content" > "$filename"
    done
    echo "Utworzono $num_logs plików log."
# skrypt.sh --help
elif [ "$1" = "--help" ]; then
    echo "Dostępne opcje:"
    echo "  --date : Wyświetla dzisiejszą datę."
    echo "  --logs [liczba_plików] : Tworzy pliki log. Domyślna ilośc to 100."
    echo "  --help : Wyświetla wszystkie dostępne opcje."
fi
