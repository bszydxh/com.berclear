require "import"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "android.graphics.*"
import "android.widget.TextView"
import "android.view.WindowManager"
import "android.content.Context"
import "android.view.KeyEvent"
import "android.widget.LinearLayout"
import "android.R$id"
import "java.lang.Runtime"
import "android.R$layout"
import "android.graphics.PixelFormat"
import "android.R$menu"
import "android.widget.*"
import "android.view.*"

import "android.content.Context"
import "android.media.MediaPlayer"
import "android.media.AudioManager"
import "android.content.pm.ActivityInfo"
import "android.content.*"
import "android.content.Intent"
import "android.content.IntentFilter"

activity.setTheme(android.R.style.Theme_DeviceDefault_Light)--设置主题

function yy()
  activity.getSystemService(Context.AUDIO_SERVICE).setStreamVolume(AudioManager.STREAM_MUSIC, 15, AudioManager.FLAG_SHOW_UI) 
  activity.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE) -- 隐藏navbar
end



mediaPlayer = MediaPlayer()
mediaPlayer.reset()        --链接过期了自己换↓（注意！链接一过期整个工程就废了！）
mediaPlayer.setDataSource("https://aimg8.dlssyht.cn/u/2077545/ueditor/video/1039/2077545/1608993673724452.mp3")--音乐直连
mediaPlayer.prepare()
mediaPlayer.setLooping(true)--循环true--不循环false
mediaPlayer.isPlaying()
task(1000,function()
end)


function dd()
  --调用主线程函数
  require "import"
  --Thread.sleep(1000)--延迟1000毫秒
  while( true ) do
    Thread.sleep(10)--延迟1000毫秒
    call("yy")
  end
end

thread(dd)

function onKeyDown(A0_0, A1_1) -- 监听按键，不调用外部方法的话就相当于劫持下来了
  if string.find(tostring(A1_1), "KEYCODE_BACK") ~= nil then -- 如果按键是返回键
    activity.getSystemService(Context.AUDIO_SERVICE).setStreamVolume(AudioManager.STREAM_MUSIC, 15, AudioManager.FLAG_SHOW_UI) -- 设置音量为最大
  end -- 相当于把返回键变成了音量最大键
  return true
end 

mediaPlayer.start()


layout=
  {
    LinearLayout;
    layout_height="100%h";
    layout_width='100%h';
    background="#00000000";
    gravity="center";
    id="tv";
  };

--[[function onCreateOptionsMenu(menu)
  menu.add("关于")
  menu.add("复制文本")
  menu.add("粘贴到编辑框")
  menu.add("退出")

end]]--

--[[function click(v)
  lp.x=100
  lp.y=100
  wm.updateViewLayout(tv,lp)
  
  Runtime.getRuntime().exec("input keyevent " .. KeyEvent.KEYCODE_MENU )

  print("已移除悬浮窗")
end]]--

wm=activity.getApplicationContext().getSystemService(Context.WINDOW_SERVICE);
lp=WindowManager.LayoutParams()

lp.format = PixelFormat.RGBA_8888
lp.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
lp.type=WindowManager.LayoutParams.TYPE_PHONE

--lp.width=WindowManager.LayoutParams.WRAP_CONTENT
--lp.height=WindowManager.LayoutParams.WRAP_CONTENT
wm.addView(loadlayout(layout),lp)
