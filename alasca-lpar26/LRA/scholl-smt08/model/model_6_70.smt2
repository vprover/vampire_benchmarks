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
(assert (forall ((?lambda Real)) (let ((?v_4 (+ x5 (* 1 ?lambda))) (?v_2 (+ x4 (* 40 ?lambda))) (?v_10 (and (not bool.b14) (and (not bool.b12) (and (not bool.b10) (and bool.b7 (not bool.b8))))))) (let ((?v_16 (not ?v_10)) (?v_29 (<= (* (- 1) ?v_4) (- 10))) (?v_13 (+ x3 (* (- 3) ?lambda)))) (let ((?v_0 (* 1 ?v_13))) (let ((?v_11 (<= ?v_0 40)) (?v_1 (+ ?v_0 (* (/ 3 40) ?v_2)))) (let ((?v_3 (<= ?v_1 (/ 743 2)))) (let ((?v_18 (not ?v_3)) (?v_20 (<= ?v_1 610)) (?v_5 (+ ?v_0 (* (/ 3 20) ?v_2)))) (let ((?v_9 (<= ?v_5 1200))) (let ((?v_6 (and ?v_9 ?v_10)) (?v_21 (+ ?v_0 (* 3 ?v_4)))) (let ((?v_7 (<= ?v_21 50))) (let ((?v_34 (not ?v_7)) (?v_42 (<= ?v_5 723))) (let ((?v_8 (not ?v_42))) (let ((?v_27 (and ?v_8 ?v_6))) (let ((?v_41 (not ?v_27)) (?v_26 (<= ?v_0 30)) (?v_12 (<= ?v_0 50))) (let ((?v_23 (not ?v_12)) (?v_14 (not (and ?v_8 ?v_10))) (?v_36 (* (- 1) ?v_13))) (let ((?v_15 (<= ?v_36 (- 50)))) (let ((?v_25 (not ?v_15)) (?v_19 (+ ?v_0 (* (/ 1 20) ?v_2)))) (let ((?v_17 (<= ?v_19 261)) (?v_22 (<= ?v_19 420)) (?v_35 (<= ?v_21 60))) (let ((?v_24 (not (and ?v_20 (and ?v_35 ?v_6)))) (?v_28 (not (and ?v_20 ?v_10))) (?v_30 (<= ?v_21 30)) (?v_46 (not ?v_29)) (?v_32 (<= ?v_0 20)) (?v_33 (not (and ?v_3 (not (and bool.b7 ?v_8))))) (?v_31 (and bool.b7 ?v_9))) (let ((?v_43 (not (and ?v_30 ?v_31))) (?v_40 (not ?v_30)) (?v_45 (and ?v_8 ?v_31))) (let ((?v_47 (not (and ?v_32 (not (and ?v_33 (not (and ?v_18 (not (and ?v_7 (not (and ?v_43 (not (and ?v_40 ?v_45))))))))))))) (?v_48 (not ?v_32)) (?v_38 (not (and ?v_34 (not (and ?v_35 ?v_10))))) (?v_37 (<= (+ ?v_36 (* (- 3) ?v_4)) (- 50)))) (let ((?v_44 (not (and ?v_37 ?v_16))) (?v_39 (not ?v_37))) (let ((?v_49 (and ?v_44 (not (and ?v_39 (not ?v_31)))))) (or (or (exists ((?lambdaprime Real)) (let ((?v_52 (not bool.b22)) (?v_54 (not bool.b7)) (?v_55 (not bool.b5))) (let ((?v_53 (and ?v_55 (not bool.b6))) (?v_57 (and ?v_55 bool.b6)) (?v_51 (* (- 1) (+ x4 (* 40 ?lambdaprime)))) (?v_56 (* 1 (+ x3 (* (- 3) ?lambdaprime))))) (let ((?v_50 (not (<= ?v_56 45))) (?v_58 (<= ?v_56 20))) (and (and (<= 0 ?lambdaprime) (<= ?lambdaprime ?lambda)) (not (and (and (not (<= (* (- 1) (+ x5 (* 1 ?lambdaprime))) (- 10))) (and (and (and (not (and (not (and (not (<= ?v_51 (- 4100))) ?v_50)) (and ?v_52 (and ?v_54 ?v_53)))) (not (and (not (and ?v_50 (not (<= ?v_51 (- 4500))))) (and ?v_52 (and bool.b7 ?v_53))))) (not (and (not (and ?v_50 (not (<= ?v_51 (- 4910))))) (and ?v_52 (and ?v_54 ?v_57))))) (not (and ?v_58 (and ?v_52 (and bool.b7 ?v_57)))))) (not (and bool.b22 ?v_58))))))))) (< ?lambda 0)) (not (and (not bool.b22) (and (not (and bool.b5 (not (and (not bool.b6) (not bool.b7))))) (not (and (not bool.b5) (not (and (not (and (not bool.b23) (not (and bool.b6 (and (not (and ?v_29 (not (and (not (and ?v_11 (not (and (not (and ?v_18 (not (and ?v_20 ?v_6)))) (not (and ?v_3 (not (and (not (and ?v_34 ?v_41)) (not (and ?v_7 (not (and ?v_8 (not (and ?v_9 ?v_16)))))))))))))) (not (and (not ?v_11) (not (and (not (and (not ?v_26) (not (and (not (and ?v_3 (not (and (not (and ?v_23 ?v_14)) (not (and ?v_12 (not (and (not (and ?v_25 ?v_14)) (not (and ?v_15 (not (and (not (and (not ?v_17) ?v_16)) (not (and ?v_17 ?v_14)))))))))))))) (not (and ?v_18 (not (and (not (and (not ?v_22) ?v_24)) (not (and ?v_22 (not (and (not (and ?v_23 ?v_24)) (not (and ?v_12 (not (and (not (and ?v_25 ?v_24)) (not (and ?v_15 ?v_28)))))))))))))))))) (not (and ?v_26 (not (and (not (and ?v_3 (not (and ?v_30 ?v_27)))) (not (and ?v_18 ?v_28)))))))))))))) (not (and ?v_46 (not (and ?v_47 (not (and ?v_48 (not (and ?v_33 (not (and ?v_18 (not (and ?v_20 (and ?v_38 (not (and ?v_7 (not ?v_49))))))))))))))))))))) (not (and bool.b23 (not (and bool.b6 (and (not (and ?v_29 (not (and (not (and ?v_18 (not (and ?v_20 (and ?v_38 (not (and ?v_7 (not (and (not (and ?v_39 (and (not (and ?v_40 (not (and ?v_41 (not (and bool.b7 ?v_42)))))) ?v_43))) ?v_44))))))))) (not (and ?v_3 (not (and ?v_7 (and (not (and ?v_40 ?v_41)) (not (and ?v_30 (not ?v_45)))))))))))) (not (and ?v_46 (not (and ?v_47 (not (and ?v_48 (not (and ?v_33 (not (and ?v_18 (not (and ?v_20 (and ?v_7 ?v_49))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
