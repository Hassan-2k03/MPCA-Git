/* Write an ALP  to find the  length of a given string

Algorithm
1.Initialise R0 to contain the address of the string
2.Let R1=0=Initial length of the string
3.Copy each character from the string into register R2(Use LDRB instruction)
4.Check if the character in R2  is zero 
5.If valid character is found, increment R1.
6.Else end Program
7.Increment R0 to point to next character in the string
8.Repeat step 3 to 5  until end of string
9.R1  contains final length of string
10.End Program */

@code:

