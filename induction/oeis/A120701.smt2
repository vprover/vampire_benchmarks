(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ 1
      (+ (+ (+ (div x (+ 1 (+ 2 (+ 2 2)))) (ite (<= x 0) 1 2)) x) x))
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (+ (div (div (div x 2) 2) 2) y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ (v0 x) x) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
