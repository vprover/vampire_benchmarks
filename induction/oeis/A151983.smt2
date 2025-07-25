(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  () Int (+ 2 2))
(define-fun
  fast
  ((x Int)) Int (+ (* 2 (* (+ 1 2) (* (+ 1 (+ 2 2)) (div x 2)))) x))
(define-fun
  f0
  ((x Int)) Int (+ (- x (mod x 2)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 g0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
