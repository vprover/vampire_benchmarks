(define-fun-rec
  v4
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v4 (- x 1) y z)))
(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u5 (- x 1) y) x)))
(define-fun
  j4
  ((x Int)) Int x)
(define-fun
  j2
  ((x Int)) Int x)
(define-fun
  i4
  () Int (+ 2 (+ 2 2)))
(define-fun
  h5
  ((x Int) (y Int)) Int y)
(define-fun
  h4
  () Int (+ 1 2))
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int) (y Int)) Int (div (u5 x y) x))
(define-fun-rec
  u4
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f4 (u4 (- x 1) y z) (v4 (- x 1) y z))))
(define-fun
  w4
  ((x Int)) Int (u4 h4 i4 x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (w4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 1 y))
(define-fun
  f2
  ((x Int) (y Int)) Int (* (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 2 1 x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (w2 x) (+ 1 x)) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (- (ite (<= x 0) 1 (+ 2 y)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ (v0 x) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
