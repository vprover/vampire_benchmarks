(declare-sort sk 0)
(declare-datatype
  pair4 ((pair23 (proj1-pair3 sk) (proj2-pair3 sk))))
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype
  pair3 ((pair22 (proj1-pair2 list2) (proj2-pair2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype
  pair ((pair2 (proj1-pair list) (proj2-pair list))))
(define-fun-rec
  take2
  ((x Int) (y list2)) list2
  (ite
    (<= x 0) nil2
    (match y
      ((nil2 nil2)
       ((cons2 z xs) (cons2 z (take2 (- x 1) xs)))))))
(define-fun-rec
  take
  ((x Int) (y list)) list
  (ite
    (<= x 0) nil
    (match y
      ((nil nil)
       ((cons z xs) (cons z (take (- x 1) xs)))))))
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
(define-fun-rec
  length2
  ((x list2)) Int
  (match x
    ((nil2 0)
     ((cons2 y l) (+ 1 (length2 l))))))
(define-fun-rec
  length
  ((x list)) Int
  (match x
    ((nil 0)
     ((cons y l) (+ 1 (length l))))))
(define-fun-rec
  drop2
  ((x Int) (y list2)) list2
  (ite
    (<= x 0) y
    (match y
      ((nil2 nil2)
       ((cons2 z xs1) (drop2 (- x 1) xs1))))))
(define-fun
  splitAt2
  ((x Int) (y list2)) pair3 (pair22 (take2 x y) (drop2 x y)))
(define-fun-rec
  drop
  ((x Int) (y list)) list
  (ite
    (<= x 0) y
    (match y
      ((nil nil)
       ((cons z xs1) (drop (- x 1) xs1))))))
(define-fun
  splitAt
  ((x Int) (y list)) pair (pair2 (take x y) (drop x y)))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  reverse2
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (++2 (reverse2 xs) (cons2 y nil2))))))
(define-funs-rec
  ((stooge1sort2
    ((x list2)) list2)
   (stoogesort
    ((x list2)) list2)
   (stooge1sort1
    ((x list2)) list2))
  ((match (splitAt2 (div (length2 x) 3) (reverse2 x))
     (((pair22 ys1 zs1) (++2 (stoogesort zs1) (reverse2 ys1)))))
   (match x
     ((nil2 nil2)
      ((cons2 y z)
       (match z
         ((nil2 (cons2 y nil2))
          ((cons2 y2 x2)
           (match x2
             ((nil2 (sort2 y y2))
              ((cons2 x3 x4)
               (stooge1sort2
                 (stooge1sort1
                   (stooge1sort2 (cons2 y (cons2 y2 (cons2 x3 x4)))))))))))))))
   (match (splitAt2 (div (length2 x) 3) x)
     (((pair22 ys1 zs) (++2 ys1 (stoogesort zs)))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  reverse
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (++ (reverse xs) (cons y nil))))))
(assert-not (forall ((xs list2)) (ordered (stoogesort xs))))
(assert-claim (= (length nil) 0))
(assert-claim (= (reverse nil) nil))
(assert-claim (= (stooge1sort2 nil2) nil2))
(assert-claim (= (stoogesort nil2) nil2))
(assert-claim (= (stooge1sort1 nil2) nil2))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (stooge1sort1 x) x))))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (stooge1sort2 x) x))))
(assert-claim
  (forall ((x list2)) (=> (ordered x) (= (stoogesort x) x))))
(assert-claim
  (forall ((x Int) (y Int)) (= (sort2 y x) (sort2 x y))))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y Int)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop 0 y) y)))
(assert-claim
  (forall ((y list)) (= (length (reverse y)) (length y))))
(assert-claim
  (forall ((x list2)) (= (length2 (stooge1sort1 x)) (length2 x))))
(assert-claim
  (forall ((x list2)) (= (length2 (stooge1sort2 x)) (length2 x))))
(assert-claim
  (forall ((x list2)) (= (length2 (stoogesort x)) (length2 x))))
