(define-fun
  small
  ((x Int)) Int
  (div (+ 1 (+ (div (- 2 (div x (+ 2 2))) (+ 2 2)) x))
    (ite (<= x 0) 1 2)))
(define-fun
  fast
  ((x Int)) Int
  (div (+ (- 1 (div (+ 2 (+ 2 x)) (* 2 (* 2 (+ 2 2))))) x)
    (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
