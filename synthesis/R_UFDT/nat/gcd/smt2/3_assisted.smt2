(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

(define-fun less ((x nat) (y nat)) Bool
 (exists ((k nat))(= (add x (s k)) y))
)

(define-fun leq ((x nat) (y nat)) Bool
 (exists ((k nat))(= (add x k) y))
)

(define-fun divides ((x nat) (y nat)) Bool
  (exists ((k nat)) (= (mult k x) y))
)

; encoded definition of gcd
(define-fun gcd ((x0 nat) (x1 nat) (y nat)) Bool
(and (and (divides y x0) (divides y x1))(forall ((z nat))(=> (and (divides z x0) (divides z x1))(leq z y))))
)

(define-fun-rec rem ((x nat) (y nat)) nat
  (match x ((zero zero)
           ((s x0) (
            ite (= (s (rem x0 y)) y) zero (s (rem x0 y))
           )))))

;LEMMAS
(assert-claim (forall ((x1 nat) (x2 nat)) (=> (and (= (rem x1 x2) zero) (distinct x2 zero)) (gcd x2 x1 x2))))
(assert-claim (forall ((x1 nat) (x2 nat)) (=> (and (distinct (rem x1 x2) zero) (distinct x2 zero)) (less (rem x2 (rem x1 x2)) (rem x1 x2)))))
(assert-claim (forall ((x1 nat) (x2 nat) (x3 nat)) (=> (and (distinct (rem x1 x2) zero) (distinct x2 zero)) (=> (gcd x3 x2 (rem x1 x2)) (gcd x3 x1 x2)))))


;SPECIFICATION
(assert-synth ((x0 nat) (x1 nat)) ((y nat)) (=> (and (distinct x0 zero) (distinct x1 zero)) (gcd x0 x1 y)))

