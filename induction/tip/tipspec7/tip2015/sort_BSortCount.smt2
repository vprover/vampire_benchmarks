(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(define-fun
  sort2
  ((x Int) (y Int)) list2
  (ite (<= x y) (cons2 x (cons2 y nil2)) (cons2 y (cons2 x nil2))))
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
  count2
  ((x Int) (y list2)) Int
  (match y
    ((nil2 0)
     ((cons2 z ys) (ite (= x z) (+ 1 (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x sk) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
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
(assert-not
  (forall ((x Int) (xs list2))
    (= (count2 x (bsort xs)) (count2 x xs))))
(assert-claim (= (evens nil) nil))
(assert-claim (= (odds nil) nil))
(assert-claim (= (bsort nil2) nil2))
(assert-claim
  (forall ((x list2) (y list2)) (= (pairs y x) (pairs x y))))
(assert-claim
  (forall ((x Int) (y Int)) (= (sort2 y x) (sort2 x y))))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((x list2)) (= (bmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (bmerge nil2 x) nil2)))
(assert-claim (forall ((x list2)) (= (bsort (bsort x)) (bsort x))))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim (forall ((x list2)) (= (pairs x nil2) x)))
(assert-claim (forall ((x list2)) (= (stitch x nil2) x)))
(assert-claim (forall ((x list2)) (= x x)))
(assert-claim
  (forall ((x list2)) (= (bmerge (bsort x) x) (bmerge x (bsort x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (++2 y x)) (bsort (++2 x y)))))
(assert-claim
  (forall ((x list2)) (= (bsort (bmerge x x)) (bsort (++2 x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (pairs x y)) (bsort (++2 x y)))))
(assert-claim
  (forall ((x Int) (y Int)) (= (bsort (sort2 x y)) (sort2 x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (stitch x y)) (bsort (++2 x y)))))
(assert-claim
  (forall ((x Int) (y list2)) (= (count2 x (bsort y)) (count2 x y))))
(assert-claim
  (forall ((y sk) (z list))
    (= (evens (cons y z)) (cons y (odds z)))))
(assert-claim (forall ((x list2)) (= (evens2 (pairs x x)) x)))
(assert-claim
  (forall ((x Int)) (= (evens2 (sort2 x x)) (cons2 x nil2))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= y x) (= (evens2 (sort2 y x)) (cons2 y nil2)))))
(assert-claim
  (forall ((y sk) (z list)) (= (odds (cons y z)) (evens z))))
(assert-claim (forall ((x list2)) (= (odds2 (pairs x x)) x)))
(assert-claim
  (forall ((x Int)) (= (odds2 (sort2 x x)) (cons2 x nil2))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y) (= (odds2 (sort2 x y)) (cons2 y nil2)))))
(assert-claim
  (forall ((x Int)) (= (bsort (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x list2))
    (= (bsort (evens2 (bsort x))) (evens2 (bsort x)))))
(assert-claim
  (forall ((x list2))
    (= (bsort (odds2 (bsort x))) (odds2 (bsort x)))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (cons2 x (cons2 x y)) (++2 (sort2 x x) y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (cons2 x (cons2 y z)) (++2 (sort2 x y) z)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge y (++2 y x)) (bmerge y y))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (count y (++ x2 z)) (count y (++ z x2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count2 y (sort2 x x)) (count2 x (sort2 y y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count2 y (sort2 x y)) (count2 x (sort2 x y)))))
(assert-claim
  (forall ((x Int)) (= (count2 x (sort2 x x)) (+ 1 1))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (pairs x (++2 x y)) (++2 (pairs x x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch x (++2 x y)) (++2 (stitch x x) y))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (and (= x x) (= (pairs y z) (pairs y z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (bsort x) (bsort x)) (bsort (++2 x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (++2 x (bsort y))) (bsort (++2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (bmerge x (bsort y))) (bmerge (bsort x) (bsort y)))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (evens2 x))) (bsort (++2 x (evens2 x))))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (odds2 x))) (bsort (++2 x (odds2 x))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (bmerge (bsort x) y)) (bsort (bmerge x y)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((x list2)) (= (evens2 (bsort (++2 x x))) (bsort x))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (evens2 (evens2 (sort2 x y))) (evens2 (sort2 x y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (evens2 (odds2 (sort2 x y))) (odds2 (sort2 x y)))))
(assert-claim
  (forall ((x list2)) (= (odds2 (bsort (++2 x x))) (bsort x))))
(assert-claim
  (forall ((x Int) (y Int)) (= (odds2 (evens2 (sort2 x y))) nil2)))
(assert-claim
  (forall ((x Int) (y Int)) (= (odds2 (odds2 (sort2 x y))) nil2)))
(assert-claim
  (forall ((x list2))
    (= (pairs (bsort x) (bsort x)) (bsort (++2 x x)))))
(assert-claim
  (forall ((x list2))
    (= (stitch (bsort x) (bsort x)) (bsort (++2 x x)))))
(assert-claim
  (forall ((x list2)) (= (count2 0 (cons2 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x Int))
    (= (count2 0 (sort2 x 1)) (count2 x (cons2 0 nil2)))))
(assert-claim
  (forall ((x list2)) (= (count2 1 (cons2 0 x)) (count2 1 x))))
(assert-claim
  (forall ((x Int))
    (= (count2 1 (sort2 x 0)) (count2 x (cons2 1 nil2)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y)
      (= (<= x (count2 y (evens2 z))) (<= x (count2 y z))))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (=> (<= z x) (= (<= z (count2 x (odds2 y))) (<= z 0)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge y (++2 (bsort y) x)) (bmerge y (bsort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge (++2 (bsort y) x) y) (bmerge (++2 y x) (bsort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bmerge (bsort y) (++2 y x)) (bmerge y (bsort y)))))
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
    (= (bmerge (odds2 y) (++2 y x)) (bmerge (odds2 y) y))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (odds2 (++2 x x)) x) (bmerge x (odds2 (++2 x x))))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (odds2 (bmerge x x)) x)
      (bmerge x (odds2 (bmerge x x))))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (odds2 (stitch x x)) x)
      (bmerge x (odds2 (stitch x x))))))
