(define-fun
  j2
  () Int (- 0 2))
(define-fun
  j1
  () Int (- 0 2))
(define-fun
  i2
  ((x Int)) Int (+ (ite (<= x 0) 0 2) 1))
(define-fun
  i1
  () Int (+ 1 2))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h1
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (i2 x) j2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 (h1 x y) i1 j1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (w2 c)))))
