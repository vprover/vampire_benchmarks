(define-fun
  small
  ((x Int)) Int
  (+
    (+ (+ (div (div (- (div x (* 2 (+ 2 2))) (- (div x 2) 2)) 2) 2) 2)
      x)
    x))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  f0
  ((x Int)) Int (div (+ (- 2 x) (div x (+ 2 2))) (+ 2 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  fast
  ((x Int)) Int (+ (+ (+ (v0 x) x) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
