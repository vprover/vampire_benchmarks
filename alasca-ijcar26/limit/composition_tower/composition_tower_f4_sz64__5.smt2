(set-info :smt-lib-version 2.6)
(set-logic UFLRA)
; lim[x -> l1](f_i1(x)) ~ l
; lim[x -> l2](f_i2(x)) ~ l1
; lim[x -> l3](f_i3(x)) ~ l2
; ...
; lim[x -> l63](f_i63(x)) ~ l62
; lim[x -> a](f_i64(x)) ~ l63
; ============================
; lim[x -> a](f_i1(f_i2(f_i3(...f_i64(x)...)))) ~ l
; 
; 
; where
; - 4 functions with arity 1
; - 64 number of function applications

(declare-fun f0 (Real) Real)
(declare-fun f1 (Real) Real)
(declare-fun f2 (Real) Real)
(declare-fun f3 (Real) Real)
(declare-const l Real)
(declare-const a Real)
(declare-const l1 Real)
(declare-const l2 Real)
(declare-const l3 Real)
(declare-const l4 Real)
(declare-const l5 Real)
(declare-const l6 Real)
(declare-const l7 Real)
(declare-const l8 Real)
(declare-const l9 Real)
(declare-const l10 Real)
(declare-const l11 Real)
(declare-const l12 Real)
(declare-const l13 Real)
(declare-const l14 Real)
(declare-const l15 Real)
(declare-const l16 Real)
(declare-const l17 Real)
(declare-const l18 Real)
(declare-const l19 Real)
(declare-const l20 Real)
(declare-const l21 Real)
(declare-const l22 Real)
(declare-const l23 Real)
(declare-const l24 Real)
(declare-const l25 Real)
(declare-const l26 Real)
(declare-const l27 Real)
(declare-const l28 Real)
(declare-const l29 Real)
(declare-const l30 Real)
(declare-const l31 Real)
(declare-const l32 Real)
(declare-const l33 Real)
(declare-const l34 Real)
(declare-const l35 Real)
(declare-const l36 Real)
(declare-const l37 Real)
(declare-const l38 Real)
(declare-const l39 Real)
(declare-const l40 Real)
(declare-const l41 Real)
(declare-const l42 Real)
(declare-const l43 Real)
(declare-const l44 Real)
(declare-const l45 Real)
(declare-const l46 Real)
(declare-const l47 Real)
(declare-const l48 Real)
(declare-const l49 Real)
(declare-const l50 Real)
(declare-const l51 Real)
(declare-const l52 Real)
(declare-const l53 Real)
(declare-const l54 Real)
(declare-const l55 Real)
(declare-const l56 Real)
(declare-const l57 Real)
(declare-const l58 Real)
(declare-const l59 Real)
(declare-const l60 Real)
(declare-const l61 Real)
(declare-const l62 Real)
(declare-const l63 Real)
; Axiom 0
(assert ; lim[x -> l1](f1 x) = l
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l1 != x
                                     (and (not (= x l1))
                                          ; | x - l1 | < delta
                                          (< (ite (>= (- x l1) 0.0) (- x l1) (- (- x l1))) delta))
                                     ;
                                     ; | (f1 x) - l | < epsilon
                                     (< (ite (>= (- (f1 x) l) 0.0) (- (f1 x) l) (- (- (f1 x) l))) epsilon)
            ))
          ))
        )))

; Axiom 1
(assert ; lim[x -> l2](f0 x) = l1
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l2 != x
                                     (and (not (= x l2))
                                          ; | x - l2 | < delta
                                          (< (ite (>= (- x l2) 0.0) (- x l2) (- (- x l2))) delta))
                                     ;
                                     ; | (f0 x) - l1 | < epsilon
                                     (< (ite (>= (- (f0 x) l1) 0.0) (- (f0 x) l1) (- (- (f0 x) l1))) epsilon)
            ))
          ))
        )))

; Axiom 2
(assert ; lim[x -> l3](f1 x) = l2
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l3 != x
                                     (and (not (= x l3))
                                          ; | x - l3 | < delta
                                          (< (ite (>= (- x l3) 0.0) (- x l3) (- (- x l3))) delta))
                                     ;
                                     ; | (f1 x) - l2 | < epsilon
                                     (< (ite (>= (- (f1 x) l2) 0.0) (- (f1 x) l2) (- (- (f1 x) l2))) epsilon)
            ))
          ))
        )))

; Axiom 3
(assert ; lim[x -> l4](f2 x) = l3
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l4 != x
                                     (and (not (= x l4))
                                          ; | x - l4 | < delta
                                          (< (ite (>= (- x l4) 0.0) (- x l4) (- (- x l4))) delta))
                                     ;
                                     ; | (f2 x) - l3 | < epsilon
                                     (< (ite (>= (- (f2 x) l3) 0.0) (- (f2 x) l3) (- (- (f2 x) l3))) epsilon)
            ))
          ))
        )))

