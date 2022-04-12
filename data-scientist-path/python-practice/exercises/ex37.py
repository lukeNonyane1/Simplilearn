one = 1
two = 2

if type(one) is int and type(two) is int:
	print "%d and %d are integers" % (one, two)
else:
	print "%d and %d are not integers"

list = [1, 2]
print list

#    del_stmt ::= "del" target_list
del list
print list
another_one = "one"
print "This is what %s does." % another_one

x = 5

x &= 3 # x = 5 & 3

print(x)
