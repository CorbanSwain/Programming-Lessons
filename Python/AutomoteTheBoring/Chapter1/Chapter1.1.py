# This program says helo and asks for my name.

print('Hello world')
print('Whats is your name?') # ask for their name
myName = input()
print('It is good to meet you, ' + myName)
print('The length of your name is:', end = ' ')
print(len(myName))
print('What is your age?')
myAge = input()
print('You will be ' + str(int(myAge) + 1) + ' in a year.')

