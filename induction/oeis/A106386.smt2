(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u1 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int (ite (<= x 0) 1 (* (+ 2 x) x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 2))
(define-fun
  g1
  ((x Int)) Int (div x 2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 2 2))
(define-fun
  f2
  () Int (- v3 2))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y f2))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  f0
  ((x Int)) Int (+ (+ (v1 x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
