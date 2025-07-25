(define-fun
  small
  ((x Int)) Int
  (div
    (+
      (+
        (- (+ (+ (+ (div (+ (+ (div (div x 2) 2) (mod x 2)) x) 2) x) 1) x)
          x)
        1)
      (ite (<= (mod x 2) 0) 1 x))
    2))
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (+
        (div
          (+
            (+
              (- (+ (+ (+ (ite (<= (mod x 2) 0) 1 (+ x x)) x) (div x (+ 2 2))) 2)
                x)
              1)
            x)
          2)
        1)
      x)
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
