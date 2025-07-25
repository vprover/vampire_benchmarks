(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  alt_mul
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero zero)
     ((succ z)
      (match y
        ((zero zero)
         ((succ x2)
          (plus (plus (plus (succ zero) (alt_mul z x2)) z) x2))))))))
(assert-not
  (forall ((x Nat) (y Nat) (z Nat))
    (= (alt_mul x (alt_mul y z)) (alt_mul (alt_mul x y) z))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (alt_mul y x) (alt_mul x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((x Nat)) (= (alt_mul x zero) zero)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((x Nat)) (= (alt_mul x (succ zero)) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (alt_mul (alt_mul x y) z) (alt_mul x (alt_mul y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (alt_mul y (plus x x)) (alt_mul x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (alt_mul x y)) (alt_mul x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (alt_mul y (plus x (plus x x)))
      (alt_mul x (plus y (plus y y))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (alt_mul x y) (alt_mul x z)) (alt_mul x (plus y z)))))
(assert-claim
  (forall ((x Nat))
    (= (succ (alt_mul x (succ (succ (succ x)))))
      (plus x (alt_mul (succ x) (succ x))))))
