#!/bin/bash

echo "================================"
echo "      ROCK PAPER SCISSORS!"
echo "================================"
echo "Welcome to Rock, Paper, Scissors!"

player_score=0
computer_score=0
ties=0

while true; do
    echo
    echo "Choose your option!"
    echo "1) Rock"
    echo "2) Paper"
    echo "3) Scissors"
    echo "Q) Quit"

    read -r -p "Your choice: " choice

    if [[ "$choice" =~ ^[Qq]$ ]]; then
        break
    fi

    case "${choice,,}" in
        1|rock)
            choice=1
            player_name="Rock"
            ;;
        2|paper)
            choice=2
            player_name="Paper"
            ;;
        3|scissors)
            choice=3
            player_name="Scissors"
            ;;
        *)
            echo "Pick an actual choice bud!"
            continue
            ;;
    esac

    computer_choice=$((RANDOM % 3 + 1))

    case "$computer_choice" in
        1) computer_name="Rock" ;;
        2) computer_name="Paper" ;;
        3) computer_name="Scissors" ;;
    esac

    echo
    echo "You chose: $player_name"
    echo "Computer chose: $computer_name"
    echo

    if [[ "$choice" -eq "$computer_choice" ]]; then
        echo "IT'S A TIE!"
        ((ties++))

    elif [[ "$choice" -eq 1 && "$computer_choice" -eq 3 ]] ||
         [[ "$choice" -eq 2 && "$computer_choice" -eq 1 ]] ||
         [[ "$choice" -eq 3 && "$computer_choice" -eq 2 ]]; then
        echo "YOU WIN!"
        ((player_score++))

    else
        echo "THE COMPUTER WINS!"
        ((computer_score++))
    fi

    echo
    echo "========== SCORE =========="
    echo "You: $player_score"
    echo "Computer: $computer_score"
    echo "Ties: $ties"
    echo "==========================="

done

echo
echo "================================"
echo "          FINAL SCORE"
echo "================================"
echo "Your wins: $player_score"
echo "Computer wins: $computer_score"
echo "Ties: $ties"

if (( player_score > computer_score )); then
    echo "YOU ARE THE WINNER!"
elif (( computer_score > player_score )); then
    echo "THE COMPUTER IS THE WINNER!"
else
    echo "IT A  TIE!"
fi

echo "Thanks for playing"
