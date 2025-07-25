(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  fast
  ((x Int)) Int
  (div (- (- (* x x) (div (* (+ 2 x) x) (* 2 (+ 2 2)))) x) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (div (+ (div y 2) y) 2) x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
