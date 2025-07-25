(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h2
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (mod (+ (div y 2) y) 2) x) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 1 (j2 x)))
(define-fun
  fast
  ((x Int)) Int (div (w2 x) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* (mod (+ (div y 2) y) 2) x) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
