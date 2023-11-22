'''
Given the names and grades for each student in a class of  students, store them in a nested list and print the name(s) of any student(s) 
having the second lowest grade.

Note: If there are multiple students with the second lowest grade, order their names alphabetically and print each name on a new line.

The ordered list of scores is , so the second lowest score is . There are two students with that score: . 
Ordered alphabetically, the names are printed as:

example:
python students = [['Harry', 37.21], ['Berry', 37.21], ['Tina', 37.2], ['Akriti', 41], ['Harsh', 39]]

output:
Berry
Harry

'''

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
