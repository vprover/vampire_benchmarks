(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h2
  ((x Int)) Int (ite (<= x 0) 0 1))
(define-fun
  g2
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  f2
  ((x Int)) Int (* (+ 1 (* 2 (* 2 (+ 2 2)))) (+ 1 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  h0
  ((x Int)) Int (* (+ 1 v1) (ite (<= x 0) 1 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
