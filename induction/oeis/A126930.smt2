(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int (- x (div x 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  () Int (- 0 1))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y f2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (* 2 (+ (- x (div x y)) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int (div (* (v1 x) (v2 x)) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (* x y) (- (div y 2) y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
