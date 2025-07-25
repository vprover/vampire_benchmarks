(define-fun
  small
  ((x Int)) Int
  (- (+ x x) (div (+ (div x (+ 1 2)) x) (+ 1 (* 2 (* 2 (+ 2 2)))))))
(define-fun
  fast
  ((x Int)) Int
  (+ (- x (div (* 2 (+ x x)) (* (+ 1 (* 2 (* 2 (+ 2 2)))) (+ 1 2))))
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
