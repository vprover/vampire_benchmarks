(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int (+ 1 x))
(define-fun
  i0
  () Int (+ 1 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (* x x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (+ 2 (* x x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 2 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (- (* v3 x) y))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 1))
(define-fun
  f1
  ((x Int)) Int
  (+ (* (* (div (div (* (- (w2 x) 1) (+ 1 (+ 2 2))) 2) 2) 2) 2) 1))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f1 (u1 (- x 1) y z))))
(define-fun
  v1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) z (g1 (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int)) Int (u1 1 (i1 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* 2 (+ (+ x x) x)) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) i0 0))
(define-fun
  small
  ((x Int)) Int (- (- (w0 x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (w1 c)))))
