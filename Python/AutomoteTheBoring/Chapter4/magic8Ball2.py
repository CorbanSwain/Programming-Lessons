import random

messages = ['It is certain',
            'It is decidedly so',
            'Yes definately',
            'Reply hazy try again later',
            'Ask again later',
            'Concentrate and ask again',
            'My reply is no',
            'Outlook not so good',
            'Very doubtful']

print(messages[random.randint(0, len(messages) - 1)])
