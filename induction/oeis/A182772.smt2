(define-fun
  small
  ((x Int)) Int
  (+ (div (- (* 2 (+ 2 x)) (div (div x 2) (+ 1 (+ 2 2)))) (+ 1 2))
    x))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (- (* 2 (+ 2 x)) (div x (+ 2 (* 2 (+ 2 2))))) (+ 1 2)) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
