(set-logic UFDT)

(declare-datatype nat ((s (s0 nat)) (zero)))
(declare-datatype lst ((nil) (cons (cons0 nat) (cons1 lst))))

(define-fun-rec app ((x lst) (y lst)) lst
  (match x ((nil y)
            ((cons x0 x1) (cons x0 (app x1 y))))))

(define-fun-rec qreva ((x lst) (y lst)) lst
  (match y ((nil x)
            ((cons y0 y1) (qreva (cons y0 x) y1)))))

(define-fun rev ((x lst)) lst
  (qreva nil x))

; SPECIFICATION
(assert-synth ((x lst)) ((y lst)) (= (rev x) y))

(set-option :uncomputable (rev qreva))

