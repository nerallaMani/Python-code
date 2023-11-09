#print square pattern
n=int(input("enter how many lines you want for square pattern: "))

for i in range(n):
    for j in range(n):
        print('#',end=' ')
    print()


#triangle pattern
for i in range(n):
    for j in range(i+1):
        print("*",end=" ")
    print()