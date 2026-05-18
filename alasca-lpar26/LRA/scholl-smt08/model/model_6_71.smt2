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
(assert (forall ((?lambda Real)) (let ((?v_3 (+ x5 (* 1 ?lambda))) (?v_1 (+ x4 (* 60 ?lambda))) (?v_34 (and (not bool.b14) (and (not bool.b12) (and (not bool.b10) (and bool.b7 (not bool.b8))))))) (let ((?v_51 (not ?v_34)) (?v_33 (<= (* (- 1) ?v_3) (- 10))) (?v_6 (+ x3 (* (- 3) ?lambda)))) (let ((?v_0 (* 1 ?v_6))) (let ((?v_30 (<= ?v_0 20)) (?v_16 (<= ?v_0 40))) (let ((?v_36 (not ?v_16)) (?v_2 (+ ?v_0 (* (/ 3 40) ?v_1)))) (let ((?v_7 (<= ?v_2 (/ 743 2)))) (let ((?v_17 (not ?v_7)) (?v_8 (+ ?v_0 (* (/ 1 20) ?v_1)))) (let ((?v_41 (<= ?v_8 420)) (?v_18 (<= ?v_2 610)) (?v_4 (+ ?v_0 (* 3 ?v_3)))) (let ((?v_9 (<= ?v_4 50)) (?v_10 (<= ?v_4 30)) (?v_11 (+ ?v_0 (* (/ 3 20) ?v_1)))) (let ((?v_5 (<= ?v_11 1200))) (let ((?v_23 (and bool.b7 ?v_5))) (let ((?v_22 (not (and ?v_10 (not (and (not ?v_23) (not (and (not ?v_5) ?v_34))))))) (?v_38 (* (- 1) ?v_6))) (let ((?v_12 (<= (+ ?v_38 (* (- 3) ?v_3)) (- 50)))) (let ((?v_20 (not (and bool.b7 ?v_12))) (?v_15 (<= ?v_8 261))) (let ((?v_24 (not ?v_15)) (?v_19 (not ?v_9)) (?v_14 (not ?v_10)) (?v_32 (<= ?v_11 723))) (let ((?v_27 (not ?v_32))) (let ((?v_28 (and bool.b7 ?v_27))) (let ((?v_13 (not (and ?v_14 ?v_28)))) (let ((?v_25 (not (and ?v_19 ?v_13))) (?v_21 (not ?v_12)) (?v_26 (not (and ?v_12 (not (and bool.b7 ?v_14))))) (?v_42 (<= ?v_4 60)) (?v_52 (not (and ?v_10 (not (and ?v_27 ?v_23))))) (?v_31 (not ?v_28))) (let ((?v_29 (not (and ?v_52 (not (and ?v_14 ?v_31)))))) (let ((?v_49 (not (and (not ?v_33) (not (and (not (and (not ?v_30) (not (and (not (and ?v_36 (not (and (not (and ?v_17 (not (and ?v_41 (and ?v_18 (and ?v_9 (not (and ?v_22 ?v_20)))))))) (not (and ?v_7 (not (and (not (and ?v_24 (not (and ?v_25 (not (and ?v_9 (not (and (not (and ?v_21 ?v_13)) ?v_26)))))))) (not (and ?v_15 ?v_13)))))))))) (not (and ?v_16 (not (and (not (and ?v_17 (not (and ?v_18 (not (and (not (and ?v_19 (and bool.b7 ?v_42))) (not (and ?v_9 (not (and ?v_20 (not (and ?v_21 (not (and ?v_22 (not (and ?v_14 ?v_23)))))))))))))))) (not (and ?v_7 (not (and (not (and ?v_24 (not (and ?v_25 (not (and ?v_9 (not (and ?v_26 (not (and ?v_21 ?v_29)))))))))) (not (and ?v_15 ?v_29)))))))))))))) (not (and ?v_30 (not (and (not (and ?v_7 ?v_31)) (not (and ?v_17 (not (and ?v_9 (not (not (and ?v_23 (not (and ?v_14 ?v_32)))))))))))))))))) (?v_35 (and ?v_5 ?v_34))) (let ((?v_47 (and ?v_27 ?v_35))) (let ((?v_50 (not ?v_47)) (?v_46 (<= ?v_0 30)) (?v_37 (<= ?v_0 50))) (let ((?v_43 (not ?v_37)) (?v_39 (not (and ?v_27 ?v_34))) (?v_40 (<= ?v_38 (- 50)))) (let ((?v_45 (not ?v_40)) (?v_44 (not (and ?v_18 (and ?v_42 ?v_35)))) (?v_48 (not (and ?v_18 ?v_34)))) (or (or (exists ((?lambdaprime Real)) (let ((?v_55 (not bool.b22)) (?v_57 (not bool.b7)) (?v_58 (not bool.b5))) (let ((?v_56 (and ?v_58 (not bool.b6))) (?v_60 (and ?v_58 bool.b6)) (?v_54 (* (- 1) (+ x4 (* 60 ?lambdaprime)))) (?v_59 (* 1 (+ x3 (* (- 3) ?lambdaprime))))) (let ((?v_53 (not (<= ?v_59 45))) (?v_61 (<= ?v_59 40))) (and (and (<= 0 ?lambdaprime) (<= ?lambdaprime ?lambda)) (not (and (and (not (<= (* (- 1) (+ x5 (* 1 ?lambdaprime))) (- 10))) (and (and (and (not (and (not (and (not (<= ?v_54 (- 4100))) ?v_53)) (and ?v_55 (and ?v_57 ?v_56)))) (not (and (not (and ?v_53 (not (<= ?v_54 (- 4500))))) (and ?v_55 (and bool.b7 ?v_56))))) (not (and (not (and ?v_53 (not (<= ?v_54 (- 4910))))) (and ?v_55 (and ?v_57 ?v_60))))) (not (and ?v_61 (and ?v_55 (and bool.b7 ?v_60)))))) (not (and bool.b22 ?v_61))))))))) (< ?lambda 0)) (not (and (not bool.b22) (and (not (and bool.b5 (not (and (not bool.b6) (not bool.b7))))) (not (and (not bool.b5) (not (and (not (and (not bool.b23) (not (and bool.b6 (and ?v_49 (not (and ?v_33 (not (and (not (and ?v_16 (not (and (not (and ?v_17 (not (and ?v_18 ?v_35)))) (not (and ?v_7 (not (and (not (and ?v_19 ?v_50)) (not (and ?v_9 (not (and ?v_27 (not (and ?v_5 ?v_51)))))))))))))) (not (and ?v_36 (not (and (not (and (not ?v_46) (not (and (not (and ?v_7 (not (and (not (and ?v_43 ?v_39)) (not (and ?v_37 (not (and (not (and ?v_45 ?v_39)) (not (and ?v_40 (not (and ?v_24 ?v_34)))))))))))) (not (and ?v_17 (not (and (not (and (not ?v_41) ?v_44)) (not (and ?v_41 (not (and (not (and ?v_43 ?v_44)) (not (and ?v_37 (not (and (not (and ?v_45 ?v_44)) (not (and ?v_40 ?v_48)))))))))))))))))) (not (and ?v_46 (not (and (not (and ?v_7 (not (and ?v_10 ?v_47)))) (not (and ?v_17 ?v_48))))))))))))))))))) (not (and bool.b23 (not (and bool.b6 (and ?v_49 (not (and ?v_33 (not (and (not (and ?v_17 (not (and ?v_18 (and (not (and ?v_19 (not (and ?v_42 ?v_34)))) (not (and ?v_9 (not (and (not (and ?v_21 (and (not (and ?v_14 (not (and ?v_50 (not (and bool.b7 ?v_32)))))) (not (and ?v_10 ?v_23))))) (not (and ?v_12 ?v_51))))))))))) (not (and ?v_7 (not (and ?v_9 (and (not (and ?v_14 ?v_50)) ?v_52)))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
