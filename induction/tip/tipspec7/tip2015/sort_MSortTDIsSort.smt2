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
  insert2
  ((x Int) (y list2)) list2
  (match y
    ((nil2 (cons2 x nil2))
     ((cons2 z xs)
      (ite (<= x z) (cons2 x (cons2 z xs)) (cons2 z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (insert2 y (isort xs))))))
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
(assert-not (forall ((xs list2)) (= (msorttd xs) (isort xs))))
(assert-claim (= (length nil) 0))
(assert-claim (= (isort nil2) nil2))
(assert-claim (forall ((x list2)) (= (isort x) (msorttd x))))
(assert-claim (forall ((y Int)) (= (drop y nil) nil)))
(assert-claim (forall ((y list)) (= (drop 0 y) y)))
(assert-claim
  (forall ((x Int)) (= (insert2 x nil2) (cons2 x nil2))))
(assert-claim (forall ((x list2)) (= (isort (isort x)) (isort x))))
(assert-claim
  (forall ((x list2)) (= (length2 (isort x)) (length2 x))))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim (forall ((y Int)) (= (take y nil) nil)))
(assert-claim (forall ((y list)) (= (take 0 y) nil)))
(assert-claim (forall ((y list)) (= (drop (length y) y) nil)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (cons2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge y x)) (isort (lmerge x y)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (length (cons y x2)) (length (cons z x2)))))
(assert-claim (forall ((y list)) (= (take (length y) y) y)))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (length z)) (length (cons y z)))))
(assert-claim (forall ((y list)) (<= 0 (length y))))
(assert-claim
  (forall ((x list2)) (= (isort (take2 1 x)) (take2 1 x))))
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
  (forall ((x Int) (y list2))
    (= (insert2 x (cons2 x y)) (cons2 x (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (insert2 x (cons2 y z)) (cons2 x (cons2 y z))))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (lmerge (insert2 x y) z) (insert2 x (lmerge y z)))))
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
  (forall ((x list2) (y list2))
    (= (+ (length2 x) (length2 y)) (length2 (lmerge x y)))))
