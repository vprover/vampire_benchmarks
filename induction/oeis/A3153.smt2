(define-fun
  g0
  ((x Int)) Int (* (+ x x) (+ 2 x)))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (div
          (+ (- 1 (div (- x (div x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2)))) x)
          2)
        2)
      x)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (div y x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
