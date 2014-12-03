Integral Program
=========

Here's the Pasacal's triangle code. The rest of the file
isn't ready.

```lisp
(defun next(row)
  (let* ( (a (cons 0 row)) (b (reverse a)) )
    (map-into b #'+ a b)))

(defun pascals(r) ;Pascal's triangle to the rth row. (starts @ 0)
  (do ( (ri 1 (1+ ri)) (lzt (cons (cons 1 nil) nil) (cons (next (car lzt)) lzt)) )
      ((> ri r) (nreverse lzt))))
```

Here are the changes I made that I can remember:
1. Changed gcd function into the gcd2 and sub function family
2. Created Ratio class which utilizes gcd2 
3. turned topl and denom lists into one list of Ratios
4. added print line to make it clear which variables are which

------------------------------------------------------------
Lukas: I have an idea about how objects could make
the program work cooler. For it to work though, we'd need
to have the gcd as a separate function. If you could do 
that, then I'd like to show you my idea next time.

Lisp: Work on whole numbered k's  (look at whole*.lisp's in old branch)