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

#Here I'm defining Permutation
#N!/(n-k)!
def npr(n, k):
    return reduce(operator.mul, range(n-k+1,n+1), 1)
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
    sbx = p + z * (n + x)
    return(sbx)

##################################
#################################
def term(f):
    global b
    top = npr(n, f) * (-b)**f  * (z**(f+1))

    global y
    y *= sbx(1-f) 

    return ((top, y))

def gcd(a, b):
    a=abs(a)
    b=abs(b)
    i=2
    tot=1
    while a != b:
            x = (a%i==0)
            if x:
                a /= i
            y = (b%i==0)
            if y:
                b /= i
            if x and y:
                tot *= i
            if not (x or y):
                i += 1
            return(tot)
#################################
#################################
class Ratio:
    """Here's some ish from lisp"""
    def __init__(self, tup):
        g = gcd(tup[0], tup[1])
        self.n = tup[0]/g
        self.d = tup[1]/g

    def __str__(self):
        return str(self.n) + "/" + str(self.d)

#################################
#################################
##where all the magic happens
def magic(x):
    global n
    n=x            #set n to x
    global p
    p=2            #define P
    global z
    z=3            #define Z
    global b
    b=3
    coeff=[]
    global y
    y=1

    for f in range(n+1):
        coeff.append(Ratio(term(f)))

    print(n, b, p, z)                    
    for rateeO in coeff:
       print(rateeO),

        
magic(7)

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
