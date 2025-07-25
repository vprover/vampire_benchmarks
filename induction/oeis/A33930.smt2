(define-fun
  small
  ((x Int)) Int
  (+ (div (div x 2) (+ 1 (+ 2 2)))
    (ite (<= x 0) 1 (mod x (+ 2 (* 2 (+ 2 2)))))))
(define-fun
  fast
  ((x Int)) Int
  (+ (* (- 0 (div x (+ 2 (* 2 (+ 2 2))))) (+ (* 2 (+ 2 2)) 1))
    (ite (<= x 0) 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
