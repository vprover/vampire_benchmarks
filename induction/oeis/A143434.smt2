(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (- x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (- x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 1 x))
(define-fun
  v3
  ((x Int)) Int (u3 x (h3 x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (* (ite (<= (- (v3 x) 1) 0) 1 0)
    (- 1 (mod (- (* x x) x) (+ 2 2)))))
(define-fun
  f4
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (- 0 x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  small
  ((x Int)) Int (* (ite (<= (- (v0 x) 1) 0) 1 0) (v2 x)))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
