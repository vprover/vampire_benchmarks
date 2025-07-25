(define-fun
  small
  ((x Int)) Int
  (+
    (+
      (*
        (+ (div (+ 2 (+ (* 2 (div (div x 2) (+ 1 (+ 2 2)))) x)) (+ 1 2)) x)
        2)
      (ite (<= x 0) 1 x))
    x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (*
        (+ (div (+ 2 (+ (* 2 (div x (+ 2 (* 2 (+ 2 2))))) x)) (+ 1 2)) x)
        2)
      (ite (<= x 0) 1 x))
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