(assert-claim
  (forall ((x list2)) (= (ordered (stoogesort x)) (ordered nil2))))
(assert-claim (forall ((y list)) (= (reverse (reverse y)) y)))
(assert-claim
  (forall ((y Int) (z Int)) (= (splitAt y nil) (splitAt z nil))))
(assert-claim
  (forall ((x list2))
    (= (stooge1sort1 (stooge1sort1 x)) (stooge1sort1 x))))
(assert-claim
  (forall ((x list2))
    (= (stooge1sort2 (stooge1sort2 x)) (stooge1sort2 x))))
(assert-claim
  (forall ((x list2)) (= (stoogesort (reverse2 x)) (stoogesort x))))
(assert-claim
  (forall ((x list2))
    (= (stoogesort (stooge1sort1 x)) (stoogesort x))))
(assert-claim
  (forall ((x list2))
    (= (stoogesort (stooge1sort2 x)) (stoogesort x))))
(assert-claim (forall ((y Int)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take 0 y) nil)))
(assert-claim (forall ((y list)) (= (drop (length y) y) nil)))
(assert-claim
  (forall ((y list) (z list))
    (= (length (++ z y)) (length (++ y z)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (length (cons y x2)) (length (cons z x2)))))
(assert-claim
  (forall ((x Int) (y Int)) (= (length2 (sort2 x y)) (+ 1 1))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x) (= (ordered (++2 x x)) (ordered (reverse2 x))))))
(assert-claim
  (forall ((x Int) (y list2))
    (=> (ordered y) (= (ordered (drop2 x y)) (ordered nil2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (sort2 x y)) (ordered nil2))))
(assert-claim
  (forall ((x Int) (y list2))
    (=> (ordered y) (= (ordered (take2 x y)) (ordered nil2)))))
(assert-claim
  (forall ((x Int)) (= (reverse2 (sort2 x x)) (sort2 x x))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (stoogesort (++2 y x)) (stoogesort (++2 x y)))))
(assert-claim (forall ((y list)) (= (take (length y) y) y)))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (length z)) (length (cons y z)))))
(assert-claim
  (forall ((x Int)) (= (ordered (cons2 x nil2)) (ordered nil2))))
(assert-claim
  (forall ((x list2))
    (= (ordered (reverse2 (stoogesort x))) (ordered (++2 x x)))))
(assert-claim
  (forall ((x list2))
    (=> (ordered x)
      (= (ordered (stooge1sort2 (reverse2 x)))
        (ordered (stooge1sort1 (reverse2 x)))))))
(assert-claim
  (forall ((x list2)) (= (ordered (take2 1 x)) (ordered nil2))))
(assert-claim
  (forall ((y sk)) (= (reverse (cons y nil)) (cons y nil))))
(assert-claim
  (forall ((y list)) (= (reverse (take 1 y)) (take 1 y))))
(assert-claim
  (forall ((x list2))
    (= (stooge1sort1 (reverse2 (stooge1sort2 x)))
      (stooge1sort1 (reverse2 x)))))
(assert-claim
  (forall ((x list2))
    (= (stoogesort x) (stooge1sort1 (stooge1sort2 (stooge1sort1 x))))))
(assert-claim
  (forall ((x list2))
    (= (stooge1sort2 (reverse2 (stooge1sort1 x)))
      (stooge1sort2 (reverse2 x)))))
(assert-claim
  (forall ((x list2))
    (= (stoogesort x) (stooge1sort2 (stooge1sort1 (stooge1sort2 x))))))
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
  (forall ((y Int) (z Int) (x2 list))
    (= (drop z (drop y x2)) (drop y (drop z x2)))))
(assert-claim
  (forall ((y Int) (z list)) (= (drop y (take y z)) nil)))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (+ y y) z) (drop y (drop y z)))))
(assert-claim
  (forall ((y Int) (z Int) (x2 list))
    (=> (<= y z) (= (drop (- y z) x2) x2))))
