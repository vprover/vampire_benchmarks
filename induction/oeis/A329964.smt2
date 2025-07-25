(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  h0
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  g2
  ((x Int) (y Int)) Int (- y 1))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 x))
(define-fun
  g0
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (w2 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (* x y) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v1 c)))))
