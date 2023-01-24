# Mastermind

## Codebreaker

In this game, computer randomly generates a 4-character code from a collection of 8 characters: Q, W, E, R, T, Y, U, I, and the player tries to guess the computer's code within 12 tries. 

With each guess, the player is provided feedback in a string of 'X's and/or 'O's. A **X** indicates that one letter (position of feedback does **not** correspond with each character) of player's input is correct in both character and position. An **O** indicates that one letter is correct in character but in the wrong position.

P.S. The duplicate option merely *allows* generating code with duplicate characters. It does not ensure it.


---


## Code Creator

In this game, the player is prompted to form a 4-character code from the collection of 8 characters (duplicates are allowed). The computer then uses its solving algorithm to solve for the player's code.


---


#### Regarding code with duplicate characters:

The logic behind game feedback when player input contains duplicate characters was one that took some trial and error to come up with.

The main difficulty I've found was the excessive 'correct in character but not in position' (henceforth referred to as 'O') results returned that dissolves the feedback string into a line of unhelpful nonsense.

I took into account the rules for duplicate input characters in Wikipedia's page for Mastermind and came up with the following set of steps (for code, please refer to `def feedback` in `modules.rb`) to determine whether to push the 'O' feedback.

 - Step 1: Ignore all 'O' feedback if the feedback comparison involves a character (in player input or corresponding from generated code) that's correct in character and in position.

 - Step 2: Ignore future 'O' feedback from a character in player input if feedback 'O' has already been pushed for the character.

 - Step 3: Ignore all 'O' feedback from a character if the character is a duplicate of a previous character that has pushed a 'O' feedback. 

 - Step 4: Push feedback 'O' if a character from player input satisfy Step 1, Step 2, and Step 3 *and* is correct in character but not in position.

The set of steps has proven to be a successful solution for feedbacking inputs with duplicate characters so far. Still, I would greatly appreciate third-party test or assessment for my logic.

**Edit:** I found someone else's idea for solving the duplicate feedback thingy that uses a *much* simpler logic:

> Delete elements in computer's code and player input that's correct in both character and position, then push feedback 'O' for every character in code that's also in player input.

I've implemented this logic for the game as well. It's under 'Method 2 for duplicate feedbacks' if anyone's interested.

Play the game live here: [Replit](https://replit.com/@Conjurer/Mastermind#main.rb)