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
  acc_plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (acc_plus z (succ y))))))
(define-fun-rec
  acc_alt_mul
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero zero)
     ((succ z)
      (match y
        ((zero zero)
         ((succ x2)
          (acc_plus (succ z) (acc_plus x2 (acc_alt_mul z x2))))))))))
(assert-not
  (forall ((x Nat) (y Nat)) (= (acc_alt_mul x y) (times x y))))
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
(assert-claim
  (forall ((x Nat) (y Nat)) (= (acc_alt_mul y x) (acc_alt_mul x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (acc_plus y x) (acc_plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (acc_plus x y) (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (acc_alt_mul x y) (times x y))))
(assert-claim (forall ((x Nat)) (= (acc_alt_mul x zero) zero)))
(assert-claim (forall ((x Nat)) (= (acc_plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (acc_plus x (succ y)) (succ (acc_plus x y)))))
(assert-claim (forall ((x Nat)) (= (acc_alt_mul x (succ zero)) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (acc_alt_mul (acc_alt_mul x y) z)
      (acc_alt_mul x (acc_alt_mul y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (acc_alt_mul y (acc_plus x x)) (acc_alt_mul x (acc_plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (acc_plus x (acc_alt_mul x y)) (acc_alt_mul x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (acc_plus (acc_plus x y) z) (acc_plus x (acc_plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (acc_alt_mul y (acc_plus x (acc_plus x x)))
      (acc_alt_mul x (acc_plus y (acc_plus y y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (acc_plus (acc_alt_mul x y) (acc_alt_mul x z))
      (acc_alt_mul x (acc_plus y z)))))
(assert-claim
  (forall ((x Nat))
    (= (succ (acc_alt_mul x (succ (succ (succ x)))))
      (acc_plus x (acc_alt_mul (succ x) (succ x))))))
