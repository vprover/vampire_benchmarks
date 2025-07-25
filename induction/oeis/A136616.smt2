(define-fun
  small
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (+ (div (+ (div (- 2 (div (div x 2) 2)) 2) x) (ite (<= x 0) 1 2))
            1)
          x)
        2)
      x)
    x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (-
      (+ (+ (- 2 (div (+ (div (+ 1 (div x (+ 2 2))) 2) x) (+ 2 2))) x) x)
      (ite (<= x 0) 1 2))
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
