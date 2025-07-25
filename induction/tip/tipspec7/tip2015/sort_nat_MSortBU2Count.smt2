(declare-sort sk 0)
(declare-datatype list3 ((nil3) (cons3 (head3 sk) (tail3 list3))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list2 ((nil2) (cons2 (head2 Nat) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
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
  lmerge
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z x2)
      (match y
        ((nil2 (cons2 z x2))
         ((cons2 x3 x4)
          (ite
            (leq z x3) (cons2 z (lmerge x2 (cons2 x3 x4)))
            (cons2 x3 (lmerge (cons2 z x2) x4))))))))))
(define-fun-rec
  pairwise
  ((x list)) list
  (match x
    ((nil nil)
     ((cons xs y)
      (match y
        ((nil (cons xs nil))
         ((cons ys xss) (cons (lmerge xs ys) (pairwise xss)))))))))
(define-fun-rec
  mergingbu2
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons xs y)
      (match y
        ((nil xs)
         ((cons z x2) (mergingbu2 (pairwise (cons xs (cons z x2)))))))))))
(define-fun-rec
  risers
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y z)
      (match z
        ((nil2 (cons (cons2 y nil2) nil))
         ((cons2 y2 xs)
          (ite
            (leq y y2)
            (match (risers (cons2 y2 xs))
              ((nil nil)
               ((cons ys yss) (cons (cons2 y ys) yss))))
            (cons (cons2 y nil2) (risers (cons2 y2 xs)))))))))))
(define-fun
  msortbu2
  ((x list2)) list2 (mergingbu2 (risers x)))
(define-fun-rec
  count3
  ((x sk) (y list3)) Nat
  (match y
    ((nil3 zero)
     ((cons3 z ys)
      (ite (= x z) (plus (succ zero) (count3 x ys)) (count3 x ys))))))
(define-fun-rec
  count2
  ((x Nat) (y list2)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x list2) (y list)) Nat
  (match y
    ((nil zero)
     ((cons z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not
  (forall ((x Nat) (xs list2))
    (= (count2 x (msortbu2 xs)) (count2 x xs))))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu2 nil) nil2))
(assert-claim (= (risers nil2) nil))
(assert-claim (= (msortbu2 nil2) nil2))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y sk)) (= (count3 y nil3) zero)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim
  (forall ((x list)) (= (mergingbu2 (pairwise x)) (mergingbu2 x))))
(assert-claim
  (forall ((x list2)) (= (msortbu2 x) (mergingbu2 (risers x)))))
(assert-claim
  (forall ((x list2)) (= (msortbu2 (msortbu2 x)) (msortbu2 x))))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 x (msortbu2 y)) (count2 x y))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (mergingbu2 (cons x y)) (lmerge x (mergingbu2 y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (msortbu2 (lmerge y x)) (msortbu2 (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x list2)) (= (count nil2 (risers x)) zero)))
(assert-claim
  (forall ((x Nat)) (= (msortbu2 (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x list2))
    (= (msortbu2 (cons2 zero x)) (cons2 zero (msortbu2 x)))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list2))
    (= (pairwise (risers (msortbu2 x))) (risers (msortbu2 x)))))
(assert-claim
  (forall ((y sk) (z list3))
    (= (count3 y (cons3 y z)) (succ (count3 y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count (lmerge y x) z) (count (lmerge x y) z))))
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
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count3 z (cons3 y nil3)) (count3 y (cons3 z nil3)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (pairwise (risers x)))
      (count x (pairwise (risers y))))))
(assert-claim
  (forall ((x list2))
    (= (count x (pairwise (risers x))) (count x (risers x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count x (risers (msortbu2 y)))
      (count x (pairwise (risers y))))))
(assert-claim
  (forall ((x list2))
    (= (count (msortbu2 x) (risers x)) (count x (risers x)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus x y) zero) (leq y zero)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge x (cons2 zero y)) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 zero x) y) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (msortbu2 x) (msortbu2 y)) (msortbu2 (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (msortbu2 (cons2 x (msortbu2 y))) (msortbu2 (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq y x)
      (= (risers (cons2 y nil2)) (cons (cons2 y nil2) nil)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise (pairwise x))))
      (pairwise (pairwise (pairwise x))))))
(assert-claim
  (forall ((x list2))
    (= (pairwise (pairwise (pairwise (risers x))))
      (risers (msortbu2 x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (risers (mergingbu2 x))))
      (risers (msortbu2 (mergingbu2 x))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 x (cons2 (succ x) y)) (count2 x y))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 (succ x) (cons2 x y)) (count2 (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y)
      (= (count2 (succ y) (cons2 x z)) (count2 (succ y) z)))))
