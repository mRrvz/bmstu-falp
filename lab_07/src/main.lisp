;; 1
(defun is-palindrome (lst)
    (equal lst (reverse lst))
)

;; 2
(defun set-equal (set1 set2)
    (not (set-difference set1 set2))
)

;; 3
(defun get-capital (table country)
    (cdr (assoc country table))
)

(defun get-country (table capital)
    (car (rassoc capital table))
)

;; 4
(defun swap-first-last (lst)
    (append
        (append
            (cons (car (reverse lst)) Nil) ;; last
            (reverse (cdr (reverse lst)))) ;; tail without last
        (cons (car lst) Nil)) ;; head
)

;; 5
(defun swap-two-elements (lst ind1 ind2)
    (rotatef (nth ind1 lst) (nth ind2 lst)) lst
)

;; 6
(defun swap-to-left (lst)
    (append (cdr lst) (cons (car lst) Nil))
)

(defun swap-to-right (lst)
    (append
        (cons (car (reverse lst)) Nil)
        (reverse (cdr (reverse lst))))
)
