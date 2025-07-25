(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun
  sort2
  ((x Nat) (y Nat)) list
  (ite (leq x y) (cons x (cons y nil)) (cons y (cons x nil))))
(define-fun-rec
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (leq x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insert2 y (isort xs))))))
(define-funs-rec
  ((evens2
    ((x list2)) list2)
   (odds2
    ((x list2)) list2))
  ((match x
     ((nil2 nil2)
      ((cons2 y xs) (cons2 y (odds2 xs)))))
   (match x
     ((nil2 nil2)
      ((cons2 y xs) (evens2 xs))))))
(define-funs-rec
  ((evens
    ((x list)) list)
   (odds
    ((x list)) list))
  ((match x
     ((nil nil)
      ((cons y xs) (cons y (odds xs)))))
   (match x
     ((nil nil)
      ((cons y xs) (evens xs))))))
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
(define-fun-rec
  pairs
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z x2)
      (match y
        ((nil (cons z x2))
         ((cons x3 x4) (++ (sort2 z x3) (pairs x2 x4)))))))))
(define-fun
  stitch
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (pairs xs y))))))
(define-fun-rec
  bmerge
  ((x list) (y list)) list
  (match x
    ((nil nil)
     ((cons z x2)
      (match y
        ((nil (cons z x2))
         ((cons x3 x4)
          (let
            ((fail
                (stitch (bmerge (evens (cons z x2)) (evens (cons x3 x4)))
                  (bmerge (odds (cons z x2)) (odds (cons x3 x4))))))
            (match x2
              ((nil
                (match x4
                  ((nil (sort2 z x3))
                   ((cons x5 x6) fail))))
               ((cons x7 x8) fail)))))))))))
(define-fun-rec
  bsort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y z)
      (match z
        ((nil (cons y nil))
         ((cons x2 x3)
          (bmerge (bsort (evens (cons y (cons x2 x3))))
            (bsort (odds (cons y (cons x2 x3))))))))))))
(assert-not (forall ((xs list)) (= (bsort xs) (isort xs))))
(assert-claim (= (evens2 nil2) nil2))
(assert-claim (= (odds2 nil2) nil2))
(assert-claim (= (bsort nil) nil))
(assert-claim (forall ((x list)) (= (bsort x) (isort x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim
  (forall ((x list) (y list)) (= (pairs y x) (pairs x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (sort2 y x) (sort2 x y))))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x list)) (= (bmerge x nil) x)))
(assert-claim (forall ((x list)) (= (bmerge nil x) nil)))
(assert-claim (forall ((x list)) (= (bsort (bsort x)) (bsort x))))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (= (pairs x nil) x)))
(assert-claim (forall ((x list)) (= (stitch x nil) x)))
(assert-claim (forall ((x list)) (= x x)))
(assert-claim
  (forall ((x list)) (= (bmerge (bsort x) x) (bmerge x (bsort x)))))
(assert-claim
  (forall ((x list) (y list)) (= (bsort (++ y x)) (bsort (++ x y)))))
