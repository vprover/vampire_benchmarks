(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int) (y Int)) Int (div (- y 1) 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (+ (ite (<= y 0) 0 1) x) y))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 0 (j2 x)))
(define-fun
  fast
  ((x Int)) Int (mod (w2 x) 2))
(define-fun
  f1
  ((x Int)) Int (- 1 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v1 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
