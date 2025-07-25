(define-fun-rec
  v5
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v5 (- x 1) y z)))
(define-fun-rec
  u5
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z))))
(define-fun
  j5
  () Int (+ 1 2))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 j5))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g5
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (+ x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 2))
(define-fun
  f3
  ((x Int)) Int (* (- (v4 x) 1) (w5 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (v3 x y) (* 2 (* 2 (+ x x)))))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* 2 (+ (+ x x) x)) (* (* y y) y)))
(define-funs-rec
  ((u1
    ((x Int) (y Int) (z Int)) Int)
   (v1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int) (y Int)) Int (u1 y 1 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (+ (w1 x y) x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
