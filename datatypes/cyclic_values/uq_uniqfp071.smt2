(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T)))))
(assert (exists ((y7629 T) (y7628 T) (y7641 T) (y7640 T) (y7647 T) (y7646 T) (y7645 T) (y7642 T) (y7621 T) (y7620 T) (y7623 T) (y7622 T) (y7625 T) (y7624 T) (y7627 T) (y7626 T) (y7660 T) (y7644 T) (y7599 T) (y7610 T) (y7611 T) (y7612 T) (y7613 T) (y7614 T) (y7615 T) (y7616 T) (y7617 T) (y7618 T) (y7649 T) (y7651 T) (y7648 T) (y7638 T) (y7639 T) (y7658 T) (y7632 T) (y7633 T) (y7656 T) (y7631 T) (y7650 T) (y7637 T) (y7634 T) (y7635 T) (y7643 T) (y7652 T) (y7653 T) (y7606 T) (y7605 T) (y7604 T) (y7603 T) (y7602 T) (y7601 T) (y7600 T) (y7654 T) (y7609 T)) (forall ((x7661 T) (x7662 T) (x7663 T) (x7664 T) (x7666 T) (x7667 T) (x7668 T) (x7669 T) (x7670 T)) 
  (or 
    (and (= y7599 (f1 y7601 (f2 (f1 (f2 x7663) x7663)))) (= y7601 (f2 y7602)) (= y7602 (f2 y7603)) (= y7603 (f2 y7599)) (= y7600 (f1 (f2 (f2 (f2 y7600))) (f2 (f1 (f2 x7663) x7663)))) (distinct y7599 y7600)) 
    (and (= y7604 (f2 y7606)) (= y7606 (f2 y7604)) (= y7605 (f2 (f2 y7605))) (distinct y7604 y7605)) 
    (and (= x7669 (f2 y7609)) (= y7609 (f2 x7669)) (= x7662 (f2 (f2 x7662))) (distinct x7669 x7662)) 
    (and (= y7610 (f1 y7612 (f2 (f2 (f1 x7663 x7663))))) (= y7612 (f1 y7613 x7663)) (= y7613 (f1 y7614 (f1 x7663 x7663))) (= y7614 (f1 y7615 (f2 x7663))) (= y7615 (f2 y7610)) (= y7611 (f1 y7616 (f2 (f2 (f1 x7663 x7663))))) (= y7616 (f1 y7617 x7663)) (= y7617 (f1 y7618 (f1 x7663 x7663))) (= y7618 (f1 x7661 (f2 x7663))) (= x7661 (f2 y7611)) (distinct y7610 y7611)) 
    (and (= y7620 (f2 y7622)) (= y7622 (f1 y7623 x7663)) (= y7623 (f1 y7624 x7663)) (= y7624 (f1 y7620 x7663)) (= y7621 (f2 y7625)) (= y7625 (f1 y7626 x7663)) (= y7626 (f1 y7627 x7663)) (= y7627 (f1 y7621 x7663)) (distinct y7620 y7621)) 
    (and (= y7628 (f2 x7668)) (= x7668 (f1 y7628 x7663)) (= y7629 (f2 y7631)) (= y7631 (f1 y7629 x7663)) (distinct y7628 y7629)) 
    (and (= y7632 (f1 y7634 (f2 (f2 x7663)))) (= y7634 (f1 y7635 (f1 x7663 x7663))) (= y7635 (f2 y7632)) (= y7633 (f1 x7667 (f2 (f2 x7663)))) (= x7667 (f1 y7637 (f1 x7663 x7663))) (= y7637 (f2 y7633)) (distinct y7632 y7633)) 
    (and (= y7638 (f1 y7640 (f2 (f2 (f2 x7663))))) (= y7640 (f2 y7641)) (= y7641 (f2 y7642)) (= y7642 (f2 y7643)) (= y7643 (f2 y7638)) (= y7639 (f1 (f2 (f2 y7644)) (f2 (f2 (f2 x7663))))) (= y7644 (f2 y7645)) (= y7645 (f2 y7639)) (distinct y7638 y7639)) 
    (and (= y7646 (f1 y7648 (f2 x7663))) (= y7648 (f1 y7649 (f1 (f1 x7663 x7663) (f2 x7663)))) (= y7649 (f1 y7650 (f1 x7663 x7663))) (= y7650 (f1 y7646 x7663)) (= y7647 (f1 y7651 (f2 x7663))) (= y7651 (f1 y7652 (f1 (f1 x7663 x7663) (f2 x7663)))) (= y7652 (f1 y7653 (f1 x7663 x7663))) (= y7653 (f1 y7647 x7663)) (distinct y7646 y7647)) 
    (and (= y7654 (f1 (f1 y7656 (f2 x7663)) (f1 x7663 x7663))) (= y7656 (f2 x7666)) (= x7666 (f2 y7654)) (= x7664 (f1 y7658 (f1 x7663 x7663))) (= y7658 (f1 x7670 (f2 x7663))) (= x7670 (f2 y7660)) (= y7660 (f2 x7664)) (distinct y7654 x7664))))))
(check-sat)
