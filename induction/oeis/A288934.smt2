(define-fun
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (mod x 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v3
    ((x Int) (y Int) (z Int)) Int)
   (u3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) y (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  () Int (+ 2 (+ 2 2)))
(define-fun
  u4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y f4))
(define-fun
  w4
  ((x Int)) Int (u4 (h4 x) 1 x))
(define-fun
  w3
  ((x Int)) Int (u3 (w4 x) 0 x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (div y (w3 x)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div y (w1 x)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ 1 (+ (v0 x) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
