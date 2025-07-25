(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- (* 2 (* 2 (* 2 (+ 2 2)))) x))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (ite
    (<= (+ 1 (- x (* 2 (* 2 (* 2 (+ 2 2)))))) 0) (+ 2 x)
    (* 2 (* 2 (* 2 (+ 2 2))))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
