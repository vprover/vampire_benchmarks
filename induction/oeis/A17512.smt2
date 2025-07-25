(define-fun
  h2
  ((x Int)) Int (+ (* 2 (* (+ 1 (+ 2 2)) (+ 1 x))) x))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (* x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 (h2 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 2 (* (+ 2 y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  h0
  ((x Int)) Int (- (v1 x) x))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
