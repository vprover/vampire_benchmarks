(define-fun
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h8
  () Int (+ 2 2))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (div x 2))
(define-fun
  h3
  ((x Int)) Int (div x (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g8
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) h8))
(define-fun
  g6
  ((x Int)) Int (- 1 (mod x (+ 2 2))))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 1 x))
(define-fun
  f7
  ((x Int)) Int (div x (v8 x)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 2 x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (v7 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) x))
(define-fun
  f5
  ((x Int)) Int (mod (- (v6 x) 1) 2))
(define-fun-rec
  t5
  ((x Int)) Int (ite (<= (f5 x) 0) x (t5 (+ x 1))))
(define-fun-rec
  u5
  ((x Int)) Int (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))
(define-fun
  f4
  ((x Int)) Int (- (- (* (u5 x) 2) 1) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (- (- (+ (* (+ (* (v4 x) 2) x) 2) 1) x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (- (- (- (* (+ (v3 x) x) 2) 1) x) 1))
(define-fun
  f2
  ((x Int)) Int (ite (<= (mod (div x 2) 2) 0) 2 (div x 2)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x (h2 x)))
(define-fun
  f1
  ((x Int)) Int (mod (+ (v2 x) x) 2))
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
  ((x Int)) Int (- (- (v1 x) 1) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (+ (* (v0 x) 2) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