; Axiom 4
(assert ; lim[x -> l5](f2 x) = l4
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l5 != x
                                     (and (not (= x l5))
                                          ; | x - l5 | < delta
                                          (< (ite (>= (- x l5) 0.0) (- x l5) (- (- x l5))) delta))
                                     ;
                                     ; | (f2 x) - l4 | < epsilon
                                     (< (ite (>= (- (f2 x) l4) 0.0) (- (f2 x) l4) (- (- (f2 x) l4))) epsilon)
            ))
          ))
        )))

; Axiom 5
(assert ; lim[x -> l6](f1 x) = l5
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l6 != x
                                     (and (not (= x l6))
                                          ; | x - l6 | < delta
                                          (< (ite (>= (- x l6) 0.0) (- x l6) (- (- x l6))) delta))
                                     ;
                                     ; | (f1 x) - l5 | < epsilon
                                     (< (ite (>= (- (f1 x) l5) 0.0) (- (f1 x) l5) (- (- (f1 x) l5))) epsilon)
            ))
          ))
        )))

; Axiom 6
(assert ; lim[x -> l7](f0 x) = l6
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l7 != x
                                     (and (not (= x l7))
                                          ; | x - l7 | < delta
                                          (< (ite (>= (- x l7) 0.0) (- x l7) (- (- x l7))) delta))
                                     ;
                                     ; | (f0 x) - l6 | < epsilon
                                     (< (ite (>= (- (f0 x) l6) 0.0) (- (f0 x) l6) (- (- (f0 x) l6))) epsilon)
            ))
          ))
        )))

; Axiom 7
(assert ; lim[x -> l8](f2 x) = l7
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l8 != x
                                     (and (not (= x l8))
                                          ; | x - l8 | < delta
                                          (< (ite (>= (- x l8) 0.0) (- x l8) (- (- x l8))) delta))
                                     ;
                                     ; | (f2 x) - l7 | < epsilon
                                     (< (ite (>= (- (f2 x) l7) 0.0) (- (f2 x) l7) (- (- (f2 x) l7))) epsilon)
            ))
          ))
        )))

; Axiom 8
(assert ; lim[x -> l9](f2 x) = l8
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l9 != x
                                     (and (not (= x l9))
                                          ; | x - l9 | < delta
                                          (< (ite (>= (- x l9) 0.0) (- x l9) (- (- x l9))) delta))
                                     ;
                                     ; | (f2 x) - l8 | < epsilon
                                     (< (ite (>= (- (f2 x) l8) 0.0) (- (f2 x) l8) (- (- (f2 x) l8))) epsilon)
            ))
          ))
        )))

; Axiom 9
(assert ; lim[x -> l10](f3 x) = l9
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l10 != x
                                     (and (not (= x l10))
                                          ; | x - l10 | < delta
                                          (< (ite (>= (- x l10) 0.0) (- x l10) (- (- x l10))) delta))
                                     ;
                                     ; | (f3 x) - l9 | < epsilon
                                     (< (ite (>= (- (f3 x) l9) 0.0) (- (f3 x) l9) (- (- (f3 x) l9))) epsilon)
            ))
          ))
        )))

; Axiom 10
(assert ; lim[x -> l11](f2 x) = l10
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l11 != x
                                     (and (not (= x l11))
                                          ; | x - l11 | < delta
                                          (< (ite (>= (- x l11) 0.0) (- x l11) (- (- x l11))) delta))
                                     ;
                                     ; | (f2 x) - l10 | < epsilon
                                     (< (ite (>= (- (f2 x) l10) 0.0) (- (f2 x) l10) (- (- (f2 x) l10))) epsilon)
            ))
          ))
        )))

; Axiom 11
(assert ; lim[x -> l12](f3 x) = l11
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l12 != x
                                     (and (not (= x l12))
                                          ; | x - l12 | < delta
                                          (< (ite (>= (- x l12) 0.0) (- x l12) (- (- x l12))) delta))
                                     ;
                                     ; | (f3 x) - l11 | < epsilon
                                     (< (ite (>= (- (f3 x) l11) 0.0) (- (f3 x) l11) (- (- (f3 x) l11))) epsilon)
            ))
          ))
        )))

; Axiom 12
(assert ; lim[x -> l13](f2 x) = l12
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l13 != x
                                     (and (not (= x l13))
                                          ; | x - l13 | < delta
                                          (< (ite (>= (- x l13) 0.0) (- x l13) (- (- x l13))) delta))
                                     ;
                                     ; | (f2 x) - l12 | < epsilon
                                     (< (ite (>= (- (f2 x) l12) 0.0) (- (f2 x) l12) (- (- (f2 x) l12))) epsilon)
            ))
          ))
        )))

; Axiom 13
(assert ; lim[x -> l14](f3 x) = l13
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l14 != x
                                     (and (not (= x l14))
                                          ; | x - l14 | < delta
                                          (< (ite (>= (- x l14) 0.0) (- x l14) (- (- x l14))) delta))
                                     ;
                                     ; | (f3 x) - l13 | < epsilon
                                     (< (ite (>= (- (f3 x) l13) 0.0) (- (f3 x) l13) (- (- (f3 x) l13))) epsilon)
            ))
          ))
        )))

