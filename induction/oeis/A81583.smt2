(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  g0
  () Int (+ 1 2))
(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z g0))
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (* (+ 1 2) (* (+ 1 2) (div (+ (* (* x x) x) x) 2)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (* x y) y) y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 x x))
(define-fun
  small
  ((x Int)) Int (div (w0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
