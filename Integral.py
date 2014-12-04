
import operator
from _functools import reduce
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
#################################
def order(a, b): #largest first
    return (a, b) if a>b else (b, a)

def gcd(a, b): #Euclid's method
    return sub(order(abs(a), abs(b)))

def sub(t): #t[0] is always larger than t[1]
    if t[1] <= 0:
        return t[0]
    return sub((t[1], t[0]%t[1]))
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
    n=x            #set n to x
    p=2            #define P
    z=3            #define Z
    b=1
    coeff=[]
    global y
    y=1

    #This is what modifies the exponets for the coeffiecnt values
    def sbx(x):
        return p + z * (n + x)
        
    def term(f):
        top = npr(n, f) * (-b)**f  * (z**(f+1))
        global y
        y *= sbx(1-f)
        return ((top, y))

    for f in range(n+1):
        coeff.append(Ratio(term(f)))
    
    print("(n, b, p, z)")
    print(n, b, p, z)                    
    for rateeO in coeff:
       print(rateeO),

magic(2)

######################
######################
