(define-fun
  small
  ((x Int)) Int
  (* (+ 1 2) (mod (* (+ 1 x) (- x (div x (+ 1 2)))) (+ 1 2))))
(define-fun
  fast
  ((x Int)) Int
  (mod (* (+ 1 x) (* (+ 2 (* x x)) x)) (+ 1 (* 2 (+ 2 2)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
