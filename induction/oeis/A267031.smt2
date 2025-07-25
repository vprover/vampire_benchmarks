(define-fun
  h1
  ((x Int)) Int (+ x x))
(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  f1
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (* (div (- (* 2 (v1 x)) x) (+ 1 2)) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* y y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
