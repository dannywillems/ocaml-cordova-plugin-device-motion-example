let device_ready _ =
  let accelerometer = Accelerometer.accelerometer () in

  let succ : Accelerometer.cb_success =
    fun a ->
      let doc = Dom_html.document in
      let p = Dom_html.createP doc in
      p##.innerHTML := Js.string ("x: " ^ (string_of_int a##.x) ^ "\ny: " ^
      (string_of_int a##.y) ^ "\nz: " ^ (string_of_int a##.z));
      Dom.appendChild doc##.body p
  in

  let err : Accelerometer.cb_error =
    fun () -> Dom_html.window##(alert (Js.string "Error with accelerometer")) in

  let id = accelerometer##(watchAcceleration succ err
  (Accelerometer.create_options 1000)) in
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler device_ready) Js._false
  (*Dom_html.window##.onload := Dom_html.handler onload*)
