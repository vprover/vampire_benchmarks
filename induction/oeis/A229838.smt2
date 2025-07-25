(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ (div (* (- x (div (- 0 x) (+ 1 (+ 2 2)))) (+ 2 2)) (+ 1 2)) 1)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (+ (+ (div (- (* x y) 1) (+ 2 (+ 2 y))) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
