(set-logic UFDT)

; type of natural numbers
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))

(declare-fun half (nat) nat)
(declare-fun even (nat) Bool)

;; Definition of half
(assert (= (half zero) zero))
(assert (= (half (s zero)) zero))
(assert (forall ((x nat)) (= (half (s (s x))) (s (half x)))))

;; Definition of even
(assert (even zero))
(assert (not (even (s zero))))
(assert (forall ((x nat)) (= (even (s (s x))) (even x))))

; Encoding of the specification using a fresh uncomputable predicate p
(declare-fun p (nat nat) Bool)
(assert (forall ((x nat) (y nat)) (= (p x y) (and (= (half y) x) (even y)))))

(assert-not (forall ((x nat)) (exists ((y nat)) (p x y))))

(set-option :uncomputable (p))

(check-sat)
