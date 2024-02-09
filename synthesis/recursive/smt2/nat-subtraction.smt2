(set-logic UFDT)

; TYPE OF NATURAL NUMBERS
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))

(declare-fun add (nat nat) nat)
(declare-fun le (nat nat) Bool)
(declare-fun leq (nat nat) Bool)

;; NATURAL NUMBER AXIOMS
; A3
(assert (forall ((x nat)) (= (add x zero) x)))
; A4
(assert (forall ((x nat) (y nat)) (= (add x (s y)) (s (add x y)))))
; A7
(assert (forall ((x nat)) (not (le x zero))))
; A8
(assert (forall ((x nat) (y nat)) (= (le x (s y)) (or (le x y) (= x y)))))
; A9
(assert (forall ((x nat) (y nat) (z nat)) (=> (and (le x y) (le y z)) (le x z))))
; A10
(assert (forall ((x nat) (y nat)) (= (not (le y x)) (leq x y))))

;; NATURAL NUMBER LEMMAS
; L1
(assert (forall ((x nat)) (= x (add zero x))))
; L2
(assert (forall ((x nat) (n nat)) (= (add (s x) n) (add x (s n)))))
; L5
(assert (forall ((x nat) (y nat)) (=> (le (s x) y) (le x y))))
; L6
(assert (forall ((x nat) (y nat) (z nat)) (=> (and (= (add y x) z) (le y z)) (not (= x zero)))))
; L7
(assert (forall ((x nat) (y nat)) (=> (le x y) (not (= x y)))))
; L8
(assert (forall ((x nat) (y nat)) (=> (le x y) (or (le (s x) y) (= (s x) y)))))
; L9
(assert (forall ((x nat) (y nat)) (=> (leq y x) (leq y (s x)))))
; L10
(assert (forall ((x nat) (y nat)) (=> (not (= y zero)) (le x (add x y)))))
; L11
(assert (forall ((x nat) (y nat)) (=> (le x y) (leq x y))))
; L12
(assert (forall ((x nat) (y nat)) (=> (le x y) (not (= x y)))))
; L13
(assert (forall ((x nat) (y nat) (z nat)) (=> (and (or (leq x y) (leq x z)) (leq y z)) (leq x z))))
; L14
(assert (forall ((n1 nat) (n2 nat) (m nat)) (=> (= n1 n2) (= (add m n1) (add m n2)))))

; ENCODING OF THE SPECIFICATION USING A FRESH UNCOMPUTABLE PREDICATE p
(declare-fun p (nat nat nat) Bool)
(assert (forall ((x1 nat) (x2 nat) (y nat)) (= (p x1 x2 y) (=> (le x2 x1) (= (add x2 y) x1)))))

(assert-not (forall ((x1 nat) (x2 nat)) (exists ((y nat)) (p x1 x2 y))))

(set-option :uncomputable (p))

(check-sat)
