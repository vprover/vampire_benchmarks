(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype list ((nil) (cons (head pair) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  zip
  ((x list2) (y list2)) list
  (match x
    ((nil2 nil)
     ((cons2 z x2)
      (match y
        ((nil2 nil)
         ((cons2 x3 x4) (cons (pair2 z x3) (zip x2 x4)))))))))
(define-fun-rec
  take2
  ((x Nat) (y list2)) list2
  (match x
    ((Z nil2)
     ((S z)
      (match y
        ((nil2 nil2)
         ((cons2 x2 x3) (cons2 x2 (take2 z x3)))))))))
(define-fun-rec
  take
  ((x Nat) (y list)) list
  (match x
    ((Z nil)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (cons x2 (take z x3)))))))))
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
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((xs list2) (ys list2) (zs list2))
    (= (zip xs (++2 ys zs))
      (++ (zip (take2 (len2 ys) xs) ys) (zip (drop2 (len2 ys) xs) zs)))))
(assert-claim (= (len2 nil2) Z))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((y Nat)) (= (drop2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 Z y) y)))
(assert-claim (forall ((y Nat)) (= (take2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (take2 Z y) nil2)))
(assert-claim (forall ((y list2)) (= (zip y nil2) nil)))
(assert-claim (forall ((y list2)) (= (zip nil2 y) nil)))
(assert-claim (forall ((y list2)) (= (drop2 (len2 y) y) nil2)))
(assert-claim
  (forall ((y list2) (z list2))
    (= (len2 (++2 z y)) (len2 (++2 y z)))))
(assert-claim
  (forall ((y sk) (z list2)) (= (len2 (cons2 y z)) (S (len2 z)))))
(assert-claim
  (forall ((z list2) (x2 list2))
    (= (len (zip x2 z)) (len (zip z x2)))))
(assert-claim (forall ((y list2)) (= (len (zip y y)) (len2 y))))
(assert-claim (forall ((y list2)) (= (take2 (len2 y) y) y)))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 z (drop2 y x2)) (drop2 y (drop2 z x2)))))
(assert-claim
  (forall ((y Nat) (z list2)) (= (drop2 y (take2 y z)) nil2)))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (take2 z (take2 y x2)) (take2 y (take2 z x2)))))
(assert-claim
  (forall ((y Nat) (z list2)) (= (take2 y (take2 y z)) (take2 y z))))
(assert-claim
  (forall ((y list2) (z list2)) (= (zip z (++2 z y)) (zip z z))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (zip x2 (take2 z x3)) (take z (zip x2 x3)))))
(assert-claim
  (forall ((y list2) (z list2)) (= (zip (++2 z y) z) (zip z z))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (zip (take2 z x2) x3) (take z (zip x2 x3)))))
(assert-claim (forall ((y list2)) (= (drop2 (S (len2 y)) y) nil2)))
(assert-claim
  (forall ((z list2) (x2 list2))
    (= (len2 (take2 (len2 z) x2)) (len (zip z x2)))))
(assert-claim (forall ((y list2)) (= (take2 (S (len2 y)) y) y)))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 (S z) (cons2 y x2)) (drop2 z x2))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 (S y) (drop2 z x2)) (drop2 y (drop2 (S z) x2)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (drop2 (len2 y) (++2 y z)) (take2 (len2 z) z))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 (len2 (take2 y z)) z) (drop2 y z))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (len (drop z (zip x3 x2))) (len (drop z (zip x2 x3))))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (len (drop y (zip z z))) (len2 (drop2 y z)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (len (zip z (drop2 y z))) (len2 (drop2 y z)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (take2 y (take2 (S y) z)) (take2 y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (take2 (S z) (cons2 y x2)) (cons2 y (take2 z x2)))))
(assert-claim
  (forall ((y list2) (z list2)) (= (take2 (len2 z) (++2 z y)) z)))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (take2 (len2 z) (drop2 y z)) (drop2 y z))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (take2 (len2 (take2 z x2)) x3) (take2 z (take2 (len2 x2) x3)))))
(assert-claim
  (forall ((y list2))
    (= (drop2 (S Z) (++2 y y)) (++2 (drop2 (S Z) y) y))))
(assert-claim
  (forall ((z pair) (x2 Nat) (x3 sk))
    (= (len (drop x2 (cons z nil)))
      (len2 (drop2 x2 (cons2 x3 nil2))))))
(assert-claim
  (forall ((z pair) (x2 Nat) (x3 sk))
    (= (len (take x2 (cons z nil)))
      (len2 (take2 x2 (cons2 x3 nil2))))))
