Kevin and Stuart want to play the 'The Minion Game'.

Game Rules

Both players are given the same string, S.
Both players have to make substrings using the letters of the string S.
Stuart has to make words starting with consonants.
Kevin has to make words starting with vowels.
The game ends when both players have made all possible substrings.

Scoring
A player gets +1 point for each occurrence of the substring in the string S.

For Example:
String S = BANANA
Kevin's vowel beginning word = ANA
Here, ANA occurs twice in BANANA. Hence, Kevin will get 2 Points.

Solution:
```
def minion_game(string):
    vowels = 'AEIOU' # they are all upper letters
    # set both scores to 0
    stusc = 0
    kevsc = 0
    
    for i in range(len(s)):
        if s[i] in vowels: # kevin gets points
            kevsc += (len(s) - i)
        else:
            stusc += (len(s) - i)
    if kevsc > stusc:
        print('Kevin', kevsc)
    elif stusc > kevsc:
        print('Stuart', stusc)
    else:
        print('Draw')
            
if __name__ == '__main__':
    s = input()
    minion_game(s)

```
Link: https://www.hackerrank.com/challenges/the-minion-game/problem
