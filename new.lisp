(defun range (a z &optional (s 1))
  "Creates an inclusive range from a to z, by increments of s"
  (when (= s 0) (return))
  (do (lzt (cmp (if (> s 0) #'> #'<)) (x a (+ x s)))
      ((funcall cmp x z) (nreverse lzt))
    (push x lzt)))

(defmacro chain (a z)
  "Multiplies together the numbers from a to z (a is the smaller)"
  `(reduce #'* (range ,a ,z)))

(defun npr (n r) 
  "Permutation function"
  (chain (1+ (- n r)) n))

(let (n k b)
"Integral of x^n * (x+b)^k"
  (defun run (new-n new-b new-k) 
    (setf n new-n)
    (setf b new-b)
    (setf k new-k)
    (mapcar #'term (range 0 n)))
  (defun term (x)
    (/ (* (npr n x) (expt (- b) x))
       (chain (fn (- 1 x)) (fn 1))))
  (defun fn (x)
    (+ k n x)))
	  
