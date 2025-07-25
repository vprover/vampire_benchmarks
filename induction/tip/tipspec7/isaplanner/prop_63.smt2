(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  len2
  ((x list2)) Nat
  (match x
    ((nil2 Z)
     ((cons2 y xs) (S (len2 xs))))))
(define-fun-rec
  len
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (len xs))))))
(define-fun-rec
  last
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y z)
      (match z
        ((nil y)
         ((cons x2 x3) (last (cons x2 x3)))))))))
(define-fun-rec
  drop2
  ((x Nat) (y list2)) list2
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil2 nil2)
         ((cons2 x2 x3) (drop2 z x3))))))))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (drop z x3))))))))
(define-fun-rec
  <2
  ((x Nat) (y Nat)) Bool
  (match y
    ((Z false)
     ((S z)
      (match x
        ((Z true)
         ((S x2) (<2 x2 z))))))))
(assert-not
  (forall ((n Nat) (xs list))
    (=> (<2 n (len xs)) (= (last (drop n xs)) (last xs)))))
(assert-claim (= (len2 nil2) Z))
(assert-claim (= (last nil) Z))
(assert-claim (forall ((x Nat)) (not (<2 x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x y)))))
(assert-claim (forall ((x Nat)) (not (<2 x Z))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 Z y))))
(assert-claim (forall ((y Nat)) (= (drop2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 Z y) y)))
(assert-claim (forall ((x Nat)) (<2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x (S y))))))
(assert-claim (forall ((y list2)) (= (drop2 (len2 y) y) nil2)))
(assert-claim
  (forall ((y sk) (z list2)) (= (len2 (cons2 y z)) (S (len2 z)))))
(assert-claim (forall ((x Nat)) (= (last (cons x nil)) x)))
(assert-claim (forall ((x list)) (= (last (cons Z x)) (last x))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 z (drop2 y x2)) (drop2 y (drop2 z x2)))))
(assert-claim
  (forall ((y Nat) (z sk) (x2 Nat) (x3 sk) (x4 list2))
    (=> (<2 y x2)
      (= (drop2 x2 (cons2 z x4)) (drop2 x2 (cons2 x3 x4))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<2 (S x) (S y)) (<2 x y))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 sk))
    (=> (<2 y z) (= (drop2 z (cons2 x2 nil2)) nil2))))
(assert-claim (forall ((y list2)) (= (drop2 (S (len2 y)) y) nil2)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop x (cons Z y)) (drop x (cons x y)))))
(assert-claim
  (forall ((x list)) (= (last (cons (last x) x)) (last x))))
(assert-claim
  (forall ((x list)) (= (last (cons (len x) x)) (last x))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (<2 x (last (cons x y))) (<2 x (last y)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 Nat) (x3 list2))
    (=> (<2 x2 y)
      (= (<2 x2 (len2 (drop2 z x3))) (<2 z (len2 (drop2 x2 x3)))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<2 x y) (= (<2 y (last (cons x z))) (<2 y (last z))))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (=> (<2 x z) (= (<2 (last (cons x y)) z) (<2 (last y) z)))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (=> (<2 z x)
      (= (<2 (last (cons x y)) z) (<2 (last (cons z y)) z)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 Nat) (x3 list2))
    (=> (<2 x2 y)
      (= (drop2 x2 (drop2 (S z) x3)) (drop2 z (drop2 (S x2) x3))))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 (S z) (cons2 y x2)) (drop2 z x2))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop (last (cons x y)) y) (drop (last y) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (last (cons x (cons y z))) (last (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 list))
    (=> (<2 y x)
      (= (len (drop z (cons y x3))) (len (drop z (cons x2 x3)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop (len y) (cons x y)) (cons (last (cons x y)) nil))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop x (cons (S x) y)) (drop x (cons (S Z) y)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (last x)) x)) (last (cons (S Z) x)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (len x)) x)) (last (cons (S Z) x)))))
(assert-claim
  (forall ((x Nat)) (= (last (drop x (cons x nil))) Z)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 sk))
    (= (len (drop z (cons y nil))) (len2 (drop2 z (cons2 x2 nil2))))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 z (drop2 z (cons2 y x2)))
      (drop2 z (cons2 y (drop2 z x2))))))
(assert-claim
  (forall ((x Nat) (y list)) (not (<2 (last y) (last (drop x y))))))
(assert-claim
  (forall ((x Nat) (y list)) (not (<2 (last (cons x y)) (last y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (drop (len x) (cons (last x) y)) (drop (len x) (cons Z y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (cons (last y) (drop x y))) (last y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (cons (last (cons x y)) y)) (last (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (cons (last (drop x y)) y)) (last y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (cons (len (drop x y)) y)) (last y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (drop x (cons (last y) y))) (last (drop x (cons x y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (drop x (cons (len y) y))) (last (drop x (cons x y))))))
(assert-claim
  (forall ((z sk) (x2 list2) (x3 sk) (x4 list2))
    (= (len2 (drop2 (len2 x2) (cons2 z x4)))
      (len2 (drop2 (len2 x2) (cons2 x3 x4))))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (len2 (drop2 (len2 z) (cons2 y z))) (S Z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (<2 x z)
      (= (<2 Z (last (cons (S y) x2))) (<2 Z (last (cons z x2)))))))
(assert-claim
  (forall ((y list2) (z Nat))
    (= (<2 (len2 (drop2 z y)) (S Z)) (<2 (len2 y) (S z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop x (cons (S (S x)) y)) (drop x (cons (S (S Z)) y)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (S (last x))) x)) (last (cons (S (S Z)) x)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (S (len x))) x)) (last (cons (S (S Z)) x)))))
(assert-claim
  (forall ((y Nat) (z sk))
    (= (last (drop y (cons (S y) nil)))
      (len2 (drop2 y (cons2 z nil2))))))
