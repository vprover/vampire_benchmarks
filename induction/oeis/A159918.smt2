(define-fun
  j1
  ((x Int)) Int (div (* x x) 2))
(define-fun
  j0
  ((x Int)) Int (* x x))
(define-fun
  i1
  ((x Int)) Int (* x x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (- (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x (i1 x) (j1 x)))
(define-fun
  g0
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod y 2) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 (j0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w1 c)))))
