(define-fun
  h1
  ((x Int)) Int (* (* x x) (* 2 2)))
(define-fun
  h0
  ((x Int)) Int (* x x))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  f1
  ((x Int)) Int (- (- x 1) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  f0
  ((x Int)) Int (+ (- x (mod x 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
