(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y x))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (v2 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j1
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 x x (j1 x y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  i1
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (- (* y y) y) (* 2 (+ x x))))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 0))
(define-fun
  fast
  ((x Int)) Int (+ (div (v3 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
