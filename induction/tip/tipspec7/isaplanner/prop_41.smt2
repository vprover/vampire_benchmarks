(declare-sort sk 0)
(declare-sort fun1 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-fun apply1 (fun1 sk) sk)
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
  map2
  ((x fun1) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs) (cons (apply1 x z) (map2 x xs))))))
(assert-not
  (forall ((n Nat) (f fun1) (xs list))
    (= (take n (map2 f xs)) (map2 f (take n xs)))))
(assert-claim (forall ((z fun1)) (= (map2 z nil) nil)))
(assert-claim (forall ((y Nat)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take Z y) nil)))
(assert-claim
  (forall ((z fun1) (x2 Nat) (x3 list))
    (= (take x2 (map2 z x3)) (map2 z (take x2 x3)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((z fun1) (x2 sk))
    (= (map2 z (cons x2 nil)) (cons (apply1 z x2) nil))))
(assert-claim
  (forall ((y Nat) (z list)) (= (take y (take (S y) z)) (take y z))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list))
    (= (take (S z) (cons y x2)) (cons y (take z x2)))))
(assert-claim
  (forall ((z fun1) (x2 sk) (x3 list))
    (= (cons (apply1 z x2) (map2 z x3)) (map2 z (cons x2 x3)))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (take (S y) (take (S Z) z)) (take (S Z) z))))
