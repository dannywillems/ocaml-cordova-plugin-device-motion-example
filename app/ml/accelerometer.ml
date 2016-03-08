(* Class representing sent data by the accelerometer *)
class type _Acceleration =
  object
    method x : int Js.readonly_prop
    method y : int Js.readonly_prop
    method z : int Js.readonly_prop
    method timestamp : Js.date Js.t
  end

type id = int
type cb_success = _Acceleration Js.t -> unit
type cb_error = unit -> unit

type options = < frequency : int Js.readonly_prop > Js.t

class type accelerometer =
  object
    method getCurrentAcceleration :
      cb_success  ->
      cb_error    ->
      unit Js.meth
    method watchAcceleration :
      cb_success  ->
      cb_error    ->
      options     ->
      id Js.meth
    method clearWatch : id -> unit Js.meth
  end

let create_options freq =
  object%js
    val frequency = freq
  end
