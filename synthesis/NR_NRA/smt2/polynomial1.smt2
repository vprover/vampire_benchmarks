(set-logic NRA)

(assert-synth ((x1 Real) (x2 Real))
    ((y Real))
        (= (* y y) (+ (* x1 x1) (+ (* 2 (* x1 x2)) (* x2 x2)))))
