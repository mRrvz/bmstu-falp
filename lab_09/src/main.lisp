;; 1
(defun select-between (lst)
    (reduce
        #'(lambda (acc el)
            (if (and (> el 1) (< el 10))
                (append acc (cons el Nil))
                acc))
        lst :initial-value ())
)

;; 2
(defun cartesian-prod (lst1 lst2)
    (mapcan
        #'(lambda (x1)
            (mapcar
                #'(lambda (x2)
                    (cons x1 x2))
        lst2))
    lst1)
)

;; 4
(defun sum-len-of-list (lst)
    (reduce #'(lambda (acc x) (+ acc (length x))) lst :initial-value 0)
)

;; 5
(defun square (x)
    (* x x)
)

(defun list-squares (lst)
    (defun wrapper (lst acc)
        (if (null lst) acc
            (cond ((listp (car lst))
                        (append acc
                            (wrapper (cdr lst) (wrapper (car lst) ()))))
                ((numberp (car lst))
                        (append acc (wrapper (cdr lst) (cons (square (car lst)) Nil))))
                (t acc)))
    )
    (wrapper lst ())
)