(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  fast
  ((x Int)) Int
  (ite
    (<= (mod (* 2 (- (+ 2 (mod (+ (* x x) x) (+ 1 2))) x)) (+ 2 x)) 0)
    1 0))
(define-fun
  f1
  ((x Int)) Int (div x 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (ite (<= (- (v0 x) 2) 0) 1 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
