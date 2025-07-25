(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  g2
  ((x Int)) Int (div (- x (div x 2)) 2))
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (mod x y) y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 0))
(define-fun
  f1
  ((x Int)) Int
  (- (- (- (* (* (+ 1 (v2 x)) (+ 1 2)) (ite (<= x 0) 1 2)) 2) x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (+ (* (- (v1 x) (mod x 2)) 2) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (mod (- x 1) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (+ (div (+ (* (v0 x) (+ 1 2)) x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
