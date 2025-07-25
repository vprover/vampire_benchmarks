(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (- (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  j0
  () Int (+ 1 2))
(define-fun
  h0
  ((x Int)) Int (* x x))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 2 j0))
(define-fun
  small
  ((x Int)) Int (ite (<= x 0) 1 (w0 x)))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  () Int (- 0 1))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y f1))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int
  (* (ite (<= (mod (ite (<= x 0) 1 x) (+ 1 2)) 0) 2 1) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
