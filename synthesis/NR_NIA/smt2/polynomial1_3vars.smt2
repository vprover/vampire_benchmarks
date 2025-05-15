(set-logic NIA)

(assert-synth ((x1 Int) (x2 Int) (x3 Int))
    ((y Int))
        (= (* y y) (+ (+ (+ (+ (+ (* x1 x1) (* 2 (* x1 x2))) (* x2 x2)) (* 2 (* x2 x3))) (* x3 x3)) (* 2 (* x3 x1))
                )
            )
        )


