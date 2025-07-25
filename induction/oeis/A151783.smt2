(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h3
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g3
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (* (mod y 2) (+ 1 2)) x) x))
(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z)))
   (ite (<= x 0) z (g3 (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  w3
  ((x Int)) Int (u3 h3 1 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (w3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div (div (v2 x) 2) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (ite (<= (mod y 2) 0) 1 (+ 2 2)) x))
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
  ((x Int)) Int (div (div (v0 x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
