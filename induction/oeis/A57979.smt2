(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  small
  ((x Int)) Int (div (ite (<= (mod x 2) 0) 2 x) 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (mod x 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (div y 2))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w0 c)))))
