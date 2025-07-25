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
(assert-not (forall ((x Nat)) (not (lt x x))))
(assert-claim (forall ((x Nat)) (not (lt x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (lt x y)))))
(assert-claim (forall ((x Nat)) (not (lt x zero))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (lt x y) (lt zero y))))
(assert-claim (forall ((x Nat)) (lt x (succ x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (lt (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt x y) (lt x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (lt y x) (not (lt x (succ y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (lt (succ x) (succ y)) (lt x y))))
