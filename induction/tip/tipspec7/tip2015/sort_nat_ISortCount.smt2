(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
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
(assert-not
  (forall ((x Nat) (xs list)) (= (count x (isort xs)) (count x xs))))
(assert-claim (= (isort nil) nil))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y sk)) (= (count2 y nil2) zero)))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (isort y)) (count x y))))
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
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (count2 y (cons2 y z)) (succ (count2 y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim (forall ((x Nat) (y Nat)) (leq x (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (plus y x) x) (leq y zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus y y) x) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
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
  (forall ((x Nat) (y list))
    (= (insert2 (succ x) (cons x y)) (cons x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 (succ y) (cons x z)) (cons x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ x) (plus y x)) (leq (succ zero) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (succ x) (plus y y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ x)) (leq y (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list2))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (count x (cons y (insert2 z x2)))
      (count x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (plus x x) y)) (count x (cons zero y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (plus x x) (cons x y))
      (cons x (insert2 (plus x x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count (plus x x) y)) (leq x (count (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
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
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ (succ x))) (leq y (succ (succ zero))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (succ x) (cons (succ y) nil)) (count x (cons y nil)))))
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
    (= (leq (plus x (count x y)) zero)
      (leq (plus x (count zero y)) zero))))
