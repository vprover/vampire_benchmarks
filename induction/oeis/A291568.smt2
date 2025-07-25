(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  g1
  ((x Int)) Int (- (- (mod x (+ 1 (+ 2 2))) 1) 2))
(define-fun
  g0
  ((x Int)) Int (mod (+ 1 x) (+ 1 (+ 2 2))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (- 1 (* 2 (v0 x))))
(define-fun
  f1
  ((x Int)) Int (* (- x (+ 2 2)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