; Axiom 14
(assert ; lim[x -> l15](f2 x) = l14
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l15 != x
                                     (and (not (= x l15))
                                          ; | x - l15 | < delta
                                          (< (ite (>= (- x l15) 0.0) (- x l15) (- (- x l15))) delta))
                                     ;
                                     ; | (f2 x) - l14 | < epsilon
                                     (< (ite (>= (- (f2 x) l14) 0.0) (- (f2 x) l14) (- (- (f2 x) l14))) epsilon)
            ))
          ))
        )))

; Axiom 15
(assert ; lim[x -> l16](f3 x) = l15
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l16 != x
                                     (and (not (= x l16))
                                          ; | x - l16 | < delta
                                          (< (ite (>= (- x l16) 0.0) (- x l16) (- (- x l16))) delta))
                                     ;
                                     ; | (f3 x) - l15 | < epsilon
                                     (< (ite (>= (- (f3 x) l15) 0.0) (- (f3 x) l15) (- (- (f3 x) l15))) epsilon)
            ))
          ))
        )))

; Axiom 16
(assert ; lim[x -> l17](f1 x) = l16
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l17 != x
                                     (and (not (= x l17))
                                          ; | x - l17 | < delta
                                          (< (ite (>= (- x l17) 0.0) (- x l17) (- (- x l17))) delta))
                                     ;
                                     ; | (f1 x) - l16 | < epsilon
                                     (< (ite (>= (- (f1 x) l16) 0.0) (- (f1 x) l16) (- (- (f1 x) l16))) epsilon)
            ))
          ))
        )))

; Axiom 17
(assert ; lim[x -> l18](f0 x) = l17
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l18 != x
                                     (and (not (= x l18))
                                          ; | x - l18 | < delta
                                          (< (ite (>= (- x l18) 0.0) (- x l18) (- (- x l18))) delta))
                                     ;
                                     ; | (f0 x) - l17 | < epsilon
                                     (< (ite (>= (- (f0 x) l17) 0.0) (- (f0 x) l17) (- (- (f0 x) l17))) epsilon)
            ))
          ))
        )))

; Axiom 18
(assert ; lim[x -> l19](f3 x) = l18
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l19 != x
                                     (and (not (= x l19))
                                          ; | x - l19 | < delta
                                          (< (ite (>= (- x l19) 0.0) (- x l19) (- (- x l19))) delta))
                                     ;
                                     ; | (f3 x) - l18 | < epsilon
                                     (< (ite (>= (- (f3 x) l18) 0.0) (- (f3 x) l18) (- (- (f3 x) l18))) epsilon)
            ))
          ))
        )))

; Axiom 19
(assert ; lim[x -> l20](f2 x) = l19
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l20 != x
                                     (and (not (= x l20))
                                          ; | x - l20 | < delta
                                          (< (ite (>= (- x l20) 0.0) (- x l20) (- (- x l20))) delta))
                                     ;
                                     ; | (f2 x) - l19 | < epsilon
                                     (< (ite (>= (- (f2 x) l19) 0.0) (- (f2 x) l19) (- (- (f2 x) l19))) epsilon)
            ))
          ))
        )))

; Axiom 20
(assert ; lim[x -> l21](f0 x) = l20
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l21 != x
                                     (and (not (= x l21))
                                          ; | x - l21 | < delta
                                          (< (ite (>= (- x l21) 0.0) (- x l21) (- (- x l21))) delta))
                                     ;
                                     ; | (f0 x) - l20 | < epsilon
                                     (< (ite (>= (- (f0 x) l20) 0.0) (- (f0 x) l20) (- (- (f0 x) l20))) epsilon)
            ))
          ))
        )))

; Axiom 21
(assert ; lim[x -> l22](f1 x) = l21
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l22 != x
                                     (and (not (= x l22))
                                          ; | x - l22 | < delta
                                          (< (ite (>= (- x l22) 0.0) (- x l22) (- (- x l22))) delta))
                                     ;
                                     ; | (f1 x) - l21 | < epsilon
                                     (< (ite (>= (- (f1 x) l21) 0.0) (- (f1 x) l21) (- (- (f1 x) l21))) epsilon)
            ))
          ))
        )))

; Axiom 22
(assert ; lim[x -> l23](f0 x) = l22
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l23 != x
                                     (and (not (= x l23))
                                          ; | x - l23 | < delta
                                          (< (ite (>= (- x l23) 0.0) (- x l23) (- (- x l23))) delta))
                                     ;
                                     ; | (f0 x) - l22 | < epsilon
                                     (< (ite (>= (- (f0 x) l22) 0.0) (- (f0 x) l22) (- (- (f0 x) l22))) epsilon)
            ))
          ))
        )))

