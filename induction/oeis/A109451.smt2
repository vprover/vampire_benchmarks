(define-fun
  small
  ((x Int)) Int
  (+ 1 (+ (- (mod x 2) (mod (div (+ (div x 2) x) 2) 2)) x)))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (mod (+ (div (- x 1) (+ 2 2)) x) 2) (mod x 2)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
