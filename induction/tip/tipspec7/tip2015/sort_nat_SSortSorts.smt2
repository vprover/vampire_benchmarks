(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-sort fun14 0)
(declare-sort fun15 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-fun lam (Nat) fun12)
(declare-const lam2 fun1)
(declare-fun lam3 (Nat) fun12)
(declare-const lam4 fun1)
(declare-fun lam5 (Nat) fun12)
(declare-const lam6 fun1)
(declare-fun lam7 (Nat) fun12)
(declare-const lam8 fun1)
(declare-fun lam9 (Nat) fun12)
(declare-const lam10 fun1)
(declare-fun lam11 (Nat) fun12)
(declare-const lam12 fun1)
(declare-fun lam13 (Nat) fun12)
(declare-const lam14 fun1)
(declare-fun lam15 (Nat) fun12)
(declare-const lam16 fun1)
(declare-fun lam17 (Nat) fun12)
(declare-const lam18 fun1)
(declare-fun lam19 (Nat) fun12)
(declare-const lam20 fun1)
(declare-fun lam21 (Nat) fun12)
(declare-const lam22 fun1)
(declare-fun lam23 (Nat) fun12)
(declare-const lam24 fun1)
(declare-fun apply1 (fun1 Nat) fun12)
(declare-fun apply12 (fun12 Nat) Bool)
(declare-fun apply13 (fun13 sk) sk)
(declare-fun apply14 (fun14 sk) fun15)
(declare-fun apply15 (fun15 sk) Bool)
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun-rec
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (leq y y2) (ordered (cons y2 xs))))))))))
(define-fun-rec
  ssort-minimum1
  ((x Nat) (y list)) Nat
  (match y
    ((nil x)
     ((cons y1 ys1)
      (ite (leq y1 x) (ssort-minimum1 y1 ys1) (ssort-minimum1 x ys1))))))
(define-fun-rec
  deleteBy2
  ((x fun14) (y sk) (z list2)) list2
  (match z
    ((nil2 nil2)
     ((cons2 y2 ys)
      (ite
        (apply15 (apply14 x y) y2) ys (cons2 y2 (deleteBy2 x y ys)))))))
(define-fun-rec
  deleteBy
  ((x fun1) (y Nat) (z list)) list
  (match z
    ((nil nil)
     ((cons y2 ys)
      (ite (apply12 (apply1 x y) y2) ys (cons y2 (deleteBy x y ys)))))))
(define-fun-rec
  ssort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y ys)
      (let ((m (ssort-minimum1 y ys)))
        (cons m (ssort (deleteBy lam2 m (cons y ys)))))))))
(assert (forall ((z Nat)) (= (apply1 lam2 z) (lam z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam z) x2) (= z x2))))
(assert (forall ((z Nat)) (= (apply1 lam4 z) (lam3 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam3 z) x2) (leq z x2))))
(assert (forall ((x2 Nat)) (= (apply1 lam6 x2) (lam5 x2))))
(assert
  (forall ((x2 Nat) (x3 Nat))
    (= (apply12 (lam5 x2) x3) (leq x2 x3))))
(assert (forall ((z Nat)) (= (apply1 lam8 z) (lam7 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam7 z) x2) (leq z x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam10 x3) (lam9 x3))))
(assert
  (forall ((x3 Nat) (x4 Nat))
    (= (apply12 (lam9 x3) x4) (leq x3 x4))))
(assert (forall ((z Nat)) (= (apply1 lam12 z) (lam11 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam11 z) x2) (leq z x2))))
(assert (forall ((x2 Nat)) (= (apply1 lam14 x2) (lam13 x2))))
(assert
  (forall ((x2 Nat) (x3 Nat))
    (= (apply12 (lam13 x2) x3) (leq x2 x3))))
