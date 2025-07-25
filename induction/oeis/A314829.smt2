(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ (div (+ (- 1 (mod (div x (+ 2 2)) 2)) x) 2)
    (ite (<= x 0) 1 (* 2 (+ x x)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (+ (- 1 (mod (div x 2) 2)) y) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) (* 2 (+ x x))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
