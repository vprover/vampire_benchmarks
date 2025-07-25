(declare-sort sk 0)
(declare-datatype
  pair3 ((pair22 (proj1-pair2 Int) (proj2-pair2 Int))))
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype
  list6 ((nil6) (cons6 (head6 Bool) (tail6 list6))))
(declare-datatype list5 ((nil5) (cons5 (head5 Int) (tail5 list5))))
(declare-datatype list4 ((nil4) (cons4 (head4 sk) (tail4 list4))))
(declare-datatype
  list3 ((nil3) (cons3 (head3 list4) (tail3 list3))))
(declare-datatype list ((nil) (cons (head pair3) (tail list))))
(declare-datatype
  list2 ((nil2) (cons2 (head2 list) (tail2 list2))))
(declare-datatype Maybe2 ((Nothing2) (Just2 (proj1-Just2 Int))))
(declare-datatype Maybe ((Nothing) (Just (proj1-Just sk))))
(define-fun-rec
  primEnumFromTo
  ((x Int) (y Int)) list5
  (ite (> x y) nil5 (cons5 x (primEnumFromTo (+ 1 x) y))))
(define-fun-rec
  petersen3
  ((x Int) (y list5)) list
  (match y
    ((nil5 nil)
     ((cons5 z x2) (cons (pair22 z (+ x z)) (petersen3 x x2))))))
(define-fun-rec
  petersen2
  ((x list5)) list
  (match x
    ((nil5 nil)
     ((cons5 y z) (cons (pair22 y (+ 1 y)) (petersen2 z))))))
(define-fun-rec
  petersen
  ((x Int) (y list)) list2
  (match y
    ((nil nil2)
     ((cons z x2)
      (match z
        (((pair22 u v)
          (cons2 (cons (pair22 u v) (cons (pair22 (+ x u) (+ x v)) nil))
            (petersen x x2)))))))))
(define-fun-rec
  index2
  ((x list5) (y Int)) Maybe2
  (match x
    ((nil5 Nothing2)
     ((cons5 z xs) (ite (= y 0) (Just2 z) (index2 xs (- y 1)))))))
(define-fun-rec
  index
  ((x list4) (y Int)) Maybe
  (match x
    ((nil4 Nothing)
     ((cons4 z xs) (ite (= y 0) (Just z) (index xs (- y 1)))))))
(define-fun-rec
  formula
  ((x list5)) list6
  (match x
    ((nil5 nil6)
     ((cons5 y z) (cons6 (< y 3) (formula z))))))
(define-fun-rec
  colouring
  ((a list5) (x list)) list6
  (match x
    ((nil nil6)
     ((cons y z)
      (match y
        (((pair22 u v)
          (match (index2 a u)
            ((Nothing2 (cons6 false (colouring a z)))
             ((Just2 c1)
              (match (index2 a v)
                ((Nothing2 (cons6 false (colouring a z)))
                 ((Just2 c2) (cons6 (distinct c1 c2) (colouring a z)))))))))))))))
(define-fun-rec
  and2
  ((x list6)) Bool
  (match x
    ((nil6 true)
     ((cons6 y xs) (and y (and2 xs))))))
(define-fun
  colouring2
  ((x list) (y list5)) Bool (and2 (colouring y x)))
(define-fun-rec
  ++6
  ((x list6) (y list6)) list6
  (match x
    ((nil6 y)
     ((cons6 z xs) (cons6 z (++6 xs y))))))
(define-fun-rec
  ++5
  ((x list5) (y list5)) list5
  (match x
    ((nil5 y)
     ((cons5 z xs) (cons5 z (++5 xs y))))))
(define-fun-rec
  ++4
  ((x list4) (y list4)) list4
  (match x
    ((nil4 y)
     ((cons4 z xs) (cons4 z (++4 xs y))))))
(define-fun-rec
  concat3
  ((x list3)) list4
  (match x
    ((nil3 nil4)
     ((cons3 y xs) (++4 y (concat3 xs))))))
