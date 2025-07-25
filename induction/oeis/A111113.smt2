(define-fun
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h6
  () Int (+ 2 2))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g6
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) h6))
(define-fun
  g5
  () Int (+ 1 2))
(define-fun
  g4
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int)) Int (div x (v6 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 g5 x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  f3
  ((x Int)) Int
  (- (- (ite (<= (- (v4 x) 2) 0) 1 0) (ite (<= x 0) 1 x)) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (- (mod (+ (v3 x) x) 2) (mod x 2)))
(define-fun
  f2
  ((x Int)) Int (- 0 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (mod (+ 2 x) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
