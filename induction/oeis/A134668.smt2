(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
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
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (- 1 (mod (+ (v1 x) x) (+ 1 2))))
(define-fun
  f0
  ((x Int)) Int (- 1 (mod x (+ 1 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
