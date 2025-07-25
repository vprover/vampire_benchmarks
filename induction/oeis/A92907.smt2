(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ (* (+ 1 2) (* (+ 1 2) (- x (mod x (+ 2 (* 2 (+ 2 2))))))) x))
(define-fun
  f0
  ((x Int)) Int
  (mod (div (div x 2) (+ 1 (+ 2 2))) (+ 2 (* 2 (+ 2 2)))))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (u0 c) (fast c)))))
