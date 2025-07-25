(define-fun
  h4
  ((x Int)) Int (* (* x x) x))
(define-fun
  h3
  ((x Int)) Int (+ 1 (* (+ 2 x) x)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (* x x))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  f4
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (* (* (* (* x x) x) x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (- (v3 x) (* (v4 x) x)))
(define-fun
  f2
  ((x Int)) Int (* (* x x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 (h1 x)))
(define-fun
  f0
  ((x Int)) Int (* (* (v1 x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (- (v0 x) (* (v2 x) x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
