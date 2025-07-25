(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (* (+ (mod (- (+ (* 2 (+ x x)) x) 1) (+ 1 (* 2 (+ 2 2)))) 1)
    (ite (<= x 0) 0 1)))
(define-fun
  f0
  ((x Int)) Int (+ 1 (mod (+ 1 (+ 2 x)) (+ 1 (* 2 (+ 2 2))))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
