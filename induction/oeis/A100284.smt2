(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  h3
  () Int (+ 1 (+ 2 2)))
(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 1 h3))
(define-fun
  f2
  () Int (+ 1 (+ 2 2)))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y f2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) (v2 x) v3))
(define-fun
  fast
  ((x Int)) Int (+ 1 (div (w1 x) (+ 2 (+ 2 2)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* 2 (* 2 (- x (mod y 2)))) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
