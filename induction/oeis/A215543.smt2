(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y x))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int (- y 1))
(define-fun
  g0
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  fast
  ((x Int)) Int
  (div
    (* (* (+ (+ (- x (ite (<= x 0) 0 2)) x) x) (+ 2 (+ (+ x x) x)))
      (+ 1 x))
    2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x y) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 0))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (- (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
