(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  f1
  ((x Int) (y Int)) Int (- 2 (* y y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  fast
  ((x Int)) Int (+ (+ 2 (v1 x)) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 0 1))
(define-fun
  small
  ((x Int)) Int (+ 2 (w0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
