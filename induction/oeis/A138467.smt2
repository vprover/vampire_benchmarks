(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (div (+ 2 (- (div (+ 1 x) (+ 2 (+ 2 2))) x)) (+ 2 2)) 1) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (- y (div (* x y) (+ (+ (+ x y) y) y))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (- (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
