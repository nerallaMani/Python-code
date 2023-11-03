#cricket balls to how many overs!
def over(balls):
	if balls%6==0:
		return balls/6
	return balls%6/10+balls//6
print(over(2400))


import time as t

def decorator(func):
	def inner(name):
		start=t.time()
		func(name)
		print("you successfully logged in.")
		print("it takes time", t.time()-start,"secs")
	return inner

@decorator
def greet(name):
	print(f"hi {name}")

greet("manikanta")
