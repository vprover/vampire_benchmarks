(define-fun
  h0
  ((x Int)) Int (+ 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ (div (+ (* (- x (div (- 1 x) (+ 2 2))) (+ 2 x)) x) (+ 2 2)) x)
    1))
(define-fun
  f0
  ((x Int)) Int (* (+ (div (div x 2) 2) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (div (- (v0 x) x) (+ 2 2)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
