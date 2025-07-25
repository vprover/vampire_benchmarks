(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (div (+ 1 (v0 x)) (+ 2 x)))
(define-fun
  g1
  ((x Int)) Int (- x 1))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (div (+ 2 (* (* 2 x) (v1 x))) (+ 2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
