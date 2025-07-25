(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  j4
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  j2
  ((x Int)) Int (+ 1 x))
(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  i1
  ((x Int)) Int (+ x x))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v4
    ((x Int) (y Int) (z Int)) Int)
   (u4
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g4 (u4 (- x 1) y z) (v4 (- x 1) y z)))
   (ite (<= x 0) y (* (u4 (- x 1) y z) (v4 (- x 1) y z)))))
(define-fun
  w4
  ((x Int)) Int (u4 x 1 (j4 x)))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 1 y))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 (j2 x)))
(define-fun
  g1
  ((x Int)) Int (* x x))
(define-fun
  g0
  ((x Int)) Int (* 2 (+ (+ x x) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  f1
  ((x Int)) Int (* (* (w2 x) (v3 x)) (w4 x)))
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
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (w1 c)))))
