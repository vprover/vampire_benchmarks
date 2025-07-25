(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g3
  ((x Int)) Int (- 2 x))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 2))
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (- (ite (<= x 0) 0 (+ 2 y)) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  f1
  ((x Int)) Int (ite (<= (v2 x) 0) 1 0))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (v3 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (ite (<= x 0) 0 y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  small
  ((x Int)) Int (- (ite (<= (v0 x) 0) 1 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
