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
  insert2
  ((x Nat) (y list2)) list2
  (match y
    ((nil2 (cons2 x nil2))
     ((cons2 z xs)
      (ite (leq x z) (cons2 x (cons2 z xs)) (cons2 z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (insert2 y (isort xs))))))
(assert-not (forall ((xs list2)) (= (msortbu2 xs) (isort xs))))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu2 nil) nil2))
(assert-claim (= (risers nil2) nil))
(assert-claim (= (isort nil2) nil2))
(assert-claim (forall ((x list2)) (= (isort x) (msortbu2 x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x Nat)) (= (insert2 x nil2) (cons2 x nil2))))
(assert-claim
  (forall ((x list2)) (= (insert2 zero x) (cons2 zero x))))
(assert-claim (forall ((x list2)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim
  (forall ((x list)) (= (mergingbu2 (pairwise x)) (mergingbu2 x))))
(assert-claim
  (forall ((x list2)) (= (isort x) (mergingbu2 (risers x)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (isort (cons2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge y x)) (isort (lmerge x y)))))
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
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list2))
    (= (pairwise (risers (isort x))) (risers (isort x)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 x (cons2 x y)) (cons2 x (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y) (= (insert2 x (cons2 y z)) (cons2 x (cons2 y z))))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (lmerge (insert2 x y) z) (insert2 x (lmerge y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge x (isort y))) (isort (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge x (cons2 zero y)) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (isort x) (isort y)) (isort (lmerge x y)))))
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
      (risers (isort x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (risers (mergingbu2 x))))
      (risers (isort (mergingbu2 x))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 (succ x) (cons2 x y)) (cons2 x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y)
      (= (insert2 (succ y) (cons2 x z))
        (cons2 x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons (insert2 x (isort y)) nil)
      (risers (insert2 x (isort y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairwise (cons x (risers (isort y))))
      (cons (lmerge x (isort y)) nil))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (pairwise (risers (cons2 x (isort y))))
      (risers (insert2 x (isort y))))))
(assert-claim
  (forall ((x list2) (y Nat) (z list2))
    (= (lmerge (cons2 y x) (cons2 y z))
      (cons2 y (lmerge x (cons2 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (cons (insert2 x (cons2 y nil2)) nil)
      (risers (insert2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (insert2 (succ zero) (cons2 (succ x) y))
      (cons2 (succ zero) (cons2 (succ x) y)))))
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
      (cons (lmerge x (isort y)) nil))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x (pairwise y)))))
      (cons (lmerge x (mergingbu2 y)) nil))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairwise (pairwise (pairwise (cons x (risers y)))))
      (cons (lmerge x (isort y)) nil))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (pairwise (risers (cons2 x (cons2 y nil2))))
      (risers (insert2 x (cons2 y nil2))))))
