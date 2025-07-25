(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int (div x 2))
(define-fun
  h1
  () Int (+ 1 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 0 x))
(define-fun
  small
  ((x Int)) Int (- x (mod (w0 x) 2)))
(define-fun
  f1
  ((x Int) (y Int)) Int (div (- y x) 2))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 h1 (i1 x) 0))
(define-fun
  fast
  ((x Int)) Int (+ (mod (+ (w1 x) x) (- 0 2)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
