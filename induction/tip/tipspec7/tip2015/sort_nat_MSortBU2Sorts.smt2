(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list2 ((nil2) (cons2 (head2 Nat) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
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
  ordered
  ((x list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 y z)
      (match z
        ((nil2 true)
         ((cons2 y2 xs) (and (leq y y2) (ordered (cons2 y2 xs))))))))))
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
(assert-not (forall ((xs list2)) (ordered (msortbu2 xs))))
(assert-claim (ordered nil2))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu2 nil) nil2))
(assert-claim (= (risers nil2) nil))
(assert-claim (= (msortbu2 nil2) nil2))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (msortbu2 x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y) (=> (ordered x) (= (lmerge y x) (lmerge x y))))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim
  (forall ((x list)) (= (mergingbu2 (pairwise x)) (mergingbu2 x))))
(assert-claim
  (forall ((x list2)) (= (msortbu2 x) (mergingbu2 (risers x)))))
(assert-claim
  (forall ((x list2)) (= (msortbu2 (msortbu2 x)) (msortbu2 x))))
(assert-claim (forall ((x list2)) (ordered (msortbu2 x))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x) (= (pairwise (risers x)) (risers x)))))
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
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (msortbu2 (lmerge x y)) (lmerge (msortbu2 x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (lmerge y x)) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x list2)) (= (ordered (lmerge x x)) (ordered x))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x) (= (ordered (lmerge y x)) (ordered y)))))
(assert-claim
  (forall ((x Nat)) (= (msortbu2 (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x list2))
    (= (msortbu2 (cons2 zero x)) (cons2 zero (msortbu2 x)))))
(assert-claim
  (forall ((x list2)) (= (ordered (cons2 zero x)) (ordered x))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge x (cons2 zero y)) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (=> (ordered y)
      (= (msortbu2 (cons2 x y)) (lmerge (cons2 x nil2) y)))))
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
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (pairwise (cons x (risers y))) (cons (lmerge x y) nil)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (=> (ordered y)
      (= (risers (msortbu2 (cons2 x y)))
        (pairwise (risers (cons2 x y)))))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x)
      (= (risers (cons2 zero x)) (cons (cons2 zero x) nil)))))
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
    (= (ordered (cons2 x (cons2 x y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (ordered (cons2 x (lmerge z y)))
      (ordered (cons2 x (lmerge y z))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (cons2 x (lmerge y y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y)
      (= (ordered (cons2 x (cons2 y z))) (ordered (cons2 y z))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (lmerge y (cons2 x y))) (ordered (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (ordered (lmerge x (lmerge z y)))
      (ordered (lmerge x (lmerge y z))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (lmerge x (lmerge x y))) (ordered (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons (msortbu2 (cons2 x y)) nil)
      (risers (msortbu2 (cons2 x y))))))
(assert-claim
  (forall ((x Nat))
    (= (msortbu2 (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (msortbu2 (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq x y) (ordered (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x list2) (y Nat))
    (=> (ordered x)
      (= (ordered (cons2 y (cons2 zero x))) (leq y zero)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x y))))
      (pairwise (pairwise (cons x (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y Nat) (z list2))
    (= (lmerge (cons2 y x) (cons2 y z))
      (cons2 y (lmerge x (cons2 y z))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (cons2 x (lmerge y (msortbu2 y))))
      (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (cons2 x (msortbu2 (cons2 x y))))
      (ordered (cons2 x (msortbu2 y))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (not (ordered (cons2 (succ x) (cons2 x y))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (ordered (lmerge y (cons2 x (msortbu2 y))))
      (ordered (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (not (ordered (cons2 (succ x) (cons2 zero y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairwise (cons (cons2 zero x) (risers y)))
      (pairwise (cons x (risers (cons2 zero y)))))))
