'''
Your job is to create a function, that takes 3 numbers: 
a, b, c and returns True if the last digit of a * b = the last digit of c. 
'''

def last_digit(a,b,c):
    if (a*b)%10==c%10:
        return True
    else:
        return False
    
print(last_digit(25,21,125))