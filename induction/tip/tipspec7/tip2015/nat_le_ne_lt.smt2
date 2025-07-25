(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  lt
  ((x Nat) (y Nat)) Bool
  (match y
    ((zero false)
     ((succ z)
      (match x
        ((zero true)
         ((succ n) (lt n z))))))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(assert-not
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (=> (distinct x y) (lt x y)))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (=> (lt x y) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (leq x y)))))
(assert-claim (forall ((x Nat)) (not (lt x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (lt x y)))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt x y) (not (leq y zero)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (lt x y) (lt zero y))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (lt x y) (leq (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq x y) (lt x (succ y)))))
