(define-fun
  small
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (div (+ (+ (div (+ (div (+ (div x (+ 2 2)) x) (+ 2 2)) 2) 2) 1) x)
            2)
          1)
        (+ 1 2))
      x)
    1))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div
        (-
          (div
            (+ (div (+ (div x (+ 2 (* 2 (+ 2 2)))) x) (+ 1 (+ 2 (+ 2 2)))) x)
            2)
          1)
        (+ 1 2))
      x)
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
