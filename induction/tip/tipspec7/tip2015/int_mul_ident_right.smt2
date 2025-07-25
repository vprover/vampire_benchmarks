(declare-datatype Sign ((Pos) (Neg)))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype Integer ((P (proj1-P Nat)) (N (proj1-N Nat))))
(define-fun
  toInteger
  ((x Sign) (y Nat)) Integer
  (match x
    ((Pos (P y))
     (Neg
      (match y
        ((zero (P zero))
         ((succ z) (N z))))))))
(define-fun
  sign
  ((x Integer)) Sign
  (match x
    (((P y) Pos)
     ((N z) Neg))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  times2
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero zero)
     ((succ z) (plus y (times2 z y))))))
(define-fun
  opposite
  ((x Sign)) Sign
  (match x
    ((Pos Neg)
     (Neg Pos))))
(define-fun
  timesSign
  ((x Sign) (y Sign)) Sign
  (match x
    ((Pos y)
     (Neg (opposite y)))))
(define-fun
  one
  () Integer (P (succ zero)))
(define-fun
  absVal
  ((x Integer)) Nat
  (match x
    (((P n) n)
     ((N m) (plus (succ zero) m)))))
(define-fun
  times
  ((x Integer) (y Integer)) Integer
  (toInteger (timesSign (sign x) (sign y))
    (times2 (absVal x) (absVal y))))
(assert-not (forall ((x Integer)) (= x (times x one))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times2 x (times2 y z)) (times2 (times2 x y) z))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (times2 x y) (times2 y x))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times2 x (plus y z)) (plus (times2 x y) (times2 x z)))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times2 (plus x y) z) (plus (times2 x z) (times2 y z)))))
(assert (forall ((x Nat)) (= (times2 x (succ zero)) x)))
(assert (forall ((x Nat)) (= (times2 (succ zero) x) x)))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert (forall ((x Nat)) (= (times2 x zero) zero)))
(assert (forall ((x Nat)) (= (times2 zero x) zero)))
(assert-claim (= (absVal one) (succ zero)))
(assert-claim true)
(assert-claim true)
(assert-claim (= (sign one) Pos))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Integer) (y Integer)) (= (times y x) (times x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (times2 y x) (times2 x y))))
(assert-claim
  (forall ((x Sign) (y Sign)) (= (timesSign y x) (timesSign x y))))
(assert-claim (forall ((x Sign)) (= (timesSign x x) Pos)))
(assert-claim (forall ((x Nat)) (= (plus (succ zero) x) (succ x))))
(assert-claim (forall ((x Nat)) (= x x)))
(assert-claim (forall ((x Sign)) (= (opposite (opposite x)) x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x Nat)) true))
(assert-claim (forall ((x Nat)) true))
(assert-claim (forall ((x Integer)) (= (times x one) x)))
(assert-claim (forall ((x Nat)) (= (times2 x zero) zero)))
(assert-claim
  (forall ((x Sign)) (= (opposite x) (timesSign x Neg))))
(assert-claim (forall ((x Sign)) (= x x)))
(assert-claim (forall ((x Sign)) (= (toInteger x zero) (P zero))))
(assert-claim (forall ((x Nat)) (= x x)))
(assert-claim (= one (P (succ zero))))
(assert-claim
  (forall ((x Sign) (y Nat)) (= (absVal (toInteger x y)) y)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((x Integer)) (= (sign (times x x)) Pos)))
(assert-claim
  (forall ((x Sign) (y Sign))
    (= (timesSign x (opposite y)) (opposite (timesSign x y)))))
(assert-claim
  (forall ((x Integer)) (= (times x (P zero)) (P zero))))
(assert-claim (forall ((x Nat)) (= (times2 x (succ zero)) x)))
(assert-claim
  (forall ((x Nat)) (= (toInteger Neg (succ x)) (N x))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (times2 x y)) (times2 x (succ y)))))
(assert-claim
  (forall ((x Integer) (y Integer) (z Integer))
    (= (times (times x y) z) (times x (times y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (times2 y (plus x x)) (times2 x (plus y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (times2 (times2 x y) z) (times2 x (times2 y z)))))
(assert-claim
  (forall ((x Sign) (y Sign) (z Sign))
    (= (timesSign (timesSign x y) z) (timesSign x (timesSign y z)))))
(assert-claim
  (forall ((x Integer)) (= (P (absVal (times x x))) (times x x))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (absVal (times y (P x))) (times2 x (absVal y)))))
(assert-claim
  (forall ((x Nat) (y Integer) (z Nat))
    (= (sign (times y (N x))) (sign (times y (N z))))))
(assert-claim
  (forall ((x Nat) (y Sign)) (= (sign (toInteger y (succ x))) y)))
(assert-claim
  (forall ((x Integer) (y Nat))
    (= (sign (toInteger (sign x) y)) (sign (times x (P y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (times (P x) (P y)) (P (times2 x y)))))
(assert-claim
  (forall ((x Integer) (y Nat))
    (= (times2 (succ y) (absVal x)) (absVal (times x (N y))))))
(assert-claim
  (forall ((x Integer) (y Integer))
    (= (times2 (absVal x) (absVal y)) (absVal (times x y)))))
(assert-claim
  (forall ((x Integer)) (= (toInteger (sign x) (absVal x)) x)))
(assert-claim
  (forall ((x Nat)) (= (toInteger Neg x) (times (N zero) (P x)))))
(assert-claim
  (forall ((x Sign) (y Nat))
    (= (sign (toInteger x (plus y y))) (sign (toInteger x y)))))
(assert-claim
  (forall ((x Sign) (y Nat))
    (= (sign (toInteger x (times2 y y))) (sign (toInteger x y)))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (times y (toInteger (sign y) x)) (P (times2 x (absVal y))))))
(assert-claim
  (forall ((x Sign) (y Nat) (z Nat))
    (= (times (P y) (toInteger x z)) (toInteger x (times2 y z)))))
(assert-claim
  (forall ((x Sign) (y Nat))
    (= (times (N zero) (toInteger x y)) (toInteger (opposite x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (times2 x y) (times2 x z)) (times2 x (plus y z)))))
(assert-claim
  (forall ((x Sign) (y Nat) (z Sign) (x2 Nat))
    (= (times (toInteger x x2) (toInteger z y))
      (times (toInteger x y) (toInteger z x2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (times2 y (plus x (plus x x))) (times2 x (plus y (plus y y))))))
(assert-claim
  (forall ((x Sign) (y Nat) (z Sign) (x2 Nat))
    (= (toInteger (timesSign x z) (times2 y x2))
      (times (toInteger x y) (toInteger z x2)))))
(assert-claim
  (forall ((x Nat) (y Integer) (z Sign) (x2 Nat))
    (= (sign (times y (toInteger z (succ x))))
      (sign (times y (toInteger z (succ x2)))))))
(assert-claim
  (forall ((x Integer) (y Sign) (z Nat))
    (= (sign (times x (toInteger y (absVal x))))
      (sign (times x (toInteger y (succ z)))))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (times y (toInteger (opposite (sign y)) x))
      (toInteger Neg (times2 x (absVal y))))))
(assert-claim
  (forall ((x Integer) (y Sign))
    (= (toInteger (timesSign y (sign x)) (absVal x))
      (times x (toInteger y (succ zero))))))
(assert-claim
  (forall ((x Nat))
    (= (succ (times2 x (succ (succ (succ x)))))
      (plus x (times2 (succ x) (succ x))))))
