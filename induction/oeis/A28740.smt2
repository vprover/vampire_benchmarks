(define-fun
  g0
  ((x Int)) Int (- (- x 2) 2))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (div (+ (ite (<= (- (- x 2) 2) 0) 0 (+ 1 2)) x) 2) 2) x))
(define-fun
  f0
  () Int (+ 1 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y f0))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (+ 2 (+ (div (+ (v0 x) x) 2) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
