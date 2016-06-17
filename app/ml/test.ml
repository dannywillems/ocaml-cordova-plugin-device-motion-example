let on_device_ready _ =
  let succ =
    fun a ->
      let doc = Dom_html.document in
      let p = Dom_html.createP doc in
      let x_val = Cordova_accelerometer.acceleration_x a in
      let y_val = Cordova_accelerometer.acceleration_y a in
      let z_val = Cordova_accelerometer.acceleration_z a in
      p##.innerHTML := Js.string ("x: " ^ (string_of_int x_val) ^ "\ny: " ^
      (string_of_int y_val) ^ "\nz: " ^ (string_of_int z_val));
      Dom.appendChild doc##.body p
  in

  let err =
    fun () -> Jsoo_lib.alert "Error with accelerometer"
  in

  let id = Cordova_accelerometer.watch_acceleration succ err
  (Cordova_accelerometer.create_options ()) in
  ()

let _ = Cordova.Event.device_ready on_device_ready
