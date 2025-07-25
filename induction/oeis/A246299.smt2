(define-fun
  small
  ((x Int)) Int
  (+
    (+ (+ (+ (div (+ 1 (+ (div (div (div x 2) 2) 2) x)) (+ 2 2)) 2) x)
      x)
    (* 2 (+ x x))))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ 1 (+ (+ (div (+ 1 (+ (div x (* 2 (+ 2 2))) x)) (+ 2 2)) x) x))
    (+ 1 (* 2 (+ x x)))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
