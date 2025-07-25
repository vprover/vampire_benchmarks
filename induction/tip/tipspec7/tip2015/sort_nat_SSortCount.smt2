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
(declare-fun lam25 (Nat) fun12)
(declare-const lam26 fun1)
(declare-fun lam27 (Nat) fun12)
(declare-const lam28 fun1)
(declare-fun apply1 (fun1 Nat) fun12)
(declare-fun apply12 (fun12 Nat) Bool)
(declare-fun apply13 (fun13 sk) sk)
(declare-fun apply14 (fun14 sk) fun15)
(declare-fun apply15 (fun15 sk) Bool)
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
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
(define-fun-rec
  count2
  ((x sk) (y list2)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x Nat) (y list)) Nat
  (match y
    ((nil zero)
     ((cons z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
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
(assert (forall ((z Nat)) (= (apply1 lam20 z) (lam19 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam19 z) x2) (leq z x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam22 x3) (lam21 x3))))
(assert
  (forall ((x3 Nat) (x4 Nat))
    (= (apply12 (lam21 x3) x4) (leq x3 x4))))
(assert (forall ((z Nat)) (= (apply1 lam24 z) (lam23 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam23 z) x2) (leq z x2))))
(assert (forall ((z Nat)) (= (apply1 lam26 z) (lam25 z))))
(assert
  (forall ((z Nat) (x2 Nat)) (= (apply12 (lam25 z) x2) (leq z x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam28 x3) (lam27 x3))))
(assert
  (forall ((x3 Nat) (x4 Nat))
    (= (apply12 (lam27 x3) x4) (leq x3 x4))))
(assert-not
  (forall ((x Nat) (xs list)) (= (count x (ssort xs)) (count x xs))))
(assert-claim (= (ssort nil) nil))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y sk)) (= (count2 y nil2) zero)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x list)) (= (ssort (ssort x)) (ssort x))))
(assert-claim (forall ((x Nat)) (= (ssort-minimum1 x nil) x)))
(assert-claim (forall ((x list)) (= (ssort-minimum1 zero x) zero)))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (ssort y)) (count x y))))
(assert-claim
  (forall ((y fun14) (z sk)) (= (deleteBy2 y z nil2) nil2)))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 x (ssort y)) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Nat)) (= (ssort (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (ssort (cons zero x)) (cons zero (ssort x)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (count2 y (cons2 y z)) (succ (count2 y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (leq x (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (leq y (ssort-minimum1 x z)) (leq y (ssort-minimum1 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (plus y x) x) (leq y zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus y y) x) (leq y zero)))))
(assert-claim
  (forall ((x list) (y Nat)) (leq (ssort-minimum1 y x) y)))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (=> (leq x z) (leq (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
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
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y nil2)) (count2 y (cons2 z nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus x y) zero) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort (cons x (ssort y))) (ssort (cons x y)))))
(assert-claim
  (forall ((x list)) (= (ssort-minimum1 (count zero x) x) zero)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (succ x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (succ x) (cons x y)) (count (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (count (succ y) (cons x z)) (count (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x) (= (count y (cons (succ x) z)) (count y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ x) (plus y x)) (leq (succ zero) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (succ x) (plus y y)) (leq (succ zero) y)))))
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
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ x)) (leq y (succ zero)))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (=> (leq z x)
      (= (leq (ssort-minimum1 (succ x) y) z)
        (leq (ssort-minimum1 (succ z) y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (ssort (cons z (cons y x2))) (ssort (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort (cons (ssort-minimum1 x y) y))
      (cons (ssort-minimum1 x y) (ssort y)))))
(assert-claim
  (forall ((x fun1) (y Nat) (z list))
    (= (ssort (deleteBy x y (ssort z))) (deleteBy x y (ssort z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 (succ (ssort-minimum1 x y)) y)
      (ssort-minimum1 (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((x Nat))
    (= (ssort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (ssort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (succ zero) (count zero y))
      (leq (ssort-minimum1 (succ x) y) zero))))
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
  (forall ((y sk) (z sk) (x2 sk) (x3 list2))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (plus x x) y)) (count x (cons zero y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count (plus x x) y)) (leq x (count (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (leq x (ssort-minimum1 x (cons y z)))
      (leq x (ssort-minimum1 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (= (leq (ssort-minimum1 x y) (ssort-minimum1 z y))
      (leq (ssort-minimum1 x y) z))))
(assert-claim
  (forall ((x list) (y Nat)) (leq (ssort-minimum1 (count y x) x) y)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 x (cons (count x y) y))
      (ssort-minimum1 (count x y) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list) (x2 list))
    (= (ssort-minimum1 x (cons (ssort-minimum1 y x2) z))
      (ssort-minimum1 x (cons (ssort-minimum1 y z) x2)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 (plus x (count x y)) y) (ssort-minimum1 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (ssort-minimum1 (plus x (ssort-minimum1 y z)) z)
      (ssort-minimum1 (plus x y) z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count x (cons (plus y x) nil)) (count y (cons zero nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count zero (cons (plus x x) y)) (count zero (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (plus x x) (cons zero y))
      (count (plus x x) (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count x (cons zero y))) (leq x (count x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count zero (cons x y))) (leq x (count zero y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ (succ x)) (plus y x)) (leq (succ (succ zero)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons y nil)) x) (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (count (ssort-minimum1 x y) y) zero)
      (leq (succ x) (ssort-minimum1 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ (succ x))) (leq y (succ (succ zero))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (ssort-minimum1 (plus x x) y) zero)
      (leq (ssort-minimum1 x y) zero))))
(assert-claim
  (forall ((x list) (y list))
    (= (ssort-minimum1 (count (count zero y) x) y)
      (ssort-minimum1 (count zero x) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (succ x) (cons (succ y) nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (plus x (count x y)) zero)
      (leq (succ x) (ssort-minimum1 (succ zero) y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (succ (succ zero)) (plus x x)) (leq (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons zero nil)) y)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (plus x x) (succ (succ zero))) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (plus x (count zero y)) zero)
      (leq (succ x) (ssort-minimum1 (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (ssort-minimum1 (succ x) (cons (succ y) nil))
      (succ (ssort-minimum1 x (cons y nil))))))
(assert-claim
  (forall ((x list))
    (= (ssort-minimum1 (succ (count (succ zero) x)) x)
      (ssort-minimum1 (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ssort-minimum1 (count zero (cons x y)) y)
      (ssort-minimum1 (count x (cons zero nil)) y))))
(assert-claim
  (forall ((x list))
    (= (ssort-minimum1 (succ zero) x)
      (count zero (cons (count zero x) nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (deleteBy lam16 (succ x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam18 x (ssort (cons x y))) (ssort y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam20 (succ x) (cons x y))
      (cons x (deleteBy lam22 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count zero (deleteBy lam24 (succ x) y)) (count zero y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (deleteBy lam26 (succ x) (cons zero y))
      (cons zero (deleteBy lam28 (succ x) y)))))
