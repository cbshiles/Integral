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

(defmacro mapn2(dest fn src)
  (let ((d (gensym)))
    `(let ((,d ,dest))
       (map-into ,d ,fn ,d ,src))))

(defun try(x)
  (do ( (c 0 (1+ c)) (lzt nil (cons (npr x c) lzt)) )
      ((> c x) (nreverse lzt))))

(defun inv(n) (/ 1 n))

(defun titan(k n) ;
  (do* ( (x (inv k) (- x 1)) (lzt (cons k nil) (cons (* (car lzt) (inv x)) lzt)) (c 0 (1+ c)) )
      ((> c n) (nreverse lzt))))

(defun strang (k n)
  (mapn2 (titan k n) #'* (try n)))
