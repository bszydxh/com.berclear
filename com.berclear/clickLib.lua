require "import"
import "functionLib"
--监听音量
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_VOLUME_UP") ~= nil then
    soti_start()
     wm=activity.getApplicationContext().getSystemService(Context.WINDOW_SERVICE);
    wm.removeView(v);
  end
  if string.find(tostring(event),"KEYCODE_VOLUME_DOWN") ~= nil then
    soti_start()
  end

end