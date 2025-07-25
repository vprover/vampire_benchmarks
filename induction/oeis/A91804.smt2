(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 y x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((v5
    ((x Int) (y Int) (z Int)) Int)
   (u5
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g5 (u5 (- x 1) y z) (v5 (- x 1) y z)))
   (ite (<= x 0) y (* (u5 (- x 1) y z) (v5 (- x 1) y z)))))
(define-fun
  w5
  ((x Int)) Int (u5 x 1 2))
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (v3 x)))
(define-fun
  fast
  ((x Int)) Int (* (v2 x) (w5 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (* 2 (* (* x y) y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
