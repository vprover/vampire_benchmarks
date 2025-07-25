(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  acc_plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (acc_plus z (succ y))))))
(assert-not
  (forall ((x Nat) (y Nat)) (= (acc_plus x y) (acc_plus y x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (acc_plus y x) (acc_plus x y))))
(assert-claim (forall ((x Nat)) (= (acc_plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (acc_plus x (succ y)) (succ (acc_plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (acc_plus (acc_plus x y) z) (acc_plus x (acc_plus y z)))))
