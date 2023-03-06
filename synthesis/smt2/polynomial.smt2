(assert-not (forall ((x1 Int) (x2 Int))
    (exists ((y Int))
        (= (* y y) (+ (* x1 x1) (+ (* 2 (* x1 x2)) (* x2 x2)))))
))