(assert (forall ((z Nat)) (= (apply1 lam16 z) (lam15 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam15 z) x2) (leq z x2))))
(assert (forall ((z Nat)) (= (apply1 lam18 z) (lam17 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam17 z) x2) (leq z x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam20 x3) (lam19 x3))))
(assert
  (forall ((x3 Nat) (x4 Nat))
    (= (apply12 (lam19 x3) x4) (leq x3 x4))))
(assert (forall ((z Nat)) (= (apply1 lam22 z) (lam21 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam21 z) x2) (leq z x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam24 x3) (lam23 x3))))
(assert
  (forall ((x3 Nat) (x4 Nat))
    (= (apply12 (lam23 x3) x4) (leq x3 x4))))
(assert-not (forall ((xs list)) (ordered (ssort xs))))
(assert-claim (ordered nil))
(assert-claim (forall ((x list)) (=> (ordered x) (= (ssort x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (ordered (ssort x))))
(assert-claim (forall ((x Nat)) (= (ssort-minimum1 x nil) x)))
(assert-claim (forall ((x list)) (= (ssort-minimum1 zero x) zero)))
(assert-claim
  (forall ((y fun14) (z sk)) (= (deleteBy2 y z nil2) nil2)))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 x (ssort y)) (ssort-minimum1 x y))))
(assert-claim (forall ((x Nat)) (ordered (cons x nil))))
(assert-claim
  (forall ((x list)) (= (ordered (cons zero x)) (ordered x))))
(assert-claim
  (forall ((x list))
    (= (ssort (cons zero x)) (cons zero (ssort x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (=> (ordered y)
      (= (ordered (cons x y)) (leq x (ssort-minimum1 x y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (leq y (ssort-minimum1 x z)) (leq y (ssort-minimum1 y z))))))
(assert-claim
  (forall ((x list) (y Nat)) (leq (ssort-minimum1 y x) y)))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (=> (leq x z) (leq (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x fun1) (y Nat) (z list))
    (=> (ordered z) (ordered (deleteBy x y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (ssort-minimum1 y (cons x z)) (ssort-minimum1 x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 x (cons x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (ssort-minimum1 y (cons x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (ssort-minimum1 (ssort-minimum1 x z) y)
      (ssort-minimum1 (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 (ssort-minimum1 x y) y) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort (cons x (ssort y))) (ssort (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (=> (leq z x)
      (= (leq (succ (ssort-minimum1 x y)) z)
        (leq (succ (ssort-minimum1 z y)) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (leq y (succ (ssort-minimum1 x z)))
        (leq y (succ (ssort-minimum1 y z)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons (ssort-minimum1 x y) y)) (ordered y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (ssort (cons z (cons y x2))) (ssort (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort (cons (ssort-minimum1 x y) y))
      (cons (ssort-minimum1 x y) (ssort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 (succ (ssort-minimum1 x y)) y)
      (ssort-minimum1 (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq x y) (ordered (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat))
    (= (ssort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (ssort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list)) (= (deleteBy lam4 x (cons x y)) y)))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (deleteBy lam6 x (cons y z)) z))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam8 (ssort-minimum1 x y) y)
      (deleteBy lam10 zero y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 x (deleteBy lam12 x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (ssort-minimum1 y (deleteBy lam14 x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (leq x (ssort-minimum1 x (cons y z)))
      (leq x (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (= (leq (ssort-minimum1 x y) (ssort-minimum1 z y))
      (leq (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list) (x2 list))
    (= (ssort-minimum1 x (cons (ssort-minimum1 y x2) z))
      (ssort-minimum1 x (cons (ssort-minimum1 y z) x2)))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons x y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons (succ (ssort-minimum1 x y)) y))
      (ordered (cons (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (ssort-minimum1 (succ x) (cons (succ y) nil))
      (succ (ssort-minimum1 x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam16 x (ssort (cons x y))) (ssort y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam18 (succ x) (cons x y))
      (cons x (deleteBy lam20 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam22 (succ x) (cons zero y))
      (cons zero (deleteBy lam24 (succ x) y)))))
