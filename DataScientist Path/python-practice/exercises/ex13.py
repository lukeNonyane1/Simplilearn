from sys import argv

#first, second, third = argv

#print "The script is called:", script
#print "Your first variable is:", first
#print "Your second variable is:", second
#print "Your third variable is:", third

# combining raw_input with argv to make a script that gets more input from a user.

prompt_user = argv

question = raw_input(prompt_user)

print "Is this what you typed?", prompt_user
print question