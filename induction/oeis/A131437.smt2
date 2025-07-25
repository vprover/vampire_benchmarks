(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g6
  () Int (+ 1 (+ 2 2)))
(define-fun
  g3
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (div x (+ 1 (mod x 2))))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 g6 x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 2 x))
(define-fun
  f4
  ((x Int)) Int (- (v5 x) 1))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 2 x))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (v4 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x)))
(define-fun
  fast
  ((x Int)) Int (- (* (v3 x) 2) 1))
(define-fun
  f2
  ((x Int) (y Int)) Int (mod (- x 1) y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 0))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  f0
  ((x Int)) Int (+ (+ (v1 x) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (- (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
