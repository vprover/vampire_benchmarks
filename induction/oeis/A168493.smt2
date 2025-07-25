(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  j3
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h1
  ((x Int)) Int (div (* x x) (+ 2 2)))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (div (* x x) 2))
(define-fun
  f4
  () Int (+ 1 2))
(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y f4))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) (v4 x) j3))
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (w3 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
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
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
