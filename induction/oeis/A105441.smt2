(define-fun
  h9
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int)) Int (mod x 2))
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (div x 2))
(define-fun
  g5
  ((x Int)) Int (+ 1 x))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f9
  ((x Int)) Int (div x 2))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (f9 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (v9 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 x x))
(define-fun
  f7
  ((x Int)) Int (+ x x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) 1))
(define-fun
  f6
  ((x Int)) Int
  (+ (mod (+ (ite (<= (- (mod (+ 1 (v7 x)) (+ 1 x)) 2) 0) 1 0) x) 2)
    (mod x 2)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (v8 x)))
(define-fun
  f5
  ((x Int)) Int (mod (v6 x) (+ 1 x)))
(define-fun-rec
  t5
  ((x Int)) Int (ite (<= (f5 x) 0) x (t5 (+ x 1))))
(define-fun-rec
  u5
  ((x Int)) Int (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v5 x) 1))
(define-fun
  f4
  ((x Int)) Int (div x 2))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 x x))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x x))
(define-fun
  f1
  ((x Int)) Int (ite (<= (mod (+ 1 (v2 x)) (+ 1 x)) 0) 1 0))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (v3 x)))
(define-fun
  f0
  ((x Int)) Int (mod (mod (v1 x) 2) (+ 1 x)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