(assert-claim (forall ((y sk) (z list)) (= (drop 1 (cons y z)) z)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (drop2 x (isort y))) (drop2 x (isort y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (lmerge x (isort y))) (isort (lmerge x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (take2 x (isort y))) (take2 x (isort y)))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (length (take (length x2) z)) (length (take (length z) x2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (length2 (drop2 x (isort y))) (length2 (drop2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (length2 (take2 x (isort y))) (length2 (take2 x y)))))
(assert-claim
  (forall ((x list2))
    (= (lmerge (drop2 1 x) x) (drop2 1 (lmerge x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (isort x) (isort y)) (isort (lmerge x y)))))
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
(assert-claim
  (forall ((y list)) (= (drop 1 (drop 2 y)) (drop (+ 1 2) y))))
(assert-claim
  (forall ((x list2))
    (= (insert2 1 (cons2 0 x)) (cons2 0 (insert2 1 x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 2 (cons2 0 x)) (cons2 0 (insert2 2 x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 2 (cons2 1 x)) (cons2 1 (insert2 2 x)))))
(assert-claim
  (forall ((y list)) (= (take 1 (drop 1 y)) (drop 1 (take 2 y)))))
(assert-claim
  (forall ((y list) (z Int))
    (= (<= z (length (drop z y))) (<= z (- (length y) z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (<= y (length (take y z))) (<= y (length z)))))
(assert-claim
  (forall ((y list) (z Int))
    (= (<= (length (drop z y)) z) (<= (- (length y) z) z))))
(assert-claim
  (forall ((y list) (z Int))
    (= (<= (length (take z y)) z) (<= 0 z))))
(assert-claim
  (forall ((y Int) (z list) (x2 Int))
    (=> (<= y x2) (= (<= (length (take y z)) x2) (<= 0 x2)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (length (drop y z)) z) (drop (- (length z) y) z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (length (take y z)) z) (drop y z))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x) (= (drop2 x (isort (take2 y z))) nil2))))
(assert-claim
  (forall ((y sk) (z Int) (x2 sk) (x3 list))
    (= (length (drop z (cons y x3))) (length (drop z (cons x2 x3))))))
(assert-claim
  (forall ((y sk) (z Int) (x2 sk) (x3 list))
    (= (length (take z (cons y x3))) (length (take z (cons x2 x3))))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take (length z) (drop y z)) (drop y z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take (length (drop y z)) z) (take (- (length z) y) z))))
(assert-claim
  (forall ((z Int) (x2 list) (x3 list))
    (= (take (length (take z x2)) x3) (take z (take (length x2) x3)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (take2 x (isort (take2 y z))) (isort (take2 y z))))))
(assert-claim
  (forall ((y sk) (z list)) (= (div 0 (length (cons y z))) 0)))
(assert-claim (forall ((y list)) (= (drop (- 1 (length y)) y) y)))
(assert-claim
  (forall ((z sk) (x2 list) (x3 list))
    (= (drop 1 (drop (length x2) x3)) (drop (length (cons z x2)) x3))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (drop (length (drop 1 z)) x2) (drop (- (length z) 1) x2))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (drop (length (drop 2 z)) x2) (drop (- (length z) 2) x2))))
(assert-claim
  (forall ((x list2))
    (= (insert2 (length2 x) (cons2 0 x))
      (cons2 0 (insert2 (length2 x) x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isort (drop2 1 (lmerge y x))) (isort (drop2 1 (lmerge x y))))))
(assert-claim
  (forall ((y Int) (z Int) (x2 sk))
    (= (length2 (drop2 z (cons2 y nil2)))
      (length (drop z (cons x2 nil))))))
(assert-claim
  (forall ((x list2))
    (= (lmerge x (drop2 1 (isort x))) (drop2 1 (lmerge x (isort x))))))
(assert-claim
  (forall ((x list2))
    (= (lmerge (drop2 1 (isort x)) x) (drop2 1 (lmerge (isort x) x)))))
(assert-claim
  (forall ((x list2))
    (= (lmerge (take2 1 (isort x)) x) (lmerge x (take2 1 (isort x))))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (take (- 1 (length z)) x2) (drop (length z) (take 1 x2)))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (take (length (drop 1 z)) x2) (take (- (length z) 1) x2))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (take (length (drop 2 z)) x2) (take (- (length z) 2) x2))))
(assert-claim
  (forall ((x list2))
    (= (take2 1 (lmerge x (isort x))) (take2 1 (isort x)))))
