(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  h1
  ((x Int) (y Int)) Int (mod 2 y))
(define-fun
  g3
  () Int (+ 2 2))
(define-fun
  v3
  () Int (u3 g3 1))
(define-fun
  g2
  ((x Int)) Int (- x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  () Int (+ 1 v3))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y f2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int (- (* (v2 x) (ite (<= x 0) 1 x)) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 2 (h1 x y)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
