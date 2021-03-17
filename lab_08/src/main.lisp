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
(defun select-between (lst bot top)
    (reduce
        #'(lambda (acc el)
            (if (and (> el bot) (< el top))
                (append acc (cons el Nil))
                acc))
        lst :initial-value ())
)

;; 4
(defun minus-n (lst n)
    (mapcar #'(lambda (el) (- el n)) lst)
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
    (cons 0 lst)) ;; NIL Check
)
