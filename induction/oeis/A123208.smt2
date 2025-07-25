(define-fun
  h1
  () Int (+ 1 (+ 2 2)))
(define-fun
  g1
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (+ x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  fast
  ((x Int)) Int (+ (v1 x) (* 2 (- (mod x 2) 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (ite (<= (mod y 2) 0) x 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
