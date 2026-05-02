#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib

while true; do
    clear
    echo "================================================================="
    echo "| Oracle All Inclusive Tool                                      |"
    echo "| Main Menu - Select Desired Operation(s):                       |"
    echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>               |"
    echo "-----------------------------------------------------------------"
    echo "  1) query 1 explanataion"
    echo "  2) query 2 explanataion"
    echo "  3) query 3 explanataion"
    echo "  4) query 4 explanataion"
    echo "  5) query 5 explanataion"
    echo ""
    echo "  E) Exit Query Menu"
    printf "Choose a query to run: "
    read CHOICE

    case "$CHOICE" in
        1)
            echo "Running Query 1:"
            ;;
        2)
            echo "Running Query 2:"
            ;;
        3)
            echo "Running Query 3:"
            ;;
        4)
            echo "Running Query 4:"
            ;;
        5)
            echo "Running Query 5:"
            ;;
        [eE])
            echo "Returning to Main Menu..."
            break
            ;;
        *)
            echo "Invalid option. Please select a valid query (1-5) or E to exit."
            ;;
    esac

    echo ""
    printf "Press Enter to continue..."
    read dummy
done
