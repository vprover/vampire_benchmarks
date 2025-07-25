(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(define-fun
  sort2
  ((x Int) (y Int)) list2
  (ite (<= x y) (cons2 x (cons2 y nil2)) (cons2 y (cons2 x nil2))))
(define-fun-rec
  ordered
  ((x list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 y z)
      (match z
        ((nil2 true)
         ((cons2 y2 xs) (and (<= y y2) (ordered (cons2 y2 xs))))))))))
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
  pairs
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z x2)
      (match y
        ((nil2 (cons2 z x2))
         ((cons2 x3 x4) (++2 (sort2 z x3) (pairs x2 x4)))))))))
(define-fun
  stitch
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (pairs xs y))))))
(define-fun-rec
  bmerge
  ((x list2) (y list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 z x2)
      (match y
        ((nil2 (cons2 z x2))
         ((cons2 x3 x4)
          (let
            ((fail
                (stitch (bmerge (evens2 (cons2 z x2)) (evens2 (cons2 x3 x4)))
                  (bmerge (odds2 (cons2 z x2)) (odds2 (cons2 x3 x4))))))
            (match x2
              ((nil2
                (match x4
                  ((nil2 (sort2 z x3))
                   ((cons2 x5 x6) fail))))
               ((cons2 x7 x8) fail)))))))))))
(define-fun-rec
  bsort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y z)
      (match z
        ((nil2 (cons2 y nil2))
         ((cons2 x2 x3)
          (bmerge (bsort (evens2 (cons2 y (cons2 x2 x3))))
            (bsort (odds2 (cons2 y (cons2 x2 x3))))))))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not (forall ((xs list2)) (ordered (bsort xs))))
(assert-claim (ordered nil2))
(assert-claim (= (evens nil) nil))
(assert-claim (= (odds nil) nil))
(assert-claim (= (bsort nil2) nil2))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (bsort x) x))))
(assert-claim
  (forall ((x list2) (y list2)) (= (pairs y x) (pairs x y))))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (bmerge x x) (pairs x x)))))
(assert-claim
  (forall ((x Int) (y Int)) (= (sort2 y x) (sort2 x y))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x) (= (bmerge x x) (stitch x x)))))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((x list2)) (= (bmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (bmerge nil2 x) nil2)))
(assert-claim (forall ((x list2)) (= (bsort (bsort x)) (bsort x))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x) (= (bsort (evens2 x)) (evens2 x)))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x) (= (bsort (odds2 x)) (odds2 x)))))
(assert-claim (forall ((x list2)) (ordered (bsort x))))
(assert-claim (forall ((x list2)) (= (pairs x nil2) x)))
(assert-claim (forall ((x list2)) (= (stitch x nil2) x)))
(assert-claim (forall ((x list2)) (= x x)))
(assert-claim
  (forall ((x list2)) (= (bmerge (bsort x) x) (bmerge x (bsort x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (++2 y x)) (bsort (++2 x y)))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x) (= (bmerge x x) (bsort (++2 x x))))))
(assert-claim
  (forall ((x list2)) (= (bsort (bmerge x x)) (bsort (++2 x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y) (= (bsort (bmerge x y)) (bmerge (bsort x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (pairs x y)) (bsort (++2 x y)))))
(assert-claim
  (forall ((x Int) (y Int)) (= (bsort (sort2 x y)) (sort2 x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (stitch x y)) (bsort (++2 x y)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (evens (cons y z)) (cons y (odds z)))))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (evens2 (bmerge x x)) x))))
(assert-claim (forall ((x list2)) (= (evens2 (pairs x x)) x)))
(assert-claim
  (forall ((x Int)) (= (evens2 (sort2 x x)) (cons2 x nil2))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= y x) (= (evens2 (sort2 y x)) (cons2 y nil2)))))
(assert-claim
  (forall ((y sk) (z list)) (= (odds (cons y z)) (evens z))))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (odds2 (bmerge x x)) x))))
(assert-claim (forall ((x list2)) (= (odds2 (pairs x x)) x)))
(assert-claim
  (forall ((x Int)) (= (odds2 (sort2 x x)) (cons2 x nil2))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y) (= (odds2 (sort2 x y)) (cons2 y nil2)))))
