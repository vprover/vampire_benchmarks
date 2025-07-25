(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (+ 1 x))
(define-fun
  g4
  ((x Int) (y Int)) Int (- y x))
(define-fun
  g3
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int)) Int (+ x 1))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (div (* y y) (+ 1 x)) y))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 0))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (g4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  fast
  ((x Int)) Int (- (v3 x) x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (div (* y y) (+ 2 x)) y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 0))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (- (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
