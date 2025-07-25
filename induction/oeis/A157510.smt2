(define-fun
  h1
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 h1))
(define-fun
  fast
  ((x Int)) Int (* 2 (* (+ 1 (+ 2 2)) (+ 2 (* (+ 1 x) v1)))))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (* (+ (+ (* (* x y) y) 2) x) (+ (* (+ 2 2) 2) 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
