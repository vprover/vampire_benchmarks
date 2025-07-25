(define-fun
  fast
  ((x Int)) Int
  (- (* 2 (+ (* 2 (* 2 (+ x x))) x))
    (div x (+ 2 (* 2 (* 2 (+ 2 2)))))))
(define-fun
  f1
  ((x Int)) Int (* (+ 2 1) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int (- (* v0 x) (div x v1)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
