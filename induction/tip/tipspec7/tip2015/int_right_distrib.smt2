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
(define-fun-rec
  |-2|
  ((x Nat) (y Nat)) Integer
  (let
    ((fail
        (match y
          ((zero (P x))
           ((succ z)
            (match x
              ((zero (N z))
               ((succ x2) (|-2| x2 z)))))))))
    (match x
      ((zero
        (match y
          ((zero (P zero))
           ((succ x3) fail))))
       ((succ x4) fail)))))
(define-fun
  plus2
  ((x Integer) (y Integer)) Integer
  (match x
    (((P m)
      (match y
        (((P n) (P (plus m n)))
         ((N o) (|-2| m (plus (succ zero) o))))))
     ((N m2)
      (match y
        (((P n2) (|-2| n2 (plus (succ zero) m2)))
         ((N n3) (N (plus (plus (succ zero) m2) n3)))))))))
(assert-not
  (forall ((x Integer) (y Integer) (z Integer))
    (= (times (plus2 x y) z) (plus2 (times x z) (times y z)))))
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
(assert-claim true)
(assert-claim true)
(assert-claim (forall ((x Nat)) (= (|-2| x x) (P zero))))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Integer) (y Integer)) (= (plus2 y x) (plus2 x y))))
(assert-claim
  (forall ((x Integer) (y Integer)) (= (times y x) (times x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (times2 y x) (times2 x y))))
(assert-claim
  (forall ((x Sign) (y Sign)) (= (timesSign y x) (timesSign x y))))
(assert-claim (forall ((x Sign)) (= (timesSign x x) Pos)))
(assert-claim (forall ((x Nat)) (= (|-2| x zero) (P x))))
(assert-claim (forall ((x Nat)) (= (plus (succ zero) x) (succ x))))
(assert-claim (forall ((x Nat)) (= x x)))
(assert-claim (forall ((x Sign)) (= (opposite (opposite x)) x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x Nat)) true))
(assert-claim (forall ((x Nat)) true))
(assert-claim (forall ((x Nat)) (= (times2 x zero) zero)))
(assert-claim
  (forall ((x Sign)) (= (opposite x) (timesSign x Neg))))
(assert-claim (forall ((x Sign)) (= x x)))
(assert-claim (forall ((x Sign)) (= (toInteger x zero) (P zero))))
(assert-claim
  (forall ((x Nat)) (= (|-2| zero x) (toInteger Neg x))))
(assert-claim (forall ((x Nat)) (= x x)))
(assert-claim (forall ((x Nat)) (= (|-2| x (succ x)) (N zero))))
(assert-claim
  (forall ((x Nat)) (= (|-2| (succ x) x) (P (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (absVal (|-2| y x)) (absVal (|-2| x y)))))
(assert-claim
  (forall ((x Sign) (y Nat)) (= (absVal (toInteger x y)) y)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x Integer)) (= (sign (plus2 x x)) (sign x))))
(assert-claim (forall ((x Integer)) (= (sign (times x x)) Pos)))
(assert-claim
  (forall ((x Sign) (y Sign))
    (= (timesSign x (opposite y)) (opposite (timesSign x y)))))
(assert-claim (forall ((x Nat)) (= (|-2| zero (succ x)) (N x))))
(assert-claim (forall ((x Integer)) (= (plus2 x (P zero)) x)))
(assert-claim
  (forall ((x Integer)) (= (times x (P zero)) (P zero))))
(assert-claim (forall ((x Nat)) (= (times2 x (succ zero)) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| x (plus y x)) (|-2| zero y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (plus y x) x) (P y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus x (times2 x y)) (times2 x (succ y)))))
(assert-claim
  (forall ((x Integer) (y Integer) (z Integer))
    (= (plus2 (plus2 x y) z) (plus2 x (plus2 y z)))))
(assert-claim
  (forall ((x Integer) (y Integer))
    (= (times y (plus2 x x)) (times x (plus2 y y)))))
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
  (forall ((x Nat) (y Nat)) (= (|-2| (succ x) (succ y)) (|-2| x y))))
(assert-claim
  (forall ((x Integer)) (= (P (absVal (times x x))) (times x x))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (absVal (times y (P x))) (times2 x (absVal y)))))
(assert-claim
  (forall ((x Integer))
    (= (plus (absVal x) (absVal x)) (absVal (plus2 x x)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus2 (N x) (N y)) (N (succ (plus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (succ x)) (plus2 (N x) (P y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (sign (|-2| y (succ x))) (opposite (sign (|-2| x y))))))
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
  (forall ((x Integer)) (= (times x (P (succ zero))) x)))
(assert-claim
  (forall ((x Nat)) (= (|-2| zero x) (times (N zero) (P x)))))
(assert-claim
  (forall ((x Integer) (y Nat))
    (= (plus2 x (times x (N y))) (times x (|-2| zero y)))))
(assert-claim
  (forall ((x Integer) (y Nat))
    (= (plus2 x (times x (P y))) (times x (P (succ y))))))
(assert-claim
  (forall ((x Nat))
    (= (sign (|-2| x (times2 x x))) (sign (|-2| (succ zero) x)))))
(assert-claim
  (forall ((x Nat)) (= (sign (|-2| (times2 x x) x)) Pos)))
(assert-claim
  (forall ((x Integer)) (= (sign (plus2 x (times x x))) Pos)))
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
  (forall ((x Nat))
    (= (|-2| x (succ (succ (succ x)))) (N (succ (succ zero))))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (succ (succ (succ x))) x) (P (succ (succ (succ zero)))))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (opposite (sign (times y (N x)))) (sign (plus2 y (N zero))))))
