'''
Given a number n, return a sentence which describes the number in the following ways.

Always start the string with "The most".
If n is evenly divisible by 1, add "brilliant" to the sentence.
If n is evenly divisible by 2, add "exciting" to the sentence.
... 3, add "fantastic" to the sentence.
... 4, add "virtuous" to the sentence.
... 5, add "heart-warming" ...
... 6, add "tear-jerking" ...
... 7, add "beautiful" ...
... 8, add "exhilarating" ...
... 9, add "emotional" ...
If n is evenly divisible by 10, add inspiring to the sentence.
Always end the string with "number is" n!
'''


def describe_num(n):
    words = {
        1: "brilliant",
        2: "exciting",
        3: "fantastic",
        4: "virtuous",
        5: "heart-warming",
        6: "tear-jerking",
        7: "beautiful",
        8: "exhilarating",
        9: "emotional",
        10: "inspiring"
    }

    result = "The most"
    for i in range(1, 11):
        if n % i == 0:
            result += f" {words[i]}"

    result += f" number is {n}!"
    return result


print(describe_num(13))
print(describe_num(4))
print(describe_num(60))



