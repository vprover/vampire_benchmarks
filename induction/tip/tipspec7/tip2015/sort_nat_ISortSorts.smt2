(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
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
(assert-not (forall ((xs list)) (ordered (isort xs))))
(assert-claim (ordered nil))
(assert-claim (= (isort nil) nil))
(assert-claim (forall ((x list)) (=> (ordered x) (= (isort x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (ordered (isort x))))
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
    (= (ordered (insert2 x y)) (ordered y))))
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
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ x) (cons x y)) (cons x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 (succ y) (cons x z)) (cons x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (insert2 x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (ordered (cons y (insert2 x z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (ordered (cons x (insert2 y z)))
        (ordered (cons x (cons y z)))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq x y) (ordered (cons x (cons y nil))))))
(assert-claim
  (forall ((x list) (y Nat))
    (=> (ordered x)
      (= (ordered (cons y (cons zero x))) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons x y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ zero) (cons (succ x) y))
      (cons (succ zero) (cons (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons zero y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons (succ (succ x)) (isort y)))
      (ordered (cons (succ (succ x)) y)))))
