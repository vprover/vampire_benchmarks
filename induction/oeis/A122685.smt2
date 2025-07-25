(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  h3
  () Int (+ 2 2))
(define-fun
  h2
  ((x Int)) Int (- x 1))
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) h3))
(define-fun
  j2
  ((x Int)) Int (- 2 (v3 x)))
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
  f1
  ((x Int)) Int (- 0 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 2))
(define-fun
  j0
  ((x Int)) Int (- 0 (v1 x)))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 (j0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w2 c)))))
