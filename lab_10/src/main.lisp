;; 1
(defun rec-add (lst)
    (defun wrapper (lst acc)
        (if (null lst) acc
            (wrapper (cdr lst) (+ acc (car lst))))
    )
    (wrapper lst 0)
)

;; 2
(defun rec-nth (n lst)
    (if (zerop n)
            (car lst)
            (rec-nth (- n 1) (cdr lst)))
)

;; 3
(defun alloddr (lst)
    (if (null lst) T
        (and (oddp (car lst)) (alloddr (cdr lst))))
)

;; 4
(defun rec-last (lst)
    (if (null (cdr lst))
            (car lst)
            (rec-last (cdr lst)))
)

;; 5
(defun rec-sum-n (n lst)
    (if (or (zerop n) (null lst)) 0
        (+ (car lst) (sum-n (- n 1) (cdr lst))))
)

;; 6
(defun rec-last-odd (lst)
    (defun wrapper (lst cur)
        (if (null lst) cur
            (if (oddp (car lst))
                    (wrapper (cdr lst) (car lst))
                    (wrapper (cdr lst) cur)))
    )
    (wrapper lst nil)
)

;; 7
(defun cons-square (lst)
    (and lst (cons ((lambda (x) (* x x)) (car lst))
        (cons-square (cdr lst))))
)

;; 8
(defun select-odd (lst)
    (reduce #'(lambda (acc x)
        (if (oddp x)
            (append acc (cons x Nil))
            acc))
    lst :initial-value ())
)

(defun select-sum-odd (lst)
    (reduce #'(lambda (acc x)
        (if (oddp x)
            (+ acc x)
            acc))
    lst)
)

;; 9
(setf people (list
    (list
        (cons 'FIO "Sergey Kononenko")
        (cons 'Salary 30000)
        (cons 'Age 21)
        (cons 'Category "Tarantool Presale"))
    (list
        (cons 'FIO "Pavel Perestoronin")
        (cons 'Salary 100500)
        (cons 'Age 20)
        (cons 'Category "Qoolo developer"))
    (list
        (cons 'FIO "Mikhail Nitenko")
        (cons 'Salary 3000)
        (cons 'Age 32)
        (cons 'Category "Superflex C++ developer"))
    (list
        (cons 'FIO "Dmitry Yakuba")
        (cons 'Salary 500)
        (cons 'Age 58)
        (cons 'Category "Kotlin)"))
    )
)

(defun sum-salaries (lst)
    (reduce #'(lambda (acc x)
        (+ acc (cdr (assoc 'Salary x))))
    lst :initial-value 0)
)

(defun change-salaries (lst changep salary-func)
    (defun wrapper (salary-func x)
        (setf (cdr (assoc 'Salary x)) (funcall salary-func (cdr (assoc 'salary x))))
    )

    (mapcar #'(lambda (x)
        (if (funcall changep x)
            (wrapper salary-func x)
            (cdr (assoc 'Salary x))))
    lst)
)

(change-salaries people
                 #'(lambda (x) (< (cdr (assoc 'Age x)) 30)) ;; predicate
                 #'(lambda (x) (+ x 15)) ;; change func
)
