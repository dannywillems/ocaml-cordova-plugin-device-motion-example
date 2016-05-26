let on_device_ready _ =
  let accelerometer = Cordova_accelerometer.t () in

  let succ =
    fun a ->
      let doc = Dom_html.document in
      let p = Dom_html.createP doc in
      p##.innerHTML := Js.string ("x: " ^ (string_of_int a#x) ^ "\ny: " ^
      (string_of_int a#y) ^ "\nz: " ^ (string_of_int a#z));
      Dom.appendChild doc##.body p
  in

  let err =
    fun () -> Jsoo_lib.alert "Error with accelerometer"
  in

  let id = accelerometer#watch_acceleration succ err
  (Cordova_accelerometer.create_options ()) in
  ()

let _ = Cordova.Event.device_ready on_device_ready
