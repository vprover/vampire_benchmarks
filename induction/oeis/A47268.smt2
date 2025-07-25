(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  small
  ((x Int)) Int (+ 1 (+ (- x (mod (mod x (+ 1 2)) 2)) x)))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  fast
  ((x Int)) Int (+ (+ (- (v0 x) 1) x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
