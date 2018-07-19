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
(declare-fun %lbl%+751 () Bool)
(declare-fun %lbl%@1832 () Bool)
(declare-fun bad@4 () Bool)
(declare-fun i@9 () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1847 () Bool)
(declare-fun d@9 () Int)
(declare-fun occs@9 () (Array Int Bool))
(declare-fun a () (Array Int Int))
(declare-fun %lbl%@1865 () Bool)
(declare-fun %lbl%@1895 () Bool)
(declare-fun %lbl%+482 () Bool)
(declare-fun occs@7 () (Array Int Bool))
(declare-fun i@7 () Int)
(declare-fun d@8 () Int)
(declare-fun %lbl%+480 () Bool)
(declare-fun occs@8 () (Array Int Bool))
(declare-fun i@8 () Int)
(declare-fun d@7 () Int)
(declare-fun %lbl%+472 () Bool)
(declare-fun bad@3 () Bool)
(declare-fun %lbl%+470 () Bool)
(declare-fun %lbl%+462 () Bool)
(declare-fun occs@5 () (Array Int Bool))
(declare-fun i@5 () Int)
(declare-fun d@6 () Int)
(declare-fun %lbl%+460 () Bool)
(declare-fun occs@6 () (Array Int Bool))
(declare-fun i@6 () Int)
(declare-fun d@5 () Int)
(declare-fun %lbl%+452 () Bool)
(declare-fun bad@2 () Bool)
(declare-fun %lbl%+450 () Bool)
(declare-fun %lbl%+442 () Bool)
(declare-fun occs@3 () (Array Int Bool))
(declare-fun i@3 () Int)
(declare-fun d@4 () Int)
(declare-fun %lbl%+440 () Bool)
(declare-fun occs@4 () (Array Int Bool))
(declare-fun i@4 () Int)
(declare-fun d@3 () Int)
(declare-fun %lbl%+432 () Bool)
(declare-fun bad@1 () Bool)
(declare-fun %lbl%+430 () Bool)
(declare-fun %lbl%+422 () Bool)
(declare-fun occs@1 () (Array Int Bool))
(declare-fun i@1 () Int)
(declare-fun d@2 () Int)
(declare-fun %lbl%+420 () Bool)
(declare-fun occs@2 () (Array Int Bool))
(declare-fun i@2 () Int)
(declare-fun d@1 () Int)
(declare-fun %lbl%+412 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun %lbl%+410 () Bool)
(declare-fun %lbl%+402 () Bool)
(declare-fun occs () (Array Int Bool))
(declare-fun i () Int)
(declare-fun d@0 () Int)
(declare-fun %lbl%+400 () Bool)
(declare-fun occs@0 () (Array Int Bool))
(declare-fun i@0 () Int)
(declare-fun d () Int)
(declare-fun %lbl%+392 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+390 () Bool)
(declare-fun %lbl%+755 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((GeneratedUnifiedExit_correct  (=> (! (and %lbl%+751 true) :lblpos +751) (and (! (or %lbl%@1832  (or bad@4 (and (<= 0 i@9) (<= i@9 n)))) :lblneg @1832) (=> (or bad@4 (and (<= 0 i@9) (<= i@9 n))) (and (! (or %lbl%@1847  (or bad@4 (=> (>= d@9 0) (select occs@9 (select a i@9))))) :lblneg @1847) (=> (or bad@4 (=> (>= d@9 0) (select occs@9 (select a i@9)))) (and (! (or %lbl%@1865  (or bad@4 (forall ((k Int) ) (!  (=> (and (<= 0 k) (< k i@9)) (select occs@9 (select a k)))
 :qid |onedupli.19:26|
 :skolemid |3|
)))) :lblneg @1865) (=> (or bad@4 (forall ((k@@0 Int) ) (!  (=> (and (<= 0 k@@0) (< k@@0 i@9)) (select occs@9 (select a k@@0)))
 :qid |onedupli.19:26|
 :skolemid |3|
))) (! (or %lbl%@1895  (or bad@4 (forall ((j Int) (k@@1 Int) ) (!  (=> (and (and (<= 0 j) (< j k@@1)) (< k@@1 i@9)) (not (= (select a j) (select a k@@1))))
 :qid |onedupli.20:26|
 :skolemid |4|
)))) :lblneg @1895))))))))))
(let ((anon34_Else_correct  (=> (! (and %lbl%+482 true) :lblpos +482) (=> (select occs@7 (select a i@7)) (=> (and (and (= d@8 (select a i@7)) (= i@9 i@7)) (and (= occs@9 occs@7) (= d@9 d@8))) GeneratedUnifiedExit_correct)))))
(let ((anon34_Then_correct  (=> (! (and %lbl%+480 true) :lblpos +480) (=> (and (not (select occs@7 (select a i@7))) (= occs@8 (store occs@7 (select a i@7) true))) (=> (and (and (= i@8 (+ i@7 1)) (= i@9 i@8)) (and (= occs@9 occs@8) (= d@9 d@7))) GeneratedUnifiedExit_correct)))))
(let ((anon33_Else_correct  (=> (! (and %lbl%+472 true) :lblpos +472) (=> (and (and (< i@7 n) (< d@7 0)) (and (=> bad@4 bad@3) (=> bad@3 bad@4))) (and anon34_Then_correct anon34_Else_correct)))))
(let ((anon33_Then_correct  (=> (! (and %lbl%+470 true) :lblpos +470) (=> (not (and (< i@7 n) (< d@7 0))) (=> (and (=> bad@4 true) (=> true bad@4)) (and anon34_Then_correct anon34_Else_correct))))))
(let ((anon32_Else_correct  (=> (! (and %lbl%+462 true) :lblpos +462) (=> (select occs@5 (select a i@5)) (=> (and (and (= d@6 (select a i@5)) (= d@7 d@6)) (and (= occs@7 occs@5) (= i@7 i@5))) (and anon33_Then_correct anon33_Else_correct))))))
(let ((anon32_Then_correct  (=> (! (and %lbl%+460 true) :lblpos +460) (=> (and (not (select occs@5 (select a i@5))) (= occs@6 (store occs@5 (select a i@5) true))) (=> (and (and (= i@6 (+ i@5 1)) (= d@7 d@5)) (and (= occs@7 occs@6) (= i@7 i@6))) (and anon33_Then_correct anon33_Else_correct))))))
(let ((anon31_Else_correct  (=> (! (and %lbl%+452 true) :lblpos +452) (=> (and (and (< i@5 n) (< d@5 0)) (and (=> bad@3 bad@2) (=> bad@2 bad@3))) (and anon32_Then_correct anon32_Else_correct)))))
(let ((anon31_Then_correct  (=> (! (and %lbl%+450 true) :lblpos +450) (=> (not (and (< i@5 n) (< d@5 0))) (=> (and (=> bad@3 true) (=> true bad@3)) (and anon32_Then_correct anon32_Else_correct))))))
(let ((anon30_Else_correct  (=> (! (and %lbl%+442 true) :lblpos +442) (=> (select occs@3 (select a i@3)) (=> (and (and (= d@4 (select a i@3)) (= i@5 i@3)) (and (= occs@5 occs@3) (= d@5 d@4))) (and anon31_Then_correct anon31_Else_correct))))))
(let ((anon30_Then_correct  (=> (! (and %lbl%+440 true) :lblpos +440) (=> (and (not (select occs@3 (select a i@3))) (= occs@4 (store occs@3 (select a i@3) true))) (=> (and (and (= i@4 (+ i@3 1)) (= i@5 i@4)) (and (= occs@5 occs@4) (= d@5 d@3))) (and anon31_Then_correct anon31_Else_correct))))))
(let ((anon29_Else_correct  (=> (! (and %lbl%+432 true) :lblpos +432) (=> (and (and (< i@3 n) (< d@3 0)) (and (=> bad@2 bad@1) (=> bad@1 bad@2))) (and anon30_Then_correct anon30_Else_correct)))))
(let ((anon29_Then_correct  (=> (! (and %lbl%+430 true) :lblpos +430) (=> (not (and (< i@3 n) (< d@3 0))) (=> (and (=> bad@2 true) (=> true bad@2)) (and anon30_Then_correct anon30_Else_correct))))))
(let ((anon28_Else_correct  (=> (! (and %lbl%+422 true) :lblpos +422) (=> (select occs@1 (select a i@1)) (=> (and (and (= d@2 (select a i@1)) (= d@3 d@2)) (and (= occs@3 occs@1) (= i@3 i@1))) (and anon29_Then_correct anon29_Else_correct))))))
(let ((anon28_Then_correct  (=> (! (and %lbl%+420 true) :lblpos +420) (=> (and (not (select occs@1 (select a i@1))) (= occs@2 (store occs@1 (select a i@1) true))) (=> (and (and (= i@2 (+ i@1 1)) (= d@3 d@1)) (and (= occs@3 occs@2) (= i@3 i@2))) (and anon29_Then_correct anon29_Else_correct))))))
(let ((anon27_Else_correct  (=> (! (and %lbl%+412 true) :lblpos +412) (=> (and (and (< i@1 n) (< d@1 0)) (and (=> bad@1 bad@0) (=> bad@0 bad@1))) (and anon28_Then_correct anon28_Else_correct)))))
(let ((anon27_Then_correct  (=> (! (and %lbl%+410 true) :lblpos +410) (=> (not (and (< i@1 n) (< d@1 0))) (=> (and (=> bad@1 true) (=> true bad@1)) (and anon28_Then_correct anon28_Else_correct))))))
(let ((anon26_Else_correct  (=> (! (and %lbl%+402 true) :lblpos +402) (=> (select occs (select a i)) (=> (and (and (= d@0 (select a i)) (= d@1 d@0)) (and (= occs@1 occs) (= i@1 i))) (and anon27_Then_correct anon27_Else_correct))))))
(let ((anon26_Then_correct  (=> (! (and %lbl%+400 true) :lblpos +400) (=> (and (not (select occs (select a i))) (= occs@0 (store occs (select a i) true))) (=> (and (and (= i@0 (+ i 1)) (= d@1 d)) (and (= occs@1 occs@0) (= i@1 i@0))) (and anon27_Then_correct anon27_Else_correct))))))
(let ((anon25_Else_correct  (=> (! (and %lbl%+392 true) :lblpos +392) (=> (and (and (< i n) (< d 0)) (and (=> bad@0 bad) (=> bad bad@0))) (and anon26_Then_correct anon26_Else_correct)))))
(let ((anon25_Then_correct  (=> (! (and %lbl%+390 true) :lblpos +390) (=> (not (and (< i n) (< d 0))) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon26_Then_correct anon26_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+755 true) :lblpos +755) (=> (and (> n 0) (forall ((i@@0 Int) ) (!  (=> (and (<= 0 i@@0) (< i@@0 n)) (>= (select a i@@0) 0))
 :qid |onedupli.11:20|
 :skolemid |0|
))) (=> (and (and (and (<= 0 i) (<= i n)) (=> (>= d 0) (select occs (select a i)))) (and (forall ((k@@2 Int) ) (!  (=> (and (<= 0 k@@2) (< k@@2 i)) (select occs (select a k@@2)))
 :qid |onedupli.14:20|
 :skolemid |1|
)) (forall ((j@@0 Int) (k@@3 Int) ) (!  (=> (and (and (<= 0 j@@0) (< j@@0 k@@3)) (< k@@3 i)) (not (= (select a j@@0) (select a k@@3))))
 :qid |onedupli.15:20|
 :skolemid |2|
)))) (and anon25_Then_correct anon25_Else_correct))))))
anon0_correct))))))))))))))))))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
