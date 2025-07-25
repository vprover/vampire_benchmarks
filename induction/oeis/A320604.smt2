(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 2 x))
(define-fun
  g1
  ((x Int) (y Int)) Int (- y x))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (w1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 2))
(define-fun
  fast
  ((x Int)) Int
  (+ 2 (ite (<= (mod (* (+ 2 x) x) (+ 2 (+ 2 2))) 0) 2 1)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