(assert-claim
  (forall ((x list2) (y list) (z list2))
    (= (count2 (count (msortbu2 x) y) z) (count2 (count x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq y x) (= (count2 y (cons2 (succ x) z)) (count2 y z)))))
(assert-claim
  (forall ((x list2)) (= (count x (risers (lmerge x x))) zero)))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count (cons2 x y) (risers y)) zero)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (cons2 x (mergingbu2 y)) y) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2) (x2 list))
    (=> (leq y x)
      (= (count (cons2 y (msortbu2 z)) x2) (count (cons2 y z) x2)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count (lmerge x x) (risers y)) zero)))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count (lmerge x (msortbu2 y)) z) (count (lmerge x y) z))))
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
  (forall ((x Nat) (y Nat) (z Nat) (x2 list2))
    (=> (leq z x)
      (= (msortbu2 (cons2 z (cons2 y x2)))
        (msortbu2 (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (msortbu2 (lmerge y (cons2 x z)))
      (msortbu2 (cons2 x (lmerge y z))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons (msortbu2 (cons2 x y)) nil)
      (risers (msortbu2 (cons2 x y))))))
(assert-claim
  (forall ((x list2)) (= (count x (risers (cons2 zero x))) zero)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((x Nat))
    (= (msortbu2 (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (msortbu2 (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairwise (cons x (risers (msortbu2 y))))
      (cons (lmerge x (msortbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x y))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (pairwise (risers (cons2 x (msortbu2 y))))
      (risers (msortbu2 (cons2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count nil2 (cons (msortbu2 x) nil))
      (count nil2 (cons x (risers y))))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list3))
    (= (count3 y (cons3 x2 (cons3 z x3)))
      (count3 y (cons3 z (cons3 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 x (cons2 (plus x x) y)) (count2 x (cons2 zero y)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list))
    (= (count (cons2 x (lmerge y y)) z)
      (count (cons2 x (msortbu2 y)) z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
(assert-claim
  (forall ((x list2) (y Nat) (z list2))
    (= (lmerge (cons2 y x) (cons2 y z))
      (cons2 y (lmerge x (cons2 y z))))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (plus (count2 x y) (count2 x z)) (count2 x (lmerge y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count x (cons (msortbu2 y) z)) (count x (cons y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count3 z (cons3 y (cons3 y nil3)))
      (count3 y (cons3 z (cons3 z nil3))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count2 x (cons2 (plus y x) nil2))
      (count2 y (cons2 zero nil2)))))
(assert-claim
  (forall ((x list) (y list2))
    (= (count2 (succ (succ (count y x))) y)
      (count2 (succ (succ zero)) y))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 zero (cons2 (plus x x) y)) (count2 zero (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (count2 (count x (pairwise (risers y))) z)
      (count2 (count x (risers y)) z))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 (plus x x) (cons2 zero y))
      (count2 (plus x x) (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (cons x (pairwise (risers y))))
      (count y (cons x (risers y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (cons x (pairwise (risers x))))
      (count x (cons y (pairwise (risers y)))))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (count x (cons y (risers (msortbu2 z))))
      (count x (cons y (pairwise (risers z)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (cons (cons2 zero x) y)) (count x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (cons (lmerge y x) nil))
      (count nil2 (cons x (risers y))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count x (cons (msortbu2 y) (pairwise z)))
      (count x (cons y (pairwise z))))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (count x (cons (msortbu2 y) (risers z)))
      (count x (cons y (risers z))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count x (pairwise (cons x (risers x))))
      (count nil2 (cons x (risers y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (pairwise (risers (lmerge y x))))
      (count (lmerge y x) (risers y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count y (risers (cons2 x (msortbu2 y))))
      (count y (risers (cons2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (risers (lmerge y (msortbu2 x))))
      (count (lmerge y x) (risers y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count y (risers (lmerge x (msortbu2 y))))
      (count y (risers (lmerge x y))))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (count x (risers (lmerge (msortbu2 z) y)))
      (count x (risers (lmerge y (msortbu2 z)))))))
(assert-claim
  (forall ((x Nat) (y list2) (z list))
    (= (count (cons2 x y) (pairwise (pairwise z)))
      (count (cons2 x y) (pairwise z)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list))
    (= (count (cons2 (succ x) y) (pairwise z))
      (count (cons2 (succ x) y) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (cons2 zero x) (cons x y)) (count (cons2 zero x) y))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count nil2 (cons (lmerge y x) z))
      (count nil2 (cons (lmerge x y) z)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil2 (cons (lmerge x x) y))
      (count nil2 (cons (msortbu2 x) y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count (msortbu2 x) (cons (msortbu2 y) z))
      (count x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (leq x (count2 x (cons2 zero y))) (leq x (count2 x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (leq x (count2 zero (cons2 x y))) (leq x (count2 zero y)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (leq x (count z (risers y)))
      (leq x (count y (pairwise (risers z)))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ (succ x)) (plus y x)) (leq (succ (succ zero)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count2 x (cons2 y nil2)) x)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x list2) (y list2) (z Nat))
    (leq (count x (risers y)) (succ z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ (succ x))) (leq y (succ (succ zero))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count2 (succ x) (cons2 (succ y) nil2))
      (count2 x (cons2 y nil2)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count nil2 (cons (lmerge y x) nil))
      (count x (cons (lmerge y y) nil)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count nil2 (pairwise (cons y (risers x))))
      (count x (cons (lmerge y y) nil)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil2 (pairwise (cons (msortbu2 x) y)))
      (count nil2 (pairwise (cons x y))))))
(assert-claim
  (forall ((x Nat))
    (= (leq (succ (succ zero)) (plus x x)) (leq (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count2 x (cons2 zero nil2)) y)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (plus x x) (succ (succ zero))) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (leq (plus x (count2 x y)) zero)
      (leq (plus x (count2 zero y)) zero))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairwise (cons (cons2 zero x) (risers y)))
      (pairwise (cons x (risers (cons2 zero y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (cons x (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairwise (pairwise (cons x (pairwise (risers y)))))
      (cons (lmerge x (msortbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil2 (cons (cons2 zero nil2) y))
      (count nil2 (cons (cons2 zero x) y)))))
