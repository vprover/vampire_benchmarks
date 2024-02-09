(set-logic UFDT)

; TYPES OF NATURAL NUMBERS AND LISTS
(declare-datatypes ((nat 0) (lst 0)) (((s (s0 nat)) (zero)) ((nil) (cons (cons0 nat) (cons1 lst)))))

(declare-fun le (nat nat) Bool)
(declare-fun leq (nat nat) Bool)
(declare-fun inlst (nat lst) Bool)

;; NATURAL NUMBER AXIOMS
; A7
(assert (forall ((x nat)) (not (le x zero))))
; A8
(assert (forall ((x nat) (y nat)) (= (le x (s y)) (or (le x y) (= x y)))))
; A9
(assert (forall ((x nat) (y nat) (z nat)) (=> (and (le x y) (le y z)) (le x z))))
; A10
(assert (forall ((x nat) (y nat)) (= (not (le y x)) (leq x y))))

;; NATURAL NUMBER LEMMAS
; L5
(assert (forall ((x nat) (y nat)) (=> (le (s x) y) (le x y))))
; L7
(assert (forall ((x nat) (y nat)) (=> (le x y) (not (= x y)))))
; L8
(assert (forall ((x nat) (y nat)) (=> (le x y) (or (le (s x) y) (= (s x) y)))))
; L9
(assert (forall ((x nat) (y nat)) (=> (leq y x) (leq y (s x)))))
; L11
(assert (forall ((x nat) (y nat)) (=> (le x y) (leq x y))))
; L12
(assert (forall ((x nat) (y nat)) (=> (le x y) (not (= x y)))))
; L13
(assert (forall ((x nat) (y nat) (z nat)) (=> (and (or (leq x y) (leq x z)) (leq y z)) (leq x z))))

;; LIST AXIOMS
; A10
(assert (forall ((x nat)) (not (inlst x nil))))
; A11
(assert (forall ((l lst) (n nat) (k nat)) (= (inlst n (cons k l)) (or (inlst n l) (= n k)))))

; ENCODING OF THE SPECIFICATION USING A FRESH UNCOMPUTABLE PREDICATE p
(declare-fun p (lst nat) Bool)
(assert (forall ((l lst) (n nat)) (= (p l n) (and (inlst n l) (forall ((k nat)) (=> (inlst k l) (leq k n)))))))

(assert-not (forall ((l lst)) (exists ((n nat)) (=> (not (= l nil)) (p l n)))))

(set-option :uncomputable (p))

(check-sat)
