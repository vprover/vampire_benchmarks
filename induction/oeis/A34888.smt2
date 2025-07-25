(define-fun
  fast
  ((x Int)) Int
  (+
    (div
      (- (- (ite (<= x 0) 1 x) 1)
        (div x (+ 2 (* 2 (+ 2 (* 2 (+ 2 2)))))))
      2)
    1))
(define-fun
  f0
  ((x Int)) Int (+ 1 (+ (+ x x) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int (div (+ (- 1 (div x v0)) x) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
