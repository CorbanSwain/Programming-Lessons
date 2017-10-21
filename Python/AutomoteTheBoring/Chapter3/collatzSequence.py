# Chapter 3 - Practice Project 1

def collatz(number):
    """ Calculates and logs the next Collatz sequence value. """
    isEven = (number % 2) == 0
    if isEven:
        val = number // 2
    else:
        val = (3 * number) + 1
    print(val)
    return val

continuePlay = True
while continuePlay:
    while True:
        print('Enter a number')

        try:
           inputNum = int(input())
        except ValueError:
            print('Please provide a valid integer.')
            continue

        if inputNum <= 0:
            print('Please privide an integer greater than zero')
            continue
        
        break

    result = inputNum
    counter = 0
    print()
    print('Beginning Collatz sequence with ' + str(inputNum) + '.')
    while result != 1:
        result = collatz(result)
        counter += 1

    print('Starting with ' + str(inputNum) + ', the sequence converged to 1 after ' + str(counter) + ' iterations.')
    print()

    print('Would you like to enter another number (Y or N)?')
    while True:
        response = str(input()).lower
        if response == 'y':
            continuePlay = True
            break
        elif response == 'n':
            continuePlay = False
            break
        else:
            print('Please provide a valid response, Y or N.')
    
        
    