(assert-claim
  (forall ((y list2)) (= (take2 (S Z) (++2 y y)) (take2 (S Z) y))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 y (take2 (S y) z)) (take2 (S Z) (drop2 y z)))))
(assert-claim
  (forall ((y Nat) (z list2)) (= (++2 (take2 y z) (drop2 y z)) z)))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 y (++2 z (drop2 y z))) (++2 (drop2 y z) (drop2 y z)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 y (drop2 y (++2 z z))) (drop2 y (++2 (drop2 y z) z)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 z (drop2 z (cons2 y x2)))
      (drop2 z (cons2 y (drop2 z x2))))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (take2 y (++2 z (drop2 y z))) (take2 y z))))
(assert-claim
  (forall ((y Nat) (z list2) (x2 list2))
    (= (take2 y (++2 z (take2 y x2))) (take2 y (++2 z x2)))))
(assert-claim
  (forall ((y Nat) (z list2) (x2 list2))
    (= (take2 y (++2 (take2 y z) x2)) (take2 y (++2 z x2)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (zip x2 (++2 z (++2 x2 y))) (zip x2 (++2 z x2)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (zip (++2 y z) (++2 y x2)) (++ (zip y y) (zip z x2)))))
(assert-claim
  (forall ((y list2) (z Nat) (x2 list2))
    (= (zip (++2 x2 y) (drop2 z x2)) (zip x2 (drop2 z x2)))))
(assert-claim
  (forall ((z sk) (x2 sk) (x3 list2) (x4 list2))
    (= (zip (cons2 z x3) (cons2 x2 x4))
      (cons (pair2 z x2) (zip x3 x4)))))
(assert-claim
  (forall ((y list2) (z Nat) (x2 list2))
    (= (zip (drop2 z x2) (++2 x2 y)) (zip (drop2 z x2) x2))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (zip (drop2 z x2) (drop2 z x3)) (drop z (zip x2 x3)))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (drop2 (S (len2 y)) (++2 y z)) (drop2 (S Z) z))))
(assert-claim
  (forall ((z list2) (x2 list2) (x3 list2))
    (= (drop2 (len2 z) (drop2 (len2 x2) x3))
      (drop2 (len2 (++2 z x2)) x3))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (len2 (++2 z (drop2 (len2 z) y)))
      (len2 (++2 y (drop2 (len2 y) z))))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (len2 (++2 y (take2 (len2 x2) z)))
      (len2 (++2 y (take2 (len2 z) x2))))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 list2))
    (= (len2 (drop2 z (take2 (len2 x2) x3)))
      (len (drop z (zip x2 x3))))))
(assert-claim
  (forall ((z list2) (x2 list2) (x3 list2))
    (= (len2 (drop2 (len2 z) (++2 x3 x2)))
      (len2 (drop2 (len2 z) (++2 x2 x3))))))
(assert-claim
  (forall ((z sk) (x2 list2) (x3 sk) (x4 list2))
    (= (len2 (drop2 (len2 x2) (cons2 z x4)))
      (len2 (drop2 (len2 x2) (cons2 x3 x4))))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 sk))
    (= (take2 z (drop2 y (cons2 x2 nil2)))
      (drop2 y (take2 z (cons2 x2 nil2))))))
(assert-claim
  (forall ((y list2) (z list2))
    (= (take2 (S (len2 y)) (++2 y z)) (++2 y (take2 (S Z) z)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (take2 (S (len2 (take2 y z))) z) (take2 (S y) z))))
(assert-claim
  (forall ((z Nat) (x2 list2) (x3 sk))
    (= (zip x2 (drop2 z (cons2 x3 nil2)))
      (drop z (zip x2 (cons2 x3 nil2))))))
(assert-claim
  (forall ((z list2) (x2 sk))
    (= (zip (++2 z z) (cons2 x2 nil2)) (zip z (cons2 x2 nil2)))))
(assert-claim
  (forall ((z sk) (x2 list2))
    (= (zip (cons2 z nil2) (++2 x2 x2)) (zip (cons2 z nil2) x2))))
(assert-claim
  (forall ((z Nat) (x2 sk) (x3 list2))
    (= (zip (drop2 z (cons2 x2 nil2)) x3)
      (drop z (zip (cons2 x2 nil2) x3)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 (S Z) (take2 (S y) z)) (take2 y (drop2 (S Z) z)))))
(assert-claim
  (forall ((y Nat) (z list2))
    (= (drop2 y (take2 (S (S y)) z)) (take2 (S (S Z)) (drop2 y z)))))
