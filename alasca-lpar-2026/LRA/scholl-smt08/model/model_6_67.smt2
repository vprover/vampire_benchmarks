(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Scholl, Christoph; Disch, Stefan; Pigorsch, Florian and Kupferschmid, 
   Stefan; Using an SMT Solver and Craig Interpolation to Detect and Remove 
   Redundant Linear Constraints in Representations of Non-Convex Polyhedra.
   Proceedings of 6th International Workshop on Satisfiability Modulo
   Theories, Princeton, USA, July 2008.
   <http://abs.informatik.uni-freiburg.de/smtbench/>
|)
(set-info :category "industrial")
(set-info :status sat)
(declare-fun lambda () Real)
(declare-fun lambdaprime () Real)
(declare-fun x5 () Real)
(declare-fun x4 () Real)
(declare-fun x3 () Real)
(declare-fun bool.b22 () Bool)
(declare-fun bool.b7 () Bool)
(declare-fun bool.b5 () Bool)
(declare-fun bool.b6 () Bool)
(declare-fun bool.b23 () Bool)
(declare-fun bool.b14 () Bool)
(declare-fun bool.b12 () Bool)
(declare-fun bool.b10 () Bool)
(declare-fun bool.b8 () Bool)
(assert (forall ((?lambda Real)) (let ((?v_2 (+ x4 (* 40 ?lambda))) (?v_3 (+ x5 (* 1 ?lambda))) (?v_48 (not bool.b14)) (?v_49 (not bool.b12)) (?v_50 (not bool.b10)) (?v_51 (not bool.b8))) (let ((?v_9 (and ?v_48 (and ?v_49 (and ?v_50 (and bool.b7 ?v_51)))))) (let ((?v_20 (not ?v_9)) (?v_4 (+ x3 (* (- 1) ?lambda)))) (let ((?v_1 (* 1 ?v_4))) (let ((?v_6 (+ ?v_1 (* (/ 3 20) ?v_2)))) (let ((?v_0 (+ ?v_6 (* (- 5) ?v_3)))) (let ((?v_33 (<= ?v_0 1150)) (?v_29 (<= ?v_0 673))) (let ((?v_34 (not ?v_29)) (?v_5 (+ ?v_1 (* (/ 3 40) ?v_2)))) (let ((?v_30 (+ ?v_5 (* (- 2) ?v_3)))) (let ((?v_27 (<= ?v_30 590)) (?v_24 (+ ?v_1 (* 1 ?v_3)))) (let ((?v_21 (<= ?v_24 30)) (?v_23 (* (- 1) ?v_3))) (let ((?v_36 (<= ?v_23 (- 10))) (?v_13 (<= ?v_1 40))) (let ((?v_37 (not ?v_13)) (?v_22 (* (- 1) ?v_4))) (let ((?v_7 (<= ?v_22 (- 50))) (?v_8 (<= ?v_5 (/ 743 2))) (?v_44 (<= ?v_6 723))) (let ((?v_16 (not ?v_44))) (let ((?v_12 (and ?v_16 ?v_9)) (?v_14 (not ?v_8)) (?v_10 (+ ?v_1 (* (/ 1 20) ?v_2))) (?v_15 (<= ?v_5 610))) (let ((?v_11 (<= ?v_10 261)) (?v_19 (<= ?v_6 1200))) (let ((?v_17 (and ?v_19 ?v_9)) (?v_38 (+ ?v_1 (* 3 ?v_3)))) (let ((?v_18 (<= ?v_38 50))) (let ((?v_40 (not ?v_18)) (?v_39 (and ?v_16 ?v_17))) (let ((?v_43 (not ?v_39))) (let ((?v_25 (not (and ?v_36 (and (not (and ?v_37 (not (and (<= ?v_1 50) (and (not (and (not ?v_7) (not (and ?v_8 ?v_12)))) (not (and ?v_7 (not (and (not (and ?v_14 (not (and (<= ?v_10 420) (and ?v_15 ?v_9))))) (not (and ?v_8 (not (and (not (and (not ?v_11) ?v_20)) (not (and ?v_11 (not ?v_12)))))))))))))))) (not (and ?v_13 (not (and (not (and ?v_14 (not (and ?v_15 ?v_17)))) (not (and ?v_8 (not (and (not (and ?v_40 ?v_43)) (not (and ?v_18 (not (and ?v_16 (not (and ?v_19 ?v_20)))))))))))))))))) (?v_52 (<= (+ ?v_22 ?v_23) (- 10))) (?v_26 (<= ?v_24 40))) (let ((?v_31 (and (not (and (not ?v_26) ?v_25)) (not (and ?v_26 ?v_20))))) (let ((?v_28 (not (and ?v_52 ?v_31))) (?v_32 (<= ?v_30 (/ 703 2))) (?v_35 (<= (+ ?v_1 (* (/ (- 1) 2) ?v_3)) (- 5))) (?v_41 (<= ?v_38 60)) (?v_42 (<= ?v_38 30)) (?v_45 (<= (+ ?v_22 (* (- 3) ?v_3)) (- 50)))) (let ((?v_46 (not ?v_42)) (?v_47 (and bool.b7 ?v_19))) (let ((?v_55 (and ?v_36 (and (not (and ?v_37 (not (and (not (and ?v_14 (not (and ?v_15 (and ?v_41 ?v_17))))) (not (and ?v_8 (not (and ?v_42 ?v_39)))))))) (not (and ?v_13 (not (and (not (and ?v_14 (not (and ?v_15 (and (not (and ?v_40 (not (and ?v_41 ?v_9)))) (not (and ?v_18 (not (and (not (and (not ?v_45) (and (not (and ?v_46 (not (and ?v_43 (not (and bool.b7 ?v_44)))))) (not (and ?v_42 ?v_47))))) (not (and ?v_45 ?v_20))))))))))) (not (and ?v_8 (not (and ?v_18 (and (not (and ?v_46 ?v_43)) (not (and ?v_42 (not (and ?v_16 ?v_47)))))))))))))))) (?v_53 (<= ?v_24 10)) (?v_54 (and bool.b7 ?v_52))) (or (or (exists ((?lambdaprime Real)) (let ((?v_58 (not bool.b22)) (?v_60 (not bool.b7)) (?v_61 (not bool.b5))) (let ((?v_59 (and ?v_61 (not bool.b6))) (?v_57 (* (- 1) (+ x4 (* 40 ?lambdaprime)))) (?v_56 (not (<= (* 1 (+ x3 (* (- 1) ?lambdaprime))) 33)))) (and (and (<= 0 ?lambdaprime) (<= ?lambdaprime ?lambda)) (not (and (not (<= (* (- 1) (+ x5 (* 1 ?lambdaprime))) (- 10))) (and (and (not (and (not (and (not (<= ?v_57 (- 4100))) ?v_56)) (and ?v_58 (and ?v_60 ?v_59)))) (not (and (not (and ?v_56 (not (<= ?v_57 (- 4500))))) (and ?v_58 (and bool.b7 ?v_59))))) (not (and (not (and ?v_56 (not (<= ?v_57 (- 4910))))) (and ?v_58 (and ?v_60 (and ?v_61 bool.b6)))))))))))) (< ?lambda 0)) (not (and (not bool.b22) (and (not (and bool.b5 (not (and (not bool.b6) (not bool.b7))))) (not (and (not bool.b5) (not (and (not (and (not bool.b23) (not (and bool.b6 (and ?v_33 (and (not (and ?v_34 (not (and (not (and (not ?v_27) (not (and (not (and (not ?v_21) ?v_25)) (not (and ?v_21 ?v_28)))))) (not (and ?v_27 ?v_28)))))) (not (and ?v_29 (not (and (not (and (not ?v_32) (not (and ?v_27 ?v_31)))) (not (and ?v_32 ?v_25)))))))))))) (not (and bool.b23 (not (and bool.b6 (and ?v_33 (and (not (and ?v_34 (and (not (and (not (<= (+ ?v_1 ?v_23) 10)) (not (and (not (and bool.b7 ?v_35)) (not (and (not ?v_35) ?v_55)))))) (not (and ?v_21 (not (and (not (and (not ?v_53) (and ?v_48 (and ?v_49 (and ?v_50 (and ?v_51 ?v_54)))))) (not (and ?v_53 ?v_54))))))))) (not (and ?v_29 (not ?v_55)))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
