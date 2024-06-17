(* File automatically generated by Hacspec *)
Set Warnings "-notation-overridden,-ambiguous-paths".
From Crypt Require Import choice_type Package Prelude.
Import PackageNotation.
From extructures Require Import ord fset.
From mathcomp Require Import word_ssrZ word.
From Crypt Require Import jasmin_word.

From Coq Require Import ZArith.
From Coq Require Import Strings.String.
Import List.ListNotations.
Open Scope list_scope.
Open Scope Z_scope.
Open Scope bool_scope.

From Hacspec Require Import ChoiceEquality.
From Hacspec Require Import LocationUtility.
From Hacspec Require Import Hacspec_Lib_Comparable.
From Hacspec Require Import Hacspec_Lib_Pre.
From Hacspec Require Import Hacspec_Lib.

Open Scope hacspec_scope.
Import choice.Choice.Exports.

Obligation Tactic := (* try timeout 8 *) solve_ssprove_obligations.

From OVN Require Import Hacspec_ovn_Ovn_traits.
Export Hacspec_ovn_Ovn_traits.

Definition t_g_z_89_ : choice_type :=
  (int8).
Equations f_g_val (s : both t_g_z_89_) : both int8 :=
  f_g_val s  :=
    bind_both s (fun x =>
      solve_lift (ret_both (x : int8))) : both int8.
Fail Next Obligation.
Equations Build_t_g_z_89_ {f_g_val : both int8} : both (t_g_z_89_) :=
  Build_t_g_z_89_  :=
    bind_both f_g_val (fun f_g_val =>
      solve_lift (ret_both ((f_g_val) : (t_g_z_89_)))) : both (t_g_z_89_).
Fail Next Obligation.
Notation "'Build_t_g_z_89_' '[' x ']' '(' 'f_g_val' ':=' y ')'" := (Build_t_g_z_89_ (f_g_val := y)).

Definition t_z_89_ : choice_type :=
  (int8).
Equations f_z_val (s : both t_z_89_) : both int8 :=
  f_z_val s  :=
    bind_both s (fun x =>
      solve_lift (ret_both (x : int8))) : both int8.
Fail Next Obligation.
Equations Build_t_z_89_ {f_z_val : both int8} : both (t_z_89_) :=
  Build_t_z_89_  :=
    bind_both f_z_val (fun f_z_val =>
      solve_lift (ret_both ((f_z_val) : (t_z_89_)))) : both (t_z_89_).
Fail Next Obligation.
Notation "'Build_t_z_89_' '[' x ']' '(' 'f_z_val' ':=' y ')'" := (Build_t_z_89_ (f_z_val := y)).

Instance t_z_89_t_Copy : t_Copy t_z_89_. Admitted.
Instance t_z_89_t_PartialEq : t_PartialEq t_z_89_ t_z_89_. Admitted.
Instance t_z_89_t_Clone : t_Clone t_z_89_. Admitted.
Instance t_z_89_t_Serialize : t_Serialize t_z_89_. Admitted.

#[global] Program Instance t_z_89__t_Field : t_Field t_z_89_ :=
  let f_q := solve_lift (Build_t_z_89_ (f_z_val := ret_both (89 : int8))) : both t_z_89_ in
  let f_random_field_elem := fun  (random : both int32) => solve_lift (Build_t_z_89_ (f_z_val := (cast_int (WS2 := _) random) .% ((f_z_val f_q) .- (ret_both (1 : int8))))) : both t_z_89_ in
  let f_field_zero := solve_lift (Build_t_z_89_ (f_z_val := ret_both (0 : int8))) : both t_z_89_ in
  let f_field_one := solve_lift (Build_t_z_89_ (f_z_val := ret_both (1 : int8))) : both t_z_89_ in
  let f_add := fun  (x : both t_z_89_) (y : both t_z_89_) => letb q___ := (f_z_val f_q) .- (ret_both (1 : int8)) in
  letb x___ := (f_z_val x) .% q___ in
  letb y___ := (f_z_val y) .% q___ in
  solve_lift (Build_t_z_89_ (f_z_val := (x___ .+ y___) .% q___)) : both t_z_89_ in
  let f_opp := fun  (x : both t_z_89_) => letb q___ := (f_z_val f_q) .- (ret_both (1 : int8)) in
  letb x___ := (f_z_val x) .% q___ in
  solve_lift (Build_t_z_89_ (f_z_val := q___ .- x___)) : both t_z_89_ in
  let f_sub := fun  (x : both t_z_89_) (y : both t_z_89_) => solve_lift (f_add x (f_opp y)) : both t_z_89_ in
  let f_mul := fun  (x : both t_z_89_) (y : both t_z_89_) => letb q___ := (f_z_val f_q) .- (ret_both (1 : int8)) in
  letb (x___ : both int16) := cast_int (WS2 := _) ((f_z_val x) .% q___) in
  letb (y___ : both int16) := cast_int (WS2 := _) ((f_z_val y) .% q___) in
  solve_lift (Build_t_z_89_ (f_z_val := cast_int (WS2 := _) ((x___ .* y___) .% (cast_int (WS2 := _) q___)))) : both t_z_89_ in
  {| f_q := (@f_q);
  f_random_field_elem := (@f_random_field_elem);
  f_field_zero := (@f_field_zero);
  f_field_one := (@f_field_one);
  f_add := (@f_add);
  f_opp := (@f_opp);
  f_sub := (@f_sub);
  f_mul := (@f_mul)|}.
