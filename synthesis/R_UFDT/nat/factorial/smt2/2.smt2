(set-logic UFDT)

(declare-datatype nat ((zero) (s (s0 nat))))

(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

(define-fun-rec fac ((x nat)) nat
  (match x ((zero (s zero))
           ((s x0) (mult (s x0) (fac x0))))))

(assert-synth ((x nat)) ((y nat)) (= (fac (fac x)) y))

(set-option :uncomputable (fac))


