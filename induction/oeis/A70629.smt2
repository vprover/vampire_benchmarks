(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  v1
  () Int (u1 g1 2))
(define-fun
  fast
  ((x Int)) Int
  (mod (* (* (* (* x x) x) x) x)
    (- (* 2 (* 2 (* 2 (+ 2 (+ 2 2))))) 2)))
(define-fun
  f0
  ((x Int)) Int (* x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (mod (* (v0 x) x) (- v1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
