## came from functools wouldn't import so I just defined its function to use
import operator
def reduce(function, iterable, initializer=None):
    it = iter(iterable)
    if initializer is None:
        try:
            initializer = next(it)
        except StopIteration:
            raise TypeError('reduce() of empty sequence with no initial value')
    accum_value = initializer
    for x in it:
        accum_value = function(accum_value, x)
    return accum_value
###########################
#My Code starts here
#First I'm going to define what a factorial is

def factorial(n):
        fact = reduce(operator.mul, range(1, n+1), 1)
        return(fact)
###########################
#Here I'm defining Permutation
#N!/(n-k)!
def npr(n, k):
    np = factorial(n)
    pr = factorial(n-k)
    npr = np / pr
    return(npr)
#################################
#Creates a list of permutations

def nprlist(n):
    perm=[]
    for k in range(1, n):
        perm.append(npr(n, k))
    perm.append(perm[len(perm)-1])
    print(perm)
    return(perm)
###################################
###################################
#This is what modifies the exponets for the coeffiecnt values
def sbx(x):
    sbx= (n * z)+ p + (x * z)
    return(sbx)

##################################
##################################
#fucntion to keep the numbers the same going to both the numerator
#and denominator

def term(f):
    top = npr(n, f) * (z**(f+1))
    global deno
    bot(f)
    return(top)
#################################
#################################
# Does the math for the Denominator of the Coefficents
def bot(x):
    global y
    y *= sbx(1-x)
    global den
    den.append(y)
    return(den)
################################
##where all the magic happens
def magic(x):
    global n
    n=x            #set n to x
    global p
    p=4            #define P
    global z
    z=3            #define Z
    global den
    den=[]
    topl=[]
    global y
    y=1
    for f in range(n+1):
        topl.append(term(f))
        global den     
    print(topl)
    print(den)
        
magic(3)

######################
######################
# Right now all it prints is the Numerator and Denominator of each coeffiecent
# for the integral of x^n * (x+1)^p/z (It does it seperately and I plan to write
# a function to simplfy the fractions
# we have figured out for a x^n * (x+b)^p/z form but its coded for in lisp and
# hasn't made it to python yet
#
# output lists will read
#[3.0, 27.0, 162.0, 486.0]
#[16, 208, 2080, 14560]
# there is attached to every coeffiecent the vaule of (x+1)^(p/z +1) *x^n-1
# x+1 is what is inside of the original function 
# the answer to the first term would be 3/16*(x+1)^(p/z +1) *x^n
# all the coeffiecnts are 3/16 - 27/208 + 81/1040 - 243/7280
# expect more efficent code and features when I have some more spare time