(assert-claim
  (forall ((x list)) (= (bsort (bmerge x x)) (bsort (++ x x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (bsort (insert2 x y)) (bsort (cons x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (bsort (pairs x y)) (bsort (++ x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (bsort (sort2 x y)) (sort2 x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (bsort (stitch x y)) (bsort (++ x y)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (evens2 (cons2 y z)) (cons2 y (odds2 z)))))
(assert-claim (forall ((x list)) (= (evens (pairs x x)) x)))
(assert-claim
  (forall ((x Nat)) (= (evens (sort2 x x)) (cons x nil))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq y x) (= (evens (sort2 y x)) (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (bsort y)) (bsort (cons x y)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((y sk) (z list2)) (= (odds2 (cons2 y z)) (evens2 z))))
(assert-claim (forall ((x list)) (= (odds (pairs x x)) x)))
(assert-claim
  (forall ((x Nat)) (= (odds (sort2 x x)) (cons x nil))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (odds (sort2 x y)) (cons y nil)))))
(assert-claim
  (forall ((x list))
    (= (bsort (evens (bsort x))) (evens (bsort x)))))
(assert-claim
  (forall ((x list)) (= (bsort (odds (bsort x))) (odds (bsort x)))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (cons x (cons x y)) (++ (sort2 x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (cons x (cons y z)) (++ (sort2 x y) z)))))
(assert-claim
  (forall ((x list) (y list)) (= (bmerge y (++ y x)) (bmerge y y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (++ (sort2 x x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (insert2 y (sort2 x z)) (insert2 x (sort2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (insert2 x (cons y z)) (++ (sort2 x y) z)))))
(assert-claim
  (forall ((x list) (y list))
    (= (pairs x (++ x y)) (++ (pairs x x) y))))
(assert-claim
  (forall ((x list) (y list))
    (= (stitch x (++ x y)) (++ (stitch x x) y))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (and (= x x) (= (pairs y z) (pairs y z)))))
(assert-claim
  (forall ((x list))
    (= (bmerge (bsort x) (bsort x)) (bsort (++ x x)))))
(assert-claim
  (forall ((x list) (y list))
    (= (bsort (++ x (bsort y))) (bsort (++ x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (bsort (bmerge x (bsort y))) (bmerge (bsort x) (bsort y)))))
(assert-claim
  (forall ((x list))
    (= (bsort (bmerge x (evens x))) (bsort (++ x (evens x))))))
(assert-claim
  (forall ((x list))
    (= (bsort (bmerge x (odds x))) (bsort (++ x (odds x))))))
(assert-claim
  (forall ((x list) (y list))
    (= (bsort (bmerge (bsort x) y)) (bsort (bmerge x y)))))
(assert-claim
  (forall ((x list)) (= (evens (bsort (++ x x))) (bsort x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (evens (evens (sort2 x y))) (evens (sort2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (evens (odds (sort2 x y))) (odds (sort2 x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (sort2 x y) (insert2 x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x list)) (= (odds (bsort (++ x x))) (bsort x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (odds (evens (sort2 x y))) nil)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (odds (odds (sort2 x y))) nil)))
(assert-claim
  (forall ((x list) (y list))
    (= (pairs x (cons zero y)) (cons zero (stitch x y)))))
(assert-claim
  (forall ((x list))
    (= (pairs (bsort x) (bsort x)) (bsort (++ x x)))))
(assert-claim
  (forall ((x list))
    (= (stitch (bsort x) (bsort x)) (bsort (++ x x)))))
(assert-claim
  (forall ((x list))
    (= (bsort (evens (evens (evens x)))) (evens (evens (evens x))))))
(assert-claim
  (forall ((x list))
    (= (evens (odds (evens (evens x)))) (odds (evens (evens x))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (evens2 (evens2 (odds2 y)))))
      (evens2 (evens2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (evens2 (odds2 (evens2 y)))))
      (evens2 (evens2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (evens2 (odds2 (odds2 y)))))
      (evens2 (evens2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (evens2 (evens2 y)))))
      (evens2 (odds2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (evens2 (odds2 y)))))
      (evens2 (odds2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (odds2 (evens2 y)))))
      (evens2 (odds2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (evens2 (odds2 (odds2 (odds2 y)))))
      (evens2 (odds2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (evens2 (evens2 y)))))
      (odds2 (evens2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (evens2 (odds2 y)))))
      (odds2 (evens2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (odds2 (evens2 y)))))
      (odds2 (evens2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (evens2 (odds2 (odds2 y)))))
      (odds2 (evens2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (evens2 (evens2 y)))))
      (odds2 (odds2 (evens2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (evens2 (odds2 y)))))
      (odds2 (odds2 (evens2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (odds2 (evens2 y)))))
      (odds2 (odds2 (odds2 (evens2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (evens2 (odds2 (odds2 (odds2 (odds2 y)))))
      (odds2 (odds2 (odds2 (odds2 y)))))))
(assert-claim
  (forall ((y list2))
    (= (odds2 (evens2 (evens2 (evens2 (odds2 y))))) nil2)))
(assert-claim
  (forall ((y list2) (z list2))
    (= (++2 (evens2 (++2 y y)) (evens2 z))
      (evens2 (++2 y (++2 y z))))))
