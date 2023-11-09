'''
Create a function that takes a dictionary of objects like 
{ "name": "John", "notes": [3, 5, 4] } and 
returns a dictionary of objects like { "name": "John", "top_note": 5 }.
'''

def top_note(student):
    
    return {'name':student['name'],'top_note':max(student['notes'])}    

student={ "name": "John", "notes": [3, 5, 4] }
    
print(top_note(student))

