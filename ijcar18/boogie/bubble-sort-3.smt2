(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-info :status unsat)
(set-option :AUTO_CONFIG false)
(set-option :pp.bv_literals false)
(set-option :MODEL.V2 true)
(set-option :smt.PHASE_SELECTION 0)
(set-option :smt.RESTART_STRATEGY 0)
(set-option :smt.RESTART_FACTOR |1.5|)
(set-option :smt.ARITH.RANDOM_INITIAL_VALUE true)
(set-option :smt.CASE_SPLIT 3)
(set-option :smt.DELAY_UNITS true)
(set-option :NNF.SK_HACK true)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :TYPE_CHECK true)
(set-option :smt.BV.REFLECT true)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun %lbl%+485 () Bool)
(declare-fun i@2 () Int)
(declare-fun i@1 () Int)
(declare-fun %lbl%@1908 () Bool)
(declare-fun bad@2 () Bool)
(declare-fun sortedUntil () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1923 () Bool)
(declare-fun a@8 () (Array Int Int))
(declare-fun %lbl%@1973 () Bool)
(declare-fun %lbl%@2005 () Bool)
(declare-fun %lbl%+483 () Bool)
(declare-fun a@5 () (Array Int Int))
(declare-fun %lbl%+481 () Bool)
(declare-fun t@2 () Int)
(declare-fun a@6 () (Array Int Int))
(declare-fun a@7 () (Array Int Int))
(declare-fun %lbl%+472 () Bool)
(declare-fun bad@1 () Bool)
(declare-fun %lbl%+470 () Bool)
(declare-fun %lbl%+468 () Bool)
(declare-fun i@0 () Int)
(declare-fun %lbl%+462 () Bool)
(declare-fun a@2 () (Array Int Int))
(declare-fun %lbl%+460 () Bool)
(declare-fun t@1 () Int)
(declare-fun a@3 () (Array Int Int))
(declare-fun a@4 () (Array Int Int))
(declare-fun %lbl%+451 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun %lbl%+449 () Bool)
(declare-fun %lbl%+447 () Bool)
(declare-fun i () Int)
(declare-fun %lbl%+441 () Bool)
(declare-fun a () (Array Int Int))
(declare-fun %lbl%+439 () Bool)
(declare-fun t@0 () Int)
(declare-fun a@0 () (Array Int Int))
(declare-fun a@1 () (Array Int Int))
(declare-fun %lbl%+430 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+428 () Bool)
(declare-fun %lbl%+840 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((anon12_correct  (=> (! (and %lbl%+485 true) :lblpos +485) (=> (= i@2 (- i@1 1)) (and (! (or %lbl%@1908  (or bad@2 (and (<= sortedUntil i@2) (< i@2 n)))) :lblneg @1908) (=> (or bad@2 (and (<= sortedUntil i@2) (< i@2 n))) (and (! (or %lbl%@1923  (or bad@2 (forall ((j Int) (k Int) ) (!  (=> (and (and (and (<= 0 j) (< j sortedUntil)) (<= sortedUntil k)) (< k n)) (<= (select a@8 j) (select a@8 k)))
 :qid |bubbleso.18:26|
 :skolemid |5|
)))) :lblneg @1923) (=> (or bad@2 (forall ((j@@0 Int) (k@@0 Int) ) (!  (=> (and (and (and (<= 0 j@@0) (< j@@0 sortedUntil)) (<= sortedUntil k@@0)) (< k@@0 n)) (<= (select a@8 j@@0) (select a@8 k@@0)))
 :qid |bubbleso.18:26|
 :skolemid |5|
))) (and (! (or %lbl%@1973  (or bad@2 (forall ((j@@1 Int) ) (!  (=> (and (<= i@2 j@@1) (< j@@1 n)) (<= (select a@8 i@2) (select a@8 j@@1)))
 :qid |bubbleso.19:26|
 :skolemid |6|
)))) :lblneg @1973) (=> (or bad@2 (forall ((j@@2 Int) ) (!  (=> (and (<= i@2 j@@2) (< j@@2 n)) (<= (select a@8 i@2) (select a@8 j@@2)))
 :qid |bubbleso.19:26|
 :skolemid |6|
))) (! (or %lbl%@2005  (or bad@2 (forall ((j@@3 Int) (k@@1 Int) ) (!  (=> (and (and (<= 0 j@@3) (< j@@3 k@@1)) (< k@@1 sortedUntil)) (<= (select a@8 j@@3) (select a@8 k@@1)))
 :qid |bubbleso.20:26|
 :skolemid |7|
)))) :lblneg @2005)))))))))))
(let ((anon18_Else_correct  (=> (! (and %lbl%+483 true) :lblpos +483) (=> (and (< (select a@5 (- i@1 1)) (select a@5 i@1)) (= a@8 a@5)) anon12_correct))))
(let ((anon18_Then_correct  (=> (! (and %lbl%+481 true) :lblpos +481) (=> (<= (select a@5 i@1) (select a@5 (- i@1 1))) (=> (and (and (= t@2 (select a@5 i@1)) (= a@6 (store a@5 i@1 (select a@5 (- i@1 1))))) (and (= a@7 (store a@6 (- i@1 1) t@2)) (= a@8 a@7))) anon12_correct)))))
(let ((anon17_Else_correct  (=> (! (and %lbl%+472 true) :lblpos +472) (=> (> i@1 sortedUntil) (=> (and (=> bad@2 bad@1) (=> bad@1 bad@2)) (and anon18_Then_correct anon18_Else_correct))))))
(let ((anon17_Then_correct  (=> (! (and %lbl%+470 true) :lblpos +470) (=> (not (> i@1 sortedUntil)) (=> (and (=> bad@2 true) (=> true bad@2)) (and anon18_Then_correct anon18_Else_correct))))))
(let ((anon8_correct  (=> (! (and %lbl%+468 true) :lblpos +468) (=> (= i@1 (- i@0 1)) (and anon17_Then_correct anon17_Else_correct)))))
(let ((anon16_Else_correct  (=> (! (and %lbl%+462 true) :lblpos +462) (=> (and (< (select a@2 (- i@0 1)) (select a@2 i@0)) (= a@5 a@2)) anon8_correct))))
(let ((anon16_Then_correct  (=> (! (and %lbl%+460 true) :lblpos +460) (=> (<= (select a@2 i@0) (select a@2 (- i@0 1))) (=> (and (and (= t@1 (select a@2 i@0)) (= a@3 (store a@2 i@0 (select a@2 (- i@0 1))))) (and (= a@4 (store a@3 (- i@0 1) t@1)) (= a@5 a@4))) anon8_correct)))))
(let ((anon15_Else_correct  (=> (! (and %lbl%+451 true) :lblpos +451) (=> (> i@0 sortedUntil) (=> (and (=> bad@1 bad@0) (=> bad@0 bad@1)) (and anon16_Then_correct anon16_Else_correct))))))
(let ((anon15_Then_correct  (=> (! (and %lbl%+449 true) :lblpos +449) (=> (not (> i@0 sortedUntil)) (=> (and (=> bad@1 true) (=> true bad@1)) (and anon16_Then_correct anon16_Else_correct))))))
(let ((anon4_correct  (=> (! (and %lbl%+447 true) :lblpos +447) (=> (= i@0 (- i 1)) (and anon15_Then_correct anon15_Else_correct)))))
(let ((anon14_Else_correct  (=> (! (and %lbl%+441 true) :lblpos +441) (=> (and (< (select a (- i 1)) (select a i)) (= a@2 a)) anon4_correct))))
(let ((anon14_Then_correct  (=> (! (and %lbl%+439 true) :lblpos +439) (=> (<= (select a i) (select a (- i 1))) (=> (and (and (= t@0 (select a i)) (= a@0 (store a i (select a (- i 1))))) (and (= a@1 (store a@0 (- i 1) t@0)) (= a@2 a@1))) anon4_correct)))))
(let ((anon13_Else_correct  (=> (! (and %lbl%+430 true) :lblpos +430) (=> (> i sortedUntil) (=> (and (=> bad@0 bad) (=> bad bad@0)) (and anon14_Then_correct anon14_Else_correct))))))
(let ((anon13_Then_correct  (=> (! (and %lbl%+428 true) :lblpos +428) (=> (not (> i sortedUntil)) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon14_Then_correct anon14_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+840 true) :lblpos +840) (=> (>= n 0) (=> (and (and (<= 0 sortedUntil) (<= sortedUntil n)) (and (forall ((j@@4 Int) (k@@2 Int) ) (!  (=> (and (and (and (<= 0 j@@4) (< j@@4 sortedUntil)) (<= sortedUntil k@@2)) (< k@@2 n)) (<= (select a j@@4) (select a k@@2)))
 :qid |bubbleso.10:20|
 :skolemid |0|
)) (forall ((j@@5 Int) (k@@3 Int) ) (!  (=> (and (and (<= 0 j@@5) (< j@@5 k@@3)) (< k@@3 sortedUntil)) (<= (select a j@@5) (select a k@@3)))
 :qid |bubbleso.11:20|
 :skolemid |1|
)))) (=> (and (and (and (<= sortedUntil i) (< i n)) (forall ((j@@6 Int) (k@@4 Int) ) (!  (=> (and (and (and (<= 0 j@@6) (< j@@6 sortedUntil)) (<= sortedUntil k@@4)) (< k@@4 n)) (<= (select a j@@6) (select a k@@4)))
 :qid |bubbleso.13:20|
 :skolemid |2|
))) (and (forall ((j@@7 Int) ) (!  (=> (and (<= i j@@7) (< j@@7 n)) (<= (select a i) (select a j@@7)))
 :qid |bubbleso.14:20|
 :skolemid |3|
)) (forall ((j@@8 Int) (k@@5 Int) ) (!  (=> (and (and (<= 0 j@@8) (< j@@8 k@@5)) (< k@@5 sortedUntil)) (<= (select a j@@8) (select a k@@5)))
 :qid |bubbleso.15:20|
 :skolemid |4|
)))) (and anon13_Then_correct anon13_Else_correct)))))))
anon0_correct))))))))))))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
