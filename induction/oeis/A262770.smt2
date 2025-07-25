(define-fun
  h2
  () Int (+ 1 (+ 2 (* 2 (+ 2 2)))))
(define-fun
  h1
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 1 h2))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 h1))
(define-fun
  fast
  ((x Int)) Int (div (+ (* v1 x) x) (+ 2 v2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (* y y) (+ (+ x y) y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (+ (div (div (- (div (v0 x) 2) x) 2) 2) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