(assert-claim
  (forall ((x list2)) (= (ordered (bmerge x x)) (ordered x))))
(assert-claim
  (forall ((x list2)) (= (ordered (pairs x x)) (ordered x))))
(assert-claim
  (forall ((x list2)) (= (ordered (stitch x x)) (ordered x))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x) (= (evens2 (odds2 (odds2 x))) (odds2 (odds2 x))))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge y (++2 y x)) (bmerge y y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairs x (++2 x y)) (++2 (pairs x x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch x (++2 x y)) (++2 (stitch x x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (++2 x (bsort y))) (bsort (++2 x y)))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (evens2 x))) (bsort (++2 x (evens2 x))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (bsort (bmerge x y))) (bsort (bmerge (bsort x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x)
      (=> (ordered y)
        (= (bsort (evens2 (pairs x y))) (evens2 (pairs x y)))))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++2 x (bsort x))) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++2 x (evens2 x))) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++2 (bsort x) x)) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2)) (= (ordered (pairs x (bsort x))) (ordered x))))
(assert-claim
  (forall ((x list2))
    (= (ordered (stitch x (bsort x))) (ordered x))))
(assert-claim
  (forall ((x list2))
    (= (ordered (stitch x (evens2 x))) (ordered x))))
(assert-claim
  (forall ((x list2))
    (= (ordered (stitch (bsort x) x)) (ordered x))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge y (++2 (bsort y) x)) (bmerge y (bsort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (bmerge x (bsort (++2 x y))) (bmerge x (bmerge (bsort x) y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge (++2 (bsort y) x) y) (bmerge (++2 y x) (bsort y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (bmerge (bsort y) (++2 y x)) (bmerge (bsort y) (++2 y z)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge (evens2 y) (++2 y x)) (bmerge (evens2 y) y))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (evens2 (++2 x x)) x) (bmerge x (evens2 (++2 x x))))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (evens2 (bmerge x x)) x)
      (bmerge x (evens2 (bmerge x x))))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (evens2 (stitch x x)) x)
      (bmerge x (evens2 (stitch x x))))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (=> (ordered x)
        (= (bsort (++2 (++2 y y) x)) (bmerge (bsort (++2 y x)) y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (bsort (++2 (bmerge y x) y)) (bmerge (bsort (bmerge y x)) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (bmerge (bmerge x y) x)) (bsort (++2 x (bmerge x y))))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (=> (ordered x)
      (=> (ordered y)
        (=> (ordered z)
          (= (bsort (bmerge x (pairs y z))) (bmerge x (pairs y z))))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (evens2 (++2 x (pairs y y))) (++2 (evens2 x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (evens2 (++2 (pairs x x) y)) (++2 x (evens2 y)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++2 x (++2 x x))) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 x (bmerge y y))) (ordered (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (ordered (++2 x (bmerge x y))) (ordered (++2 x (++2 x y)))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 x (pairs y y))) (ordered (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 x (stitch x y))) (ordered (++2 x (++2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 x (stitch y y))) (ordered (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 (bmerge x x) y)) (ordered (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 (pairs x x) y)) (ordered (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 (stitch x x) y)) (ordered (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 (stitch y x) y)) (ordered (++2 y (++2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (++2 (stitch x y) y)) (ordered (++2 (pairs y x) y)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (bmerge (++2 x x) x)) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (ordered (bmerge (++2 x y) x)) (ordered (++2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x)
      (= (ordered (bmerge (bmerge y y) x)) (ordered y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x)
      (= (ordered (bmerge (stitch y y) x)) (ordered y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (pairs x (pairs y y)))
      (ordered (pairs x (bmerge y y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (pairs x (stitch y y)))
      (ordered (pairs x (bmerge y y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (pairs x (stitch x y)))
      (ordered (pairs x (bmerge y y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch x (++2 y y))) (ordered (++2 (stitch x y) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch x (++2 y x))) (ordered (stitch y (++2 x y))))))
(assert-claim
  (forall ((x list2))
    (= (ordered (stitch x (bmerge x x))) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (ordered (stitch x (bmerge x y))) (ordered (++2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch x (pairs y y)))
      (ordered (stitch x (bmerge y y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch x (stitch y y)))
      (ordered (stitch x (bmerge y y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch y (stitch y x)))
      (ordered (stitch y (pairs x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch (++2 x y) x)) (ordered (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch (++2 y x) x))
      (ordered (stitch y (pairs x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (ordered (stitch (++2 x x) y)) (ordered (++2 x (pairs x y)))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch (pairs x y) y)) (ordered (pairs x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (ordered (stitch (pairs x x) y))
        (ordered (stitch (bmerge x x) y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (ordered (stitch (stitch x x) y))
      (ordered (stitch (bmerge x x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered y)
      (= (ordered (stitch (stitch x y) x)) (ordered (stitch x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x)
      (= (ordered (stitch (stitch x y) x)) (ordered (stitch x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairs x (++2 (bsort x) y)) (++2 (pairs x (bsort x)) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairs (++2 x y) (bsort x)) (++2 (pairs x (bsort x)) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairs (++2 x y) (evens2 x)) (++2 (pairs x (evens2 x)) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch x (++2 (bsort x) y)) (++2 (stitch x (bsort x)) y))))
(assert-claim
  (forall ((x list2))
    (= (stitch (++2 x x) (evens2 x)) (++2 (stitch x (evens2 x)) x))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch (bsort x) (++2 x y)) (++2 (stitch (bsort x) x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch (evens2 x) (++2 x y)) (++2 (stitch (evens2 x) x) y))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (bsort x) (bsort (evens2 x)))
      (bsort (++2 x (evens2 x))))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (evens2 (evens2 x))))
      (bsort (++2 x (evens2 (evens2 x)))))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (ordered x)
      (= (bsort (evens2 (evens2 (bmerge x y))))
        (evens2 (evens2 (bmerge x y)))))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++2 x (bsort (evens2 x)))) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++2 x (evens2 (evens2 x)))) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (++2 (bsort (evens2 x)) x))
      (ordered (++2 (evens2 x) x)))))
(assert-claim
  (forall ((x list2))
    (= (ordered (pairs x (bsort (evens2 x))))
      (ordered (pairs x (evens2 x))))))
(assert-claim
  (forall ((x list2))
    (= (ordered (stitch x (bsort (evens2 x)))) (ordered x))))
(assert-claim
  (forall ((x list2))
    (= (ordered (stitch x (evens2 (evens2 x))))
      (ordered (pairs x (evens2 x))))))
(assert-claim
  (forall ((x list2))
    (= (ordered (stitch (bsort (evens2 x)) x))
      (ordered (stitch (evens2 x) x)))))
(assert-claim
  (forall ((y list))
    (= (evens (evens (evens (odds (odds y)))))
      (evens (evens (odds (odds y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (evens (odds (evens (evens y)))))
      (evens (odds (evens (evens y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (evens (odds (evens (odds y)))))
      (evens (odds (evens (odds y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (evens (odds (odds (evens y)))))
      (evens (odds (odds (evens y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (evens (odds (odds (odds y)))))
      (evens (odds (odds (odds y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (evens (evens (evens y)))))
      (odds (evens (evens (evens y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (evens (evens (odds y)))))
      (odds (evens (evens (odds y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (evens (odds (evens y)))))
      (odds (evens (odds (evens y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (evens (odds (odds y)))))
      (odds (evens (odds (odds y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (odds (evens (evens y)))))
      (odds (odds (evens (evens y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (odds (evens (odds y)))))
      (odds (odds (evens (odds y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (odds (odds (evens y)))))
      (odds (odds (odds (evens y)))))))
(assert-claim
  (forall ((y list))
    (= (evens (odds (odds (odds (odds y)))))
      (odds (odds (odds (odds y)))))))
(assert-claim
  (forall ((y list)) (= (odds (evens (evens (odds (odds y))))) nil)))
(assert-claim
  (forall ((y list) (z list))
    (= (++ (evens (++ y y)) (evens z)) (evens (++ y (++ y z))))))
