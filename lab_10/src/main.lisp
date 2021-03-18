;; 1
(defun rec-add-internal (lst)
    (if (null lst) acc
        (rec-add-internal (cdr lst) (+ acc (car lst))))
)

(defun rec-add (lst)
    (rec-add-internal lst 0)
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
(defun rec-last-odd-internal (lst curr)
    (if (null lst) cur
        (if (oddp (car lst))
            (rec-last-odd-internal (cdr lst) (car lst))
            (rec-last-odd-internal (cdr lst) cur)))
)

(defun rec-last-odd (lst)
    (rec-last-odd-internal lst ())
)

;; 7
(defun cons-square (lst)
    (and lst (cons (* (car lst) (car lst))
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

(defun get-value (table key)
    (cdr (assoc key table))
)

(defun change-salaries-internal (salary-func curr)
    (list
        (cons 'FIO (get-value curr 'FIO))
        (cons 'Salary (funcall salary-func (get-value curr 'Salary)))
        (cons 'Age (get-value curr 'Age))
        (cons 'Category (get-value curr 'Category)))
)

(defun change-salaries (lst changep salary-func)
    (mapcar #'(lambda (x)
        (if (funcall changep x)
            (change-salaries-internal salary-func x)
            x))
    lst)
)

(change-salaries people
                 #'(lambda (x) (< (cdr (assoc 'Age x)) 30)) ;; predicate
                 #'(lambda (x) (+ x 15)) ;; change func
)
