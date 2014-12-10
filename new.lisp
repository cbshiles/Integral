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

(defun strang (po zo n)
  (do ((i 0 (1+ i)) (p po (* p p)) (z zo (* z (- z p))))
      ((> i n) nil)
    (princ (/ (* p (npr n i)) z))
    (princ " "))))


(defun run (n b k)
  "Integral of x^n * (x+b)^k"	
  (defun term(x)
    (/ (* (npr n x) (expt (- b) x))
       (let ((s (+ n k 1))) ;s is the sum of the powers(n+k) plus 1
	 (chain (- s x) s))))
  (mapcar #'term (range 0 n)))
