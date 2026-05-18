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
(declare-fun x3 () Real)
(declare-fun x4 () Real)
(declare-fun bool.b17 () Bool)
(declare-fun bool.b18 () Bool)
(declare-fun bool.b19 () Bool)
(declare-fun bool.b21 () Bool)
(declare-fun bool.b22 () Bool)
(declare-fun bool.b23 () Bool)
(declare-fun bool.b20 () Bool)
(declare-fun bool.b24 () Bool)
(assert (forall ((?lambda Real)) (let ((?v_6 (+ x3 (* 1 ?lambda)))) (let ((?v_0 (* 1 ?v_6))) (let ((?v_3 (<= ?v_0 0)) (?v_5 (+ x4 (* 20 ?lambda))) (?v_11 (not bool.b18)) (?v_12 (not bool.b17))) (let ((?v_17 (not ?v_3)) (?v_45 (<= ?v_0 45)) (?v_30 (<= ?v_0 40)) (?v_27 (<= ?v_0 20))) (let ((?v_38 (not ?v_27)) (?v_47 (not ?v_30)) (?v_55 (not (<= ?v_0 33))) (?v_9 (+ ?v_0 (* (/ 3 20) ?v_5)))) (let ((?v_4 (<= ?v_9 723))) (let ((?v_25 (not ?v_4))) (let ((?v_1 (and ?v_3 ?v_25))) (let ((?v_2 (not ?v_1))) (let ((?v_35 (not (and bool.b17 ?v_2))) (?v_23 (not (and ?v_3 ?v_4))) (?v_10 (* (- 1) ?v_5))) (let ((?v_41 (<= ?v_10 (- 4910)))) (let ((?v_7 (not ?v_41)) (?v_8 (* (- 1) ?v_6)) (?v_14 (* (/ (- 1) 20) ?v_5))) (let ((?v_46 (<= (+ ?v_8 ?v_14) (/ (- 581) 2))) (?v_48 (<= (+ ?v_8 (* (/ (- 1) 60) ?v_5)) (/ (- 731) 6))) (?v_24 (<= ?v_9 1200))) (let ((?v_29 (and ?v_30 ?v_24)) (?v_13 (<= ?v_10 (- 4500))) (?v_50 (<= (+ ?v_8 (* (/ (- 1) 40) ?v_5)) (/ (- 623) 4)))) (let ((?v_34 (and (not (and ?v_7 ?v_46)) (and (not (and ?v_45 (and ?v_7 ?v_48))) (not (and ?v_29 (and ?v_13 (and ?v_7 ?v_50))))))) (?v_26 (<= (+ ?v_0 (* (/ 1 15) ?v_5)) (/ 964 3))) (?v_15 (+ ?v_0 ?v_14))) (let ((?v_22 (and (<= ?v_15 (- 205)) (not (<= ?v_15 (- 209)))))) (let ((?v_16 (not ?v_22)) (?v_49 (<= ?v_8 (- 30)))) (let ((?v_19 (not ?v_49)) (?v_18 (+ ?v_0 (* (/ (- 1) 80) ?v_5)))) (let ((?v_20 (<= ?v_18 (/ (- 161) 4))) (?v_21 (not (<= ?v_8 (- 20))))) (let ((?v_36 (not (and (not ?v_13) (not (and (not (and ?v_3 (and ?v_26 (not (and (not (and (not (<= ?v_0 30)) ?v_16)) (not (and ?v_19 ?v_16))))))) (not (and ?v_17 (not (and (not (and (not ?v_20) (not (and (<= ?v_18 (/ (- 145) 4)) (and ?v_19 (not (and ?v_21 ?v_16))))))) (not (and ?v_20 (not (and ?v_21 ?v_22))))))))))))) (?v_37 (not (and ?v_27 (and (not (and ?v_24 ?v_25)) (not (and ?v_26 (not (<= (+ ?v_0 (* (/ 1 20) ?v_5)) 241)))))))) (?v_40 (not ?v_26)) (?v_28 (+ ?v_0 (* (/ 3 40) ?v_5)))) (let ((?v_43 (not (<= ?v_28 (/ 703 2)))) (?v_44 (<= ?v_28 610)) (?v_31 (<= ?v_28 359))) (let ((?v_52 (not ?v_31)) (?v_53 (not (<= ?v_28 (/ 743 2)))) (?v_51 (not (and ?v_47 ?v_31)))) (let ((?v_42 (not (and ?v_43 (and ?v_44 (and (not (and ?v_52 (not (and ?v_53 ?v_29)))) ?v_51))))) (?v_32 (+ ?v_0 (* (/ 1 40) ?v_5)))) (let ((?v_33 (<= ?v_32 133))) (let ((?v_39 (not (and ?v_26 (not (and (not (<= ?v_32 (/ 261 2))) (and (<= ?v_32 (/ 650 3)) (and (not (and (not ?v_33) (not (and ?v_30 (not (<= ?v_32 (/ 823 6))))))) (not (and ?v_33 (not ?v_29)))))))))) (?v_54 (not (and (not ?v_45) (not ?v_46)))) (?v_57 (and ?v_47 (not (and (<= (+ ?v_0 (* (/ 1 60) ?v_5)) (/ 400 3)) ?v_48))))) (let ((?v_56 (not ?v_57))) (or (or (exists ((?lambdaprime Real)) (let ((?v_58 (not (<= (* (- 1) (+ x3 (* 1 ?lambdaprime))) (- 20)))) (?v_59 (* (- 1) (+ x4 (* 20 ?lambdaprime))))) (and (and (<= 0 ?lambdaprime) (<= ?lambdaprime ?lambda)) (not (and (and (not (and bool.b17 (not (and ?v_58 (not (<= ?v_59 (- 4100))))))) (not (and bool.b18 (not (and ?v_58 (not (<= ?v_59 (- 4500)))))))) (not (and bool.b19 (not (and ?v_58 (not (<= ?v_59 (- 4910)))))))))))) (< ?lambda 0)) (and (not (and bool.b21 ?v_1)) (not (and (not bool.b21) (and (not (and bool.b22 ?v_2)) (not (and (not bool.b22) (not (and (not (and bool.b23 ?v_2)) (not (and (not bool.b23) (not (and (not (and bool.b20 ?v_2)) (not (and (not bool.b20) (not (and (not (and bool.b19 (not (and (not (and bool.b18 ?v_2)) (not (and ?v_11 (not (and ?v_35 (not (and ?v_12 (not (and ?v_23 (not (and ?v_17 ?v_34)))))))))))))) (not (and (not bool.b19) (not (and (not (and ?v_11 (not (and (not (and ?v_12 ?v_2)) (not (and bool.b17 (not (and ?v_36 (not (and ?v_13 (not (and ?v_23 (not (and ?v_17 (not (and (not (and (not bool.b24) (not (and ?v_37 (not (and ?v_38 (not (and (<= ?v_10 (- 4100)) (and (not (and ?v_40 ?v_42)) ?v_39))))))))) (not (and bool.b24 ?v_34)))))))))))))))))) (not (and bool.b18 (not (and ?v_35 (not (and ?v_12 (not (and ?v_36 (not (and ?v_13 (not (and ?v_37 (not (and ?v_38 (not (and ?v_39 (not (and ?v_40 (not (and (not (and ?v_41 ?v_42)) (not (and ?v_7 (not (and ?v_43 (and (not (and (not ?v_44) (not (and ?v_54 (not (and ?v_45 (not (and ?v_56 (not (and ?v_30 (not (and ?v_55 (and ?v_49 ?v_50))))))))))))) (not (and ?v_44 (not (and ?v_51 (not (and ?v_52 (not (and ?v_53 (and (not (and (not ?v_24) (not (and ?v_54 (not (and ?v_45 (not (and ?v_55 ?v_56)))))))) (not (and ?v_24 (not (and ?v_54 (not (and ?v_45 ?v_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
