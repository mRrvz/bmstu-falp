;; 3.1
(defun last (lst)
    (if (cdr lst)
        (last-elem (cdr lst))
        (car lst))
)

;; 3.2
(defun last-reduce (lst)
    (reduce #'(lambda (acc current) current) lst)
)

;; 4.1
(defun init (lst)
    (defun wrapper (lst acc)
        (if (cdr lst)
            (wrapper (cdr lst) (append acc (cons (car lst) Nil)))
            acc)
    )
    (wrapper lst ())
)

;; 4.2
(defun init-reverse (lst)
    (reverse (cdr (reverse lst)))
)

;; 5
(defun random-cube-value ()
    (list (random 7) (random 7))
)

(defun dices-sum (pair)
    (+ (car pair) (car (cdr pair)))
)

(defun check-absolute-win (sum)
    (or (= sum 7) (= sum 11))
)

(defun check-rerun (pair)
    (let* ((fst (car pair))
            (snd (car (cdr pair))))
    (or (= fst snd 1) (= fst snd 6)))
)

(defun dices ()
    (let* ((fst-dices-pair (random-cube-value))
           (fst-dices-sum (dices-sum fst-dices-pair)))
                (format T "Player one dices: ~a.~%" fst-dices-pair)
                (cond ((check-absolute-win fst-dices-sum)
                            (format T "Player one win!~%"))
                      ((check-rerun fst-dices-pair)
                            (format T "Rerun!~%") (dices))
                      (t (let* ((snd-dices-pair (random-cube-value))
                                (snd-dices-sum (dices-sum snd-dices-pair)))
                                    (format T "Player two dices: ~a.~%" snd-dices-pair)
                                    (cond ((check-absolute-win snd-dices-sum)
                                                (format T "Player two win!~%"))
                                          ((> fst-dices-sum snd-dices-sum)
                                                (format T "Player one win!~%"))
                                          (t
                                                (format T "Player two win!~%")))))))
)
