#!/bin/bash

# skrypt.sh --date
if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    date +"Dzisiejsza data: %Y-%m-%d"
# skrypt.sh --logs
elif [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
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
elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Dostępne opcje:"
    echo " -d, --date : Wyświetla dzisiejszą datę."
    echo " -l [liczba_plików], --logs [liczba_plików] : Tworzy pliki log. Domyślna ilośc to 100."
    echo " -h, --help : Wyświetla wszystkie dostępne opcje."
    echo " -e [liczba_plików], --error [liczba_plików] : Tworzy pliki error. Domyślna ilośc to 100."
    echo " -i, --init : Klonuje całe repozytorium oraz ustawia ścieżkę w zmiennej PATH."
# skrypt.sh --init
elif [ "$1" = "--init" ] || [ "$1" = "-i" ] ; then
    git clone git@github.com:anhelinakruk/Lab04.git repository
    repo_path="$(pwd)/repository"
    export PATH="$PATH:$repo_path"
    echo "Repositorium sklonowane i dodane do PATH."
# skrytp.sh --error
elif [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    if [ -n "$2" ]; then
        num_errors=$2
    else
        num_errors=100
    fi
    for ((i=1; i<=num_errors; i++)); do
        mkdir -p "error$i"
        filename="error${i}/error${i}.txt"
        content="Nazwa pliku: $filename\nUtworzono przez: skrypt.sh\nData: $(date +"%Y-%m-%d %H:%M:%S")\n"
        echo -e "$content" > "$filename"
    done
    echo "Utworzono $num_errors plików error w osobnych folderach."
fi
