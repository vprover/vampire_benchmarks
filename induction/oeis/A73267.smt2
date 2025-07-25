(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 2 2))
(define-fun
  h2
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  h1
  () Int (+ 2 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (- 2 x))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) h3))
(define-fun
  g2
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g1
  ((x Int)) Int (- 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  g0
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (mod y 2) x) x))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 h2 1 x))
(define-fun
  fast
  ((x Int)) Int (mod (div (w2 x) 2) (v3 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (mod y 2) x) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 x))
(define-fun
  small
  ((x Int)) Int (mod (div (w0 x) 2) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
