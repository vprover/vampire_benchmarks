(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 2 2))
(define-fun
  f2
  ((x Int)) Int (- (- (* (+ 1 (* 2 (mod x 2))) (* v3 2)) 1) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (div (v2 x) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (* (+ 2 y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  () Int (u1 2 2))
(define-fun
  h0
  () Int (- 2 v1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x h0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
