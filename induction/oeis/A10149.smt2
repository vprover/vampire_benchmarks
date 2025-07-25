(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h0
  ((x Int)) Int (* (* 2 (+ 2 2)) (ite (<= x 0) 1 2)))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 2 (+ 2 2))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) (mod x 2)))
(define-fun
  fast
  ((x Int)) Int
  (ite
    (<= (mod x (+ 2 (+ 2 2))) 0) (* (ite (<= x 0) 1 2) (* 2 (+ 2 2)))
    (+ 1 (mod x 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
