(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- (+ 2 x) (* 2 (* 2 (+ 2 (+ 2 2))))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 0))
(define-fun
  g1
  () Int (+ (+ 2 2) 2))
(define-fun
  v1
  ((x Int)) Int (u1 g1 x))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) x))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int) (y Int)) Int (- y 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (v1 x) 0))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
