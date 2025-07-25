(define-fun
  i1
  ((x Int)) Int (ite (<= (- x 1) 0) 1 2))
(define-fun
  h1
  ((x Int)) Int (- x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (+ (div (+ (* y y) y) x) x) y))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 (h1 x) (i1 x) 1))
(define-fun
  fast
  ((x Int)) Int (+ (- (w1 x) (ite (<= (- x 2) 0) 1 x)) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 1 (+ (div (* y y) (+ x y)) y)))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 0))
(define-fun
  small
  ((x Int)) Int (+ (- (w0 x) (ite (<= (- x 2) 0) 1 x)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
