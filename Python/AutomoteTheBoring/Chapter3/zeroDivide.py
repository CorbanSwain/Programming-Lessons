def spam(divideBy):
    print('Running spam(' + str(divideBy) + ')...')
    try:
        return 42 / divideBy
    except ZeroDivisionError:
        print('Error: Invalid argument, division by zero.')
    except Exception as e:
        print('Unexpected Error: ' + str(e))

print(spam(2))
print(spam(12))
print(spam(0) if (spam(0) != None) else '')
print(spam('lol') if (spam('lol') != None) else '')
print(spam(1))
      
