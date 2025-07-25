(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (+ x x))
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  f2
  ((x Int) (y Int)) Int
  (+ (div (+ (* 2 (* 2 (+ y y))) y) (+ (* x x) y)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) x))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 g1 x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div y (* x x)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (v1 x) 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
