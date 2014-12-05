(defun range (a z &optional (s 1))
  "Creates an inclusive range from a to z, by increments of s"
  (when (= s 0) (return))
  (do (lzt (cmp (if (> s 0) #'> #'<)) (x a (+ x s)))
      ((funcall cmp x z) (nreverse lzt))
    (push x lzt)))

(defmacro doeach(lzt fn &rest params) ;Simple fn name (+ not #'+)
  (let ((i (gensym)) (zt (gensym)))
    `(let ((,zt ,lzt))
       (loop for ,i on ,zt do (setf (car ,i) (,fn (car ,i) ,@params)))
       ,zt)))

(defmacro mapn2(dest fn src)
  (let ((d (gensym)))
    `(let ((,d ,dest))
       (map-into ,d ,fn ,d ,src))))

(defun next(row)
  (let* ( (a (cons 0 row)) (b (reverse a)) )
    (mapn2 b #'+ a)))

(defun pascals(r) ;Pascal's triangle to the rth row. (starts @ 0)
  (defun psub(ri lzt)
    (if (> ri r) 
	(nreverse lzt)
	(psub (1+ ri) (cons (next (car lzt)) lzt))))

  (let ( (tri (psub 1 (cons(cons 1 nil)nil))))
    (defun row(n) (nth n tri))))


(defun run(n b k)
  (pascals (1+ n)) ;Provides access to row(n) function

;Have not tested :a parameter
  (defun expand(n &key (a 1) (b 1)) ;expansion of (ax + b)^n
    (defun esub(at bt c lzt)
      (if (> c n) lzt
	  (esub (/ at a) (* bt b) (1+ c) (cons (* at bt) lzt))))
    (mapn2 (esub (expt a n) 1 0 nil) #'* (row n)))

  (let ( sum (ulist (mapn2 (expand n :b (- b)) #'/ (range (1+ k) (+ 1 n k)))))
    (dotimes (x (1+ n))
      (setf sum (mapn2 (doeach (expand (1+ x) :b b) * (nth x ulist)) #'+ sum)));doeach * nth in ulist
   (nreverse sum)))

;(run 2 1 1/3)
