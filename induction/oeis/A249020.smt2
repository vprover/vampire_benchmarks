(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (div (v0 x) (+ 1 (+ 2 2))))
(define-fun
  fast
  ((x Int)) Int (+ 1 (div (+ (div (* x x) (+ 1 (+ 2 2))) x) 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
