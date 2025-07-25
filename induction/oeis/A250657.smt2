(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (* (+ 1 (+ 2 (* (+ 2 (+ 2 x)) (+ 2 2)))) (+ 2 x))))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (* (+ (+ 1 x) y) x) 1))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 2 x))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
