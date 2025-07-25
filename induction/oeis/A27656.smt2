(define-fun
  small
  ((x Int)) Int (div (ite (<= (mod x 2) 0) (+ 2 x) 0) 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div y 2) 1))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w0 c)))))
