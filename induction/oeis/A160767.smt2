(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  j0
  ((x Int)) Int (+ x 1))
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 1 (+ (+ x x) x)))
(define-fun
  h2
  ((x Int)) Int (div (+ (* x x) x) 2))
(define-fun
  h1
  ((x Int)) Int (* x x))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y (h1 x)))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v1 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 x (j0 x)))
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
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  f2
  ((x Int)) Int (+ (v3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v2 c)))))
