(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y6758 T) (y6759 T) (y6753 T) (y6750 T) (y6757 T) (y6754 T) (y6766 T) (y6764 T) (y6763 T) (y6762 T) (y6761 T) (y6760 T) (y6768 T)) (forall ((x6775 T) (x6777 T) (x6776 T) (x6771 T) (x6773 T) (x6778 T)) 
  (or 
    (and (= y6750 (f1 y6750)) (= x6776 (f1 x6776)) (distinct y6750 x6776)) 
    (and (= x6777 (f1 (f1 (f1 x6777)))) (= y6753 (f1 y6754)) (= y6754 (f1 x6771)) (= x6771 (f1 y6753)) (distinct x6777 y6753)) 
    (and (= x6773 (f1 y6758)) (= y6758 (f1 x6773)) (= y6757 (f1 y6759)) (= y6759 (f1 y6757)) (distinct x6773 y6757)) 
    (and (= y6760 (f1 y6760)) (= y6761 (f1 y6761)) (distinct y6760 y6761)) 
    (and (= y6762 (f1 (f1 (f1 (f1 y6764))))) (= y6764 (f1 y6762)) (= y6763 (f1 x6775)) (= x6775 (f1 y6766)) (= y6766 (f1 x6778)) (= x6778 (f1 y6768)) (= y6768 (f1 y6763)) (distinct y6762 y6763))))))
(check-sat)
