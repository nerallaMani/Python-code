'''
Create a function that takes a string and censors
words over four characters with *.
example :
censor("Two plus three is five") ➞ "Two plus ***** is five"
'''
def censor(sentence):
    words = sentence.split()
    result = []
    for i in words:
        if len(i) <= 4:
            result.append(i)
        else:
            result.append('*'*len(i))
    return ' '.join(result)


print(censor("Two plus three is five"))
print(censor("aaaa aaaaa 1234 12345"))







