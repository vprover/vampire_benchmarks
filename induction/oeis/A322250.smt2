(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  h8
  ((x Int)) Int x)
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int (div x 2))
(define-fun
  h5
  ((x Int)) Int x)
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
  h1
  ((x Int)) Int x)
(define-fun
  g9
  ((x Int)) Int (mod x 2))
(define-fun
  g8
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
  g1
  ((x Int)) Int x)
(define-fun
  f9
  () Int (+ 2 2))
(define-fun
  u9
  ((x Int) (y Int)) Int (ite (<= x 0) y f9))
(define-fun
  v9
  ((x Int)) Int (u9 (g9 x) 0))
(define-fun
  f8
  ((x Int)) Int (div x 2))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 (g8 x) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (v8 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 (v9 x) x))
(define-fun
  f6
  ((x Int)) Int (+ 1 (v7 x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (h6 x)))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun
  f4
  ((x Int)) Int (div (v5 x) 2))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
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
(define-fun
  fast
  ((x Int)) Int (div (+ (* (+ (* (v2 x) 2) 1) x) 1) (+ 1 x)))
(define-fun
  f1
  ((x Int)) Int (div x (+ 1 (mod x 2))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun
  v0
  ((x Int)) Int (u0 (v1 x) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
