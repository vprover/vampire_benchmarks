(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (* (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2)))))) (div (+ (* x x) x) 2)))
(define-fun
  f0
  ((x Int)) Int (+ (* x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int (* (- v0 1) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
