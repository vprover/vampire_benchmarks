(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  h0
  ((x Int)) Int (- x 1))
(define-fun
  g3
  ((x Int)) Int (- x 1))
(define-fun
  g2
  ((x Int)) Int (- 2 x))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  f1
  ((x Int)) Int (+ (* x x) (v2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (v3 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* y y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 2))
(define-fun
  small
  ((x Int)) Int (+ 1 (w0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
