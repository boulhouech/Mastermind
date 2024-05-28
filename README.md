Mastermind Game Documentation
Introduction

Mastermind is a classic code-breaking game where one player, the code maker, creates a secret code, and the other player, the code breaker, attempts to guess the code within a limited number of attempts. The game provides feedback to the code breaker after each guess, helping them refine their strategy to crack the code.

This documentation outlines the implementation details and functionalities of the Mastermind game, including its main components, classes, and their interactions.
Table of Contents

    Main
    Board
    Game
    Computer

1. Main <a name="main"></a>
Purpose

The main.rb file serves as the entry point for the Mastermind game. It initializes the game and prompts the user to select an opponent.
Functionality

    Initializes the Game class.
    Starts the game by prompting the user to choose between playing against another person or against the computer.

2. Board <a name="board"></a>
Purpose

The board.rb file contains the Board class, responsible for managing the game board.
Functionality

    Initializes the game board with default colors and empty rows.
    Provides methods to display the board, update it with guesses, and show its current state.

3. Game <a name="game"></a>
Purpose

The game.rb file defines the Game class, which contains the core logic for playing the Mastermind game.
Functionality

    Allows players to play against each other or against the computer.
    Manages player input, validates guesses, and provides feedback on each attempt.
    Tracks the number of attempts and determines the winner or end of the game.

4. Computer <a name="computer"></a>
Purpose

The computer.rb file contains the Computer class, responsible for simulating the computer player's behavior in the game.
Functionality

    Implements different game modes (easy, medium, hard) for the computer player.
    Generates guesses based on the selected game mode and adjusts strategies for each difficulty level.