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
(declare-fun x3 () Real)
(declare-fun x4 () Real)
(declare-fun bool.b22 () Bool)
(declare-fun bool.b7 () Bool)
(declare-fun bool.b5 () Bool)
(declare-fun bool.b6 () Bool)
(declare-fun bool.b23 () Bool)
(declare-fun bool.b14 () Bool)
(declare-fun bool.b12 () Bool)
(declare-fun bool.b10 () Bool)
(declare-fun bool.b8 () Bool)
(assert (forall ((?lambda Real)) (let ((?v_49 (not bool.b7)) (?v_0 (* 1 ?lambda))) (let ((?v_8 (+ x3 ?v_0))) (let ((?v_1 (* 1 ?v_8)) (?v_2 (+ x4 (* 40 ?lambda))) (?v_3 (+ x5 ?v_0))) (let ((?v_14 (<= ?v_1 40))) (let ((?v_31 (not ?v_14)) (?v_12 (and (not bool.b14) (and (not bool.b12) (and (not bool.b10) (and bool.b7 (not bool.b8))))))) (let ((?v_20 (not ?v_12)) (?v_32 (+ ?v_1 (* 3 ?v_3)))) (let ((?v_39 (<= ?v_32 50))) (let ((?v_48 (not ?v_39)) (?v_38 (<= ?v_32 60)) (?v_36 (<= ?v_32 30))) (let ((?v_44 (not ?v_36)) (?v_51 (<= ?v_1 20)) (?v_56 (<= ?v_1 0)) (?v_57 (<= (* 1 ?v_2) 4820)) (?v_11 (+ ?v_1 (* (/ 3 20) ?v_2)))) (let ((?v_23 (+ ?v_11 (* (- 7) ?v_3)))) (let ((?v_28 (<= ?v_23 1130)) (?v_7 (+ ?v_1 (* (/ 3 40) ?v_2)))) (let ((?v_5 (+ ?v_7 (* (- 4) ?v_3)))) (let ((?v_26 (<= ?v_5 (/ 663 2))) (?v_6 (* (- 1) ?v_3))) (let ((?v_4 (+ ?v_1 ?v_6))) (let ((?v_22 (<= ?v_4 (- 10))) (?v_21 (<= ?v_4 10))) (let ((?v_29 (not ?v_21)) (?v_19 (<= ?v_4 20)) (?v_30 (<= ?v_6 (- 10))) (?v_9 (<= ?v_7 (/ 743 2)))) (let ((?v_15 (not ?v_9)) (?v_13 (+ ?v_1 (* (/ 1 20) ?v_2))) (?v_16 (<= ?v_7 610)) (?v_34 (* (- 1) ?v_8))) (let ((?v_10 (<= ?v_34 (- 50))) (?v_35 (<= ?v_11 723))) (let ((?v_17 (not ?v_35))) (let ((?v_46 (not (and ?v_17 ?v_12))) (?v_18 (<= ?v_11 1200))) (let ((?v_33 (and ?v_18 ?v_12)) (?v_50 (not (and ?v_18 ?v_20))) (?v_47 (not ?v_18))) (let ((?v_25 (not (and ?v_30 (and (not (and ?v_31 (not (and (<= ?v_1 50) (and (not (and ?v_15 (not (and (<= ?v_13 420) (and ?v_16 (and ?v_10 ?v_12)))))) (not (and ?v_9 (not (and (not (and (not ?v_10) ?v_46)) (not (and ?v_10 (not (and (not (<= ?v_13 261)) ?v_12))))))))))))) (not (and ?v_14 (not (and (not (and ?v_15 (not (and ?v_16 ?v_33)))) (not (and ?v_9 (not (and ?v_17 (and ?v_50 (not (and ?v_47 ?v_48))))))))))))))) (?v_24 (<= ?v_23 653))) (let ((?v_42 (not ?v_24))) (let ((?v_27 (not (and (not (and ?v_42 ?v_20)) (not (and ?v_24 ?v_25))))) (?v_52 (+ ?v_34 (* (- 3) ?v_3)))) (let ((?v_37 (<= ?v_52 (- 50)))) (let ((?v_43 (not ?v_37)) (?v_45 (not (and bool.b7 ?v_35))) (?v_40 (and ?v_17 (and ?v_18 (not (and (not (and ?v_44 ?v_12)) (not (and bool.b7 ?v_36)))))))) (let ((?v_41 (not (and ?v_30 (and (not (and ?v_31 (not (and (not (and ?v_15 (not (and ?v_16 (and ?v_38 ?v_33))))) (not (and ?v_9 (not (and ?v_36 (and ?v_17 ?v_33))))))))) (not (and ?v_14 (not (and (not (and ?v_15 (not (and ?v_16 (and (not (and ?v_43 (and ?v_45 (not ?v_40)))) (not (and ?v_37 (not (and ?v_38 ?v_12))))))))) (not (and ?v_9 (not (and ?v_39 ?v_40)))))))))))) (?v_53 (and (not (and bool.b7 ?v_18)) (not (and ?v_47 ?v_12)))) (?v_54 (not (and ?v_35 ?v_20))) (?v_55 (<= ?v_52 (- 30)))) (or (or (exists ((?lambdaprime Real)) (let ((?v_58 (* 1 ?lambdaprime)) (?v_61 (not bool.b22)) (?v_63 (not bool.b5))) (let ((?v_62 (and ?v_63 (not bool.b6))) (?v_59 (not (<= (* (- 1) (+ x3 ?v_58)) (- 20)))) (?v_60 (* (- 1) (+ x4 (* 40 ?lambdaprime))))) (and (and (<= 0 ?lambdaprime) (<= ?lambdaprime ?lambda)) (not (and (not (<= (* (- 1) (+ x5 ?v_58)) (- 10))) (and (and (not (and (not (and ?v_59 (not (<= ?v_60 (- 4100))))) (and ?v_61 (and ?v_49 ?v_62)))) (not (and (not (and ?v_59 (not (<= ?v_60 (- 4500))))) (and ?v_61 (and bool.b7 ?v_62))))) (not (and (not (and ?v_59 (not (<= ?v_60 (- 4910))))) (and ?v_61 (and ?v_49 (and ?v_63 bool.b6)))))))))))) (< ?lambda 0)) (not (and (not bool.b22) (and (not (and bool.b5 (not (and (not bool.b6) ?v_49)))) (not (and (not bool.b5) (not (and (not (and (not bool.b23) (not (and bool.b6 (and ?v_28 (and (not (and (not ?v_26) (not (and (not (and (not ?v_22) (not (and (not (and ?v_29 (not (and (<= ?v_5 570) (and (not (and (not ?v_19) ?v_25)) (not (and ?v_19 ?v_20))))))) (not (and ?v_21 ?v_20)))))) (not (and ?v_22 ?v_27)))))) (not (and ?v_26 ?v_27)))))))) (not (and bool.b23 (not (and bool.b6 (and ?v_28 (and (not (and ?v_29 ?v_41)) (not (and ?v_21 (not (and (not (and ?v_24 ?v_41)) (not (and ?v_42 (not (and (not (and (not ?v_30) ?v_20)) (not (and ?v_30 (not (and (not (and (not ?v_51) (not (and (not (and ?v_31 ?v_20)) (not (and ?v_14 (not (and (not (and ?v_15 (not (and (not (and (not ?v_16) ?v_20)) (not (and ?v_16 (not (and (not (and ?v_37 ?v_20)) (not (and ?v_43 (and (not (and ?v_44 (not (and ?v_45 ?v_46)))) (not (and ?v_36 (not ?v_53)))))))))))))) (not (and ?v_9 (not (and (not (and ?v_48 ?v_20)) (not (and ?v_39 (not (and (not (and ?v_44 (not (and (not (and ?v_49 ?v_47)) ?v_50)))) (not (and ?v_36 (not (and ?v_54 (not (and ?v_49 ?v_17)))))))))))))))))))))) (not (and ?v_51 (not (and (not (and (not ?v_56) (not (and (not (and (not ?v_55) (not (and (not (and ?v_17 ?v_53)) ?v_54)))) (not (and ?v_55 ?v_20)))))) (not (and ?v_56 (not (and (not (and ?v_49 (not ?v_57))) (not (and ?v_57 ?v_20)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