(assert-claim
  (forall ((x list2))
    (= (take2 2 (lmerge (isort x) x)) (take2 2 (lmerge x (isort x))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (- 1 (length (take 1 z))) (div 1 (length (cons y z))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (- 2 (length (take 2 z))) (div 2 (length (cons y z))))))
(assert-claim
  (forall ((y list)) (= (<= 2 (length (take 1 y))) (<= 1 0))))
(assert-claim
  (forall ((y list))
    (= (<= (length (drop 1 y)) 0) (<= (length y) 1))))
(assert-claim
  (forall ((y list))
    (= (<= (length (take 1 y)) 0) (<= (length y) 0))))
(assert-claim
  (forall ((y list)) (= (div (length (take 1 y)) 2) 0)))
(assert-claim
  (forall ((y list))
    (= (length (drop 1 (take 2 y))) (div (length (take 2 y)) 2))))
(assert-claim
  (forall ((y sk) (z Int) (x2 list))
    (= (drop z (drop z (cons y x2))) (drop z (cons y (drop z x2))))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop y (take (+ y y) z)) (take y (drop y z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (+ y (+ y y)) z) (drop y (drop y (drop y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (insert2 y (take2 x (cons2 y z)))
      (cons2 y (take2 x (cons2 y z))))))
(assert-claim
  (forall ((x list2) (y Int) (z list2))
    (= (lmerge (cons2 y x) (cons2 y z))
      (cons2 y (lmerge x (cons2 y z))))))
(assert-claim
  (forall ((y Int) (z sk) (x2 list))
    (= (take y (cons z (take y x2))) (take y (cons z x2)))))
(assert-claim
  (forall ((y Int) (z Int) (x2 list))
    (= (take z (drop y (take z x2))) (drop y (take z x2)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (drop (div y y) z)) (take y (drop 1 z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (take (+ y y) z)) (take y z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (take (div y y) z)) (take y (take 1 z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 x (cons2 (div x x) y)) (take2 x (cons2 1 y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (take2 x (insert2 y (take2 x z))) (take2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 x (insert2 (div x x) y)) (take2 x (insert2 1 y)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (take2 x (lmerge y (take2 x z))) (take2 x (lmerge y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (take2 x (lmerge (take2 x y) z)) (take2 x (lmerge y z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (- (length z) (length (drop y z))) (length (take y z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (div (length z) (length (cons y z))) 0)))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop y (drop y (take 1 z))) (drop y (take 1 z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop y (take (- 0 y) z)) (take (- 0 y) z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop y (take (- 1 y) z)) (take (- 1 y) z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop y (take 1 (drop y z))) (drop y (take 1 z)))))
(assert-claim
  (forall ((y Int) (z list)) (= (drop y (take (div y 2) z)) nil)))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (+ y (+ y 1)) z) (drop y (drop (+ y 1) z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (+ y (div y 2)) z) (drop y (drop (div y 2) z)))))
(assert-claim
  (forall ((y sk) (z Int) (x2 list))
    (= (drop 1 (take z (cons y x2))) (take (- z 1) x2))))
(assert-claim
  (forall ((x2 list) (x3 list) (x4 list))
    (= (drop (length x2) (drop (length x3) x4))
      (drop (+ (length x2) (length x3)) x4))))
(assert-claim
  (forall ((x2 list) (x3 list) (x4 list))
    (= (drop (length (drop (length x3) x2)) x4)
      (drop (- (length x2) (length x3)) x4))))
(assert-claim
  (forall ((y list) (z list2))
    (= (drop2 (length y) (cons2 (length y) z))
      (drop2 (length y) (cons2 0 z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (cons2 (- x 1) y)) (cons2 (- x 1) (insert2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (cons2 (- x 2) y)) (cons2 (- x 2) (insert2 x y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (insert2 y (drop2 x (cons2 y nil2)))
      (cons2 y (drop2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 x (drop2 1 (insert2 x y)))
      (drop2 1 (insert2 x (insert2 x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 (+ x 1) (cons2 x y)) (cons2 x (insert2 (+ x 1) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 (+ x 2) (cons2 x y)) (cons2 x (insert2 (+ x 2) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 0 (take2 x (cons2 x y)))
      (cons2 0 (take2 x (cons2 x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 1 (take2 x (cons2 x y)))
      (cons2 1 (take2 x (cons2 x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (isort (drop2 (length2 y) (cons2 x y)))
      (drop2 (length2 y) (cons2 x y)))))
(assert-claim
  (forall ((z Int) (x2 list) (x3 list))
    (= (length (drop z (take (length x3) x2)))
      (length (drop z (take (length x2) x3))))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (length2 (drop2 x (drop2 y (isort z))))
      (length2 (drop2 x (drop2 y z))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (length2 (lmerge y (drop2 (length2 y) x)))
      (length2 (lmerge x (drop2 (length2 x) y))))))
(assert-claim
  (forall ((x list2))
    (= (lmerge (drop2 1 x) (lmerge x x))
      (drop2 1 (lmerge x (lmerge x x))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (lmerge (drop2 1 y) (take2 x y))
      (drop2 1 (lmerge y (take2 x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (lmerge (drop2 1 (insert2 x y)) y)
      (drop2 1 (insert2 x (lmerge y y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (drop2 1 (lmerge y x)) y)
      (drop2 1 (lmerge y (lmerge x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (drop2 1 (lmerge x y)) y)
      (drop2 1 (lmerge x (lmerge y y))))))
(assert-claim
  (forall ((y Int) (z Int) (x2 sk))
    (= (take z (drop y (cons x2 nil)))
      (drop y (take z (cons x2 nil))))))
(assert-claim
  (forall ((y Int) (z Int) (x2 list))
    (= (take z (drop y (take 1 x2))) (drop y (take z (take 1 x2))))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (drop (+ y 1) z)) (take y (drop y (drop 1 z))))))
(assert-claim
  (forall ((y sk) (z Int) (x2 sk) (x3 list))
    (= (take z (drop z (cons y x3))) (take z (drop z (cons x2 x3))))))
(assert-claim
  (forall ((y Int) (z sk) (x2 list))
    (= (take y (drop (- y 1) x2)) (take y (drop y (cons z x2))))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (drop (- 0 y) z)) (take y z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (drop (- 1 y) z)) (take y z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (drop (div 0 y) z)) (take y z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (drop (div 1 y) z)) (take y (drop (- 2 y) z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (take (div y 2) z)) (take (div y 2) z))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take y (take (div 1 y) z)) (take y (take (- 2 y) z)))))
(assert-claim
  (forall ((y Int) (z sk))
    (= (take (+ y y) (cons z nil)) (take y (cons z nil)))))
(assert-claim
  (forall ((y Int) (z sk) (x2 list))
    (= (drop y (cons z (take y x2))) (take 1 (drop y (cons z x2))))))
(assert-claim
  (forall ((x2 list) (x3 list) (x4 list))
    (= (take (length (drop (length x3) x2)) x4)
      (take (- (length x2) (length x3)) x4))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 x (cons2 (div 0 x) y)) (take2 x (cons2 0 y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 x (insert2 x (cons2 0 y)))
      (take2 x (cons2 0 (insert2 x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 x (insert2 x (cons2 1 y)))
      (take2 x (cons2 1 (insert2 x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 x (insert2 (div 0 x) y)) (take2 x (insert2 0 y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 1 (lmerge y (take2 x y))) (take2 1 y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (take2 2 (lmerge x (lmerge y x)))
      (take2 2 (lmerge x (lmerge x y))))))
(assert-claim
  (forall ((x list2))
    (= (take2 2 (lmerge x (lmerge x x))) (take2 2 (lmerge x x)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (take2 2 (lmerge (cons2 x y) y)) (take2 2 (insert2 x y)))))
(assert-claim
  (forall ((z sk) (x2 list) (x3 list))
    (= (<= 1 (length (drop (length x2) x3)))
      (<= (length (cons z x2)) (length x3)))))
(assert-claim
  (forall ((z list) (x2 sk) (x3 list))
    (= (<= (length (drop 1 z)) (length x3))
      (<= (length z) (length (cons x2 x3))))))
(assert-claim
  (forall ((z list) (x2 list))
    (= (<= (length (drop 2 z)) (length x2))
      (<= (- (length z) 2) (length x2)))))
(assert-claim
  (forall ((y list)) (= (div (length y) (+ 2 (length y))) 0)))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (- 1 y) (take 1 z)) (take y (take 1 z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop 1 (take (+ y 1) z)) (take y (drop 1 z)))))
(assert-claim
  (forall ((y Int) (z sk))
    (= (drop (div y 2) (cons z nil)) (drop (- y 1) (cons z nil)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (drop (div y 2) (take 1 z)) (drop (- y 1) (take 1 z)))))
(assert-claim
  (forall ((x Int))
    (= (drop2 x (insert2 x (cons2 1 nil2)))
      (drop2 x (cons2 x (cons2 1 nil2))))))
(assert-claim
  (forall ((x Int))
    (= (drop2 x (insert2 x (cons2 2 nil2)))
      (drop2 x (cons2 x (cons2 2 nil2))))))
(assert-claim
  (forall ((x list2)) (= (drop2 1 (lmerge (take2 1 x) x)) x)))
(assert-claim
  (forall ((x list2))
    (= (drop2 1 (take2 2 (lmerge x x)))
      (take2 1 (isort (take2 2 x))))))
(assert-claim
  (forall ((x Int))
    (= (insert2 x (drop2 x (cons2 0 nil2)))
      (cons2 x (drop2 x (cons2 0 nil2))))))
(assert-claim
  (forall ((x Int))
    (= (insert2 x (drop2 x (cons2 1 nil2)))
      (cons2 x (drop2 x (cons2 1 nil2))))))
(assert-claim
  (forall ((x Int))
    (= (insert2 x (drop2 x (cons2 2 nil2)))
      (cons2 x (drop2 x (cons2 2 nil2))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 0 (take2 x (cons2 1 y)))
      (cons2 0 (take2 x (cons2 1 y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 0 (take2 x (cons2 2 y)))
      (cons2 0 (take2 x (cons2 2 y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (insert2 1 (take2 x (cons2 2 y)))
      (cons2 1 (take2 x (cons2 2 y))))))
(assert-claim
  (forall ((x list2))
    (= (isort (drop2 (- 2 (length2 x)) x))
      (drop2 (- 2 (length2 x)) (isort x)))))
(assert-claim
  (forall ((x list2))
    (= (isort (drop2 (- (length2 x) 1) x))
      (drop2 (- (length2 x) 1) x))))
(assert-claim
  (forall ((x list2))
    (= (isort (take2 (- 2 (length2 x)) x))
      (take2 (- 2 (length2 x)) x))))
(assert-claim
  (forall ((x list2))
    (= (isort (take2 2 (lmerge x (isort x))))
      (take2 2 (lmerge x (isort x))))))
(assert-claim
  (forall ((y sk) (z list))
    (= (length (drop (div (length z) 2) z))
      (div (length (cons y z)) 2))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 0 x) (cons2 1 y))
      (cons2 0 (lmerge x (cons2 1 y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 0 x) (cons2 2 y))
      (cons2 0 (lmerge x (cons2 2 y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 1 x) (cons2 0 y))
      (cons2 0 (lmerge (cons2 1 x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 1 x) (cons2 2 y))
      (cons2 1 (lmerge x (cons2 2 y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 1 x) (insert2 0 y))
      (insert2 0 (lmerge (cons2 1 x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 2 x) (cons2 0 y))
      (cons2 0 (lmerge (cons2 2 x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 2 x) (cons2 1 y))
      (cons2 1 (lmerge (cons2 2 x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 2 x) (insert2 0 y))
      (insert2 0 (lmerge (cons2 2 x) y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 2 x) (insert2 1 y))
      (insert2 1 (lmerge (cons2 2 x) y)))))
(assert-claim
  (forall ((x list2))
    (= (lmerge (drop2 1 (take2 2 x)) x)
      (drop2 1 (lmerge (take2 2 x) x)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (take (+ 1 2) (cons y z)) (cons y (take 2 z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (take (+ 2 2) (cons y z)) (cons y (take (+ 1 2) z)))))
(assert-claim
  (forall ((y Int) (z list))
    (= (take 1 (take (div y 2) z)) (drop (- 2 y) (take 1 z)))))
(assert-claim
  (forall ((x list2))
    (= (take2 (- 2 (length2 x)) (isort x))
      (take2 (- 2 (length2 x)) x))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (take2 2 (lmerge x (cons2 y x)))
      (take2 2 (lmerge x (cons2 y nil2))))))
(assert-claim
  (forall ((x list2))
    (= (take2 2 (lmerge x (take2 1 x))) (take2 2 (lmerge x x)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (take2 1 y) (take2 1 x))
      (lmerge (take2 1 x) (take2 1 y)))))
(assert-claim
  (forall ((x list2))
    (= (take2 2 (lmerge (take2 1 x) x))
      (lmerge (take2 1 x) (take2 1 x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 (+ 1 2) (cons2 0 x)) (cons2 0 (insert2 (+ 1 2) x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 (+ 2 2) (cons2 0 x)) (cons2 0 (insert2 (+ 2 2) x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 (+ 2 2) (cons2 1 x)) (cons2 1 (insert2 (+ 2 2) x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 1 (cons2 (- 0 2) x)) (cons2 (- 0 2) (insert2 1 x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 1 (drop2 1 (insert2 0 x)))
      (drop2 1 (insert2 0 (insert2 1 x))))))
(assert-claim
  (forall ((x list2))
    (= (insert2 2 (cons2 (- 0 1) x)) (cons2 (- 0 1) (insert2 2 x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 2 (cons2 (- 0 2) x)) (cons2 (- 0 2) (insert2 2 x)))))
(assert-claim
  (forall ((x list2))
    (= (insert2 2 (drop2 1 (insert2 0 x)))
      (drop2 1 (insert2 0 (insert2 2 x))))))
(assert-claim
  (forall ((x list2))
    (= (insert2 2 (drop2 1 (insert2 1 x)))
      (drop2 1 (insert2 1 (insert2 2 x))))))
