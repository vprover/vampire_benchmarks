(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-funs-rec
  ((u6
    ((x Int) (y Int) (z Int)) Int)
   (v6
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u6 (- x 1) y z) (v6 (- x 1) y z)))
   (ite (<= x 0) z (u6 (- x 1) y z))))
(define-fun
  w6
  ((x Int)) Int (u6 x 1 2))
(define-fun
  j3
  ((x Int)) Int x)
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  g4
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f5
  ((x Int)) Int (mod (w6 x) (+ 1 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun
  f4
  ((x Int)) Int (- (v5 x) 1))
(define-fun-rec
  t4
  ((x Int)) Int (ite (<= (f4 x) 0) x (t4 (+ x 1))))
(define-fun-rec
  u4
  ((x Int)) Int (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (g4 x y)))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (v4 x y) x) x))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 2 1 x))
(define-fun
  fast
  ((x Int)) Int (mod (w3 x) (+ 1 x)))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ 1 (+ x y)))
(define-funs-rec
  ((u2
    ((x Int) (y Int) (z Int)) Int)
   (v2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) z (u2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 x 0 1))
(define-fun
  f1
  ((x Int)) Int (mod (w2 x) (+ 1 x)))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ (v1 x y) 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(define-fun
  small
  ((x Int)) Int (mod (w0 x) (+ 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
