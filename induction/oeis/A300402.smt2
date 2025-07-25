(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  u0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v0 (- x 1) y z)))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 1))
(define-fun
  small
  ((x Int)) Int (+ 1 (w0 x)))
(define-fun
  g1
  ((x Int)) Int (- (+ 2 2) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (mod (- y x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  fast
  ((x Int)) Int (+ 1 (v1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