; Axiom 23
(assert ; lim[x -> l24](f1 x) = l23
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l24 != x
                                     (and (not (= x l24))
                                          ; | x - l24 | < delta
                                          (< (ite (>= (- x l24) 0.0) (- x l24) (- (- x l24))) delta))
                                     ;
                                     ; | (f1 x) - l23 | < epsilon
                                     (< (ite (>= (- (f1 x) l23) 0.0) (- (f1 x) l23) (- (- (f1 x) l23))) epsilon)
            ))
          ))
        )))

; Axiom 24
(assert ; lim[x -> l25](f0 x) = l24
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l25 != x
                                     (and (not (= x l25))
                                          ; | x - l25 | < delta
                                          (< (ite (>= (- x l25) 0.0) (- x l25) (- (- x l25))) delta))
                                     ;
                                     ; | (f0 x) - l24 | < epsilon
                                     (< (ite (>= (- (f0 x) l24) 0.0) (- (f0 x) l24) (- (- (f0 x) l24))) epsilon)
            ))
          ))
        )))

; Axiom 25
(assert ; lim[x -> l26](f0 x) = l25
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l26 != x
                                     (and (not (= x l26))
                                          ; | x - l26 | < delta
                                          (< (ite (>= (- x l26) 0.0) (- x l26) (- (- x l26))) delta))
                                     ;
                                     ; | (f0 x) - l25 | < epsilon
                                     (< (ite (>= (- (f0 x) l25) 0.0) (- (f0 x) l25) (- (- (f0 x) l25))) epsilon)
            ))
          ))
        )))

; Axiom 26
(assert ; lim[x -> l27](f0 x) = l26
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l27 != x
                                     (and (not (= x l27))
                                          ; | x - l27 | < delta
                                          (< (ite (>= (- x l27) 0.0) (- x l27) (- (- x l27))) delta))
                                     ;
                                     ; | (f0 x) - l26 | < epsilon
                                     (< (ite (>= (- (f0 x) l26) 0.0) (- (f0 x) l26) (- (- (f0 x) l26))) epsilon)
            ))
          ))
        )))

; Axiom 27
(assert ; lim[x -> l28](f3 x) = l27
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l28 != x
                                     (and (not (= x l28))
                                          ; | x - l28 | < delta
                                          (< (ite (>= (- x l28) 0.0) (- x l28) (- (- x l28))) delta))
                                     ;
                                     ; | (f3 x) - l27 | < epsilon
                                     (< (ite (>= (- (f3 x) l27) 0.0) (- (f3 x) l27) (- (- (f3 x) l27))) epsilon)
            ))
          ))
        )))

; Axiom 28
(assert ; lim[x -> l29](f3 x) = l28
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l29 != x
                                     (and (not (= x l29))
                                          ; | x - l29 | < delta
                                          (< (ite (>= (- x l29) 0.0) (- x l29) (- (- x l29))) delta))
                                     ;
                                     ; | (f3 x) - l28 | < epsilon
                                     (< (ite (>= (- (f3 x) l28) 0.0) (- (f3 x) l28) (- (- (f3 x) l28))) epsilon)
            ))
          ))
        )))

; Axiom 29
(assert ; lim[x -> l30](f3 x) = l29
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l30 != x
                                     (and (not (= x l30))
                                          ; | x - l30 | < delta
                                          (< (ite (>= (- x l30) 0.0) (- x l30) (- (- x l30))) delta))
                                     ;
                                     ; | (f3 x) - l29 | < epsilon
                                     (< (ite (>= (- (f3 x) l29) 0.0) (- (f3 x) l29) (- (- (f3 x) l29))) epsilon)
            ))
          ))
        )))

; Axiom 30
(assert ; lim[x -> l31](f2 x) = l30
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l31 != x
                                     (and (not (= x l31))
                                          ; | x - l31 | < delta
                                          (< (ite (>= (- x l31) 0.0) (- x l31) (- (- x l31))) delta))
                                     ;
                                     ; | (f2 x) - l30 | < epsilon
                                     (< (ite (>= (- (f2 x) l30) 0.0) (- (f2 x) l30) (- (- (f2 x) l30))) epsilon)
            ))
          ))
        )))

; Axiom 31
(assert ; lim[x -> l32](f3 x) = l31
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l32 != x
                                     (and (not (= x l32))
                                          ; | x - l32 | < delta
                                          (< (ite (>= (- x l32) 0.0) (- x l32) (- (- x l32))) delta))
                                     ;
                                     ; | (f3 x) - l31 | < epsilon
                                     (< (ite (>= (- (f3 x) l31) 0.0) (- (f3 x) l31) (- (- (f3 x) l31))) epsilon)
            ))
          ))
        )))

; Axiom 32
(assert ; lim[x -> l33](f0 x) = l32
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l33 != x
                                     (and (not (= x l33))
                                          ; | x - l33 | < delta
                                          (< (ite (>= (- x l33) 0.0) (- x l33) (- (- x l33))) delta))
                                     ;
                                     ; | (f0 x) - l32 | < epsilon
                                     (< (ite (>= (- (f0 x) l32) 0.0) (- (f0 x) l32) (- (- (f0 x) l32))) epsilon)
            ))
          ))
        )))

