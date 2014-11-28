;This file adds the ability to integrate when k is a whole number.

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

(defun zfact (a b) ; b!/a! (a must be smaller than b)
  (if (= a b) 1 (dewlzt 1 #'* (range (1+ a) b))))

(defun fact (n) (if (= n 0) 1 (zfact 1 n))) ;Normal factorial

(defun nPr (n r)
  (zfact (- n r) n))

(defun cmp (a b)
;Takes two values, returns a list of both, but the largest first
    (if (< a b)
	`(,b ,a)
	`(,a ,b)))

(defun nCr (n r)
  (let ((ordr (cmp r (- n r))))
    (/ (zfact (car ordr) n) (fact (cadr ordr)))))

(let (n k b)
"Integral of x^n * (x+b)^k"

  (defun run (new-n new-k new-b) 
    (setf n new-n)
    (setf k new-k)
    (setf b new-b)
    (if (integerp k) (wFn) (fFn)))

  (defun wFn ()
    (mapcar #'wTerm (range 0 k)))

  (defun wTerm (z)
    (/ 
     (* (nCr k z) (expt b z))
     (fn (- 1 z))))
  
  (defun fFn ()
    (mapcar #'fTerm (range 0 n)))

  (defun fTerm (r)
    (/ (* (npr n r) (expt (- b) r))
       (dewlzt 1 #'* (mapcar #'fn (range 1 (- 1 r) -1)))))

  (defun fn (x)
    (+ k n x)))
