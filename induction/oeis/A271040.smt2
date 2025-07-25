(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 2 (+ 2 2)))
(define-fun
  h2
  () Int (+ 2 (+ 2 2)))
(define-fun
  h0
  () Int (+ 2 (+ 2 2)))
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
  ((x Int)) Int (u2 h2 1 x))
(define-fun
  g0
  ((x Int) (y Int)) Int (- y 1))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 x))
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 1 h3))
(define-fun
  fast
  ((x Int)) Int (div (w2 x) (* 2 v3)))
(define-fun
  f1
  ((x Int)) Int (* 2 (+ (+ x x) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  small
  ((x Int)) Int (div (w0 x) v1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
