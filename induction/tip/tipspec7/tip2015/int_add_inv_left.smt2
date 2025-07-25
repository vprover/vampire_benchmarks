(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype Integer ((P (proj1-P Nat)) (N (proj1-N Nat))))
(define-fun
  zero2
  () Integer (P zero))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun
  neg
  ((x Integer)) Integer
  (match x
    (((P y)
      (match y
        ((zero (P zero))
         ((succ z) (N z)))))
     ((N n) (P (plus (succ zero) n))))))
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
(assert-not (forall ((x Integer)) (= (plus2 (neg x) x) zero2)))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-claim (= zero2 (P zero)))
(assert-claim (= (neg zero2) zero2))
(assert-claim (forall ((x Nat)) (= (|-2| x x) zero2)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x Integer) (y Integer)) (= (plus2 y x) (plus2 x y))))
(assert-claim (forall ((x Nat)) (= (|-2| x zero) (P x))))
(assert-claim (forall ((x Nat)) (= (plus (succ zero) x) (succ x))))
(assert-claim (forall ((x Nat)) (= (|-2| zero x) (neg (P x)))))
(assert-claim (forall ((x Integer)) (= (neg (neg x)) x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x Integer)) (= (plus2 x zero2) x)))
(assert-claim (forall ((x Nat)) (= (|-2| x (succ x)) (N zero))))
(assert-claim
  (forall ((x Nat)) (= (|-2| (succ x) x) (P (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (neg (|-2| y x)) (|-2| x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim (forall ((x Integer)) (= (plus2 x (neg x)) zero2)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| x (plus y x)) (|-2| zero y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Integer) (y Integer) (z Integer))
    (= (plus2 (plus2 x y) z) (plus2 x (plus2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (succ x) (succ y)) (|-2| x y))))
(assert-claim
  (forall ((x Integer) (y Integer))
    (= (neg (plus2 y (neg x))) (plus2 x (neg y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (plus2 (N x) (N y)) (N (succ (plus x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (succ x)) (plus2 (N x) (P y)))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| x (succ (succ (succ (succ x)))))
      (N (succ (succ (succ zero)))))))