; Axiom 33
(assert ; lim[x -> l34](f1 x) = l33
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l34 != x
                                     (and (not (= x l34))
                                          ; | x - l34 | < delta
                                          (< (ite (>= (- x l34) 0.0) (- x l34) (- (- x l34))) delta))
                                     ;
                                     ; | (f1 x) - l33 | < epsilon
                                     (< (ite (>= (- (f1 x) l33) 0.0) (- (f1 x) l33) (- (- (f1 x) l33))) epsilon)
            ))
          ))
        )))

; Axiom 34
(assert ; lim[x -> l35](f0 x) = l34
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l35 != x
                                     (and (not (= x l35))
                                          ; | x - l35 | < delta
                                          (< (ite (>= (- x l35) 0.0) (- x l35) (- (- x l35))) delta))
                                     ;
                                     ; | (f0 x) - l34 | < epsilon
                                     (< (ite (>= (- (f0 x) l34) 0.0) (- (f0 x) l34) (- (- (f0 x) l34))) epsilon)
            ))
          ))
        )))

; Axiom 35
(assert ; lim[x -> l36](f3 x) = l35
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l36 != x
                                     (and (not (= x l36))
                                          ; | x - l36 | < delta
                                          (< (ite (>= (- x l36) 0.0) (- x l36) (- (- x l36))) delta))
                                     ;
                                     ; | (f3 x) - l35 | < epsilon
                                     (< (ite (>= (- (f3 x) l35) 0.0) (- (f3 x) l35) (- (- (f3 x) l35))) epsilon)
            ))
          ))
        )))

; Axiom 36
(assert ; lim[x -> l37](f1 x) = l36
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l37 != x
                                     (and (not (= x l37))
                                          ; | x - l37 | < delta
                                          (< (ite (>= (- x l37) 0.0) (- x l37) (- (- x l37))) delta))
                                     ;
                                     ; | (f1 x) - l36 | < epsilon
                                     (< (ite (>= (- (f1 x) l36) 0.0) (- (f1 x) l36) (- (- (f1 x) l36))) epsilon)
            ))
          ))
        )))

; Axiom 37
(assert ; lim[x -> l38](f3 x) = l37
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l38 != x
                                     (and (not (= x l38))
                                          ; | x - l38 | < delta
                                          (< (ite (>= (- x l38) 0.0) (- x l38) (- (- x l38))) delta))
                                     ;
                                     ; | (f3 x) - l37 | < epsilon
                                     (< (ite (>= (- (f3 x) l37) 0.0) (- (f3 x) l37) (- (- (f3 x) l37))) epsilon)
            ))
          ))
        )))

; Axiom 38
(assert ; lim[x -> l39](f0 x) = l38
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l39 != x
                                     (and (not (= x l39))
                                          ; | x - l39 | < delta
                                          (< (ite (>= (- x l39) 0.0) (- x l39) (- (- x l39))) delta))
                                     ;
                                     ; | (f0 x) - l38 | < epsilon
                                     (< (ite (>= (- (f0 x) l38) 0.0) (- (f0 x) l38) (- (- (f0 x) l38))) epsilon)
            ))
          ))
        )))

; Axiom 39
(assert ; lim[x -> l40](f0 x) = l39
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l40 != x
                                     (and (not (= x l40))
                                          ; | x - l40 | < delta
                                          (< (ite (>= (- x l40) 0.0) (- x l40) (- (- x l40))) delta))
                                     ;
                                     ; | (f0 x) - l39 | < epsilon
                                     (< (ite (>= (- (f0 x) l39) 0.0) (- (f0 x) l39) (- (- (f0 x) l39))) epsilon)
            ))
          ))
        )))

; Axiom 40
(assert ; lim[x -> l41](f1 x) = l40
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l41 != x
                                     (and (not (= x l41))
                                          ; | x - l41 | < delta
                                          (< (ite (>= (- x l41) 0.0) (- x l41) (- (- x l41))) delta))
                                     ;
                                     ; | (f1 x) - l40 | < epsilon
                                     (< (ite (>= (- (f1 x) l40) 0.0) (- (f1 x) l40) (- (- (f1 x) l40))) epsilon)
            ))
          ))
        )))

; Axiom 41
(assert ; lim[x -> l42](f3 x) = l41
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l42 != x
                                     (and (not (= x l42))
                                          ; | x - l42 | < delta
                                          (< (ite (>= (- x l42) 0.0) (- x l42) (- (- x l42))) delta))
                                     ;
                                     ; | (f3 x) - l41 | < epsilon
                                     (< (ite (>= (- (f3 x) l41) 0.0) (- (f3 x) l41) (- (- (f3 x) l41))) epsilon)
            ))
          ))
        )))

; Axiom 42
(assert ; lim[x -> l43](f2 x) = l42
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l43 != x
                                     (and (not (= x l43))
                                          ; | x - l43 | < delta
                                          (< (ite (>= (- x l43) 0.0) (- x l43) (- (- x l43))) delta))
                                     ;
                                     ; | (f2 x) - l42 | < epsilon
                                     (< (ite (>= (- (f2 x) l42) 0.0) (- (f2 x) l42) (- (- (f2 x) l42))) epsilon)
            ))
          ))
        )))

