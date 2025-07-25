(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  small
  ((x Int)) Int
  (div (+ (* 2 (* 2 (+ 2 2))) (mod (+ 1 x) (+ 1 2)))
    (ite (<= (mod x (+ 1 2)) 0) 1 2)))
(define-fun
  h0
  () Int (* 2 (+ 2 2)))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) h0))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (+ (+ (+ (- (v0 x) (mod x (+ 1 2))) 1) 2) 2) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
