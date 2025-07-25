(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  () Int (+ 2 2))
(define-fun
  v0
  ((x Int)) Int (u0 g0 (h0 x)))
(define-fun
  fast
  ((x Int)) Int
  (*
    (div (* 2 (* 2 (* 2 (* (+ 1 2) (+ 1 x)))))
      (+ 1 (* 2 (* 2 (+ 2 2)))))
    2))
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
  ((x Int)) Int (* (div (v0 x) (+ 1 v1)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
