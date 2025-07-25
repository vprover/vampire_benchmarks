(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  small
  ((x Int)) Int
  (+ (+ (div (ite (<= (- (mod x (+ 1 2)) 1) 0) (- 1 x) x) (+ 1 2)) 1)
    x))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int (+ (* (v0 x) (div (+ 1 (+ x x)) (+ 1 2))) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