(assert-claim
  (forall ((x Integer)) (= (sign (plus2 x (N (absVal x)))) Neg)))
(assert-claim
  (forall ((x Integer)) (= (sign (plus2 x (P (absVal x)))) Pos)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (times (|-2| y x) (N zero)) (|-2| x y))))
(assert-claim
  (forall ((x Sign) (y Nat))
    (= (times (N zero) (toInteger x y)) (toInteger (opposite x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (times2 z x) (times2 z y)) (times (|-2| x y) (P z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (times2 x y) (times2 x z)) (times2 x (plus y z)))))
(assert-claim
  (forall ((x Integer) (y Nat) (z Nat))
    (= (plus2 x (times x (|-2| y z))) (times x (|-2| (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (plus2 (|-2| x z) (|-2| y x2)) (|-2| (plus x y) (plus z x2)))))
(assert-claim
  (forall ((x Integer) (y Integer) (z Integer))
    (= (plus2 (times x y) (times x z)) (times x (plus2 y z)))))
(assert-claim
  (forall ((x Sign) (y Nat) (z Nat))
    (= (plus2 (toInteger x y) (toInteger x z))
      (toInteger x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (times (|-2| y x) (|-2| x2 z)) (times (|-2| x y) (|-2| z x2)))))
(assert-claim
  (forall ((x Integer) (y Integer))
    (= (times y (plus2 x (plus2 x x)))
      (times x (plus2 y (plus2 y y))))))
(assert-claim
  (forall ((x Integer) (y Integer) (z Integer))
    (= (times y (plus2 x (times x z)))
      (times x (plus2 y (times y z))))))
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
  (forall ((x Nat))
    (= (N (absVal (|-2| x (times2 x x))))
      (|-2| x (succ (times2 x x))))))
(assert-claim
  (forall ((x Nat) (y Sign) (z Nat))
    (= (absVal (plus2 (toInteger y x) (P z)))
      (absVal (plus2 (P x) (toInteger y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (sign (|-2| x (absVal (|-2| x y))))
      (sign (|-2| (plus x x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (sign (|-2| x (times2 y (succ x))))
      (sign (|-2| x (plus x y))))))
(assert-claim
  (forall ((x Nat))
    (= (sign (|-2| (succ x) (times2 x x)))
      (sign (|-2| (succ zero) x)))))
(assert-claim
  (forall ((x Nat)) (= (sign (|-2| (succ (times2 x x)) x)) Pos)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (sign (|-2| (times2 x (succ y)) y))
      (sign (|-2| (times2 x y) y)))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (sign (plus2 y (plus2 y (P x))))
      (sign (plus2 y (|-2| x (absVal y)))))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (sign (plus2 y (toInteger (sign y) x))) (sign y))))
(assert-claim
  (forall ((x Nat) (y Integer) (z Sign) (x2 Nat))
    (= (sign (times y (toInteger z (succ x))))
      (sign (times y (toInteger z (succ x2)))))))
(assert-claim
  (forall ((x Integer) (y Sign) (z Nat))
    (= (sign (times x (toInteger y (absVal x))))
      (sign (times x (toInteger y (succ z)))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (sign (times (|-2| x y) (P y))) (sign (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Integer))
    (= (times y (toInteger (opposite (sign y)) x))
      (|-2| zero (times2 x (absVal y))))))
(assert-claim
  (forall ((x Integer) (y Sign))
    (= (toInteger (timesSign y (sign x)) (absVal x))
      (times x (toInteger y (succ zero))))))
(assert-claim
  (forall ((x Integer))
    (= (N (absVal (plus2 x (N (absVal x)))))
      (plus2 x (N (succ (absVal x)))))))
(assert-claim
  (forall ((x Nat))
    (= (succ (times2 x (succ (succ (succ x)))))
      (plus x (times2 (succ x) (succ x))))))
(assert-claim
  (forall ((x Integer))
    (= (absVal (plus2 x (P (succ (absVal x)))))
      (succ (absVal (plus2 x (P (absVal x))))))))
(assert-claim
  (forall ((x Integer) (y Integer))
    (= (absVal (plus2 y (times x (N zero))))
      (absVal (plus2 x (times y (N zero)))))))
(assert-claim
  (forall ((x Nat))
    (= (plus x (absVal (|-2| x (succ zero))))
      (absVal (|-2| (succ zero) (plus x x))))))
(assert-claim
  (forall ((x Integer))
    (= (plus2 x (toInteger (sign x) (succ zero)))
      (toInteger (sign x) (succ (absVal x))))))
(assert-claim
  (forall ((x Integer))
    (= (sign (plus2 x (P (succ (absVal x))))) Pos)))
(assert-claim
  (forall ((x Integer)) (= (sign (times x (plus2 x (N zero)))) Pos)))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (absVal (|-2| x (succ zero))) x)
      (toInteger (sign (|-2| zero x)) (succ zero)))))
