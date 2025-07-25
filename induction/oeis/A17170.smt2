(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i1
  () Int (+ 1 2))
(define-fun
  h2
  ((x Int)) Int (+ (* 2 (* 2 (+ x x))) x))
(define-fun
  h1
  () Int (+ 2 2))
(define-fun
  w1
  ((x Int)) Int (u1 h1 i1 x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (* (v0 x) x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (* (* (v2 x) (+ 1 2)) (+ (+ x x) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
