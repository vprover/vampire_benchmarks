(define-fun
  small
  ((x Int)) Int (mod (div (ite (<= (mod x 2) 0) (div x 2) 2) 2) 2))
(define-fun
  fast
  ((x Int)) Int
  (ite (<= (mod (* (- 2 x) x) (* 2 (* 2 (+ 2 2)))) 0) 0 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
