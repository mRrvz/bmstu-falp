;; 1
(defun my-reverse-internal (lst acc)
    (cond ((null lst) acc)
          (t (my-reverse-internal (cdr lst) (cons (car lst) acc))))
)

(defun my-reverse (lst)
    (my-reverse-internal lst ())
)

(defun my-equal-internal (lst1 lst2)
    (if (null lst1) T
        (and (= (car lst1) (car lst2)) (my-equal-internal (cdr lst1) (cdr lst2))))
)

(defun my-equal (lst1 lst2)
    (if (= (length lst1) (length lst2))
        (my-equal-internal lst1 lst2)
        Nil)
)

(defun is-palindrome (lst)
    (my-equal lst (my-reverse lst))
)

;; 2
(defun my-subsetp (set1 set2)
    (reduce
        #'(lambda (acc1 set1-el)
            (and acc (reduce
                #'(lambda (acc2 set2-el)
                    (or acc2 (= set2-el set1-el))) set2 :initial-value Nil)))
    set1 :initial-value T)
)

(defun set-equal (set1 set2)
    (if (= (length set1) (length set2))
        (and (my-subsetp set1 set2) (my-subsetp set2 set1))
        Nil)
)

;; 3
(defun get-capital (table country)
    (cdr (assoc country table))
)

(defun get-country (table capital)
    (car (rassoc capital table))
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

(defun swap-first-last (lst)
    (add-to-end
        (cons
            (car (reverse lst)) ;; last
            (reverse (cdr (reverse lst)))) ;; tail without last
        (car lst)) ;; head
)

;; 5
(defun swap-two-elements-internal (lst i1 i2 v1 v2 acc pos)
    (cond ((null lst) acc)
          ((= pos i1)
                (swap-two-elements-internal (cdr lst) i1 i2 v1 v2 (add-to-end acc v2) (+ pos 1)))
          ((= pos i2)
                (swap-two-elements-internal (cdr lst) i1 i2 v1 v2 (add-to-end acc v1) (+ pos 1)))
          (t
                (swap-two-elements-internal (cdr lst) i1 i2 v1 v2(add-to-end acc (car lst)) (+ pos 1))))
)

(defun swap-two-elements (lst i1 i2) ;; без setf
    (swap-two-elements-internal lst i1 i2 (nth i1 lst) (nth i2 lst) () 0)
)

(defun swap-two-elements (lst ind1 ind2)
    (let ((elem1 (nth ind1 lst))
          (elem2 (nth ind2 lst)))
                (setf (nth ind1 lst) elem2)
                (setf (nth ind2 lst) elem1)
    lst)
)

;; 6
(defun swap-to-left (lst)
    (rec-add-to-end (cdr lst) (car lst))
)

(defun swap-to-right (lst)
    (cons
        (car (reverse lst))
        (reverse (cdr (reverse lst))))
)