(assert-claim
  (forall ((x list2) (y Int) (z Int))
    (= (bsort (cons2 y (cons2 z x))) (bsort (++2 x (sort2 y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z Int))
    (= (bsort (cons2 y (sort2 x z))) (bsort (cons2 x (sort2 y z))))))
(assert-claim
  (forall ((x Int))
    (= (bsort (cons2 x (sort2 x x))) (cons2 x (sort2 x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (bmerge (++2 x y) x)) (bsort (++2 x (++2 x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (bsort (bmerge (cons2 x y) y)) (bsort (++2 y (cons2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (bsort (bmerge (bmerge x y) x)) (bsort (++2 x (bmerge x y))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count2 x (odds2 (sort2 x y)))
      (count2 y (evens2 (sort2 x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (evens2 (++2 x (pairs y y))) (++2 (evens2 x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (evens2 (++2 (pairs x x) y)) (++2 x (evens2 y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (evens2 (bmerge (sort2 x x) y)) (bmerge (cons2 x nil2) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (odds2 (++2 x (pairs y y))) (++2 (odds2 x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (odds2 (++2 (pairs x x) y)) (++2 x (odds2 y)))))
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
    (= (pairs (++2 x y) (odds2 x)) (++2 (pairs x (odds2 x)) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch x (++2 (bsort x) y)) (++2 (stitch x (bsort x)) y))))
(assert-claim
  (forall ((x list2))
    (= (stitch (++2 x x) (evens2 x)) (++2 (stitch x (evens2 x)) x))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch (++2 x y) (odds2 x)) (++2 (stitch x (odds2 x)) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch (bsort x) (++2 x y)) (++2 (stitch (bsort x) x) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch (evens2 x) (++2 x y)) (++2 (stitch (evens2 x) x) y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (stitch (evens2 (sort2 x y)) z) (++2 (evens2 (sort2 x y)) z))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stitch (odds2 x) (++2 x y)) (++2 (stitch (odds2 x) x) y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (stitch (odds2 (sort2 x y)) z) (++2 (odds2 (sort2 x y)) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (bmerge (cons2 x nil2) (evens2 y)) (bmerge (cons2 x nil2) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (odds2 (bmerge (sort2 x x) y))
      (bmerge (cons2 x nil2) (odds2 y)))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (bsort x) (bsort (evens2 x)))
      (bsort (++2 x (evens2 x))))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (bsort x) (bsort (odds2 x)))
      (bsort (++2 x (odds2 x))))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (evens2 (bsort x)) (evens2 x))
      (bmerge (evens2 x) (evens2 (bsort x))))))
(assert-claim
  (forall ((x list2))
    (= (bmerge (odds2 (bsort x)) (odds2 x))
      (bmerge (odds2 x) (odds2 (bsort x))))))
(assert-claim
  (forall ((x list2))
    (= (bsort (++2 (evens2 x) (odds2 x))) (bsort x))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (evens2 (evens2 x))))
      (bsort (++2 x (evens2 (evens2 x)))))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (evens2 (odds2 x))))
      (bsort (++2 x (evens2 (odds2 x)))))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (odds2 (evens2 x))))
      (bsort (++2 x (odds2 (evens2 x)))))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge x (odds2 (odds2 x))))
      (bsort (++2 x (odds2 (odds2 x)))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (bsort (bmerge (cons2 x nil2) y)) (bmerge (cons2 x nil2) y))))
(assert-claim
  (forall ((x list2))
    (= (bsort (bmerge (evens2 x) (odds2 x))) (bsort x))))
(assert-claim
  (forall ((x list2))
    (= (evens2 (pairs (evens2 x) (odds2 x)))
      (evens2 (odds2 (stitch x x))))))
(assert-claim
  (forall ((x list2))
    (= (evens2 (stitch (evens2 x) (odds2 x)))
      (evens2 (evens2 (stitch x x))))))
(assert-claim
  (forall ((x list2))
    (= (odds2 (pairs (evens2 x) (odds2 x)))
      (odds2 (evens2 (stitch x x))))))
(assert-claim
  (forall ((x list2))
    (= (odds2 (stitch (evens2 x) (odds2 x)))
      (odds2 (odds2 (stitch x x))))))
(assert-claim
  (forall ((x list2))
    (= (bsort (evens2 (evens2 (odds2 (evens2 x)))))
      (evens2 (evens2 (odds2 (evens2 x)))))))
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
  (forall ((y list))
    (= (odds (evens (evens (odds (odds y)))))
      (odds (evens (evens (odds (evens y))))))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (+ (count y z) (count y x2)) (count y (++ z x2)))))
(assert-claim
  (forall ((y list) (z list))
    (= (++ (evens (++ y y)) (evens z)) (evens (++ y (++ y z))))))
