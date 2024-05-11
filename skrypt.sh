#!/bin/bash

# skrypt.sh --date
if [ "$1" = "--date" ]; then
    date +"Dzisiejsza data: %Y-%m-%d"
fi

# skrypt.sh --logs
if [ "$1" = "--logs" ]; then
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
fi
