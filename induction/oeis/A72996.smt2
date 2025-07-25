(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h2
  () Int (+ 1 2))
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) h2))
(define-fun
  h1
  ((x Int)) Int (+ 2 (v2 x)))
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (* (+ 1 2) (mod y 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
