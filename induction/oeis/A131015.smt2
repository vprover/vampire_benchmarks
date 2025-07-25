(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v1 (- x 1) y z))
   (ite (<= x 0) z (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  h1
  ((x Int)) Int (mod (+ 1 x) (+ 2 2)))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 2 1))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ (+ x y) y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 1))
(define-fun
  small
  ((x Int)) Int (mod (w0 x) (+ 1 (+ 2 2))))
(define-fun
  fast
  ((x Int)) Int
  (mod (* (w1 x) (ite (<= (mod x (+ 1 2)) 0) 1 2)) (+ 1 (+ 2 2))))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
