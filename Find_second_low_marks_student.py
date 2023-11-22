records = []
for _ in range(int(input())):
    name = input()
    score = float(input())
    records.append([name, score])

scores = set([x[1] for x in records])
low_marks = list(scores)
low_marks.sort()
second_low = low_marks[1]

student = []

for name in records:

    if name[1] == second_low:
        student.append(name[0])

student.sort()

for names in student:
    print(names)