(define-fun
  small
  ((x Int)) Int
  (* (+ 1 (mod (div x 2) 2))
    (ite (<= (mod (+ 1 x) (+ 2 1)) 0) (+ 1 2) 1)))
(define-fun
  g0
  ((x Int)) Int (- (mod x (+ 1 2)) 1))
(define-fun
  f0
  () Int (+ 1 2))
(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y f0))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int (* (v0 x) (ite (<= (- (mod x (+ 2 2)) 1) 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
