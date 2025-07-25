(define-fun
  small
  ((x Int)) Int
  (+ 2
    (+
      (+
        (div (- x (div x (- (* 2 (* 2 (* 2 (+ 2 2)))) 2))) (+ 1 (+ 2 2)))
        x)
      x)))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (div (+ (* (+ 1 (+ 2 2)) (+ 1 x)) x)
          (- (* 2 (* 2 (* 2 (+ 2 2)))) 1))
        2)
      x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
