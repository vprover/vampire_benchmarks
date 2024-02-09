(set-logic UFDT)

; TYPES OF NATURAL NUMBERS AND TREES
(declare-datatypes ((nat 0) (tree 0)) (((s (s0 nat)) (zero)) ((leaf (leaf0 nat)) (node (lc tree) (val nat) (rc tree)))))

(declare-fun le (nat nat) Bool)
(declare-fun leq (nat nat) Bool)
(declare-fun inbt (nat tree) Bool)

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

;; BINARY TREE AXIOMS
; A1
(assert (forall ((n nat) (k nat)) (= (inbt n (leaf k)) (= n k))))
; A2
(assert (forall ((l tree) (r tree) (n nat) (k nat)) (= (inbt n (node l k r)) (or (inbt n l) (inbt n r) (= n k)))))

; ENCODING OF THE SPECIFICATION USING A FRESH UNCOMPUTABLE PREDICATE p
(declare-fun p (tree nat) Bool)
(assert (forall ((t tree) (n nat)) (= (p t n) (and (inbt n t) (forall ((k nat)) (=> (inbt k t) (leq k n)))))))

(assert-not (forall ((t tree)) (exists ((n nat)) (p t n))))

(set-option :uncomputable (p))

(check-sat)