(define-fun-rec
  ++3
  ((x list3) (y list3)) list3
  (match x
    ((nil3 y)
     ((cons3 z xs) (cons3 z (++3 xs y))))))
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
  concat2
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xs) (++ y (concat2 xs))))))
(define-fun
  petersen4
  ((x Int)) list
  (ite
    (= x 0) nil
    (++
      (concat2
        (petersen x
          (cons (pair22 (- x 1) 0) (petersen2 (primEnumFromTo 0 (- x 1))))))
      (petersen3 x (primEnumFromTo 0 x)))))
(assert-not
  (forall ((a list5))
    (or
      (not
        (colouring2
          (++
            (concat2
              (petersen 21
                (cons (pair22 (- 21 1) 0)
                  (petersen2 (primEnumFromTo 0 (- 21 1))))))
            (petersen3 21 (primEnumFromTo 0 21)))
          a))
      (not (and2 (formula a))))))
(assert-claim
  (not
    (colouring2
      (++
        (concat2
          (petersen 3
            (cons (pair22 (- 3 1) 0) (petersen2 (primEnumFromTo 0 (- 3 1))))))
        (petersen3 3 (primEnumFromTo 0 3)))
      nil5)))
(assert-claim (= (petersen2 nil5) nil))
(assert-claim (= (formula nil5) nil6))
(assert-claim (= (concat3 nil3) nil4))
(assert-claim true)
(assert-claim
  (forall ((x list6) (y list6))
    (=> (and2 y) (=> (and2 x) (= (++6 y x) (++6 x y))))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (< y x) (= (primEnumFromTo x y) nil5))))
(assert-claim (forall ((y list4)) (= (++4 y nil4) y)))
(assert-claim (forall ((y list4)) (= (++4 nil4 y) y)))
(assert-claim
  (forall ((x Int)) (= (primEnumFromTo x x) (cons5 x nil5))))
(assert-claim (forall ((x list5)) (= (colouring x nil) nil6)))
(assert-claim
  (forall ((x list5)) (= (colouring2 nil x) (and2 nil6))))
(assert-claim (forall ((y list4)) (= (index y 21) Nothing)))
(assert-claim (forall ((y Int)) (= (index nil4 y) Nothing)))
(assert-claim (forall ((x Int)) (= (petersen x nil) nil2)))
(assert-claim (forall ((x Int)) (= (petersen3 x nil5) nil)))
(assert-claim
  (forall ((x list5)) (= (petersen2 x) (petersen3 1 x))))
(assert-claim
  (forall ((x list6) (y list6))
    (= (and2 (++6 y x)) (and2 (++6 x y)))))
(assert-claim (forall ((x list6)) (= (and2 (++6 x x)) (and2 x))))
(assert-claim
  (forall ((x list6) (y list6))
    (=> (and2 x) (= (and2 (++6 y x)) (and2 y)))))
(assert-claim
  (forall ((x list6) (y Bool))
    (=> (and2 x) (= (and2 (cons6 y x)) y))))
(assert-claim
  (forall ((x list5) (y list))
    (= (colouring2 y x) (and2 (colouring x y)))))
(assert-claim
  (forall ((y list4) (z list3))
    (= (concat3 (cons3 y z)) (++4 y (concat3 z)))))
(assert-claim (forall ((x Bool)) (= (and2 (cons6 x nil6)) x)))
(assert-claim (forall ((x list6)) (not (and2 (cons6 false x)))))
(assert-claim
  (forall ((x list5))
    (not
      (colouring2
        (++
          (concat2
            (petersen 1
              (cons (pair22 (- 1 1) 0) (petersen2 (primEnumFromTo 0 (- 1 1))))))
          (petersen3 1 (primEnumFromTo 0 1)))
        x))))
(assert-claim
  (forall ((x list5))
    (not
      (colouring2
        (++
          (concat2
            (petersen 21
              (cons (pair22 (- 21 1) 0)
                (petersen2 (primEnumFromTo 0 (- 21 1))))))
          (petersen3 21 (primEnumFromTo 0 21)))
        x))))
