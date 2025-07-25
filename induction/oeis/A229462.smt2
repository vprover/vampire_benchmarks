(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  j1
  ((x Int)) Int (mod x 2))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  i1
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  i0
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ x x) y))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 x i1 (j1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (mod y 2) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x i0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (w1 c)))))
