(assert-not (forall ((x1 Int))
    (exists ((y Int))
        (= (* y x1) (+ (* x1 x1) (* x1 2)))
    )
))
(check-sat)
