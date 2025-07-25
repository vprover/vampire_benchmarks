(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h1
  () Int (+ 2 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  fast
  ((x Int)) Int (- (+ (+ (- (div (+ (v1 x) x) 2) (mod x 2)) x) x) 2))
(define-fun
  f0
  ((x Int)) Int (- (* 2 (+ (div x 2) x)) (mod x (+ 1 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (div (+ (v0 x) x) (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
