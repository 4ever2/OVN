(* File automatically generated by Hacspec *)
Set Warnings "-notation-overridden,-ambiguous-paths".
From SSProve.Crypt Require Import choice_type Package Prelude.
Import PackageNotation.
From extructures Require Import ord fset.
From mathcomp Require Import word_ssrZ word.
(* From Jasmin Require Import word. *)

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


Class t_Field (v_Self : _) `{ t_Copy v_Self} `{ t_PartialEq v_Self v_Self} `{ t_Eq v_Self} `{ t_Clone v_Self} `{ t_Serialize v_Self} := {
  f_q : (both v_Self) ;
  f_random_field_elem : (both int32 -> both v_Self) ;
  f_field_zero : (both v_Self) ;
  f_field_one : (both v_Self) ;
  f_add : (both v_Self -> both v_Self -> both v_Self) ;
  f_opp : (both v_Self -> both v_Self) ;
  f_mul : (both v_Self -> both v_Self -> both v_Self) ;
  f_inv : (both v_Self -> both v_Self) ;
}.

Class t_Group (v_Self : _) `{ t_Copy v_Self} `{ t_PartialEq v_Self v_Self} `{ t_Eq v_Self} `{ t_Clone v_Self} `{ t_Serialize v_Self} := {
  f_Z : choice_type ;
  f_Z_t_Field :> (t_Field f_Z) ;
  f_Z_t_Serialize :> (t_Serialize f_Z) ;
  f_Z_t_Deserial :> (t_Deserial f_Z) ;
  f_Z_t_Serial :> (t_Serial f_Z) ;
  f_Z_t_Clone :> (t_Clone f_Z) ;
  f_Z_t_Eq :> (t_Eq f_Z) ;
  f_Z_t_PartialEq :> (t_PartialEq f_Z f_Z) ;
  f_Z_t_Copy :> (t_Copy f_Z) ;
  f_Z_t_Sized :> (t_Sized f_Z) ;
  f_g : (both v_Self) ;
  f_g_pow : (both f_Z -> both v_Self) ;
  f_pow : (both v_Self -> both f_Z -> both v_Self) ;
  f_group_one : (both v_Self) ;
  f_prod : (both v_Self -> both v_Self -> both v_Self) ;
  f_group_inv : (both v_Self -> both v_Self) ;
  f_hash : (both (t_Vec v_Self t_Global) -> both f_Z) ;
}.
