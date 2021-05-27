(set-logic ALIA)
(set-info :status unsat)
(declare-datatypes ((struct_type_pointer_struct 0)) (((struct_type_pointer_struct (pointer_object Int) (pointer_offset Int)))))
(declare-datatypes ((struct_type_addr_space_type 0)) (((struct_type_addr_space_type (start Int) (end Int)))))
(declare-fun __ESBMC_ptr_obj_start_0 () Int)
(declare-fun __ESBMC_ptr_obj_end_0 () Int)
(declare-fun __ESBMC_ptr_obj_start_1 () Int)
(declare-fun __ESBMC_ptr_obj_end_1 () Int)
(declare-fun __ESBMC_ptr_addr_range_0 () struct_type_addr_space_type)
(declare-fun __ESBMC_ptr_addr_range_1 () struct_type_addr_space_type)
(declare-fun __ESBMC_addrspace_arr_2 () (Array Int struct_type_addr_space_type))
(declare-fun __ESBMC_addrspace_arr_1 () (Array Int struct_type_addr_space_type))
(declare-fun __ESBMC_addrspace_arr_3 () (Array Int struct_type_addr_space_type))
(declare-fun |0| () struct_type_pointer_struct)
(declare-fun NULL () struct_type_pointer_struct)
(declare-fun INVALID () struct_type_pointer_struct)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#1| () (Array Int Int))
(declare-fun |nondet$symex::nondet0| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#0| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#2| () (Array Int Int))
(declare-fun |nondet$symex::nondet1| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#3| () (Array Int Int))
(declare-fun |nondet$symex::nondet2| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#4| () (Array Int Int))
(declare-fun |nondet$symex::nondet3| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#5| () (Array Int Int))
(declare-fun |nondet$symex::nondet4| () Int)
(declare-fun |c:loop_example.c@72@F@main@pivot?1!0&0#1| () Int)
(declare-fun |goto_symex::guard?0!0&0#1| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#6| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#7| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#9| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#8| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@pivot?1!0&0#2| () Int)
(declare-fun |goto_symex::guard?0!0&0#2| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#9| () (Array Int Int))
(declare-fun |goto_symex::guard?0!0&0#3| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#10| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#11| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#13| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#12| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#14| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#13| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@pivot?1!0&0#3| () Int)
(declare-fun |goto_symex::guard?0!0&0#4| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#14| () (Array Int Int))
(declare-fun |goto_symex::guard?0!0&0#5| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#15| () (Array Int Int))
(declare-fun |goto_symex::guard?0!0&0#6| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#16| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#17| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#19| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#18| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#20| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#19| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#21| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#20| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@pivot?1!0&0#4| () Int)
(declare-fun |goto_symex::guard?0!0&0#7| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#21| () (Array Int Int))
(declare-fun |goto_symex::guard?0!0&0#8| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#22| () (Array Int Int))
(declare-fun |goto_symex::guard?0!0&0#9| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#23| () (Array Int Int))
(declare-fun |goto_symex::guard?0!0&0#10| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#24| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#25| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#27| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#26| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#28| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#27| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#29| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#28| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#30| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#29| () (Array Int Int))
(declare-fun |execution_statet::\\guard_exec?0!0| () Bool)
(assert (= __ESBMC_ptr_obj_start_0 0))
(assert (= __ESBMC_ptr_obj_end_0 0))
(assert (= __ESBMC_ptr_obj_start_1 1))
(assert (= __ESBMC_ptr_obj_end_1 18446744073709551615))
(assert (= __ESBMC_ptr_addr_range_0
   (struct_type_addr_space_type __ESBMC_ptr_obj_start_0 __ESBMC_ptr_obj_end_0)))
(assert (= __ESBMC_ptr_addr_range_1
   (struct_type_addr_space_type __ESBMC_ptr_obj_start_1 __ESBMC_ptr_obj_end_1)))
(assert (= (store __ESBMC_addrspace_arr_1
          0
          (struct_type_addr_space_type
            __ESBMC_ptr_obj_start_0
            __ESBMC_ptr_obj_end_0))
   __ESBMC_addrspace_arr_2))
(assert (= (store __ESBMC_addrspace_arr_2
          1
          (struct_type_addr_space_type
            __ESBMC_ptr_obj_start_1
            __ESBMC_ptr_obj_end_1))
   __ESBMC_addrspace_arr_3))
(assert (= |0| (struct_type_pointer_struct 0 0)))
(assert (= NULL (struct_type_pointer_struct 0 0)))
(assert (= INVALID (struct_type_pointer_struct 1 0)))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#0| 0 |nondet$symex::nondet0|)
   |c:loop_example.c@72@F@main@a?1!0&0#1|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#1| 1 |nondet$symex::nondet1|)
   |c:loop_example.c@72@F@main@a?1!0&0#2|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#2| 2 |nondet$symex::nondet2|)
   |c:loop_example.c@72@F@main@a?1!0&0#3|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#3| 3 |nondet$symex::nondet3|)
   |c:loop_example.c@72@F@main@a?1!0&0#4|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#4| 4 |nondet$symex::nondet4|)
   |c:loop_example.c@72@F@main@a?1!0&0#5|))
(assert (= (select |c:loop_example.c@72@F@main@a?1!0&0#5| 1)
   |c:loop_example.c@72@F@main@pivot?1!0&0#1|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#5| 0)
      |c:loop_example.c@72@F@main@pivot?1!0&0#1|)
   |goto_symex::guard?0!0&0#1|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#5|
          1
          (select |c:loop_example.c@72@F@main@a?1!0&0#5| 0))
   |c:loop_example.c@72@F@main@a?1!0&0#6|))
(assert (= (ite (not |goto_symex::guard?0!0&0#1|)
        |c:loop_example.c@72@F@main@a?1!0&0#5|
        |c:loop_example.c@72@F@main@a?1!0&0#6|)
   |c:loop_example.c@72@F@main@a?1!0&0#7|))
(assert (= (ite (not |goto_symex::guard?0!0&0#1|) 0 (- 1))
   |c:loop_example.c@53@F@main@i?1!0&0#9|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#7|
          (+ |c:loop_example.c@53@F@main@i?1!0&0#9| 1)
          |c:loop_example.c@72@F@main@pivot?1!0&0#1|)
   |c:loop_example.c@72@F@main@a?1!0&0#8|))
(assert (= (select |c:loop_example.c@72@F@main@a?1!0&0#8| 2)
   |c:loop_example.c@72@F@main@pivot?1!0&0#2|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#8| 1)
      |c:loop_example.c@72@F@main@pivot?1!0&0#2|)
   |goto_symex::guard?0!0&0#2|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#8|
          2
          (select |c:loop_example.c@72@F@main@a?1!0&0#8| 1))
   |c:loop_example.c@72@F@main@a?1!0&0#9|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#9| 0)
      |c:loop_example.c@72@F@main@pivot?1!0&0#2|)
   |goto_symex::guard?0!0&0#3|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#9|
          1
          (select |c:loop_example.c@72@F@main@a?1!0&0#9| 0))
   |c:loop_example.c@72@F@main@a?1!0&0#10|))
(assert (= (ite (not |goto_symex::guard?0!0&0#3|)
        |c:loop_example.c@72@F@main@a?1!0&0#9|
        |c:loop_example.c@72@F@main@a?1!0&0#10|)
   |c:loop_example.c@72@F@main@a?1!0&0#11|))
(assert (= (ite (not |goto_symex::guard?0!0&0#3|) 0 (- 1))
   |c:loop_example.c@53@F@main@i?1!0&0#13|))
(assert (= (ite (not |goto_symex::guard?0!0&0#2|)
        |c:loop_example.c@72@F@main@a?1!0&0#8|
        |c:loop_example.c@72@F@main@a?1!0&0#11|)
   |c:loop_example.c@72@F@main@a?1!0&0#12|))
(assert (= (ite (not |goto_symex::guard?0!0&0#2|)
        1
        |c:loop_example.c@53@F@main@i?1!0&0#13|)
   |c:loop_example.c@53@F@main@i?1!0&0#14|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#12|
          (+ |c:loop_example.c@53@F@main@i?1!0&0#14| 1)
          |c:loop_example.c@72@F@main@pivot?1!0&0#2|)
   |c:loop_example.c@72@F@main@a?1!0&0#13|))
(assert (= (select |c:loop_example.c@72@F@main@a?1!0&0#13| 3)
   |c:loop_example.c@72@F@main@pivot?1!0&0#3|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#13| 2)
      |c:loop_example.c@72@F@main@pivot?1!0&0#3|)
   |goto_symex::guard?0!0&0#4|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#13|
          3
          (select |c:loop_example.c@72@F@main@a?1!0&0#13| 2))
   |c:loop_example.c@72@F@main@a?1!0&0#14|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#14| 1)
      |c:loop_example.c@72@F@main@pivot?1!0&0#3|)
   |goto_symex::guard?0!0&0#5|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#14|
          2
          (select |c:loop_example.c@72@F@main@a?1!0&0#14| 1))
   |c:loop_example.c@72@F@main@a?1!0&0#15|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#15| 0)
      |c:loop_example.c@72@F@main@pivot?1!0&0#3|)
   |goto_symex::guard?0!0&0#6|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#15|
          1
          (select |c:loop_example.c@72@F@main@a?1!0&0#15| 0))
   |c:loop_example.c@72@F@main@a?1!0&0#16|))
(assert (= (ite (not |goto_symex::guard?0!0&0#6|)
        |c:loop_example.c@72@F@main@a?1!0&0#15|
        |c:loop_example.c@72@F@main@a?1!0&0#16|)
   |c:loop_example.c@72@F@main@a?1!0&0#17|))
(assert (= (ite (not |goto_symex::guard?0!0&0#6|) 0 (- 1))
   |c:loop_example.c@53@F@main@i?1!0&0#19|))
(assert (= (ite (not |goto_symex::guard?0!0&0#5|)
        |c:loop_example.c@72@F@main@a?1!0&0#14|
        |c:loop_example.c@72@F@main@a?1!0&0#17|)
   |c:loop_example.c@72@F@main@a?1!0&0#18|))
(assert (= (ite (not |goto_symex::guard?0!0&0#5|)
        1
        |c:loop_example.c@53@F@main@i?1!0&0#19|)
   |c:loop_example.c@53@F@main@i?1!0&0#20|))
(assert (= (ite (not |goto_symex::guard?0!0&0#4|)
        |c:loop_example.c@72@F@main@a?1!0&0#13|
        |c:loop_example.c@72@F@main@a?1!0&0#18|)
   |c:loop_example.c@72@F@main@a?1!0&0#19|))
(assert (= (ite (not |goto_symex::guard?0!0&0#4|)
        2
        |c:loop_example.c@53@F@main@i?1!0&0#20|)
   |c:loop_example.c@53@F@main@i?1!0&0#21|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#19|
          (+ |c:loop_example.c@53@F@main@i?1!0&0#21| 1)
          |c:loop_example.c@72@F@main@pivot?1!0&0#3|)
   |c:loop_example.c@72@F@main@a?1!0&0#20|))
(assert (= (select |c:loop_example.c@72@F@main@a?1!0&0#20| 4)
   |c:loop_example.c@72@F@main@pivot?1!0&0#4|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#20| 3)
      |c:loop_example.c@72@F@main@pivot?1!0&0#4|)
   |goto_symex::guard?0!0&0#7|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#20|
          4
          (select |c:loop_example.c@72@F@main@a?1!0&0#20| 3))
   |c:loop_example.c@72@F@main@a?1!0&0#21|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#21| 2)
      |c:loop_example.c@72@F@main@pivot?1!0&0#4|)
   |goto_symex::guard?0!0&0#8|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#21|
          3
          (select |c:loop_example.c@72@F@main@a?1!0&0#21| 2))
   |c:loop_example.c@72@F@main@a?1!0&0#22|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#22| 1)
      |c:loop_example.c@72@F@main@pivot?1!0&0#4|)
   |goto_symex::guard?0!0&0#9|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#22|
          2
          (select |c:loop_example.c@72@F@main@a?1!0&0#22| 1))
   |c:loop_example.c@72@F@main@a?1!0&0#23|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#23| 0)
      |c:loop_example.c@72@F@main@pivot?1!0&0#4|)
   |goto_symex::guard?0!0&0#10|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#23|
          1
          (select |c:loop_example.c@72@F@main@a?1!0&0#23| 0))
   |c:loop_example.c@72@F@main@a?1!0&0#24|))
(assert (= (ite (not |goto_symex::guard?0!0&0#10|)
        |c:loop_example.c@72@F@main@a?1!0&0#23|
        |c:loop_example.c@72@F@main@a?1!0&0#24|)
   |c:loop_example.c@72@F@main@a?1!0&0#25|))
(assert (= (ite (not |goto_symex::guard?0!0&0#10|) 0 (- 1))
   |c:loop_example.c@53@F@main@i?1!0&0#27|))
(assert (= (ite (not |goto_symex::guard?0!0&0#9|)
        |c:loop_example.c@72@F@main@a?1!0&0#22|
        |c:loop_example.c@72@F@main@a?1!0&0#25|)
   |c:loop_example.c@72@F@main@a?1!0&0#26|))
(assert (= (ite (not |goto_symex::guard?0!0&0#9|)
        1
        |c:loop_example.c@53@F@main@i?1!0&0#27|)
   |c:loop_example.c@53@F@main@i?1!0&0#28|))
(assert (= (ite (not |goto_symex::guard?0!0&0#8|)
        |c:loop_example.c@72@F@main@a?1!0&0#21|
        |c:loop_example.c@72@F@main@a?1!0&0#26|)
   |c:loop_example.c@72@F@main@a?1!0&0#27|))
(assert (= (ite (not |goto_symex::guard?0!0&0#8|)
        2
        |c:loop_example.c@53@F@main@i?1!0&0#28|)
   |c:loop_example.c@53@F@main@i?1!0&0#29|))
(assert (= (ite (not |goto_symex::guard?0!0&0#7|)
        |c:loop_example.c@72@F@main@a?1!0&0#20|
        |c:loop_example.c@72@F@main@a?1!0&0#27|)
   |c:loop_example.c@72@F@main@a?1!0&0#28|))
(assert (= (ite (not |goto_symex::guard?0!0&0#7|)
        3
        |c:loop_example.c@53@F@main@i?1!0&0#29|)
   |c:loop_example.c@53@F@main@i?1!0&0#30|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#28|
          (+ |c:loop_example.c@53@F@main@i?1!0&0#30| 1)
          |c:loop_example.c@72@F@main@pivot?1!0&0#4|)
   |c:loop_example.c@72@F@main@a?1!0&0#29|))
(assert (let ((a!1 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (>= (+ |c:loop_example.c@53@F@main@i?1!0&0#9| 1) 0))))
      (a!2 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (< (+ |c:loop_example.c@53@F@main@i?1!0&0#9| 1) 5))))
      (a!3 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (>= (+ |c:loop_example.c@53@F@main@i?1!0&0#14| 1) 0))))
      (a!4 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (< (+ |c:loop_example.c@53@F@main@i?1!0&0#14| 1) 5))))
      (a!5 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (>= (+ |c:loop_example.c@53@F@main@i?1!0&0#21| 1) 0))))
      (a!6 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (< (+ |c:loop_example.c@53@F@main@i?1!0&0#21| 1) 5))))
      (a!7 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (>= (+ |c:loop_example.c@53@F@main@i?1!0&0#30| 1) 0))))
      (a!8 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (< (+ |c:loop_example.c@53@F@main@i?1!0&0#30| 1) 5))))
      (a!9 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (<= (select |c:loop_example.c@72@F@main@a?1!0&0#29| 0)
                       (select |c:loop_example.c@72@F@main@a?1!0&0#29| 1)))))
      (a!10 (=> true
                (=> |execution_statet::\\guard_exec?0!0|
                    (<= (select |c:loop_example.c@72@F@main@a?1!0&0#29| 1)
                        (select |c:loop_example.c@72@F@main@a?1!0&0#29| 2)))))
      (a!11 (=> true
                (=> |execution_statet::\\guard_exec?0!0|
                    (<= (select |c:loop_example.c@72@F@main@a?1!0&0#29| 2)
                        (select |c:loop_example.c@72@F@main@a?1!0&0#29| 3)))))
      (a!12 (=> true
                (=> |execution_statet::\\guard_exec?0!0|
                    (<= (select |c:loop_example.c@72@F@main@a?1!0&0#29| 3)
                        (select |c:loop_example.c@72@F@main@a?1!0&0#29| 4))))))
  (or (not a!1)
      (not a!2)
      (not a!3)
      (not a!4)
      (not a!5)
      (not a!6)
      (not a!7)
      (not a!8)
      (not a!9)
      (not a!10)
      (not a!11)
      (not a!12))))
