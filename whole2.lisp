;Focuses on combining the two integration methods. 
;There should be a way, since we are talking about the set of rea numbers.
;whether k = 999/1000 or 1 shouldn't make this much a diff. when integrating


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

(defun zfact (a b) ; a!/b!
  (if (= a b) 1 
      (if (> a b) 
	  (dewlzt 1 #'* (range (1+ b) a))
	  (dewlzt 1 #'/ (range (1+ a) b)))))

(defun fact (n) (if (= n 0) 1 (zfact n 1))) ;Normal factorial

(defun nPr (n r)
  (zfact n (- n r)))

(let (n k b nd)
  "Integral of x^n * (x+b)^k"

  (defun run (new-n new-k new-b) 
    (setf n new-n)
    (setf k new-k)
    (setf b new-b)

    (let* ((wk (integerp k)) ;Stands for whole k
	   (term-fn (if wk #'w-term #'f-term))) 
      (setf nd (if wk k n));The # that determines the # of terms ( wk+1 terms)
      (mapcar term-fn (range 0 nd))))

  (defun base-term (z)
    (/
     (* (nPr nd z) (expt b z))
     (fn (- 1 z))))

  (defun w-term (z) 
    (/ (base-term z) (fact z)))

  (defun f-term (z) 
    (/ (base-term z) (if (oddp z) -1 1) (dewlzt 1 #'* (mapcar #'fn (range 1 (- 2 z) -1)))))
;(zfact  (fn 1) (fn (- 2 z)))))

  (defun fn (x)
    (+ k n x)))

;Need to seperate ideas of multiply chain and zfact (because zfact should produce fractions)
;Its in here man. That dewlzt * range of fn values is a form of factorial (zfact)
