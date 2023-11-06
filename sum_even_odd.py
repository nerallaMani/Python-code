'''
Write a function that takes a list of numbers and returns a list with two elements:

The first element should be the sum of all even numbers in the list.
The second element should be the sum of all odd numbers in the list.

'''
def sum_even_odd(lst):
    new_list=[]
    even=0
    odd=0
    for i in lst:
        if i%2==0:
            even+=i
        else:
            odd+=i
    new_list.extend([even,odd])
    return new_list

print(sum_even_odd([1,2,3,4,5,6]))
