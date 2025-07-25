(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
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
            (<= z x3) (cons2 z (lmerge x2 (cons2 x3 x4)))
            (cons2 x3 (lmerge (cons2 z x2) x4))))))))))
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
(define-fun-rec
  msorttd
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y z)
      (match z
        ((nil2 (cons2 y nil2))
         ((cons2 x2 x3)
          (let ((k (div (length2 (cons2 y (cons2 x2 x3))) 2)))
            (lmerge (msorttd (take2 k (cons2 y (cons2 x2 x3))))
              (msorttd (drop2 k (cons2 y (cons2 x2 x3)))))))))))))
(define-fun-rec
  drop
  ((x Int) (y list)) list
  (ite
    (<= x 0) y
    (match y
      ((nil nil)
       ((cons z xs1) (drop (- x 1) xs1))))))
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
(assert-not
  (forall ((x Int) (xs list2))
    (= (count2 x (msorttd xs)) (count2 x xs))))
(assert-claim (= (length nil) 0))
(assert-claim (= (msorttd nil2) nil2))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim (forall ((y Int)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop 0 y) y)))
(assert-claim
  (forall ((x list2)) (= (length2 (msorttd x)) (length2 x))))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim
  (forall ((x list2)) (= (msorttd (msorttd x)) (msorttd x))))
(assert-claim (forall ((y Int)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take 0 y) nil)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (msorttd y)) (count2 x y))))
(assert-claim (forall ((y list)) (= (drop (length y) y) nil)))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (length (cons y x2)) (length (cons z x2)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (length2 (lmerge y x)) (length2 (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (msorttd (lmerge y x)) (msorttd (lmerge x y)))))
(assert-claim (forall ((y list)) (= (take (length y) y) y)))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (length z)) (length (cons y z)))))
(assert-claim (forall ((y list)) (<= 0 (length y))))
(assert-claim
  (forall ((x Int)) (= (msorttd (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x list2)) (= (msorttd (take2 1 x)) (take2 1 x))))
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
(assert-claim
  (forall ((y Int) (z Int) (x2 list))
    (=> (<= z y) (= (drop y (take z x2)) nil))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((y Int) (z Int) (x2 list))
    (= (take z (take y x2)) (take y (take z x2)))))
(assert-claim
  (forall ((y Int) (z list)) (= (take y (take y z)) (take y z))))
(assert-claim
  (forall ((y Int) (z Int) (x2 list))
    (=> (<= z y) (= (take z (take y x2)) (take z x2)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (+ (length2 x) (length2 y)) (length2 (lmerge x y)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim (forall ((y sk) (z list)) (= (drop 1 (cons y z)) z)))
(assert-claim
  (forall ((z list) (x2 list))
    (= (length (take (length x2) z)) (length (take (length z) x2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (length2 (drop2 x (msorttd y))) (length2 (drop2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (length2 (take2 x (msorttd y))) (length2 (take2 x y)))))
(assert-claim
  (forall ((x list2))
    (= (lmerge (drop2 1 x) x) (drop2 1 (lmerge x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (msorttd x) (msorttd y)) (msorttd (lmerge x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (msorttd (cons2 x (msorttd y))) (msorttd (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (msorttd (drop2 x (msorttd y))) (drop2 x (msorttd y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (msorttd (take2 x (msorttd y))) (take2 x (msorttd y)))))
(assert-claim
  (forall ((y list) (z sk)) (= (take 1 (cons z y)) (cons z nil))))
(assert-claim
  (forall ((y sk) (z list))
    (= (take 2 (cons y z)) (cons y (take 1 z)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (take2 1 (lmerge y x)) (take2 1 (lmerge x y)))))
(assert-claim
  (forall ((x list2)) (= (take2 1 (lmerge x x)) (take2 1 x))))
(assert-claim (forall ((x list2)) (<= (count2 2 x) 2)))
