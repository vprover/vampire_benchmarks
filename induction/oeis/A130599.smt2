(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  j3
  () Int (+ 1 2))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 j3))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (w3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 1 y))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (v2 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int (mod x 2))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 x))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (* (div x 2) (mod x 2)))
(define-fun
  f0
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (w1 c)))))