(assert-claim
  (forall ((x list5))
    (= (formula (cons5 1 x)) (formula (cons5 0 x)))))
(assert-claim
  (forall ((x list5))
    (= (formula (cons5 21 x)) (cons6 false (formula x)))))
(assert-claim
  (forall ((x list5))
    (= (formula (cons5 3 x)) (cons6 false (formula x)))))
(assert-claim
  (forall ((y list4) (z list4) (x2 list4))
    (= (++4 (++4 y z) x2) (++4 y (++4 z x2)))))
(assert-claim
  (forall ((x Bool) (y list6) (z list6))
    (=> (and2 z)
      (=> (and2 y) (= (++6 (cons6 x z) y) (++6 (cons6 x y) z))))))
(assert-claim
  (forall ((x list6) (y list5) (z list))
    (=> (and2 x)
      (=> (colouring2 z y)
        (= (++6 (colouring y z) x) (++6 x (colouring y z)))))))
(assert-claim
  (forall ((y sk) (z list4) (x2 list4))
    (= (cons4 y (++4 z x2)) (++4 (cons4 y z) x2))))
(assert-claim
  (forall ((x list5) (y list5) (z list5) (x2 list) (x3 list))
    (=> (colouring2 x3 x)
      (=> (colouring2 x2 y)
        (= (colouring z (++ x3 x2)) (colouring z (++ x2 x3)))))))
(assert-claim
  (forall ((x list5) (y list5) (z list))
    (=> (colouring2 z y) (= (colouring (++5 y x) z) (colouring y z)))))
(assert-claim
  (forall ((y list4) (z Int) (x2 Int))
    (=> (< z x2) (= (index y (- z x2)) Nothing))))
(assert-claim
  (forall ((y list3) (z list3))
    (= (++4 (concat3 y) (concat3 z)) (concat3 (++3 y z)))))
(assert-claim
  (forall ((x list5) (y list5))
    (= (++6 (formula x) (formula y)) (formula (++5 x y)))))
(assert-claim
  (forall ((x list5) (y list5))
    (= (++ (petersen2 x) (petersen2 y)) (petersen2 (++5 x y)))))
(assert-claim
  (forall ((x list5) (y list5))
    (= (colouring x (petersen3 0 y)) (colouring nil5 (petersen2 y)))))
(assert-claim
  (forall ((x list5) (y list5))
    (= (colouring x (petersen3 21 y)) (colouring x (petersen3 0 y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (colouring nil5 (++ y x)) (colouring nil5 (++ x y)))))
(assert-claim
  (forall ((x Int) (y list5))
    (= (colouring nil5 (petersen3 x y))
      (colouring nil5 (petersen2 y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list5) (x2 Int) (x3 Int))
    (=> (< x y)
      (=> (< x2 x3)
        (= (colouring z (petersen4 (- x y)))
          (colouring z (petersen4 (- x2 x3))))))))
(assert-claim
  (forall ((x list5) (y list5) (z list))
    (=> (colouring2 z x)
      (= (colouring y (concat2 (petersen 0 z)))
        (colouring y (++ z z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (colouring nil5 (concat2 (petersen x y)))
      (colouring nil5 (++ y y)))))
(assert-claim
  (forall ((x list5) (y list) (z list))
    (= (++6 (colouring x y) (colouring x z)) (colouring x (++ y z)))))
(assert-claim
  (forall ((x Int) (y list5) (z list5))
    (= (++ (petersen3 x y) (petersen3 x z)) (petersen3 x (++5 y z)))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (++2 (petersen x y) (petersen x z)) (petersen x (++ y z)))))
(assert-claim
  (forall ((x list5) (y list) (z list5))
    (= (colouring x (++ y (petersen3 21 z)))
      (colouring x (++ y (petersen3 0 z))))))
(assert-claim
  (forall ((x Int) (y list5) (z list5))
    (= (colouring y (petersen3 (- x 21) z))
      (colouring y (petersen3 0 z)))))
