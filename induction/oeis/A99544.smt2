(define-fun
  h9
  ((x Int)) Int x)
(define-fun
  h8
  ((x Int)) Int (div x 2))
(define-fun
  h7
  ((x Int)) Int x)
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
  ((x Int)) Int (div x 2))
(define-fun
  h10
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (div x 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (mod x 2))
(define-fun
  g6
  ((x Int)) Int (mod x 2))
(define-fun
  g5
  ((x Int)) Int (mod x 2))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  g11
  ((x Int)) Int (mod x 2))
(define-fun
  g10
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f11
  () Int (+ 2 2))
(define-fun
  u11
  ((x Int) (y Int)) Int (ite (<= x 0) y f11))
(define-fun
  v11
  ((x Int)) Int (u11 (g11 x) 0))
(define-fun
  f10
  ((x Int)) Int (div x 2))
(define-fun-rec
  u10
  ((x Int) (y Int)) Int (ite (<= x 0) y (f10 (u10 (- x 1) y))))
(define-fun
  v10
  ((x Int)) Int (u10 (g10 x) x))
(define-fun-rec
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y (v10 (u9 (- x 1) y))))
(define-fun
  v9
  ((x Int)) Int (u9 (v11 x) x))
(define-fun
  f8
  ((x Int)) Int (+ 1 (v9 x)))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 1 (h8 x)))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (v8 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) x))
(define-fun
  f6
  ((x Int)) Int (div (v7 x) 2))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) (h6 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) (h5 x)))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (v5 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) (h4 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) (h3 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) (h1 x)))
(define-fun
  fast
  ((x Int)) Int (mod (+ (* (v1 x) 2) 1) (+ 1 2)))
(define-fun
  f0
  ((x Int)) Int (div x (+ 1 (mod x 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (mod (+ 1 (v0 x)) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
