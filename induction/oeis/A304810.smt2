(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (div (+ (ite (<= (- (mod x (+ 1 (* 2 (+ 2 2)))) 1) 0) 2 1) x)
            (+ 1 2))
          1)
        2)
      1)
    x))
(define-fun
  f0
  ((x Int)) Int (+ 1 (+ (mod (+ (div x (+ 2 (mod x 2))) x) 2) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (div (+ (v0 x) x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
