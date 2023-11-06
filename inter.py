"""
Given a list of integers, in which any number occured morethan twice and remove them and put into a new list. 
In the new list, if any number occured morethan once, then put that second value as underscore(_).
"""



a=[1,1,1,1,2,2,2,3,3,3]
c=[]
for x in a:
	if c.count(x)<2:
		c.append(x)
print(c)
new_lst=[]
for i in range(len(c)):
	if i%2==0:
		new_lst.append(c[i])
	else:
		new_lst.append('_')
print(new_lst)
