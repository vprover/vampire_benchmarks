(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u1 (- x 1) y) x)))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  h2
  ((x Int)) Int (- (- x (* 2 (+ 2 2))) 2))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  v1
  ((x Int)) Int (u1 g1 x))
(define-fun
  v0
  ((x Int)) Int (u0 (v1 x) 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(define-fun
  f2
  ((x Int)) Int (ite (<= x 0) 1 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v2 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
