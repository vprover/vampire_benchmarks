(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  v1
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v1 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun-rec
  u1
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u1 (- x 1) y z) (v1 (- x 1) y z))))
(define-fun
  j3
  () Int (+ 1 (+ 2 (* 2 (+ 2 2)))))
(define-fun
  j2
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  j1
  () Int (+ 1 (+ 2 (* 2 (+ 2 2)))))
(define-fun
  w1
  ((x Int)) Int (u1 x 1 j1))
(define-fun
  h3
  ((x Int)) Int (- x 1))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) 1 j3))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 1 (+ 2 (+ (* 2 (+ 2 2)) y))))
(define-funs-rec
  ((v2
    ((x Int) (y Int) (z Int)) Int)
   (u2
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z)))
   (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z)))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 j2))
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  () Int (u4 2 2))
(define-fun
  fast
  ((x Int)) Int (+ (div (div (w2 x) (w3 x)) v4) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ (- (* 2 (+ (* 2 (+ y y)) y)) 2) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (div (v0 x) (w1 x)) (ite (<= x 0) 0 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
