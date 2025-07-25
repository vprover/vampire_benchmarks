(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u3 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  g3
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 (g3 x y) 2))
(define-fun
  g2
  ((x Int)) Int (- (- x 1) 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 2))
(define-fun
  g0
  ((x Int)) Int (- (- x 1) 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* x y) (v3 x y)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 0))
(define-fun
  fast
  ((x Int)) Int (* (v2 x) (* (- x 1) x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x y) (v1 x y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (* (* (v0 x) (- x 1)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
