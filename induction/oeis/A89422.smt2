(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 2 (- 2 x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (- (v1 x) 2) (ite (<= x 0) 1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod (+ 2 (mod x y)) x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
