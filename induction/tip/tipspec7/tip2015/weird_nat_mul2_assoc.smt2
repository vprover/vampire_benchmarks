(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  add3acc
  ((x Nat) (y Nat) (z Nat)) Nat
  (match x
    ((zero
      (match y
        ((zero z)
         ((succ x2) (add3acc zero x2 (succ z))))))
     ((succ x3) (add3acc x3 (succ y) z)))))
(define-fun-rec
  mul2
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero zero)
     ((succ z)
      (match y
        ((zero zero)
         ((succ x2) (plus (succ zero) (add3acc z x2 (mul2 z x2))))))))))
(assert-not
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mul2 x (mul2 y z)) (mul2 (mul2 x y) z))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (mul2 y x) (mul2 x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((x Nat)) (= (mul2 x zero) zero)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc x z y) (add3acc x y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc y x z) (add3acc x y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x y) (add3acc x y zero))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((x Nat)) (= (mul2 x (succ zero)) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc x y (succ z)) (succ (add3acc x y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (mul2 (mul2 x y) z) (mul2 x (mul2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mul2 y (plus x x)) (mul2 x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (mul2 x y)) (mul2 x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc x y z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (mul2 y (add3acc x x x)) (mul2 x (add3acc y y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (mul2 x y) (mul2 x z)) (mul2 x (plus y z)))))
(assert-claim
  (forall ((x Nat))
    (= (succ (mul2 x (succ (succ (succ x)))))
      (plus x (mul2 (succ x) (succ x))))))
