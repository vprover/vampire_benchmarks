(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (v1 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (v2 x) (v3 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
