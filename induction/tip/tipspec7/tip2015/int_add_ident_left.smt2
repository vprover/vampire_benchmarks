(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype Integer ((P (proj1-P Nat)) (N (proj1-N Nat))))
(define-fun
  zero2
  () Integer (P zero))
(define-fun-rec
  plus2
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus2 z y))))))
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
  plus
  ((x Integer) (y Integer)) Integer
  (match x
    (((P m)
      (match y
        (((P n) (P (plus2 m n)))
         ((N o) (|-2| m (plus2 (succ zero) o))))))
     ((N m2)
      (match y
        (((P n2) (|-2| n2 (plus2 (succ zero) m2)))
         ((N n3) (N (plus2 (plus2 (succ zero) m2) n3)))))))))
(assert-not (forall ((x Integer)) (= x (plus zero2 x))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus2 x (plus2 y z)) (plus2 (plus2 x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus2 x y) (plus2 y x))))
(assert (forall ((x Nat)) (= (plus2 x zero) x)))
(assert (forall ((x Nat)) (= (plus2 zero x) x)))
(assert-claim (= zero2 (P zero)))
(assert-claim (forall ((x Nat)) (= (|-2| x x) zero2)))
(assert-claim
  (forall ((x Integer) (y Integer)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus2 y x) (plus2 x y))))
(assert-claim (forall ((x Nat)) (= (|-2| x zero) (P x))))
(assert-claim (forall ((x Integer)) (= (plus x zero2) x)))
(assert-claim (forall ((x Nat)) (= (plus2 x zero) x)))
(assert-claim (forall ((x Nat)) (= (|-2| x (succ x)) (N zero))))
(assert-claim
  (forall ((x Nat)) (= (|-2| (succ x) x) (P (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus2 x (succ y)) (succ (plus2 x y)))))
(assert-claim (forall ((x Nat)) (= (|-2| zero (succ x)) (N x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| x (plus2 y x)) (|-2| zero y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (plus2 y x) x) (P y))))
(assert-claim
  (forall ((x Integer) (y Integer) (z Integer))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus2 (plus2 x y) z) (plus2 x (plus2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (succ x) (succ y)) (|-2| x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus (N x) (N y)) (N (succ (plus2 x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (succ x)) (plus (N x) (P y)))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| x (succ (succ (succ x)))) (N (succ (succ zero))))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (succ (succ (succ x))) x) (P (succ (succ (succ zero)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (= (plus (|-2| x z) (|-2| y x2)) (|-2| (plus2 x y) (plus2 z x2)))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| x (succ (succ (succ (succ x)))))
      (N (succ (succ (succ zero)))))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (succ (succ (succ (succ x)))) x)
      (P (succ (succ (succ (succ zero))))))))
