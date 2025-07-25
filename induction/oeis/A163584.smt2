(define-fun
  small
  ((x Int)) Int
  (div
    (mod (+ (+ (div (+ 1 (div x (- 1 (* 2 (+ 2 (+ 2 2)))))) 2) 1) x)
      (+ 1 2))
    2))
(define-fun
  fast
  ((x Int)) Int
  (mod
    (mod
      (mod (+ 1 (+ (* 2 (+ 2 2)) x)) (+ 2 (* 2 (+ 2 (* 2 (+ 2 2))))))
      (+ 1 2))
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
