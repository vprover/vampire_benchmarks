(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int) (y Int)) Int (u2 y 1 2))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int (mod x 2))
(define-fun
  h0
  ((x Int)) Int (ite (<= (mod x 2) 0) 1 x))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 2))
(define-fun
  small
  ((x Int)) Int (- (w0 x) 2))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (- (w2 x y) 2))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) 1 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w1 c)))))
