(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun
  geq
  ((x Nat) (y Nat)) Bool (leq y x))
(assert-not
  (forall ((x Nat) (y Nat)) (=> (geq x y) (=> (geq y x) (= x y)))))
(assert-claim (forall ((x Nat)) (geq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (=> (leq y x) (geq x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (geq y x) (leq x y))))
(assert-claim (forall ((x Nat)) (geq x zero)))
(assert-claim (forall ((x Nat)) (not (geq x (succ x)))))
(assert-claim (forall ((x Nat)) (geq (succ x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (geq x y) (geq (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (geq y x) (not (geq x (succ y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (geq (succ x) (succ y)) (geq x y))))
