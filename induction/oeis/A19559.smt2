(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  small
  ((x Int)) Int (+ (+ (mod 2 (+ 1 (mod x (+ 1 (+ 2 2))))) 2) 2))
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int)) Int (- 2 (mod x (+ 1 (+ 2 2)))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) h0))
(define-fun
  fast
  ((x Int)) Int (+ 2 (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
