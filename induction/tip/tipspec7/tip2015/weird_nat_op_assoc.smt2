(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  op
  ((x Nat) (y Nat) (z Nat) (x2 Nat)) Nat
  (match z
    ((zero
      (match x
        ((zero x2)
         ((succ x3) (op x3 y y x2)))))
     ((succ x4) (op x y x4 (succ x2))))))
(assert-not
  (forall ((a Nat) (b Nat) (c Nat) (d Nat) (e Nat))
    (= (op (op a b zero zero) c d e) (op a (op b c zero zero) d e))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x y x2 z) (op x y z x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op y x z x2) (op x y z x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op y zero y z) (op x zero y z))))
(assert-claim (forall ((x Nat) (y Nat)) (= (op x zero y zero) y)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x y z (succ x2)) (succ (op x y z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op y (succ x) x z) (op x (succ y) y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op y (succ x) z zero) (op y x y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (op y (succ (succ x)) x x) (op x (succ (succ y)) y y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op (succ x) (succ zero) y z) (succ (op x (succ zero) y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op y (succ zero) x z) (op x (succ zero) y z))))
