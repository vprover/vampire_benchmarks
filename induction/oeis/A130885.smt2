(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  fast
  ((x Int)) Int (+ 1 (* (+ 2 (* (+ 1 x) (+ (* 2 (+ 2 x)) x))) x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ x y) (* x x)))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
