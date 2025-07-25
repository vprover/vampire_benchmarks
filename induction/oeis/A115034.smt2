(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v3 (- x 1) y z))
   (ite (<= x 0) z (* (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 x 2 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (w3 (u2 (- x 1) y))))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v0 (- x 1) y z))
   (ite (<= x 0) z (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int) (y Int)) Int (- y x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  v2
  ((x Int)) Int (u2 1 (v4 x)))
(define-fun
  f3
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int) (y Int)) Int (- y (div x 1)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  w0
  ((x Int)) Int (u0 (v1 x) 2 1))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v2 c)))))
