(define-fun
  h4
  ((x Int)) Int (+ x x))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x (+ 1 (+ 2 (+ 2 2)))))
(define-fun
  g3
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int)) Int (- (div x 2) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 1))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (ite (<= (mod (+ (v4 x) 1) 2) 0) 1 (div x 2)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  f2
  ((x Int)) Int (+ (v3 x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (- (* (* x x) x) 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  f0
  ((x Int)) Int (mod v1 (+ 1 x)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (+ (u0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v2 c)))))
