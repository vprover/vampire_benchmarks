(define-fun
  g2
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 2 2))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y v3))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 2))
(define-fun
  fast
  ((x Int)) Int
  (-
    (* (- (* (+ (v2 x) (mod x 2)) 2) (ite (<= x 0) 1 2))
      (ite (<= x 0) 1 2))
    2))
(define-fun
  f1
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int)) Int (ite (<= (mod x 2) 0) 1 (div x 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) v1))
(define-fun
  small
  ((x Int)) Int (* (+ (* (v0 x) 2) 1) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
