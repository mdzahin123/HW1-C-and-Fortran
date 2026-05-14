/*
Author: Muhammad Danish Zahin
E-mail: mjr7066@psu.edu
Course: CMPSC 460
Assignment: Fortran / C Programming Project
Due date: 2/14/2026
File: Assignment.c
Purpose: This program prompts a user to enter a positive integer, tests if
the integer is perfect, abundant, or deficient, and reports the
result of the test. The program loops until the user decides that
s/he is done testing integers.
IDE/Compiler:
IDE: VScode
Online: TDM64-GCC-10.3.0-2
Download extentsions in VScode:C/C++,modern Fortran, and Code Runner extensions for VScode
Operating system:
MS Windows 11
References: 
How to start coding in Fortran: https://www.youtube.com/watch?v=RrsoM6wVEWE&t=548s 
AI Tool(s): Github Copilot (VScode extension)
Description of code use of pointers and arrays:
In C by default uses pass by value, so we need to use pointers to pass by reference. 
In this program, we will use pointers to allow the functions to modify the values of the variables passed to them 
and change the values of the variables in the main function :).
Array by default is a pointer in C, so we can pass the array to the functions without using pointers.
thank you
*/
#include <stdio.h>

#define MAX_FACTORS 30

// Function prototypes
void getInteger(int *num);
int computeFactors(int num, int factors[]);
void printFactors(int factors[], int count);
int sumFactors(int factors[], int count);
//the main function calling the other functions
int main() {
    int number, factors[MAX_FACTORS], count, sum;
    char choice;
    printf("Welcome to the Perfect, Abundant, and Deficient Number Finder!\n");
    do {    
        printf("----------------------------------------\n");
        getInteger(&number);

        count = computeFactors(number, factors);
        printFactors(factors, count);

        sum = sumFactors(factors, count);

        printf("----------------------------------------\n");
        printf("The sum of the factors is: %d\n", sum);

        if (sum == number) {
            printf("The number %d is perfect.\n", number);
        } else if (sum > number) {
            printf("The number %d is abundant.\n", number);
            printf("Abundance: %d\n", sum - number);
        } else {
            printf("The number %d is deficient.\n", number);
            printf("Deficiency: %d\n", number - sum);
        }
        printf("----------------------------------------\n");

        printf("Do you want to enter another number? (Y/y for yes, any other key for no): ");
        scanf(" %c", &choice);

    } while (choice == 'Y' || choice == 'y');

    return 0;
}
//get integer function to get a positive integer from the user and validate the input
//------------------------------------------------
void getInteger(int *num) {
    int status;
    do {
        printf("Please enter a positive integer: ");
        status = scanf("%d", num);
        while(getchar() != '\n'); // clear input buffer

        if (status != 1 || *num <= 0) {
            printf("Invalid input. Please enter a positive integer.\n");
        } else {
            break;
        }
    } while (1);
}
//compute factors function to compute the factors of the given number and store them in an array, returning the count of factors found
//------------------------------------------------
int computeFactors(int num, int factors[]) {
    int count = 0;
    for (int i = 1; i <= num / 2; i++) {
        if (num % i == 0) {
            factors[count++] = i;
        }
    }
    return count;
}
//print factors function to print the factors of the number stored in the array, handling the case where there are no factors
//------------------------------------------------
void printFactors(int factors[], int count) {
    if (count == 0) {
        printf("The number has no proper factors.\n");
        return;
    }

    printf("The factors of the number are: ");
    for (int i = 0; i < count; i++) {
        if (i < count - 1)
            printf("%d, ", factors[i]);
        else
            printf("%d\n", factors[i]);
    }
}
//sum factors function to calculate the sum of the factors stored in the array and return the sum
//------------------------------------------------
int sumFactors(int factors[], int count) {
    int sum = 0;
    for (int i = 0; i < count; i++) {
        sum += factors[i];
    }
    return sum;
}