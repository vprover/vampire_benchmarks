(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T) (proj1f4 T)))))
(assert (exists ((y7786 T) (y7787 T) (y7784 T) (y7785 T) (y7782 T) (y7783 T) (y7793 T) (y7781 T) (y7773 T) (y7776 T) (y7772 T) (y7771 T) (y7792 T) (y7770 T) (y7789 T) (y7790 T) (y7768 T) (y7769 T) (y7753 T) (y7752 T) (y7755 T) (y7754 T) (y7757 T) (y7756 T) (y7759 T) (y7758 T) (y7762 T) (y7763 T) (y7764 T) (y7765 T) (y7766 T) (y7767 T) (y7777 T) (y7761 T) (y7775 T) (y7788 T)) (forall ((x7800 T) (x7794 T) (x7796 T) (x7799 T) (x7798 T) (x7801 T) (x7802 T) (x7803 T) (x7797 T)) 
  (or 
    (and (= y7752 (f2 y7754)) (= y7754 (f1 y7755 (f3 x7798 x7798 x7798 x7798))) (= y7755 (f3 y7756 x7798 (f4 x7798 x7798) x7798)) (= y7756 (f3 y7752 y7752 x7798 x7798)) (= y7753 (f2 (f1 (f3 (f3 y7753 y7753 x7798 x7798) x7798 (f4 x7798 x7798) x7798) (f3 x7798 x7798 x7798 x7798)))) (distinct y7752 y7753)) 
    (and (= y7757 (f3 y7759 (f4 x7798 x7798) x7798 (f2 x7798))) (= y7759 (f1 y7757 x7798)) (= y7758 (f3 x7801 (f4 x7798 x7798) x7798 (f2 x7798))) (= x7801 (f1 y7758 x7798)) (distinct y7757 y7758)) 
    (and (= y7761 (f2 y7763)) (= y7763 (f1 y7764 x7798)) (= y7764 (f1 y7765 (f1 x7798 x7798))) (= y7765 (f4 y7761 x7798)) (= y7762 (f2 y7766)) (= y7766 (f1 y7767 x7798)) (= y7767 (f1 y7768 (f1 x7798 x7798))) (= y7768 (f4 y7762 x7798)) (distinct y7761 y7762)) 
    (and (= y7769 x7803) (= y7770 (f3 y7770 x7798 x7798 x7798)) (distinct y7769 y7770)) 
    (and (= y7771 (f1 (f2 (f3 y7773 (f2 y7771) (f2 (f3 x7798 x7798 x7798 x7798)) x7798)) (f1 (f1 x7798 x7798) (f3 x7798 x7798 x7798 x7798)))) (= y7773 (f1 x7800 x7798)) (= x7800 (f4 y7771 x7798)) (= y7772 (f1 (f2 (f3 y7775 (f2 y7772) (f2 (f3 x7798 x7798 x7798 x7798)) x7798)) (f1 (f1 x7798 x7798) (f3 x7798 x7798 x7798 x7798)))) (= y7775 (f1 y7776 x7798)) (= y7776 (f4 y7772 x7798)) (distinct y7771 y7772)) 
    (and (= y7777 (f4 y7777 x7798)) (= x7799 (f4 x7799 x7798)) (distinct y7777 x7799)) 
    (and (= x7796 x7802) (= x7794 (f2 x7794)) (distinct x7796 x7794)) 
    (and (= y7781 (f3 (f2 y7783) (f4 x7798 x7798) (f3 y7781 x7798 x7798 x7798) x7798)) (= y7783 (f2 y7781)) (= y7782 (f3 y7784 (f4 x7798 x7798) (f3 y7782 x7798 x7798 x7798) x7798)) (= y7784 (f2 y7785)) (= y7785 (f2 y7782)) (distinct y7781 y7782)) 
    (and (= y7786 (f3 y7788 x7798 (f1 (f1 x7798 x7798) (f1 x7798 x7798)) (f3 x7798 x7798 x7798 x7798))) (= y7788 (f3 y7789 (f2 x7798) (f3 x7798 x7798 x7798 x7798) (f3 (f1 x7798 x7798) (f1 x7798 x7798) x7798 (f2 x7798)))) (= y7789 (f2 y7790)) (= y7790 (f4 y7786 x7798)) (= y7787 (f3 x7797 x7798 (f1 (f1 x7798 x7798) (f1 x7798 x7798)) (f3 x7798 x7798 x7798 x7798))) (= x7797 (f3 y7792 (f2 x7798) (f3 x7798 x7798 x7798 x7798) (f3 (f1 x7798 x7798) (f1 x7798 x7798) x7798 (f2 x7798)))) (= y7792 (f2 y7793)) (= y7793 (f4 y7787 x7798)) (distinct y7786 y7787))))))
(check-sat)
