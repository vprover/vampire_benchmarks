(define-fun
  fast
  ((x Int)) Int (* 2 (* 2 (+ 2 (+ 2 2)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int v0)
(assert-not (forall ((c Int)) (or (not (>= c 0)) (= v0 (fast c)))))
