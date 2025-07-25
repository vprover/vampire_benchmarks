(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (* (+ 1 x) (+ 1 (div x 2))))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (div x 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (div (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) (v1 x)) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* y y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