; Axiom 43
(assert ; lim[x -> l44](f1 x) = l43
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l44 != x
                                     (and (not (= x l44))
                                          ; | x - l44 | < delta
                                          (< (ite (>= (- x l44) 0.0) (- x l44) (- (- x l44))) delta))
                                     ;
                                     ; | (f1 x) - l43 | < epsilon
                                     (< (ite (>= (- (f1 x) l43) 0.0) (- (f1 x) l43) (- (- (f1 x) l43))) epsilon)
            ))
          ))
        )))

; Axiom 44
(assert ; lim[x -> l45](f0 x) = l44
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l45 != x
                                     (and (not (= x l45))
                                          ; | x - l45 | < delta
                                          (< (ite (>= (- x l45) 0.0) (- x l45) (- (- x l45))) delta))
                                     ;
                                     ; | (f0 x) - l44 | < epsilon
                                     (< (ite (>= (- (f0 x) l44) 0.0) (- (f0 x) l44) (- (- (f0 x) l44))) epsilon)
            ))
          ))
        )))

; Axiom 45
(assert ; lim[x -> l46](f2 x) = l45
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l46 != x
                                     (and (not (= x l46))
                                          ; | x - l46 | < delta
                                          (< (ite (>= (- x l46) 0.0) (- x l46) (- (- x l46))) delta))
                                     ;
                                     ; | (f2 x) - l45 | < epsilon
                                     (< (ite (>= (- (f2 x) l45) 0.0) (- (f2 x) l45) (- (- (f2 x) l45))) epsilon)
            ))
          ))
        )))

; Axiom 46
(assert ; lim[x -> l47](f1 x) = l46
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l47 != x
                                     (and (not (= x l47))
                                          ; | x - l47 | < delta
                                          (< (ite (>= (- x l47) 0.0) (- x l47) (- (- x l47))) delta))
                                     ;
                                     ; | (f1 x) - l46 | < epsilon
                                     (< (ite (>= (- (f1 x) l46) 0.0) (- (f1 x) l46) (- (- (f1 x) l46))) epsilon)
            ))
          ))
        )))

; Axiom 47
(assert ; lim[x -> l48](f2 x) = l47
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l48 != x
                                     (and (not (= x l48))
                                          ; | x - l48 | < delta
                                          (< (ite (>= (- x l48) 0.0) (- x l48) (- (- x l48))) delta))
                                     ;
                                     ; | (f2 x) - l47 | < epsilon
                                     (< (ite (>= (- (f2 x) l47) 0.0) (- (f2 x) l47) (- (- (f2 x) l47))) epsilon)
            ))
          ))
        )))

; Axiom 48
(assert ; lim[x -> l49](f0 x) = l48
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l49 != x
                                     (and (not (= x l49))
                                          ; | x - l49 | < delta
                                          (< (ite (>= (- x l49) 0.0) (- x l49) (- (- x l49))) delta))
                                     ;
                                     ; | (f0 x) - l48 | < epsilon
                                     (< (ite (>= (- (f0 x) l48) 0.0) (- (f0 x) l48) (- (- (f0 x) l48))) epsilon)
            ))
          ))
        )))

; Axiom 49
(assert ; lim[x -> l50](f1 x) = l49
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l50 != x
                                     (and (not (= x l50))
                                          ; | x - l50 | < delta
                                          (< (ite (>= (- x l50) 0.0) (- x l50) (- (- x l50))) delta))
                                     ;
                                     ; | (f1 x) - l49 | < epsilon
                                     (< (ite (>= (- (f1 x) l49) 0.0) (- (f1 x) l49) (- (- (f1 x) l49))) epsilon)
            ))
          ))
        )))

; Axiom 50
(assert ; lim[x -> l51](f2 x) = l50
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l51 != x
                                     (and (not (= x l51))
                                          ; | x - l51 | < delta
                                          (< (ite (>= (- x l51) 0.0) (- x l51) (- (- x l51))) delta))
                                     ;
                                     ; | (f2 x) - l50 | < epsilon
                                     (< (ite (>= (- (f2 x) l50) 0.0) (- (f2 x) l50) (- (- (f2 x) l50))) epsilon)
            ))
          ))
        )))

; Axiom 51
(assert ; lim[x -> l52](f0 x) = l51
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l52 != x
                                     (and (not (= x l52))
                                          ; | x - l52 | < delta
                                          (< (ite (>= (- x l52) 0.0) (- x l52) (- (- x l52))) delta))
                                     ;
                                     ; | (f0 x) - l51 | < epsilon
                                     (< (ite (>= (- (f0 x) l51) 0.0) (- (f0 x) l51) (- (- (f0 x) l51))) epsilon)
            ))
          ))
        )))

