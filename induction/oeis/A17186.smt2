(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 1))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 2 (+ (* 2 (* 2 (+ x x))) x)))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 2 x) (* (+ 2 x) y)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (v1 c)))))
