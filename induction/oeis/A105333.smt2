(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (mod (div (+ (* x x) x) 2) (* 2 (* 2 (+ 2 2)))))
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
  small
  ((x Int)) Int (mod (v0 x) v1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
