(set-logic NIA)

(assert-synth ((x1 Int) (x2 Int))
    ((y Int))
        (= (* y y) (+ (* x1 x1) (+ (* 2 (* x1 x2)) (* x2 x2)))))
