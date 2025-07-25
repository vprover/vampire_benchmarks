(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  acc_plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (acc_plus z (succ y))))))
(assert-not
  (forall ((x Nat) (y Nat)) (= (plus x y) (acc_plus x y))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (acc_plus y x) (acc_plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (acc_plus x y) (plus x y))))
(assert-claim (forall ((x Nat)) (= (acc_plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (acc_plus x (succ y)) (succ (acc_plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (acc_plus (acc_plus x y) z) (acc_plus x (acc_plus y z)))))
