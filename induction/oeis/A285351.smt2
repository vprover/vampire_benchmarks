(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g1
  () Int (+ 1 (+ 2 2)))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f1
  ((x Int)) Int (ite (<= (- (mod x (+ 1 2)) 1) 0) (div x (+ 1 2)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 g1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (mod (+ (v1 x) x) 2))
(define-fun
  f0
  ((x Int)) Int (ite (<= (- (mod x (+ 1 2)) 1) 0) (div x (+ 1 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  small
  ((x Int)) Int (mod (+ (v0 x) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
