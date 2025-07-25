(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int (div (- x 1) 2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 0))
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f3
  ((x Int)) Int (+ 1 (- (div (* x x) 2) x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (- (+ (+ (div (- (div (v3 x) 2) 1) 2) 2) (* x x)) x) 2) 1))
(define-fun
  f1
  ((x Int)) Int (+ (* (v2 x) (div x 2)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
