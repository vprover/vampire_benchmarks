(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y4727 T) (y4708 T) (y4718 T) (y4707 T) (y4730 T) (y4731 T) (y4736 T) (y4737 T) (y4688 T) (y4689 T) (y4710 T) (y4711 T) (y4712 T) (y4713 T) (y4714 T) (y4715 T) (y4716 T) (y4717 T) (y4696 T) (y4691 T) (y4690 T) (y4733 T) (y4706 T) (y4692 T) (y4734 T) (y4721 T) (y4722 T) (y4699 T) (y4698 T) (y4709 T) (y4726 T) (y4695 T) (y4728 T) (y4697 T) (y4704 T) (y4703 T) (y4702 T) (y4701 T) (y4700 T) (y4732 T) (y4735 T) (y4694 T) (y4719 T) (y4739 T) (y4740 T) (y4729 T) (y4687 T) (y4725 T) (y4724 T)) (forall ((x4742 T) (x4750 T) (x4746 T) (x4744 T) (x4745 T) (x4748 T) (x4749 T)) 
  (or 
    (and (= y4687 (f1 y4689 (f1 x4749 x4749 x4749) x4749)) (= y4689 (f2 y4690 x4749)) (= y4690 (f1 y4687 x4749 x4749)) (= y4688 (f1 y4691 (f1 x4749 x4749 x4749) x4749)) (= y4691 (f2 y4692 x4749)) (= y4692 (f1 y4688 x4749 x4749)) (distinct y4687 y4688)) 
    (and (= x4750 (f2 x4750 x4749)) (= y4694 (f2 y4694 x4749)) (distinct x4750 y4694)) 
    (and (= y4695 (f2 y4697 (f3 x4749 (f1 x4749 x4749 x4749) x4749))) (= y4697 (f1 y4698 (f1 x4749 x4749 x4749) x4749)) (= y4698 (f1 y4699 (f3 x4749 x4749 x4749) x4749)) (= y4699 (f3 y4695 y4695 x4749)) (= y4696 (f2 y4700 (f3 x4749 (f1 x4749 x4749 x4749) x4749))) (= y4700 (f1 y4701 (f1 x4749 x4749 x4749) x4749)) (= y4701 (f1 y4702 (f3 x4749 x4749 x4749) x4749)) (= y4702 (f3 y4696 y4696 x4749)) (distinct y4695 y4696)) 
    (and (= y4703 (f2 x4745 x4749)) (= x4745 (f2 y4706 x4749)) (= y4706 (f2 y4707 (f2 x4749 x4749))) (= y4707 (f3 y4703 x4749 x4749)) (= y4704 (f2 y4708 x4749)) (= y4708 (f2 y4709 x4749)) (= y4709 (f2 y4710 (f2 x4749 x4749))) (= y4710 (f3 y4704 x4749 x4749)) (distinct y4703 y4704)) 
    (and (= y4711 (f2 (f3 (f2 y4713 (f1 (f3 x4749 x4749 x4749) x4749 (f1 x4749 x4749 x4749))) y4711 (f1 x4749 x4749 x4749)) (f1 (f2 (f1 (f2 x4749 x4749) x4749 x4749) (f3 x4749 (f1 x4749 x4749 x4749) (f3 x4749 x4749 x4749))) (f1 (f1 x4749 (f1 x4749 x4749 x4749) (f1 x4749 x4749 x4749)) (f2 x4749 x4749) x4749) x4749))) (= y4713 (f1 (f2 y4711 x4749) y4714 (f2 x4749 x4749))) (= y4714 (f2 y4711 x4749)) (= y4712 (f2 y4715 (f1 (f2 (f1 (f2 x4749 x4749) x4749 x4749) (f3 x4749 (f1 x4749 x4749 x4749) (f3 x4749 x4749 x4749))) (f1 (f1 x4749 (f1 x4749 x4749 x4749) (f1 x4749 x4749 x4749)) (f2 x4749 x4749) x4749) x4749))) (= y4715 (f3 y4716 y4712 (f1 x4749 x4749 x4749))) (= y4716 (f2 y4717 (f1 (f3 x4749 x4749 x4749) x4749 (f1 x4749 x4749 x4749)))) (= y4717 (f1 (f2 y4712 x4749) y4718 (f2 x4749 x4749))) (= y4718 (f2 y4712 x4749)) (distinct y4711 y4712)) 
    (and (= y4719 (f3 (f2 y4719 x4749) y4721 x4749)) (= y4721 (f3 y4719 x4749 x4749)) (= x4742 (f3 (f2 x4742 x4749) y4722 x4749)) (= y4722 (f3 x4742 x4749 x4749)) (distinct y4719 x4742)) 
    (and (= x4744 (f3 y4725 x4749 x4749)) (= y4725 (f2 x4744 x4749)) (= y4724 (f3 y4726 x4749 x4749)) (= y4726 (f2 y4724 x4749)) (distinct x4744 y4724)) 
    (and (= y4727 (f1 y4729 (f3 (f1 y4727 x4749 x4749) x4749 x4749) (f2 (f1 (f2 x4749 x4749) (f2 x4749 x4749) (f1 x4749 x4749 x4749)) x4749))) (= y4729 (f3 y4730 (f2 (f1 y4727 x4749 x4749) x4749) x4749)) (= y4730 (f2 y4731 (f3 (f1 x4749 x4749 x4749) x4749 x4749))) (= y4731 (f3 y4732 x4749 (f1 x4749 x4749 x4749))) (= y4732 (f3 y4727 x4749 x4749)) (= y4728 (f1 y4733 (f3 (f1 y4728 x4749 x4749) x4749 x4749) (f2 (f1 (f2 x4749 x4749) (f2 x4749 x4749) (f1 x4749 x4749 x4749)) x4749))) (= y4733 (f3 y4734 (f2 (f1 y4728 x4749 x4749) x4749) x4749)) (= y4734 (f2 y4735 (f3 (f1 x4749 x4749 x4749) x4749 x4749))) (= y4735 (f3 y4736 x4749 (f1 x4749 x4749 x4749))) (= y4736 (f3 y4728 x4749 x4749)) (distinct y4727 y4728)) 
    (and (= y4737 x4748) (= y4739 (f3 y4737 x4749 x4749)) (= x4746 (f1 (f1 x4746 x4749 x4749) y4740 x4749)) (= y4740 (f3 x4746 x4749 x4749)) (distinct y4737 x4746))))))
(check-sat)