; Axiom 52
(assert ; lim[x -> l53](f1 x) = l52
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l53 != x
                                     (and (not (= x l53))
                                          ; | x - l53 | < delta
                                          (< (ite (>= (- x l53) 0.0) (- x l53) (- (- x l53))) delta))
                                     ;
                                     ; | (f1 x) - l52 | < epsilon
                                     (< (ite (>= (- (f1 x) l52) 0.0) (- (f1 x) l52) (- (- (f1 x) l52))) epsilon)
            ))
          ))
        )))

; Axiom 53
(assert ; lim[x -> l54](f1 x) = l53
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l54 != x
                                     (and (not (= x l54))
                                          ; | x - l54 | < delta
                                          (< (ite (>= (- x l54) 0.0) (- x l54) (- (- x l54))) delta))
                                     ;
                                     ; | (f1 x) - l53 | < epsilon
                                     (< (ite (>= (- (f1 x) l53) 0.0) (- (f1 x) l53) (- (- (f1 x) l53))) epsilon)
            ))
          ))
        )))

; Axiom 54
(assert ; lim[x -> l55](f3 x) = l54
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l55 != x
                                     (and (not (= x l55))
                                          ; | x - l55 | < delta
                                          (< (ite (>= (- x l55) 0.0) (- x l55) (- (- x l55))) delta))
                                     ;
                                     ; | (f3 x) - l54 | < epsilon
                                     (< (ite (>= (- (f3 x) l54) 0.0) (- (f3 x) l54) (- (- (f3 x) l54))) epsilon)
            ))
          ))
        )))

; Axiom 55
(assert ; lim[x -> l56](f3 x) = l55
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l56 != x
                                     (and (not (= x l56))
                                          ; | x - l56 | < delta
                                          (< (ite (>= (- x l56) 0.0) (- x l56) (- (- x l56))) delta))
                                     ;
                                     ; | (f3 x) - l55 | < epsilon
                                     (< (ite (>= (- (f3 x) l55) 0.0) (- (f3 x) l55) (- (- (f3 x) l55))) epsilon)
            ))
          ))
        )))

; Axiom 56
(assert ; lim[x -> l57](f3 x) = l56
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l57 != x
                                     (and (not (= x l57))
                                          ; | x - l57 | < delta
                                          (< (ite (>= (- x l57) 0.0) (- x l57) (- (- x l57))) delta))
                                     ;
                                     ; | (f3 x) - l56 | < epsilon
                                     (< (ite (>= (- (f3 x) l56) 0.0) (- (f3 x) l56) (- (- (f3 x) l56))) epsilon)
            ))
          ))
        )))

; Axiom 57
(assert ; lim[x -> l58](f2 x) = l57
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l58 != x
                                     (and (not (= x l58))
                                          ; | x - l58 | < delta
                                          (< (ite (>= (- x l58) 0.0) (- x l58) (- (- x l58))) delta))
                                     ;
                                     ; | (f2 x) - l57 | < epsilon
                                     (< (ite (>= (- (f2 x) l57) 0.0) (- (f2 x) l57) (- (- (f2 x) l57))) epsilon)
            ))
          ))
        )))

; Axiom 58
(assert ; lim[x -> l59](f2 x) = l58
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l59 != x
                                     (and (not (= x l59))
                                          ; | x - l59 | < delta
                                          (< (ite (>= (- x l59) 0.0) (- x l59) (- (- x l59))) delta))
                                     ;
                                     ; | (f2 x) - l58 | < epsilon
                                     (< (ite (>= (- (f2 x) l58) 0.0) (- (f2 x) l58) (- (- (f2 x) l58))) epsilon)
            ))
          ))
        )))

; Axiom 59
(assert ; lim[x -> l60](f2 x) = l59
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l60 != x
                                     (and (not (= x l60))
                                          ; | x - l60 | < delta
                                          (< (ite (>= (- x l60) 0.0) (- x l60) (- (- x l60))) delta))
                                     ;
                                     ; | (f2 x) - l59 | < epsilon
                                     (< (ite (>= (- (f2 x) l59) 0.0) (- (f2 x) l59) (- (- (f2 x) l59))) epsilon)
            ))
          ))
        )))

; Axiom 60
(assert ; lim[x -> l61](f1 x) = l60
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l61 != x
                                     (and (not (= x l61))
                                          ; | x - l61 | < delta
                                          (< (ite (>= (- x l61) 0.0) (- x l61) (- (- x l61))) delta))
                                     ;
                                     ; | (f1 x) - l60 | < epsilon
                                     (< (ite (>= (- (f1 x) l60) 0.0) (- (f1 x) l60) (- (- (f1 x) l60))) epsilon)
            ))
          ))
        )))

; Axiom 61
(assert ; lim[x -> l62](f0 x) = l61
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l62 != x
                                     (and (not (= x l62))
                                          ; | x - l62 | < delta
                                          (< (ite (>= (- x l62) 0.0) (- x l62) (- (- x l62))) delta))
                                     ;
                                     ; | (f0 x) - l61 | < epsilon
                                     (< (ite (>= (- (f0 x) l61) 0.0) (- (f0 x) l61) (- (- (f0 x) l61))) epsilon)
            ))
          ))
        )))

