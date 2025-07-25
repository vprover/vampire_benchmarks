(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u4 (- x 1) y) x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  h5
  ((x Int)) Int (+ 1 x))
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  g4
  ((x Int)) Int (- x 1))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  g3
  ((x Int)) Int (- 2 x))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 1 (h5 x)))
(define-fun
  fast
  ((x Int)) Int (* (* (v3 x) (v4 x)) (v5 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  v0
  ((x Int)) Int (u0 (v1 x) 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
