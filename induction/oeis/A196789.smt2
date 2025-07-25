(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int (+ x x))
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 g1 y))
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (div (* 2 (+ (* 2 (+ x x)) x)) y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (* (v1 x y) x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
