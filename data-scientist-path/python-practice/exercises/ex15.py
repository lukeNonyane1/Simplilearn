# import the argv module from sys package/libary.
from sys import argv

# unpack the argv variable to hold distinct variables. argv holds the arguments you pass to your python script when you run it.
script, filename = argv

# open the file and assign to variable txt.
txt = open(filename)

# print to console the filename using raw formatter %r.
print "Here's your file %r" % filename
# read the contents of variable txt.
print txt.read()
# print message and prompt user for filename.
print "Type the filename again:"
file_again = raw_input("> ")
# open the file from user input and assign to variable txt_again.
txt_again = open(file_again)
# use the read function on variable txt_again and print the value to console.
print txt_again.read()

# close txt and txt_again variables; it's important to close files when you are done with them.
txt.close()
txt_again.close()