Fail Next Obligation.
Hint Unfold t_z_89__t_Field.

#[global] Program Instance t_g_z_89__t_Group : t_Group t_g_z_89_ :=
  let f_Z := t_z_89_ : choice_type in
  let f_g := solve_lift (Build_t_g_z_89_ (f_g_val := ret_both (3 : int8))) : both t_g_z_89_ in
  let f_hash := fun  (x : both (t_Vec t_g_z_89_ t_Global)) => letb res := f_field_one in
  letb res := foldi_both_list (f_into_iter x) (fun y =>
    ssp (fun res =>
      solve_lift (f_mul (Build_t_z_89_ (f_z_val := f_g_val y)) res) : (both t_z_89_))) res in
  solve_lift res : both t_z_89_ in
  let f_group_one := solve_lift (Build_t_g_z_89_ (f_g_val := ret_both (1 : int8))) : both t_g_z_89_ in
  let f_prod := fun  (x : both t_g_z_89_) (y : both t_g_z_89_) => letb q___ := f_z_val f_q in
  letb x___ := cast_int (WS2 := U16) ((f_g_val x) .% q___) in
  letb y___ := cast_int (WS2 := U16) ((f_g_val y) .% q___) in
  solve_lift (Build_t_g_z_89_ (f_g_val := cast_int (WS2 := U8) ((x___ .* y___) .% (cast_int (WS2 := U16) q___)))) : both t_g_z_89_ in
  let f_pow := fun  (g : both t_g_z_89_) (x : both t_z_89_) => letb result := f_group_one in
  letb result := foldi_both_list (f_into_iter (Build_t_Range (f_start := ret_both (0 : int8)) (f_end := (f_z_val x) .% ((f_z_val f_q) .- (ret_both (1 : int8)))))) (fun _ =>
    ssp (fun result =>
      solve_lift (f_prod result g) : (both t_g_z_89_))) result in
  solve_lift result : both t_g_z_89_ in
  let f_g_pow := fun  (x : both t_z_89_) => solve_lift (f_pow f_g x) : both t_g_z_89_ in
  let f_group_inv := fun  (x : both t_g_z_89_) => solve_lift (run (letb _ := foldi_both_list (f_into_iter (Build_t_Range (f_start := ret_both (0 : int8)) (f_end := ret_both (89 : int8)))) (fun j =>
    ssp (fun _ =>
      letb g_value := Build_t_g_z_89_ (f_g_val := j) in
      solve_lift (ifb (f_prod x g_value) =.? f_group_one
      then letm[choice_typeMonad.result_bind_code t_g_z_89_] hoist29 := v_Break g_value in
      ControlFlow_Continue (never_to_any hoist29)
      else ControlFlow_Continue (ret_both (tt : 'unit))) : (both _ (* (t_ControlFlow t_g_z_89_ 'unit) *)))) (Result_Ok (ret_both (tt : 'unit))) in
  (* letb _ := ifb not (ret_both (false : 'bool)) *)
  (* then never_to_any _ (* (panic (ret_both (assertion failed: false : chString))) *) *)
  (* else ret_both (tt : 'unit) in *)
  letm[choice_typeMonad.result_bind_code t_g_z_89_] hoist30 := v_Break x in
  ControlFlow_Continue (never_to_any hoist30))) : both t_g_z_89_ in
  let f_div := fun  (x : both t_g_z_89_) (y : both t_g_z_89_) => solve_lift (f_prod x (f_group_inv y)) : both t_g_z_89_ in
  {| f_Z := (@f_Z);
  f_g := (@f_g);
  f_hash := (@f_hash);
  f_g_pow := (@f_g_pow);
  f_pow := (@f_pow);
  f_group_one := (@f_group_one);
  f_prod := (@f_prod);
  f_group_inv := (@f_group_inv);
  f_div := (@f_div)|}.
Fail Next Obligation.
Hint Unfold t_g_z_89__t_Group.
