(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 2 (- y (mod x 2))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* 2 (+ x x)) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 2))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (+ 1 (+ (+ (* 2 (+ x x)) (div y (+ 1 2))) y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (w1 c)))))
