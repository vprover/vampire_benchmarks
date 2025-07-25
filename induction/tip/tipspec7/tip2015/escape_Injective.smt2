(declare-datatype Token ((A) (B) (C) (D) (ESC) (P) (Q) (R)))
(declare-datatype list ((nil) (cons (head Token) (tail list))))
(define-fun
  isSpecial
  ((x Token)) Bool
  (match x
    ((ESC true)
     (P true)
     (Q true)
     (R true)
     (_ false))))
(define-fun
  code
  ((x Token)) Token
  (match x
    ((ESC ESC)
     (P A)
     (Q B)
     (R C)
     (_ x))))
(define-fun-rec
  escape
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs)
      (ite
        (isSpecial y) (cons ESC (cons (code y) (escape xs)))
        (cons y (escape xs)))))))
(assert-not
  (forall ((xs list) (ys list))
    (=> (= (escape xs) (escape ys)) (= xs ys))))
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim true)
(assert-claim (= (escape nil) nil))
(assert-claim
  (= (escape (cons ESC nil)) (cons ESC (cons ESC nil))))
(assert-claim
  (= (escape (cons ESC (cons D nil)))
    (cons ESC (cons ESC (cons D nil)))))
(assert-claim (= (escape (cons P nil)) (cons ESC (cons A nil))))
(assert-claim
  (= (escape (cons P (cons A nil)))
    (cons ESC (cons A (cons A nil)))))
(assert-claim
  (= (escape (cons P (cons B nil)))
    (cons ESC (cons A (cons B nil)))))
(assert-claim
  (= (escape (cons P (cons C nil)))
    (cons ESC (cons A (cons C nil)))))
(assert-claim
  (= (escape (cons P (cons D nil)))
    (cons ESC (cons A (cons D nil)))))
(assert-claim (= (escape (cons Q nil)) (cons ESC (cons B nil))))
(assert-claim
  (= (escape (cons Q (cons A nil)))
    (cons ESC (cons B (cons A nil)))))
(assert-claim
  (= (escape (cons Q (cons B nil)))
    (cons ESC (cons B (cons B nil)))))
(assert-claim
  (= (escape (cons Q (cons C nil)))
    (cons ESC (cons B (cons C nil)))))
(assert-claim
  (= (escape (cons Q (cons D nil)))
    (cons ESC (cons B (cons D nil)))))
(assert-claim (= (escape (cons R nil)) (cons ESC (cons C nil))))
(assert-claim
  (= (escape (cons R (cons A nil)))
    (cons ESC (cons C (cons A nil)))))
(assert-claim
  (= (escape (cons R (cons B nil)))
    (cons ESC (cons C (cons B nil)))))
(assert-claim
  (= (escape (cons R (cons C nil)))
    (cons ESC (cons C (cons C nil)))))
(assert-claim
  (= (escape (cons R (cons D nil)))
    (cons ESC (cons C (cons D nil)))))
(assert-claim (forall ((x Token)) (= (code (code x)) (code x))))
(assert-claim
  (forall ((x list)) (= (escape (cons A x)) (cons A (escape x)))))
(assert-claim
  (forall ((x list)) (= (escape (cons B x)) (cons B (escape x)))))
(assert-claim
  (forall ((x list)) (= (escape (cons C x)) (cons C (escape x)))))
(assert-claim
  (forall ((x list)) (= (escape (cons D x)) (cons D (escape x)))))
(assert-claim
  (forall ((x list))
    (= (cons ESC (cons A (escape x))) (escape (cons P x)))))
(assert-claim
  (forall ((x list))
    (= (cons ESC (cons B (escape x))) (escape (cons Q x)))))
(assert-claim
  (forall ((x list))
    (= (cons ESC (cons C (escape x))) (escape (cons R x)))))
(assert-claim
  (forall ((x list))
    (= (cons ESC (cons ESC (escape x))) (escape (cons ESC x)))))
(assert-claim
  (forall ((x Token))
    (=> (isSpecial x)
      (= (escape (cons x nil)) (cons ESC (cons (code x) nil))))))
