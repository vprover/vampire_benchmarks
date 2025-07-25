(define-fun
  fast
  ((x Int)) Int
  (div x
    (ite
      (<= (mod x (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))) 0) (* (* (+ 2 2) 2) 2)
      1)))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int
  (ite (<= (mod (* x x) (+ 1 (+ 2 v0))) 0) (mod x (+ 2 (+ 2 2))) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
