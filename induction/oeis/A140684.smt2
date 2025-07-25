(define-fun
  small
  ((x Int)) Int
  (mod (+ (* 2 (div x (+ 1 (mod x 2)))) x) (+ 2 (* 2 (+ 2 2)))))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (mod x 2))
(define-fun
  f0
  () Int (- 0 1))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y f0))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  fast
  ((x Int)) Int (mod (+ (+ (v0 x) x) x) (+ 2 (* 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
