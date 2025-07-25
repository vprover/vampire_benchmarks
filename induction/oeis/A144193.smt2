(define-fun
  small
  ((x Int)) Int
  (div (div (mod x (+ 1 (* (+ 1 2) (- 2 (mod x 2))))) 2) 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (mod (+ 1 x) 2))
(define-fun
  f0
  ((x Int)) Int
  (+ (ite (<= (- (- (mod x (+ 1 (+ 2 (+ 2 2)))) 1) 2) 0) 0 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  fast
  ((x Int)) Int (- (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
