(define-fun
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  i2
  ((x Int)) Int (div (+ (* x x) x) 2))
(define-fun
  h1
  ((x Int)) Int (* x x))
(define-fun
  v1
  ((x Int)) Int (u1 x (h1 x)))
(define-fun
  small
  ((x Int)) Int (* (v0 x) (v1 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (* (+ (* y y) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 1 (i2 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w2 c)))))
