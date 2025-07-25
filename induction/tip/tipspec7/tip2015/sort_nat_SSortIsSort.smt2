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
  ssort-minimum1
  ((x Nat) (y list)) Nat
  (match y
    ((nil x)
     ((cons y1 ys1)
      (ite (leq y1 x) (ssort-minimum1 y1 ys1) (ssort-minimum1 x ys1))))))
(define-fun-rec
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (leq x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insert2 y (isort xs))))))
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
(assert (forall ((z Nat)) (= (apply1 lam6 z) (lam5 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam5 z) x2) (leq z x2))))
(assert (forall ((x2 Nat)) (= (apply1 lam8 x2) (lam7 x2))))
(assert
  (forall ((x2 Nat) (x3 Nat))
    (= (apply12 (lam7 x2) x3) (leq x2 x3))))
(assert (forall ((z Nat)) (= (apply1 lam10 z) (lam9 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam9 z) x2) (leq z x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam12 x3) (lam11 x3))))
(assert
  (forall ((x3 Nat) (x4 Nat))
    (= (apply12 (lam11 x3) x4) (leq x3 x4))))
(assert (forall ((z Nat)) (= (apply1 lam14 z) (lam13 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam13 z) x2) (leq z x2))))
(assert (forall ((x2 Nat)) (= (apply1 lam16 x2) (lam15 x2))))
(assert
  (forall ((x2 Nat) (x3 Nat))
    (= (apply12 (lam15 x2) x3) (leq x2 x3))))
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
(assert-not (forall ((xs list)) (= (ssort xs) (isort xs))))
(assert-claim (= (isort nil) nil))
(assert-claim (forall ((x list)) (= (isort x) (ssort x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (ssort-minimum1 x nil) x)))
(assert-claim (forall ((x list)) (= (ssort-minimum1 zero x) zero)))
(assert-claim
  (forall ((y fun14) (z sk)) (= (deleteBy2 y z nil2) nil2)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (cons x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 x (isort y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (ssort-minimum1 x y) y)
      (cons (ssort-minimum1 x y) y))))
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
    (= (insert2 (succ x) (cons x y)) (cons x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 (succ y) (cons x z)) (cons x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x fun1) (y Nat) (z list))
    (= (isort (deleteBy x y (isort z))) (deleteBy x y (isort z)))))
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
  (forall ((x Nat) (y list) (z Nat))
    (=> (leq z x)
      (= (leq (ssort-minimum1 (succ x) y) z)
        (leq (ssort-minimum1 (succ z) y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 (succ (ssort-minimum1 x y)) y)
      (ssort-minimum1 (succ x) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (deleteBy lam4 x (cons x y)) y)))
(assert-claim
  (forall ((x Nat) (y list)) (= (deleteBy lam6 x (insert2 x y)) y)))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (deleteBy lam8 x (cons y z)) z))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam10 (ssort-minimum1 x y) y)
      (deleteBy lam12 zero y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 x (deleteBy lam14 x y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (ssort-minimum1 y (deleteBy lam16 x z)) (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons (ssort-minimum1 x y) y))
      (cons (ssort-minimum1 x y) (insert2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 (ssort-minimum1 x (cons y z)) z)
      (cons (ssort-minimum1 x (cons y z)) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (leq x (ssort-minimum1 x (cons y z)))
      (leq x (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (= (leq (ssort-minimum1 x y) (ssort-minimum1 z y))
      (leq (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (ssort-minimum1 x (cons z (cons y x2)))
      (ssort-minimum1 x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (ssort-minimum1 x (cons y (insert2 z x2)))
      (ssort-minimum1 x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list) (x2 list))
    (= (ssort-minimum1 x (cons (ssort-minimum1 y x2) z))
      (ssort-minimum1 x (cons (ssort-minimum1 y z) x2)))))
(assert-claim
  (forall ((x fun1) (y Nat) (z Nat))
    (= (isort (deleteBy x y (cons z nil)))
      (deleteBy x y (cons z nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (ssort-minimum1 (succ x) (cons (succ y) nil))
      (succ (ssort-minimum1 x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam18 (succ x) (cons x y))
      (cons x (deleteBy lam20 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam22 (succ x) (cons zero y))
      (cons zero (deleteBy lam24 (succ x) y)))))
