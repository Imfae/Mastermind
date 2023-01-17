# Mastermind

## Codebreaker

In this game, computer randomly generates a 4-character code from a collection of 8 characters: Q, W, E, R, T, Y, U, I, and the player tries to guess the computer's code within 12 tries. 

With each guess, the player is provided feedback in the form of 'X' and/or 'O.' An 'X' indicates that one letter (position of feedback does **not** correspond with each character) of player's input is correct in both character and position. An 'O' indicates that one letter is correct in character but in the wrong position.

P.S. The duplicate option merely *allows* generating code with duplicate characters. It does not ensure it.

---

**Regarding code with duplicate characters:**

The logic behind game feedback when player input contains duplicate characters was one that took some trial and error to come up with.

The main difficulty I've found was the excessive 'correct in character but not in position' (henceforth refered to as 'O') results returned that dissolves the feedback string into a line of unhelpful nonsense.

I took into account the rules for duplicate input characters in Wikipedia's page for Mastermind and came up with the following set of steps (for code, please refer to `def feedback` in `guessgame.rb`) to determine whether to push the 'O' feedback.

 - Step 1: Ignore all 'O' feedback if the feedback comparison involves a character (in player input or corresponding from generated code) that's correct in character and in position.

 - Step 2: Ignore future 'O' feedback from a character in player input if feedback 'O' has already been pushed for the character.

 - Step 3: Ignore all 'O' feedback from a character if the character is a duplicate of a previous character that has pushed a 'O' feedback. 

 - Step 4: Push feedback 'O' if a character from player input satisfy Step 1, Step 2, and Step 3 *and* is correct in character but not in position.

The set of steps has proven to be a successful solution for feedbacking inputs with duplicate characters so far. 

Still I would greatly appreciate third-party test or assessment for my logic.