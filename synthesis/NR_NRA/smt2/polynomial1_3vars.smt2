(set-logic NRA)

(assert-synth ((x1 Real) (x2 Real) (x3 Real))
    ((y Real))
        (= (* y y) (+ (+ (+ (+ (+ (* x1 x1) (* 2 (* x1 x2))) (* x2 x2)) (* 2 (* x2 x3))) (* x3 x3)) (* 2 (* x3 x1))
                )
            )
        )


