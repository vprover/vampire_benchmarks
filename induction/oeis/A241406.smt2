(define-fun
  small
  ((x Int)) Int
  (+
    (-
      (+
        (*
          (- (* (+ 1 (+ 2 2)) (+ 1 (+ (+ (+ (mod x 2) x) x) x))) (mod x 2))
          2)
        1)
      (div x 2))
    x))
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (+
        (* (+ (* (+ (* (+ 1 2) (+ 1 (+ (+ (+ (mod x 2) x) x) x))) x) 2) 1)
          (+ 1 2))
        1)
      x)
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
