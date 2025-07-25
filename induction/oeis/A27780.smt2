(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int (+ 2 (+ 2 (+ 2 x))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (div (+ (* 2 (+ (+ x x) x)) x) y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div (* (v2 x) (+ 1 (+ 2 (+ 2 2)))) 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (* 2 (+ (+ x x) x)) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (* (+ (- (v0 x) 1) 1) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
