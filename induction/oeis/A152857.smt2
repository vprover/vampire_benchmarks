(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (mod (* (+ 2 x) (v0 x)) (+ 1 (+ 2 2))))
(define-fun
  g1
  ((x Int)) Int (- 2 (mod (- 2 x) (+ 1 (+ 2 2)))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
