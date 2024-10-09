#include <stdio.h>

////////////////////////////////////////
// Author : Sed Centeno
// Date : 10/4/2024
//
// Description:
// Takes a number argument and prints "Hello world!" 
// as many times as the number supplied.
//
// Arguments:
// N (Number)
//
// Example Invocation:
// ./helloWorldNum 5
/////////////////////////////////////////


int main(int argc, char *argv[]){
  // Checks if user has supplied an argument.
  if (argc < 2){
    printf("Please supply an integer.\n");
    printf("Example Invocation:\n");
    printf("./helloWorldNum 5\n");
    return 2;
  }

  // Counts # of digits in argument and checks if it's a valid number (not
  // something like "12ab")
  int digits;
  for (digits = 0; argv[1][digits] != '\0'; digits++){
    if (argv[1][digits] < 48 || argv[1][digits] > 57){
      printf("Please enter a valid interger\n");
      printf("Example Invocation:\n");
      printf("./helloWorldNum 5\n");
      return 2;
    }
  }
  
  // Converts ASCII to number.
  int Sum = 0;
  int Multiplier = 1;
  for (int i = digits; i > 0; i--){
    Sum = Sum + (argv[1][i-1] - 48)*Multiplier;
    Multiplier = Multiplier * 10;
  }

  // Prints "Hello world!" as many times as the user wanted.
  for (int i = 0; i < Sum; i++){
    printf("Hello world!\n");
  }
  return 0;
}
