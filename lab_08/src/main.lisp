;; 1.1

(defun mult-numbers (acc lst)
    (reduce #'* lst :initial-value acc)
)

;; 1.2
(defun mult-objects (mp lst)
    (reduce
        #'(lambda (acc el)
            (if (numberp el)
                (* acc el)
                acc))
    lst :initial-value mp)
)

;; 2
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

(defun select-between (lst bot top)
    (reduce
        #'(lambda (acc el)
            (if (and (> el bot) (< el top))
                (add-to-end acc el)
                acc))
    lst :initial-value ())
)

;; 4
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

(defun rec-minus-n-internal (lst n acc)
    (if (car lst)
        (cond ((listp (car lst))
                    (add-to-end acc (rec-minus-n (car lst) n ())))
              ((numberp (car lst))
                    (rec-minus-n (cdr lst) n (add-to-end acc (- (car lst) n))))
              (t
                    (add-to-end acc (car lst))))
        acc
    )
)

(defun rec-minus-n (lst n)
    (rec-minus-n-internal lst n ())
)

(defun minus-n (lst n)
    (mapcar #'(lambda (el)
        (cond ((listp el) (minus-n el n))
               ((numberp el) (- el n))
               (t el)))
    lst)
)

;; 5
(defun first-lst (lst)
    (if (listp (car lst))
        (car (car lst))
        (first-lst (cdr lst)))
)

;; 6
(defun sum-list (lst)
    (reduce
        #'(lambda (acc x)
        (cond ((listp x) (+ acc (sum-list x)))
               ((numberp x) (+ acc x))
               (t acc)))
    lst :initial-value 0)
)
