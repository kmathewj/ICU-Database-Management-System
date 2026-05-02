#!/bin/sh
MainMenu()
{
    while [ "$CHOICE" != "START" ]; do
        
        echo "================================================================="
        echo "| Oracle All Inclusive Tool                                      |"
        echo "| Main Menu - Select Desired Operation(s):                       |"
        echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>               |"
        echo "-----------------------------------------------------------------"
        echo ""
        echo "  $IS_SELECTEDM M) View Manual"
        echo ""
        echo "  $IS_SELECTED1 1) Drop Tables"
        echo "  $IS_SELECTED2 2) Create Tables"
        echo "  $IS_SELECTED3 3) Populate Tables"
        echo "  $IS_SELECTED4 4) Query Tables"
        echo ""
        echo "  $IS_SELECTEDX X) Force/Stop/Kill Oracle DB"
        echo ""
        echo "  $IS_SELECTEDE E) End/Exit"
        echo -n "Choose: "
        read CHOICE

        if [ "$CHOICE" = "M" ]; then
            echo "Manual"
            Pause
        elif [ "$CHOICE" = "1" ]; then
            echo "---- Dropping Tables..."
            bash drop_tables.sh
            Pause
        elif [ "$CHOICE" = "2" ]; then
            echo "---- Creating Tables..."
            bash create_tables.sh
            Pause
        elif [ "$CHOICE" = "3" ]; then
            echo "--- Populating Tables..."
            bash populate_tables.sh
            Pause
        elif [ "$CHOICE" = "4" ]; then
            echo "--- Querying Tables..."
            bash advanced_queries.sh
            Pause
        elif [ "$CHOICE" = "E" ]; then
            echo "--- Exiting Oracle Tool, Goodbye!"
            exit
        else
            echo ""
            echo "--- ERROR: Invalid Option!"
            echo "----------------------------------------------------"
            echo "Please enter a valid option (M, 1, 2, 3, 4, X, or E)"
            Pause
        fi
        clear
    done
}


Pause() {
    echo ""
    printf "Press Enter to continue..."
    read dummy
}


#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart()
{
    StartMessage
    while [ 1 ]; do
        MainMenu
    done
}
ProgramStart
