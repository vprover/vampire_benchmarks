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
(assert-not
  (forall ((x Nat) (y Nat))
    (let ((z (ite (leq x y) y x))) (= (ite (leq x z) x z) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
