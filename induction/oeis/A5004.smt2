(define-fun
  g0
  ((x Int)) Int (- x 2))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (ite (<= (- x 2) 0) 1 (+ (- (mod x 2) 2) x)) x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod y 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (+ (+ (v0 x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
