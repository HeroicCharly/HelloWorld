# Description:
# This script is to test, and learn the lenguage basic operations.

# variables
name = "Carlos"
age = 32

# arrays
tmpList = ["1","2","3"]
tmpTuple = ("1","2","3")

# conditional statements
if (age < 18):
    print("You need to be over 21")
else:
    print("You are considered as an adult")

# If and else if
if(age<40):
    print("You're less than 40")
elif (age < 30):
    print("You're less than 30")
elif(age<20):
    print("you're less than 20")

# functions
def MultiplyByTwo(number):
    # We use quotes to be able to print the __doc__
    """Multiplies given number by 2"""
    newValue = number * 2
    return newValue

print("Testing functions...")
print(MultiplyByTwo.__doc__)
print(MultiplyByTwo(4))

# string interpolation
value = "yay!"
print("This should contain embeded % s" % value)
print("This is another way to do string interpolation {a1}".format(a1=value))
print(f"This is a third way of doing string interpolation {value}")


# for loop
for i in tmpList:
    print(i)

# print
print("Hello world")
print(name)
print(age)

