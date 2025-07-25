(define-fun
  h4
  () Int (+ 2 (+ 2 2)))
(define-fun
  g4
  ((x Int)) Int (div x 2))
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int (+ x 2))
(define-fun
  f4
  ((x Int)) Int (+ x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) h4))
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (v4 x)))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (v3 x)))
(define-fun
  fast
  ((x Int)) Int (* (- (* (- (- (v2 x) 2) 2) (+ 1 2)) 2) 2))
(define-fun
  f1
  ((x Int)) Int (+ 1 (* x 2)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* x x) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  () Int (u0 2 2))
(define-fun
  small
  ((x Int)) Int (- (* v0 (v1 x)) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
