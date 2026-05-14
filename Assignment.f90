
!Author: Muhammad Danish Zahin
!E-mail: mjr7066@psu.edu
!Course: CMPSC 460
!Assignment: Fortran / C Programming Project
!Due date: 2/14/2026
!File: Assignment.f90
!Purpose: This program prompts a user to enter a positive integer, tests if
!the integer is perfect, abundant, or deficient, and reports the
!result of the test. The program loops until the user decides that
!s/he is done testing integers.
!IDE/Compiler:
!VScode
!TDM64-GCC-10.3.0-2
!Download extentsions:C/C++,modern Fortran, and Code Runner extensions for VScode
!Operating system:
!MS Windows 11
!References: 
!How to start coding in Fortran: https://www.youtube.com/watch?v=RrsoM6wVEWE&t=548s 
!AI Tool(s): Github Copilot (VScode extension)
program numberfinder
    IMPLICIT NONE
    INTEGER :: number, factors(30), count, sum
    CHARACTER(LEN=1) :: choice
    print *, "Welcome to the Perfect, Abundant, and Deficient Number Finder!"
    do
        call getInteger(number)
        call computeFactors(number, factors, count)
        call printFactors(factors, count)
        
        sum = sumFactors(factors, count)  

        print *, "The sum of the factors is:", sum
        if (sum == number) then
            print *, "The number is perfect."
        else if (sum > number) then
            print *, "The number is abundant."
            print *, "The abundance is:", sum - number
        else
            print *, "The number is deficient."
            print *, "The deficiency is:", number - sum
        end if

        print *, "Do you want to enter another number? (Enter Y/y for yes, any other key for no)"
        read *, choice
        if (choice /= 'Y' .and. choice /= 'y') then
            exit
        end if
    end do

contains
    ! This subroutine prompts the user to enter a positive integer and validates the input. 
    !It continues to prompt until a valid positive integer is entered. The valid integer is returned through the output parameter 'num'.
    subroutine getInteger(num)
        IMPLICIT NONE
        INTEGER, INTENT(OUT) :: num
        INTEGER :: status
        DO 
            print *, "Please enter a positive integer: "
            read(*, *, IOSTAT=status) num
            if (status /= 0) then
                print *, "Invalid input. Please enter a positive integer."
                cycle
            end if
            if (num > 0) then
                exit
            else
                print *, "Invalid input. Please enter a positive integer."
            end if
        END DO
    end subroutine getInteger
    !This subroutine computes the factors of the given positive integer 'num' and stores them in the output array 'factors'. 
    !The count of factors found is returned through the output parameter 'count'. The subroutine iterates from 1 to num/2 to find all factors of 'num'.
    subroutine computeFactors(num, factors, count)
        IMPLICIT NONE
        INTEGER, INTENT(IN) :: num
        INTEGER, INTENT(OUT) :: factors(30), count
        INTEGER :: i

        count = 0
        do i = 1, num/2
            if (mod(num, i) == 0) then
                count = count + 1
                factors(count) = i
            end if
        end do
    end subroutine computeFactors
    !This subroutine prints the factors of the number stored in the input array 'factors' based on the count of factors provided. 
    !If there are no factors, it prints "None". Otherwise, it iterates through the factors and prints each one.
    subroutine printFactors(factors, count)
        IMPLICIT NONE
        INTEGER, INTENT(IN) :: factors(30), count
        INTEGER :: i

        print *, "The factors of the number are: "
        if (count == 0) then
            print *, "None"
        end if
        do i = 1, count
            print *, factors(i)
        end do
    end subroutine printFactors
    !This function calculates the sum of the factors stored in the input array 'factors' based on the count of factors provided. 
    !It iterates through the factors, adding each one to a running total 'sum', which is returned as the result of the function.
    function sumFactors(factors, count) result(sum)
        IMPLICIT NONE
        INTEGER, INTENT(IN) :: factors(30), count
        INTEGER :: sum, i

        sum = 0
        do i = 1, count
            sum = sum + factors(i)
        end do
    end function sumFactors

end program numberfinder
