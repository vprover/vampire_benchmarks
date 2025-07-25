(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype
  pair3 ((pair22 (proj1-pair2 sk) (proj2-pair2 sk))))
(declare-datatype list ((nil3) (cons3 (head3 sk) (tail3 list))))
(declare-datatype
  list3 ((nil2) (cons2 (head2 list) (tail2 list3))))
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair list))))
(declare-datatype list2 ((nil) (cons (head pair) (tail list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-fun lam (list sk) fun13)
(declare-fun lam2 (fun12) fun13)
(declare-fun lam3 (fun12) fun13)
(declare-fun lam4 (fun12) fun13)
(declare-fun lam5 (fun12) fun13)
(declare-fun lam6 (fun12) fun13)
(declare-fun lam7 (fun12) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(declare-fun apply13 (fun13 list) Bool)
(define-fun-rec
  select2
  ((x sk) (y list2)) list2
  (match y
    ((nil nil)
     ((cons z x2)
      (match z
        (((pair2 y2 ys)
          (cons (pair2 y2 (cons3 x ys)) (select2 x x2)))))))))
(define-fun-rec
  select22
  ((x list)) list2
  (match x
    ((nil3 nil)
     ((cons3 y xs) (cons (pair2 y xs) (select2 y (select22 xs)))))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  formula
  ((x list2)) list3
  (match x
    ((nil nil2)
     ((cons y z)
      (match y (((pair2 y2 ys) (cons2 (cons3 y2 ys) (formula z)))))))))
(define-fun-rec
  count2
  ((x sk) (y list)) Nat
  (match y
    ((nil3 zero)
     ((cons3 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x list) (y list3)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
(define-fun-rec
  all2
  ((q fun12) (x list)) Bool
  (match x
    ((nil3 true)
     ((cons3 y xs) (and (apply12 q y) (all2 q xs))))))
(define-fun-rec
  all
  ((q fun13) (x list3)) Bool
  (match x
    ((nil2 true)
     ((cons2 y xs) (and (apply13 q y) (all q xs))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert
  (forall ((xs list) (z sk) (x list))
    (= (apply13 (lam xs z) x) (= (count2 z xs) (count2 z x)))))
(assert
  (forall ((y fun12) (x2 list))
    (= (apply13 (lam2 y) x2) (all2 y x2))))
(assert
  (forall ((y fun12) (x2 list))
    (= (apply13 (lam3 y) x2) (all2 y x2))))
(assert
  (forall ((y fun12) (x3 list))
    (= (apply13 (lam4 y) x3) (all2 y x3))))
(assert
  (forall ((y fun12) (x2 list))
    (= (apply13 (lam5 y) x2) (all2 y x2))))
(assert
  (forall ((z fun12) (x3 list))
    (= (apply13 (lam6 z) x3) (all2 z x3))))
(assert
  (forall ((z fun12) (x4 list))
    (= (apply13 (lam7 z) x4) (all2 z x4))))
(assert-not
  (forall ((xs list) (z sk))
    (all (lam xs z) (formula (select22 xs)))))
(assert-claim (= (select22 nil3) nil))
(assert-claim (= (formula nil) nil2))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y fun12)) (all2 y nil3)))
(assert-claim (forall ((y sk)) (= (count2 y nil3) zero)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((y sk)) (= (select2 y nil) nil)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((y list2)) (= (count nil3 (formula y)) zero)))
(assert-claim
  (forall ((y sk) (z list))
    (= (count2 y (cons3 y z)) (succ (count2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons3 y nil3)) (count2 y (cons3 z nil3)))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list) (x3 list))
    (=> (all2 y x3)
      (=> (all2 z x2)
        (= (count x3 (formula (select22 x2)))
          (count x2 (formula (select22 x3))))))))
(assert-claim
  (forall ((y sk))
    (= (formula (select22 (cons3 y nil3)))
      (cons2 (cons3 y nil3) nil2))))
(assert-claim
  (forall ((y list) (z fun12) (x2 sk))
    (=> (all2 z y) (= (all2 z (cons3 x2 y)) (apply12 z x2)))))
(assert-claim
  (forall ((y list) (z fun12) (x2 sk))
    (=> (all2 z y) (= (all2 z (cons3 x2 nil3)) (apply12 z x2)))))
(assert-claim
  (forall ((y list) (z sk) (x2 list2))
    (= (count y (formula (select2 z x2))) zero)))
(assert-claim
  (forall ((y list2) (z list))
    (= (count nil3 (cons2 z (formula y)))
      (count z (cons2 nil3 nil2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (all (lam2 y) (cons2 z nil2)) (all2 y z))))
(assert-claim
  (forall ((y fun12) (z list3))
    (= (all (lam3 y) (cons2 nil3 z)) (all (lam4 y) z))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (all (lam5 y) (formula (select22 z))) (all2 y z))))
(assert-claim
  (forall ((y list) (z fun12) (x2 list3))
    (=> (all2 z y) (= (all (lam6 z) (cons2 y x2)) (all (lam7 z) x2)))))
(assert-claim
  (forall ((y fun12) (z sk) (x2 sk) (x3 list))
    (= (all2 y (cons3 x2 (cons3 z x3)))
      (all2 y (cons3 z (cons3 x2 x3))))))
(assert-claim
  (forall ((y fun12) (z sk) (x2 list))
    (= (all2 y (cons3 z (cons3 z x2))) (all2 y (cons3 z x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (count2 y (cons3 x2 (cons3 z x3)))
      (count2 y (cons3 z (cons3 x2 x3))))))
(assert-claim
  (forall ((y sk) (z list) (x2 list3))
    (= (count z (cons2 (cons3 y z) x2)) (count z x2))))
(assert-claim
  (forall ((y sk) (z list) (x2 list3))
    (= (count (cons3 y z) (cons2 z x2)) (count (cons3 y z) x2))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list) (x3 list3))
    (= (count (cons3 y (cons3 z x2)) x3) zero)))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons3 y (cons3 y nil3)))
      (count2 y (cons3 z (cons3 z nil3))))))
(assert-claim
  (forall ((y list) (z list))
    (= (count z (cons2 y (formula (select22 y))))
      (count y (cons2 z (formula (select22 z)))))))
(assert-claim
  (forall ((y list) (z list))
    (= (count z (cons2 z (formula (select22 y))))
      (count y (cons2 y (formula (select22 z)))))))
(assert-claim
  (forall ((y list) (z sk) (x2 list))
    (= (count y (formula (select22 (cons3 z x2))))
      (count y (cons2 (cons3 z x2) nil2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list3))
    (= (count (cons3 y z) (cons2 nil3 x2)) (count (cons3 y z) x2))))
(assert-claim
  (forall ((y sk) (z list) (x2 list3))
    (= (count nil3 (cons2 (cons3 y z) x2)) (count nil3 x2))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (cons2 (cons3 z (cons3 y nil3)) nil2)
      (formula (select2 y (select22 (cons3 z nil3)))))))
