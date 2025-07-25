(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  j2
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  j0
  ((x Int)) Int (+ x x))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 (j2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 (j0 x)))
(define-fun
  small
  ((x Int)) Int (div (w0 x) (v1 x)))
(define-fun
  fast
  ((x Int)) Int (* (div (w2 x) (v3 x)) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
