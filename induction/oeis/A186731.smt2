(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  small
  ((x Int)) Int (div (+ (ite (<= (mod x (+ 1 2)) 0) x 1) x) (+ 1 2)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (mod x (+ 1 2)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  fast
  ((x Int)) Int (div (+ (v0 x) x) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
