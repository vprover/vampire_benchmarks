(define-fun
  h1
  ((x Int)) Int (* 2 (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (+ 1 x))))
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (+ 1 (+ (v1 x) x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ y x) x) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  () Int (u0 2 h0))
(define-fun
  small
  ((x Int)) Int (* (+ (* v0 (+ 1 x)) 1) (+ x 1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
