(define-fun
  small
  ((x Int)) Int
  (mod (+ (div (div x 2) (+ 1 (+ 2 2))) (mod x (+ 2 (* 2 (+ 2 2)))))
    (ite (<= x 0) 1 x)))
(define-fun
  fast
  ((x Int)) Int
  (mod (- x (* (+ 1 (* 2 (+ 2 2))) (div x (+ 2 (* 2 (+ 2 2))))))
    (ite (<= x 0) 1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
