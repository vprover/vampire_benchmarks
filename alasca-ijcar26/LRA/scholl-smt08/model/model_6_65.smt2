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
(assert (forall ((?lambda Real)) (let ((?v_8 (+ x3 (* 0 ?lambda)))) (let ((?v_0 (* 1 ?v_8)) (?v_1 (+ x4 (* 30 ?lambda))) (?v_2 (+ x5 (* 1 ?lambda)))) (let ((?v_5 (<= ?v_0 20)) (?v_9 (and (not bool.b14) (and (not bool.b12) (and (not bool.b10) (and bool.b7 (not bool.b8))))))) (let ((?v_41 (not ?v_5)) (?v_6 (<= ?v_0 0))) (let ((?v_38 (not (and bool.b7 ?v_6))) (?v_39 (not ?v_6)) (?v_19 (<= ?v_0 40))) (let ((?v_42 (not ?v_19)) (?v_17 (<= ?v_0 30))) (let ((?v_32 (not ?v_17)) (?v_11 (<= ?v_0 50)) (?v_18 (not ?v_9))) (let ((?v_31 (not (and ?v_17 ?v_18))) (?v_43 (+ ?v_0 (* 3 ?v_2)))) (let ((?v_24 (<= ?v_43 50))) (let ((?v_45 (not ?v_24)) (?v_40 (and ?v_17 ?v_9)) (?v_46 (<= ?v_43 60)) (?v_48 (<= ?v_43 30))) (let ((?v_52 (not ?v_48)) (?v_12 (+ ?v_0 (* (/ 3 20) ?v_1)))) (let ((?v_3 (+ ?v_12 (* (/ (- 9) 2) ?v_2)))) (let ((?v_36 (<= ?v_3 1155)) (?v_7 (+ ?v_0 (* (/ 3 40) ?v_1)))) (let ((?v_28 (+ ?v_7 (* (/ (- 9) 4) ?v_2)))) (let ((?v_27 (<= ?v_28 (/ 1175 2))) (?v_4 (<= (* (- 1) ?v_2) (- 10)))) (let ((?v_29 (not ?v_4)) (?v_59 (<= ?v_3 678))) (let ((?v_37 (not ?v_59))) (let ((?v_26 (and ?v_37 ?v_9)) (?v_10 (<= ?v_7 (/ 743 2)))) (let ((?v_20 (not ?v_10)) (?v_15 (+ ?v_0 (* (/ 1 20) ?v_1))) (?v_47 (* (- 1) ?v_8))) (let ((?v_13 (<= ?v_47 (- 50))) (?v_21 (<= ?v_7 610)) (?v_50 (<= ?v_12 723))) (let ((?v_22 (not ?v_50))) (let ((?v_14 (not (and ?v_22 ?v_9))) (?v_16 (<= ?v_15 261))) (let ((?v_30 (not (and ?v_42 (not (and (not (and ?v_32 (not (and (not (and ?v_20 (not (and (<= ?v_15 420) (and ?v_11 (and ?v_13 (and ?v_21 ?v_9))))))) (not (and ?v_10 (not (and (not (and (not ?v_11) ?v_14)) (not (and ?v_11 (not (and (not (and (not ?v_13) ?v_14)) (not (and ?v_13 (not (and (not (and (not ?v_16) ?v_18)) (not (and ?v_16 ?v_14)))))))))))))))))) ?v_31))))) (?v_25 (<= ?v_12 1200))) (let ((?v_23 (and ?v_25 ?v_9))) (let ((?v_44 (and ?v_22 ?v_23))) (let ((?v_49 (not ?v_44))) (let ((?v_33 (not (and (not (and ?v_20 (not (and ?v_21 ?v_23)))) (not (and ?v_10 (not (and (not (and ?v_45 ?v_49)) (not (and ?v_24 (not (and ?v_22 (not (and ?v_25 ?v_18)))))))))))))) (let ((?v_35 (not (and (not (and ?v_29 (not (and ?v_5 ?v_26)))) (not (and ?v_4 (not (and (not (and ?v_41 (and ?v_38 (not (and ?v_39 (and ?v_30 (not (and ?v_19 ?v_33)))))))) (not (and ?v_5 (not ?v_26)))))))))) (?v_34 (<= ?v_28 349)) (?v_54 (not (and ?v_42 (not (and (not (and ?v_20 (not (and ?v_21 (and ?v_46 ?v_23))))) (not (and ?v_10 (not (and ?v_48 ?v_44))))))))) (?v_55 (+ ?v_47 (* (- 3) ?v_2)))) (let ((?v_51 (<= ?v_55 (- 50))) (?v_53 (and bool.b7 ?v_25))) (let ((?v_56 (not (and ?v_22 ?v_53))) (?v_57 (<= ?v_55 (- 30)))) (let ((?v_58 (not ?v_57))) (let ((?v_60 (not (and ?v_24 (and (not (and ?v_58 ?v_56)) (not (and ?v_57 ?v_49))))))) (or (or (exists ((?lambdaprime Real)) (let ((?v_62 (not bool.b22)) (?v_64 (not bool.b7)) (?v_65 (not bool.b5))) (let ((?v_63 (and ?v_65 (not bool.b6))) (?v_61 (* (- 1) (+ x4 (* 30 ?lambdaprime))))) (and (and (<= 0 ?lambdaprime) (<= ?lambdaprime ?lambda)) (not (and (not (<= (* (- 1) (+ x5 (* 1 ?lambdaprime))) (- 10))) (and (and (not (and (<= ?v_61 (- 4100)) (and ?v_62 (and ?v_64 ?v_63)))) (not (and (<= ?v_61 (- 4500)) (and ?v_62 (and bool.b7 ?v_63))))) (not (and (<= ?v_61 (- 4910)) (and ?v_62 (and ?v_64 (and ?v_65 bool.b6)))))))))))) (< ?lambda 0)) (not (and (not bool.b22) (and (not (and bool.b5 (not (and (not bool.b6) (not bool.b7))))) (not (and (not bool.b5) (not (and (not (and (not bool.b23) (not (and bool.b6 (and ?v_36 (and (not (and (not ?v_27) ?v_35)) (not (and ?v_27 (not (and (not (and (not ?v_34) (not (and (not (and ?v_29 (not ?v_40))) (not (and ?v_4 (not (and ?v_30 (not (and ?v_19 (not (and ?v_31 (not (and ?v_32 ?v_33)))))))))))))) (not (and ?v_34 ?v_35)))))))))))) (not (and bool.b23 (not (and bool.b6 (and ?v_36 (and (not (and ?v_29 (not (and ?v_5 (and ?v_37 (not (and ?v_38 (not (and ?v_39 ?v_40))))))))) (not (and ?v_4 (not (and (not (and ?v_41 (not (and ?v_54 (not (and ?v_19 (not (and (not (and ?v_20 (not (and ?v_21 (and (not (and ?v_45 (not (and ?v_46 ?v_9)))) (not (and ?v_24 (not (and (not (and (not ?v_51) (and (not (and ?v_52 (not (and ?v_49 (not (and bool.b7 ?v_50)))))) (not (and ?v_48 ?v_53))))) (not (and ?v_51 ?v_18))))))))))) (not (and ?v_10 (not (and ?v_24 (and (not (and ?v_52 ?v_49)) (not (and ?v_48 ?v_56))))))))))))))) (not (and ?v_5 (not (and (not (and ?v_37 (and (not (and ?v_39 (and ?v_54 (not (and ?v_19 (not (and (not (and ?v_32 ?v_60)) (not (and ?v_17 (not (and (not (and ?v_58 (not (and (not (and ?v_22 (and (not ?v_53) (not (and (not ?v_25) ?v_9))))) (not (and ?v_50 ?v_18)))))) (not (and ?v_57 ?v_18))))))))))))) ?v_38))) (not (and ?v_59 (not (and (not (and ?v_39 (not (and ?v_54 (not (and ?v_19 ?v_60)))))) (not (and ?v_6 (not (and bool.b7 (not (<= (* 1 ?v_1) 4820))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
