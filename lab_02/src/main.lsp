(defun f1 (ar1 ar2 ar3 ar4)
    (cons (cons ar1 (cons ar2 ())) 
        (cons (cons ar3 (cons ar4 ())) ()))
)

(defun f2 (ar1 ar2)
    (cons (cons ar1 ()) (cons (cons ar2 ()) ()))
)

(defun f3 (ar1)
    (cons (cons ar1 ()) ())
)

(print (f1 1 2 3 4))
(print (f2 1 2))
(print (f3 1))