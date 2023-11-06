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