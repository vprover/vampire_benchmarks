(define-fun
  small
  ((x Int)) Int (+ 1 (+ (div (- (div x (+ 1 2)) x) (+ 1 2)) x)))
(define-fun
  fast
  ((x Int)) Int (- x (div (+ (- x 1) x) (+ 1 (* 2 (+ 2 2))))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
