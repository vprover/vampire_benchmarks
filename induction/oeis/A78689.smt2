(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun
  u0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v0 (- x 1) y z)))
(define-fun
  small
  ((x Int)) Int (ite (<= (mod (+ 2 x) (+ 1 2)) 0) (+ x x) 1))
(define-fun
  j0
  ((x Int)) Int (+ x x))
(define-fun
  h0
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 (j0 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w0 c)))))
