(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (- (mod x (+ 1 2)) 1))
(define-fun
  g0
  ((x Int) (y Int)) Int (ite (<= x 0) 2 (- 1 y)))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 2))
(define-fun
  f1
  () Int (- 0 1))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y f1))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  fast
  ((x Int)) Int (ite (<= x 0) 1 (v1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
