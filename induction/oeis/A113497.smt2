(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x x 1))
(define-fun
  small
  ((x Int)) Int (+ 1 (+ x (w0 x))))
(define-fun
  fast
  ((x Int)) Int (+ (+ (* (+ (- x 1) x) (div (- 2 x) 2)) (* x x)) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
