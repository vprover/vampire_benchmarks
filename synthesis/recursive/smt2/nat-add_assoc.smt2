(set-logic UFDT)

; TYPE OF NATURAL NUMBERS
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))

(declare-fun add (nat nat) nat)

;; NATURAL NUMBER AXIOMS AND LEMMAS
; A3
(assert (forall ((x nat)) (= (add x zero) x)))
; A4
(assert (forall ((x nat) (y nat)) (= (add x (s y)) (s (add x y)))))
; L1
(assert (forall ((x nat)) (= x (add zero x))))
; L2
(assert (forall ((x nat) (n nat)) (= (add (s x) n) (add x (s n)))))

; SPECIFICATION
(assert-not (forall ((x nat) (y nat) (z nat)) (exists ((w nat)) (= (add (add x y) z) (add x w)))))

(check-sat)
