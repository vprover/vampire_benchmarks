(set-logic NIA)

(assert-synth ((x1 Int) (x2 Int))
    ((y Int))
        (= (*(* y y) y) (+ (*(* x1 x1) x1) (+ (* 3 (* (* x1 x1) x2)) (+ (* 3 (* x1 (* x2 x2))) (*(* x2 x2) x2))))))
