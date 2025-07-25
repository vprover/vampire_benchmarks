(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun
  u0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v0 (- x 1) y z)))
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 2))
(define-fun
  g1
  ((x Int)) Int (- (+ 1 2) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 2 (- (div x y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v1 c)))))
