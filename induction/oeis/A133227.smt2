(define-fun
  h1
  ((x Int)) Int (+ (ite (<= x 0) 0 2) x))
(define-fun
  h0
  ((x Int)) Int (+ 2 (div x 2)))
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 2 y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 1))
(define-fun
  small
  ((x Int)) Int (ite (<= x 0) 1 (w0 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* 2 (* x y)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
