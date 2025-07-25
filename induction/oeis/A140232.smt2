(define-fun
  g0
  () Int (+ 1 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ 2
      (+ (* 2 (+ 2 (+ x x))) (div x (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1))))
    x))
(define-fun
  f0
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 g0 2))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ (* 2 (+ 2 (+ x x))) (div x v0)) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
