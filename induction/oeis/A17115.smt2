(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  j0
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  h1
  ((x Int)) Int (* 2 (+ 2 (* 2 (+ x x)))))
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  w0
  ((x Int)) Int (u0 h0 2 (j0 x)))
(define-fun
  small
  ((x Int)) Int (* 2 (w0 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
