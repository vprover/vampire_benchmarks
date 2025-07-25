(declare-sort sk 0)
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(declare-datatype
  pair3 ((pair22 (proj1-pair2 Bool) (proj2-pair2 list))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun-rec
  count2
  ((x sk) (y list2)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x Nat) (y list)) Nat
  (match y
    ((nil zero)
     ((cons z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
(define-fun-rec
  bubble
  ((x list)) pair3
  (match x
    ((nil (pair22 false nil))
     ((cons y z)
      (match z
        ((nil (pair22 false (cons y nil)))
         ((cons y2 xs)
          (ite
            (leq y y2)
            (match (bubble (cons y2 xs))
              (((pair22 b12 ys12) (pair22 b12 (cons y ys12)))))
            (match (bubble (cons y xs))
              (((pair22 b1 ys1) (pair22 true (cons y2 ys1)))))))))))))
(define-fun-rec
  bubsort
  ((x list)) list
  (match (bubble x) (((pair22 c ys1) (ite c (bubsort ys1) x)))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not
  (forall ((x Nat) (xs list))
    (= (count x (bubsort xs)) (count x xs))))
(assert-claim (= (bubsort nil) nil))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim
  (forall ((x list)) (= (bubsort (bubsort x)) (bubsort x))))
(assert-claim (forall ((y sk)) (= (count2 y nil2) zero)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (bubsort y)) (count x y))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x Nat)) (= (bubsort (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (bubsort (cons zero x)) (cons zero (bubsort x)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (count2 y (cons2 y z)) (succ (count2 y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (leq x (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (plus y x) x) (leq y zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus y y) x) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (bubsort (cons x (bubsort y))) (bubsort (cons x y)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y nil2)) (count2 y (cons2 z nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus x y) zero) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (bubsort (cons z (cons y x2)))
        (bubsort (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (succ x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (succ x) (cons x y)) (count (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (count (succ y) (cons x z)) (count (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x) (= (count y (cons (succ x) z)) (count y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ x) (plus y x)) (leq (succ zero) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (succ x) (plus y y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ x)) (leq y (succ zero)))))
(assert-claim
  (forall ((x Nat))
    (= (bubsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (bubsort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list2))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (plus x x) y)) (count x (cons zero y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count x (cons (plus y x) nil)) (count y (cons zero nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count zero (cons (plus x x) y)) (count zero (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (plus x x) (cons zero y))
      (count (plus x x) (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count x (cons zero y))) (leq x (count x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count zero (cons x y))) (leq x (count zero y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ (succ x)) (plus y x)) (leq (succ (succ zero)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons y nil)) x) (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ (succ x))) (leq y (succ (succ zero))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (succ x) (cons (succ y) nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (succ (succ zero)) (plus x x)) (leq (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons zero nil)) y)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (plus x x) (succ (succ zero))) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (plus x (count x y)) zero)
      (leq (plus x (count zero y)) zero))))
