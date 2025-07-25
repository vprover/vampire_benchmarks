(define-fun
  j1
  ((x Int)) Int (- x (div x 2)))
(define-fun
  h1
  () Int (+ 2 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y (+ 1 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* x y) x))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 h1 1 (j1 x)))
(define-fun
  fast
  ((x Int)) Int (mod (w1 x) (+ 1 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (- 0 (div (* x y) (- y (div y 2)))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
