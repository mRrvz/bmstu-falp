(defun f1 (a b c d e f g)
    (cons a (
        cons (
            cons b
                (cons (cons (cons c Nil) (cons (cons d Nil) (cons (cons e Nil) Nil)))
            (cons (cons f Nil) Nil)))
        (cons g Nil)))
)

(defun f2 (a b c d e f g)
    (list a
        (list b (list
            (list c) (list d) (list e)) (list f)
        ) g
    )
)

(defun f3 (a b c d e f g)
    `(,a (,b ((,c) (,d) (,e)) (,f)) ,g)
)

