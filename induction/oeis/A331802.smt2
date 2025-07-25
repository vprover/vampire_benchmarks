(define-fun
  g1
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f1
  ((x Int)) Int (- (div x (+ 2 (+ 2 2))) (mod x (+ 2 2))))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x)))
(define-fun
  f0
  ((x Int)) Int (- (div (div x 2) (+ 1 2)) (mod x (+ 2 2))))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
