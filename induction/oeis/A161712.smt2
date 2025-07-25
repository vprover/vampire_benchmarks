(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  fast
  ((x Int)) Int
  (+ (* (+ (div (* (+ (- x 1) x) (- (* x x) x)) (+ 1 2)) x) 2) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (+ (* y y) x)))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
