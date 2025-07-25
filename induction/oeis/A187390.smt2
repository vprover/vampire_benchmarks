(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div (* (+ 2 (* 2 (+ 2 2))) (+ 1 x))
        (* (+ 1 (* 2 (* 2 (+ 2 2)))) (+ 1 2)))
      1)
    x))
(define-fun
  f1
  ((x Int)) Int (- (* (* x x) x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 h0))
(define-fun
  small
  ((x Int)) Int (div (- (* (+ 1 x) v0) 1) v1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
