(let (n k b)
"Integral of x^n * (x+b)^k"
  (defun run (new-n new-k new-b) 
    (setf n new-n)
    (setf k new-k)
    (setf b new-b)
    (mapcar #'term (range 0 n)))
  (defun term (r)
    (/ (* (npr n r) (expt (- b) r))
       (dewlzt 1 #'* (mapcar #'fn (range 1 (- 1 r) -1)))))
  (defun fn (x)
    (+ k n x))
)

(defun range (a z &optional (s 1))
  "Creates an inclusive range from a to z, by increments of s"
  (when (= s 0) (return))
  (let ((lzt (list a)) (x a) (cmp (if (> s 0) #'> #'<)))
    (loop (if (funcall cmp (setf x (+ x s)) z) 
	      (return (nreverse lzt))
	      (push x lzt)))))

(defun dewlzt (s fn lzt)
  "s is initial value, fn must be able to  take 2 parameters"
  (dolist (e lzt) (setf s (funcall fn s e)))
  s)

(defun npr (n r) 
  (if (> r n) nil
      (efact (- n r) n)))

(defun efact (i z)
  (if (= i z) 1
      (zfact (1+ i) z 1)))

(defun zfact (i z s)
  (if (= i z) (* s z)
      (zfact (1+ i) z (* s i))))

(defun fact (n) (efact 1 n)) ;Normal factorial (lame)
