(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  () Int (+ (* (+ 2 2) 2) 2))
(define-fun
  g1
  ((x Int)) Int (- 1 (mod (+ 2 x) (+ (* (+ 2 2) 2) 2))))
(define-fun
  g0
  ((x Int)) Int (mod (+ 2 x) (+ 2 (* 2 (+ 2 2)))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) h0))
(define-fun
  small
  ((x Int)) Int (div x (v0 x)))
(define-fun
  f1
  ((x Int)) Int (div x (+ 2 (* 2 (+ 2 2)))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
