(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  times
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero zero)
     ((succ z) (plus y (times z y))))))
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
  (forall ((a Nat) (b Nat) (c Nat) (d Nat))
    (= (op a b c d) (plus (plus (times a b) c) d))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times x (times y z)) (times (times x y) z))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (times x y) (times y x))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times x (plus y z)) (plus (times x y) (times x z)))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times (plus x y) z) (plus (times x z) (times y z)))))
(assert (forall ((x Nat)) (= (times x (succ zero)) x)))
(assert (forall ((x Nat)) (= (times (succ zero) x) x)))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert (forall ((x Nat)) (= (times x zero) zero)))
(assert (forall ((x Nat)) (= (times zero x) zero)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (times y x) (times x y))))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x Nat)) (= (times x zero) zero)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((x Nat)) (= (times x (succ zero)) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x y x2 z) (op x y z x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op y x z x2) (op x y z x2))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (times y (succ x)) (op y x y zero))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (= (op x zero y z) (plus y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op y z x zero) (plus x (times y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (times y (plus x x)) (times x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times (times x y) z) (times x (times y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (op x y x x) (times x (succ (succ y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (times (succ x) (succ y)) (succ (op x y x y)))))
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
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op x (succ zero) y z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x x z (plus y x2)) (op x x y (plus z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x y x (plus z x2)) (op x (succ y) z x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x y z (plus x x2)) (op x (succ y) z x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x y x2 (plus z z)) (op x y z (plus z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op z x2 y (times z x)) (op z x y (times z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op x2 x2 z (times x y)) (op x y z (times x2 x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (op z x2 y (times y x)) (op y x y (times z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op x y x (times x z)) (times x (succ (plus y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 Nat))
    (= (op x y (plus z x2) x3) (op x y z (plus x2 x3)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (op x y zero (times x z)) (times x (plus y z)))))
