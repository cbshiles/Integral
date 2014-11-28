(let (n (p 7)(z 3))

  (defun setn (z) (setf n z))

  (defun sbx (x)     ;; (n+x)z+p -> (nz+p)+xz
    (+ p (* n z) (* x z)))

  (defun term (f)
    (/ 
     (* (npr n f) (expt z (1+ f)))
     (terma f 1)))

  (defun terma (d y)
    (if (< d 0)
	y
	(terma (- d 1) (* y (sbx (- 1 d))))))
  )

(defun fact (n)
  (if (= 0 n)
      1
      (facta 1 n)))

(defun facta (total n)
  (if (= 1 n)
      total
      (facta (* total n) (- n 1))))

(defun npr (n r) 
  (if (> r n) 
      '() 
      (/ (fact n) (fact (- n r)))))

(defun perm-tri (x)
  (let ((n 0) r)
    (loop (when (>= n x) (return));For each row
       (setf r 0)
       (loop (when (> r n) (return))
	  (princ (npr n r)) (princ " ")
	  (incf r))
       (princ #\Newline)
       (incf n))))

(defun luk-tri (x)
  (let ((n 0) r)
    (loop (when (>= n x) (return));For each row
       (setf r 0)
       (setn n)
       (loop (when (> r n) (return))
	  (princ (term r)) (princ "X^") (princ (- n r)) (princ " ")
	  (incf r))
       (princ #\Newline)
       (incf n))))