; Axiom 62
(assert ; lim[x -> l63](f0 x) = l62
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; l63 != x
                                     (and (not (= x l63))
                                          ; | x - l63 | < delta
                                          (< (ite (>= (- x l63) 0.0) (- x l63) (- (- x l63))) delta))
                                     ;
                                     ; | (f0 x) - l62 | < epsilon
                                     (< (ite (>= (- (f0 x) l62) 0.0) (- (f0 x) l62) (- (- (f0 x) l62))) epsilon)
            ))
          ))
        )))

; Axiom 63
(assert ; lim[x -> a](f3 x) = l63
        ;
        ; forall epsilon > 0
        (forall ((epsilon Real)) (=> (< 0.0 epsilon)
          ;
          ; exists delta > 0
          (exists ( (delta Real) ) (and (< 0.0 delta)
            (forall ((x Real)) (=> ;
                                          ; a != x
                                     (and (not (= x a))
                                          ; | x - a | < delta
                                          (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                     ;
                                     ; | (f3 x) - l63 | < epsilon
                                     (< (ite (>= (- (f3 x) l63) 0.0) (- (f3 x) l63) (- (- (f3 x) l63))) epsilon)
            ))
          ))
        )))


; Conclusion
(assert (not ; lim[x -> a](f1 (f0 (f1 (f2 (f2 (f1 (f0 (f2 (f2 (f3 (f2 (f3 (f2 (f3 (f2 (f3 (f1 (f0 (f3 (f2 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f3 (f3 (f3 (f2 (f3 (f0 (f1 (f0 (f3 (f1 (f3 (f0 (f0 (f1 (f3 (f2 (f1 (f0 (f2 (f1 (f2 (f0 (f1 (f2 (f0 (f1 (f1 (f3 (f3 (f3 (f2 (f2 (f2 (f1 (f0 (f0 (f3 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) = l
             ;
             ; forall epsilon > 0
             (forall ((epsilon Real)) (=> (< 0.0 epsilon)
               ;
               ; exists delta > 0
               (exists ( (delta Real) ) (and (< 0.0 delta)
                 (forall ((x Real)) (=> ;
                                               ; a != x
                                          (and (not (= x a))
                                               ; | x - a | < delta
                                               (< (ite (>= (- x a) 0.0) (- x a) (- (- x a))) delta))
                                          ;
                                          ; | (f1 (f0 (f1 (f2 (f2 (f1 (f0 (f2 (f2 (f3 (f2 (f3 (f2 (f3 (f2 (f3 (f1 (f0 (f3 (f2 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f3 (f3 (f3 (f2 (f3 (f0 (f1 (f0 (f3 (f1 (f3 (f0 (f0 (f1 (f3 (f2 (f1 (f0 (f2 (f1 (f2 (f0 (f1 (f2 (f0 (f1 (f1 (f3 (f3 (f3 (f2 (f2 (f2 (f1 (f0 (f0 (f3 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) - l | < epsilon
                                          (< (ite (>= (- (f1 (f0 (f1 (f2 (f2 (f1 (f0 (f2 (f2 (f3 (f2 (f3 (f2 (f3 (f2 (f3 (f1 (f0 (f3 (f2 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f3 (f3 (f3 (f2 (f3 (f0 (f1 (f0 (f3 (f1 (f3 (f0 (f0 (f1 (f3 (f2 (f1 (f0 (f2 (f1 (f2 (f0 (f1 (f2 (f0 (f1 (f1 (f3 (f3 (f3 (f2 (f2 (f2 (f1 (f0 (f0 (f3 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) l) 0.0) (- (f1 (f0 (f1 (f2 (f2 (f1 (f0 (f2 (f2 (f3 (f2 (f3 (f2 (f3 (f2 (f3 (f1 (f0 (f3 (f2 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f3 (f3 (f3 (f2 (f3 (f0 (f1 (f0 (f3 (f1 (f3 (f0 (f0 (f1 (f3 (f2 (f1 (f0 (f2 (f1 (f2 (f0 (f1 (f2 (f0 (f1 (f1 (f3 (f3 (f3 (f2 (f2 (f2 (f1 (f0 (f0 (f3 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) l) (- (- (f1 (f0 (f1 (f2 (f2 (f1 (f0 (f2 (f2 (f3 (f2 (f3 (f2 (f3 (f2 (f3 (f1 (f0 (f3 (f2 (f0 (f1 (f0 (f1 (f0 (f0 (f0 (f3 (f3 (f3 (f2 (f3 (f0 (f1 (f0 (f3 (f1 (f3 (f0 (f0 (f1 (f3 (f2 (f1 (f0 (f2 (f1 (f2 (f0 (f1 (f2 (f0 (f1 (f1 (f3 (f3 (f3 (f2 (f2 (f2 (f1 (f0 (f0 (f3 x)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) l))) epsilon)
                 ))
               ))
             ))))

(check-sat)

