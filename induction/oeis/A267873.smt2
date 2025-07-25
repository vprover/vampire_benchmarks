(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v2 (- x 1) y z))
   (ite (<= x 0) z (- (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 x 0 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (w2 (u1 (- x 1) y))))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 1 (- 2 x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (v1 x) x))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (- y (div 2 y)) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (+ 1 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
