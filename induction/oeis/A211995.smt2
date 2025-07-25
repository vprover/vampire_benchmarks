(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  j3
  () Int (+ (* 2 (* 2 (* 2 (+ 2 (+ 2 2))))) 1))
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  g8
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (div x 2))
(define-fun
  g5
  ((x Int)) Int (mod x 2))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int)) Int (+ x x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 x 1))
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
  ((x Int)) Int (* x x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 1 (v7 x)))
(define-fun
  f5
  ((x Int)) Int (+ x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) (v6 x)))
(define-fun
  f4
  () Int (+ 1 (+ 2 (+ 2 2))))
(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y f4))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) 1))
(define-fun
  w3
  ((x Int)) Int (u3 (h3 x) (v4 x) j3))
(define-fun
  fast
  ((x Int)) Int (mod (div (w3 x) (v5 x)) (v8 x)))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (+ (* 2 (+ (+ x x) x)) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (div x 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x (v1 x)))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
