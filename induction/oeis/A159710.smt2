(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  g2
  ((x Int)) Int (- x 2))
(define-fun
  g1
  ((x Int)) Int (- x 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (+ 1 (- (v1 x) x)) (div (v2 x) 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (- (* y y) y) x) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 1))
(define-fun
  small
  ((x Int)) Int (* (w0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
