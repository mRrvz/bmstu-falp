;; 1
(defun rec-add-to-end (lst elem)
    (cond ((cdr lst)
                (rec-add-to-end (cdr lst) elem))
           ((listp elem)
                (setf (cdr lst) elem))
           (t (setf (cdr lst) (cons elem Nil))))
    lst
)

(defun add-to-end (lst elem)
    (if (null lst)
        (cons elem Nil)
        (rec-add-to-end lst elem)
    )
)

(defun select-between (lst)
    (reduce
        #'(lambda (acc el)
            (if (and (> el 1) (< el 10))
                (add-to-end acc el)
                acc))
    lst :initial-value ())
)

;; 2
(defun cartesian-prod (lst1 lst2)
    (mapcan #'(lambda (x1)
        (mapcar #'(lambda (x2)
            (cons x1 x2))
        lst2))
    lst1)
)

;; 4
(defun sum-len-of-list (lst)
    (reduce #'(lambda (acc x) (+ acc (length x))) lst :initial-value 0)
)

;; 5
(defun rec-add-to-end (lst elem)
    (cond ((cdr lst)
                (rec-add-to-end (cdr lst) elem))
           ((listp elem)
                (setf (cdr lst) elem))
           (t (setf (cdr lst) (cons elem Nil))))
    lst
)

(defun add-to-end (lst elem)
    (if (null lst)
        (cons elem Nil)
        (rec-add-to-end lst elem)
    )
)

(defun list-squares-internal (lst acc)
    (if (null lst) acc
        (cond ((listp (car lst))
                    (add-to-end acc (list-squares-internal (car lst) ())))
              ((numberp (car lst))
                    (list-squares-internal (cdr lst) (add-to-end acc (* (car lst) (car lst)))))
              (t
                    (list-squares-internal (cdr lst) acc))))
)

(defun list-squares (lst)
    (list-squares-internal lst ())
)