(define-fun
  h1
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int) (y Int)) Int (* 2 (+ (+ x y) y)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* 2 (+ (+ (+ x y) y) y)) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* 2 (- y x)) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w1 c)))))
