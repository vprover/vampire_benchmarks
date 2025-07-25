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
    (= (times x (times y z)) (times (times x y) z))))
