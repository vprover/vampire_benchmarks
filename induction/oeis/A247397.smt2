(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  u0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v0 (- x 1) y z)))
(define-fun
  small
  ((x Int)) Int (+ (ite (<= (- (- (div x 2) 2) 2) 0) 1 2) x))
(define-fun
  h0
  ((x Int)) Int (- x (* 2 (+ 2 2))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 1))
(define-fun
  fast
  ((x Int)) Int (+ x (w0 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
