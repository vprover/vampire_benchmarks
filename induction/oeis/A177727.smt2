(define-funs-rec
  ((u6
    ((x Int) (y Int) (z Int)) Int)
   (v6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) z (u6 (- x 1) y z))))
(define-funs-rec
  ((u5
    ((x Int) (y Int) (z Int)) Int)
   (v5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) z (u5 (- x 1) y z))))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 1))
(define-funs-rec
  ((u4
    ((x Int) (y Int) (z Int)) Int)
   (v4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) z (u4 (- x 1) y z))))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 1))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 0))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (u1 (- x 1) y z))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 y 1 0))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int (- x 1))
(define-fun
  w6
  ((x Int)) Int (u6 (h6 x) 1 1))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  () Int (+ 1 2))
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (w4 x)))
(define-fun
  fast
  ((x Int)) Int
  (* (div (* (+ (- (- (v3 x) (mod x 2)) (mod x 2)) 1) (w5 x)) 2)
    (w6 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (w1 x y) x))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 (w2 x) x))
(define-fun
  small
  ((x Int)) Int (div (w0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
