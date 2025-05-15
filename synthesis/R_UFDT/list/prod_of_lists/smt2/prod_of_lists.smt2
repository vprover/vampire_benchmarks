(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))


(define-fun-rec add ((x nat) (y nat)) nat
  (match y ((zero x)
           ((s y0) (s (add x y0))))))

(define-fun-rec mult ((x nat) (y nat)) nat
  (match y ((zero zero)
           ((s y0) (add (mult x y0) x)))))

(define-fun-rec sum ((x lst)) nat
  (match x ((nil zero) 
           ((cons x0 x1) (add (sum x1) x0)))))

;pointwise multiplication of two lists
(define-fun-rec prod ((x lst) (y lst)) lst
    (match x ((nil nil) ((cons x0 x1) (
      match y ((nil nil)
      ((cons y0 y1) (cons (mult x0 y0) (prod x1 y1)))))
  ))))


; SPECIFICATION
(assert-synth ((x0 lst) (x1 lst)) ((y nat)) (= y (sum (prod x0 x1))))

(set-option :uncomputable (sum prod))

