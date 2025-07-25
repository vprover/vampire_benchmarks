(declare-datatype
  Bin
  ((One) (ZeroAnd (proj1-ZeroAnd Bin)) (OneAnd (proj1-OneAnd Bin))))
(define-fun-rec
  s
  ((x Bin)) Bin
  (match x
    ((One (ZeroAnd One))
     ((ZeroAnd xs) (OneAnd xs))
     ((OneAnd ys) (ZeroAnd (s ys))))))
(define-fun-rec
  plus
  ((x Bin) (y Bin)) Bin
  (match x
    ((One (s y))
     ((ZeroAnd z)
      (match y
        ((One (s (ZeroAnd z)))
         ((ZeroAnd ys) (ZeroAnd (plus z ys)))
         ((OneAnd xs) (OneAnd (plus z xs))))))
     ((OneAnd x2)
      (match y
        ((One (s (OneAnd x2)))
         ((ZeroAnd zs) (OneAnd (plus x2 zs)))
         ((OneAnd ys2) (ZeroAnd (s (plus x2 ys2))))))))))
(define-fun-rec
  times
  ((x Bin) (y Bin)) Bin
  (match x
    ((One y)
     ((ZeroAnd xs1) (ZeroAnd (times xs1 y)))
     ((OneAnd xs12) (plus (ZeroAnd (times xs12 y)) y)))))
(assert-not
  (forall ((x Bin) (y Bin) (z Bin))
    (= (times x (plus y z)) (plus (times x y) (times x z)))))
(assert-claim (= (s One) (ZeroAnd One)))
(assert-claim (forall ((x Bin) (y Bin)) (= (plus y x) (plus x y))))
(assert-claim (forall ((x Bin)) (= (plus x x) (ZeroAnd x))))
(assert-claim
  (forall ((x Bin) (y Bin)) (= (times y x) (times x y))))
(assert-claim (forall ((x Bin)) (= (s x) (plus x One))))
(assert-claim
  (forall ((x Bin)) (= (s (OneAnd x)) (ZeroAnd (s x)))))
(assert-claim (forall ((x Bin)) (= (s (ZeroAnd x)) (OneAnd x))))
(assert-claim (forall ((x Bin)) (= (times x One) x)))
(assert-claim
  (forall ((x Bin) (y Bin)) (= (plus y (s x)) (plus x (s y)))))
(assert-claim (forall ((x Bin)) (= (plus x (s x)) (OneAnd x))))
(assert-claim
  (forall ((x Bin) (y Bin)) (= (s (plus x y)) (plus x (s y)))))
(assert-claim
  (forall ((x Bin) (y Bin))
    (= (times x (ZeroAnd y)) (ZeroAnd (times x y)))))
(assert-claim
  (forall ((x Bin)) (= (plus x (ZeroAnd x)) (times x (OneAnd One)))))
(assert-claim
  (forall ((x Bin) (y Bin) (z Bin))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Bin) (y Bin))
    (= (plus x (times x y)) (times x (s y)))))
(assert-claim
  (forall ((x Bin) (y Bin) (z Bin))
    (= (times (times x y) z) (times x (times y z)))))
(assert-claim
  (forall ((x Bin) (y Bin))
    (= (plus x (times y (OneAnd x))) (plus y (times x (OneAnd y))))))
(assert-claim
  (forall ((x Bin) (y Bin) (z Bin))
    (= (plus (times x y) (times x z)) (times x (plus y z)))))
(assert-claim
  (forall ((x Bin) (y Bin))
    (= (plus x (times y (OneAnd (ZeroAnd x))))
      (plus y (times x (OneAnd (ZeroAnd y)))))))
(assert-claim
  (forall ((x Bin))
    (= (plus x (times (OneAnd x) (OneAnd x)))
      (times (OneAnd (ZeroAnd x)) (s x)))))
(assert-claim
  (forall ((x Bin))
    (= (s (times (OneAnd x) (s (s x)))) (times (OneAnd (s x)) (s x)))))
(assert-claim
  (forall ((x Bin))
    (= (times (plus x (OneAnd One)) (s x))
      (plus (OneAnd (OneAnd x)) (times x x)))))
(assert-claim
  (forall ((x Bin))
    (= (plus x (ZeroAnd (ZeroAnd (ZeroAnd (ZeroAnd x)))))
      (times x (OneAnd (ZeroAnd (ZeroAnd (ZeroAnd One))))))))
