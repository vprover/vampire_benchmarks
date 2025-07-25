(define-fun
  h7
  ((x Int)) Int (div x 2))
(define-fun
  h6
  ((x Int)) Int (div x 2))
(define-fun
  h5
  ((x Int)) Int (div x 2))
(define-fun
  h4
  ((x Int)) Int (div x 2))
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h2
  ((x Int)) Int (* 2 (+ x x)))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f7
  ((x Int)) Int (- (* 2 (* x x)) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 1 (h7 x)))
(define-fun
  f6
  ((x Int)) Int (- (- (+ (* (+ (v7 x) x) (+ 1 2)) 1) x) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (h6 x)))
(define-fun
  f5
  ((x Int)) Int (- (- (- (- (* (+ (v6 x) x) (+ 1 2)) 1) 2) x) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 1 (h5 x)))
(define-fun
  f4
  ((x Int)) Int (- (- (+ (* (+ (v5 x) x) (+ 1 2)) 1) x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (- (- (- (- (* (+ (v4 x) x) (+ 1 2)) 2) 2) x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (+ (div (* (+ (v3 x) x) (+ 1 2)) 2) 2))
(define-fun
  f2
  ((x Int)) Int (ite (<= (mod x 2) 0) (div x (+ 1 2)) 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x (h2 x)))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (v2 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
