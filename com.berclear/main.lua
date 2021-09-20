require"import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.media.MediaPlayer"
import "android.view.*"
import "android.content.pm.ActivityInfo"
import "android.content.*"
import "android.content.Intent"
import "android.content.pm.PackageManager"
import "android.net.ConnectivityManager"
import 'android.webkit.WebView'
import "android.net.Uri"
import "android.text.Layout"
import "android.provider.Settings"
import "android.graphics.*"
import "functionLib"--函数库
import "cjson"
function Lib()--语法辅助填充方便,禁止执行!!!
  function read_sys() end
  function toast() end
  function change_sys(name,change_to) end
  function read_sys_all() end--返回数组注意解析
  function restart_sys(read) end
  function is_vertical() end
end

--activity.setTheme(android.R.style.Theme_DeviceDefault_Light)--设置主题
activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_USER);
--activity.ActionBar.hide()

--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN);
--activity.getWindow().addFlags(WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT);

activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
--activity.getWindow().setFlags(1,WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED);
--这个需要系统SDK21以上才能用
if Build.VERSION.SDK_INT >= 21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
end
--这个需要系统SDK19以上才能用
if Build.VERSION.SDK_INT >= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end
function hide()
  activity.getDecorView().setSystemUiVisibility(
  View.SYSTEM_UI_FLAG_LAYOUT_STABLE
  | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
  | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
  | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
  --| View.SYSTEM_UI_FLAG_FULLSCREEN
  | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
end
hide()


function onConfigurationChanged(config)
  --这个函数不是自定义的，屏幕旋转系统会调用这个的
  if is_vertical()==true then
    --toast("竖屏")--竖屏
    t_long_timer.stop()
    t_timer.stop()
    --   horizontal_image.setVisibility(View.GONE)
    -- horizontal_image.recycle();
    --   horizontal_image.refreshDrawableState();

    activity.recreate()


   else--info=land
    --toast("横屏")--横屏
    t_long_timer.stop()
    t_timer.stop()

    -- vertical_image.setVisibility(View.GONE)
    --  vertical_image.refreshDrawableState();
    activity.recreate()


  end
end

--[[if is_vertical()==true then
  --toast("竖屏")--竖屏
  activity.setContentView(loadlayout("layout_vertical"))

 else--info=land
  --toast("横屏")--横屏
  activity.setContentView(loadlayout("layout_horizontal"))

end]]--
activity.setContentView(loadlayout("layout_vertical"))
--[[裁缝/作者:bszydxh qq:2733879291]]--
--[[控件列表id (从上至下)
cw宠物
asp3 asp分 asp2秒{被屏蔽了!太烦}
date日期
b"距离高考仅剩"
last天数 t"天"
hou min sec 剩余..精确到秒
bszydxh 名言
xh手机型号             yun运营商
azbb安卓版本           hitokoto一言
dianliang电量         wl网络状态
dianya电压
dianwen电温
]]--

--[[侧滑栏id列表
off     改布局
reload  重新加载
rew     重写布局
ding    钉钉机器人
music   音乐
warning 病毒
rimet   打开钉钉
soti    打开小猿搜题
zuoye   作业单
bzy     白噪音
sjzt    手机状态


]]--
--[[以下是函数(控件+t)
保存在本地ber.sys
下面初始化

lastt=0
bszydxht=0
aspt=0
datet=0
bt=0
hout=0
xht=0
yunt=0
nett=0
hitokotot=0
dianyat=0
dianwen=0
dianliang=0
azbbt=0
]]--




--img="#FF000000"
--ber.sys附属创建.不属于任何函数
if file_exists(activity.getLuaDir().."/ber.sys")==false
  then
  io.open(activity.getLuaDir().."/ber.sys",'w')
  import "java.io.File"--导入File类
  File(activity.getLuaDir()).mkdir()
  toast("欢迎!初始化系统中")
  cwt=0
  lastt=0
  bszydxht=0
  aspt=0
  datet=0
  bt=0
  hout=0
  xht=0
  yunt=0

  hitokotot=0
  dianyat=0
  dianwent=0
  dianliangt=0
  azbbt=0
  img=0
  dateS=1623027600
  io.open(activity.getLuaDir().."/ber.sys","w"):write([[ {
		"last": "]]..lastt..[[",
        "cw":"]]..cwt..[[",
		"bszydxh": "]]..bszydxht..[[",
  		"asp": "]]..aspt..[[",
		"date": "]]..datet..[[",
  		"b": "]]..bt..[[",
		"hou": "]]..hout..[[",
        "xh": "]]..xht..[[",
		"yun": "]]..yunt..[[",
		"hitokoto": "]]..hitokotot..[[",
  		"dianya": "]]..dianyat..[[",
		"dianwen": "]]..dianwent..[[",
        "dianliang": "]]..dianliangt..[[",
		"azbb": "]]..azbbt..[[",
        "imgBack":"#FF000000",
        "dateS":"]]..dateS..[["
        
	}]]):close()
end
--读取
function read()--本地ber.sys东西全读过来
  JSON = import "cjson"
  --json字符串
  
   json_str="["..io.open(activity.getLuaDir().."/ber.sys"):read("*a").."]"
  --解析json
  yyyt=JSON.decode(json_str)
  -- print(dump(yyyt))--打印table(debug)

  --遍历打印table
  for i,vrt in ipairs(yyyt) do
    cwt=vrt.cw
    lastt=vrt.last
    bszydxht=vrt.bszydxh
    aspt=vrt.asp
    datet=vrt.date
    bt=vrt.b
    hout=vrt.hou
    xht=vrt.xh
    yunt=vrt.yun
    hitokotot=vrt.hitokoto
    dianyat=vrt.dianya
    dianwent=vrt.dianwen
    dianliangt=vrt.dianliang
    azbbt=vrt.azbb
    img=vrt.imgBack
    dateS=vrt.dateS
  end
end
function save()--保存
  
  io.open(activity.getLuaDir().."/ber.sys","w"):write([[ {
        "cw":"]]..cwt..[[",
		"last": "]]..lastt..[[",
		"bszydxh": "]]..bszydxht..[[",
  		"asp": "]]..aspt..[[",
		"date": "]]..datet..[[",
  		"b": "]]..bt..[[",
		"hou": "]]..hout..[[",
        "xh": "]]..xht..[[",
		"yun": "]]..yunt..[[",
  	
		"hitokoto": "]]..hitokotot..[[",
  		"dianya": "]]..dianyat..[[",
		"dianwen": "]]..dianwent..[[",
        "dianliang": "]]..dianliangt..[[",
		"azbb": "]]..azbbt..[[",
        "imgBack":"]]..img..[[",
         "dateS":"]]..dateS..[["
	}]]):close()
end
--重载布局
function rebj()
  asp.setVisibility(View.VISIBLE)
  --  asp2.setVisibility(View.VISIBLE)
  --  asp3.setVisibility(View.VISIBLE)
  date_1.setVisibility(View.VISIBLE)
  b.setVisibility(View.VISIBLE)
  last.setVisibility(View.VISIBLE)
  t.setVisibility(View.VISIBLE)
  hou.setVisibility(View.VISIBLE)
  min.setVisibility(View.VISIBLE)
  sec.setVisibility(View.VISIBLE)
  bszydxh.setVisibility(View.VISIBLE)
  xh.setVisibility(View.VISIBLE)
  wl.setVisibility(View.VISIBLE)
  azbb.setVisibility(View.VISIBLE)
  dianya.setVisibility(View.VISIBLE)
  dianliang.setVisibility(View.VISIBLE)
  dianwen.setVisibility(View.VISIBLE)
  hitokoto.setVisibility(View.VISIBLE)
  yun.setVisibility(View.VISIBLE)
  last.parent.setVisibility(View.VISIBLE)
  hou.parent.setVisibility(View.VISIBLE)
  asp.parent.setVisibility(View.VISIBLE)
  cw.setVisibility(View.VISIBLE)
  if tonumber(lastt)==1 then
    last.parent.setVisibility(View.GONE)
  end
  if tonumber(cwt)==1 then
    cw.setVisibility(View.GONE)
  end
  if tonumber(bszydxht)==1 then
    bszydxh.setVisibility(View.GONE)
  end
  if tonumber(aspt)==1 then
    asp.parent.setVisibility(View.GONE)
  end
  if tonumber(datet)==1 then
    date_1.setVisibility(View.GONE)
  end
  if tonumber(bt)==1 then
    b.setVisibility(View.GONE)
  end
  if tonumber(hout)==1 then
    hou.parent.setVisibility(View.GONE)
  end
  if tonumber(xht)==1 then
    xh.setVisibility(View.GONE)
  end
  if tonumber(yunt)==1 then
    yun.setVisibility(View.GONE)
  end
  if tonumber(hitokotot)==1 then
    hitokoto.setVisibility(View.GONE)
  end
  if tonumber(dianyat)==1 then
    dianya.setVisibility(View.GONE)
  end
  if tonumber(dianwent)==1 then
    dianwen.setVisibility(View.GONE)
  end
  if tonumber(dianliangt)==1 then
    dianliang.setVisibility(View.GONE)
  end
  if tonumber(azbbt)==1 then
    azbb.setVisibility(View.GONE)
  end

end
read()--开头先读一次
--activity.setContentView(loadlayout("layout_vertical"))--将布局添加至窗口
rebj()
--import "clickLib"--点击库



function po()
  import "android.content.Intent"
  import "android.content.IntentFilter"
  local BatteryT = 0
  local BatteryN = 0
  local BatteryV = 0

  batteryInfoIntent =activity.getApplicationContext().registerReceiver( null ,
  IntentFilter(Intent.ACTION_BATTERY_CHANGED ) ) ;
  BatteryN = batteryInfoIntent.getIntExtra( "level" , 0);--//电量（0-100）
  BatteryV = batteryInfoIntent.getIntExtra("voltage", 0); --//电池电压
  BatteryT = batteryInfoIntent.getIntExtra("temperature", 0); --//电池温度
  dianliang.setText("手机电量: "..BatteryN.."%")
  dianwen.setText("电池温度: "..(BatteryT*0.1).."℃")
  dianya.setText("电池电压: "..BatteryV.."mV")

end
function zyzy()
  JSON = import "cjson"
  --json字符串
  json_str="["..io.open(activity.getLuaDir().."/"..os.date("%Y-%m-%d")..".zy"):read("*a").."]"

  --解析json
  yyy=JSON.decode(json_str)

  --打印table(debug)
  --  print(dump(yyy))

  --遍历打印table
  for i,vr in ipairs(yyy) do
    sx.setText("数学:"..vr.数学)
    yw.setText("语文:"..vr.语文)
    yy.setText("英语:"..vr.英语)
    wl.setText("物理:"..vr.物理)
    hx.setText("化学:"..vr.化学)
    sw.setText("生物:"..vr.生物)
  end
end
--分割线
import "android.content.Context"
运营商名称 = this.getSystemService(Context.TELEPHONY_SERVICE).getNetworkOperatorName()
yun.setText("运营商: "..运营商名称)
--添加权限   READ_PHONE_STATE
--分割线  网络
--[[manager = activity.getSystemService(Context.CONNECTIVITY_SERVICE);
gprs = manager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE).getState();
if tostring(gprs)== "CONNECTED" then
  net.Text="网络状态: ".."移动数据"
end
connManager = activity.getSystemService(Context.CONNECTIVITY_SERVICE)
mWifi = connManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
if tostring(mWifi):find("none)") then
  --未连接
 else
  --连接
  net.Text="网络状态: ".."WiFi"
end]]--
device_model = Build.MODEL
version_xtbb = Build.VERSION.RELEASE
xh.setText("手机型号: "..Build.MODEL)
azbb.setText("安卓版本: "..Build.VERSION.RELEASE)
d=0
hourl=0
minutel=0
secondl=0
sec_y=sec.getY()
function mb()
  local day =0
  local hour = 0
  local second = 0
  local minute = 0
  local hourSec =0
  local minuteSec=0
  --dateSec=exec("date +%s")
  local dateSec=os.time()
  local dateTarget=read_sys("dateS")
  local dateLast=dateTarget-dateSec
  local past=false
  if dateLast<=0 then
    dateLast=0-dateLast
    past=true
  end
  hourSec=dateLast % 86400
  minuteSec=hourSec % 3600
  second=minuteSec % 60
  day=dateLast-hourSec
  day=day/86400
  hour=hourSec-minuteSec
  hour=hour/3600
  minute=minuteSec-second
  minute=minute/60
  --懒得改了就这样吧(补位占位)

  if hour <= 9 then

    hou.setText("0"..string.format("%u",hour).."时")
    hourl="0"..string.format("%u",hour).."时"

   else
    hou.setText(string.format("%u",hour).."时")
    hourl=string.format("%u",hour).."时"

  end
  if minute <= 9 then
    min.setText("0"..string.format("%u",minute).."分")
    minutel="0"..string.format("%u",minute).."分"
   else
    min.setText(string.format("%u",minute).."分")
    minutel=string.format("%u",minute).."分"
  end
  if second <= 9 then
    sec.setText("0"..string.format("%u",second).."")
    secondl="0"..string.format("%u",second).."秒"
   else
    sec.setText(string.format("%u",second).."")
    secondl=string.format("%u",second).."秒"
  end
  dayl=string.format("%u",tostring(day)).."天"
  last.setText(string.format("%u",day))
  asp.setText(os.date("%H:%M"))
  
 if is_vertical()==true then
  asp_2.setText(os.date("%H:%M:%S"))
  --本地时间总和..高考倒计时

end 
--xpcall(function i() asp_2_set() end)
  --dayl..hourl..minutel..secondl剩余时间输出,其余均做本地变量处理
end
function date_update()
  date_1.setText(os.date("%Y年%m月%d日   %A"))
  if is_vertical()==true then
  date_2.setText(os.date("%Y年%m月%d日   %A")) end
end
function sec_animation()
  import "android.animation.ObjectAnimator"
  import "android.view.animation.Animation"
  import "android.view.animation.*"
  local dateSec=os.time()
  local dateTarget=read_sys("dateS")
  local dateLast=dateTarget-dateSec
  local past=false
  if dateLast<=0 then
    dateLast=0-dateLast
    past=true
  end
  if past==true then translating_animation= ObjectAnimator.ofFloat(sec, "Y",{sec_y-130,sec_y+130 })
 else translating_animation= ObjectAnimator.ofFloat(sec, "Y",{sec_y+130,sec_y-130 }) end
  --translating_animation.setRepeatCount(1)--设置动画重复次数，这里-1代表无限
  translating_animation.setRepeatMode(Animation.RESTART)--循环模式
  translating_animation.setInterpolator(AccelerateDecelerateInterpolator())--设置插值器
  translating_animation.setDuration(1000)--设置动画时间
  translating_animation.setRepeatCount(-1)
end
function notice()
  local day =0
  local hour = 0
  local second = 0
  local minute = 0
  local hourSec =0
  local minuteSec=0
  --dateSec=exec("date +%s")
  local dateSec=os.time()
  local dateTarget=read_sys("dateS")
  local dateLast=dateTarget-dateSec
  local past=false
  if dateLast<=0 then
    dateLast=0-dateLast
    past=true
  end
  hourSec=dateLast % 86400
  minuteSec=hourSec % 3600
  second=minuteSec % 60
  day=dateLast-hourSec
  day=day/86400
  hour=hourSec-minuteSec
  hour=hour/3600
  minute=minuteSec-second
  minute=minute/60
  --懒得改了就这样吧(补位占位)

  if hour <= 9 then
    hourl="0"..string.format("%u",hour).."时"
   else
    hourl=string.format("%u",hour).."时"
  end
  if minute <= 9 then
    minutel="0"..string.format("%u",minute).."分"
   else
    minutel=string.format("%u",minute).."分"
  end
  if second <= 9 then
    secondl="0"..string.format("%u",second).."秒"
   else
    secondl=string.format("%u",second).."秒"
  end
  dayl=string.format("%u",tostring(day)).."天"
  --本地时间总和..高考倒计时

  mBuilder = Notification.Builder(this,channel);
  mBuilder.setSmallIcon(R.drawable.icon)--设置图标
  mBuilder.setContentTitle(read_sys("notice"));--大标
  mBuilder.setContentText(dayl..hourl..minutel..secondl);--小标
  mBuilder.setAutoCancel(false);--设置这个标志当用户单击面板就可以让通知将自动取消
  --  mBuilder.setDefaults( Notification.DEFAULT_SOUND | Notification.DEFAULT_VIBRATE) --使用默认震动
  notificationManager =activity.getSystemService(Context.NOTIFICATION_SERVICE)
  --notificationIntent =Intent(Intent.ACTION_VIEW, Uri.parse("http://bszydxh.web.zhanhi.com/wap_bszydxh.html"))
  --pendingIntent = PendingIntent.getActivity(activity.getApplicationContext(), 0, notificationIntent, Intent.FLAG_ACTIVITY_NEW_TASK);
  --mBuilder.setContentIntent(pendingIntent).setAutoCancel(false)

  --intent.setClassName("com.fenbi.android.solar","com.fenbi.android.solar.activity.MultiPurposeCameraActivity")-

  notificationIntent =Intent()
  notificationIntent.setClassName("com.berclear.com","com.androlua.Main")
  notificationIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
  pendingIntent = PendingIntent.getActivity(activity.getApplicationContext(), 0, notificationIntent, Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
  mBuilder.setContentIntent(pendingIntent).setAutoCancel(false)

  mBuilder.setOngoing(true)--ture，设置他为一
  mBuilder.setPriority(Notification.PRIORITY_LOW)
  --设置该通知优先级
  notificationManager.notify(1, mBuilder.build()) --发送通知
end
--https://v1.hitokoto.cn/?encode=text&c=i
function yyd()
  Http.get("https://v1.hitokoto.cn/?encode=text&c=i",nil,nil,nil,
  function(Stat,Content)
    -- 一言 (Hitokoto) 请求端口，示例用
    if Stat == 200 then
      local Hitokoto = Content
      bszydxh.setText(Hitokoto)
      if is_vertical()==true then
      bszydxh_2.setText(Hitokoto) end
      -- 回复成功，复制函数内部值
     else
      Hitokoto = "用代码表达言语的魅力，用代码书写山河的壮丽。"
      -- 回复失败，载入默认一言
    end
  end)
  return tostring(Hitokoto)
end

function ber()
  --后台发送短信
  local tm = os.date("%H:%M:%S")
  local header = {}
  local header={["Content-Type"]= [[application/json]],}
  local dat =[[{"msgtype":"text","text":{"content":"]]..tm..[["}}]]
  local url = "https://oapi.dingtalk.com/robot/send?access_token=9db4d9fd558fd1bd70d8a5f1e7a79c6a185ff4529724e13f7ad50d56bd10bb45"
  --Http.setUserAgent("Mozilla/5.0 (Linux; Android 6.0.1; OPPO R9s Plus Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36")
  Http.setHeader(nil)
  Http.post(url,dat,nil,nil,header,function(Stat,Content)
    if Stat == 200 then
      aks = 1
      -- 回复成功，复制函数内部值
     else
      ert = 1
      -- 回复失败，载入默认一言
    end
  end)

end

if is_vertical()==true then
  --[[  --toast("竖屏")--竖屏
    local draw=nil
     draw=vertical_image.getDrawable()
    toast(vertical_image)
   if draw ~= nil then    
    local bit=nil
    bit=draw.getBitmap()
    --b.recycle()
    --bit=nil
  --   bitmap_v=loadbitmap(bit)
     vertical_image.setImageBitmap(bit)
     else]]--
  bitmap_v=loadbitmap(read_sys("img"))
  vertical_image.setImageBitmap(nil)
  vertical_image.setImageBitmap(bitmap_v)

  --end
 else--info=land
  --toast("横屏")--横屏

  bitmap_h=loadbitmap(read_sys("img_2"))
  horizontal_image.setImageBitmap(nil)
  horizontal_image.setImageBitmap(bitmap_h)

end
--[[sec_animation()--卡顿___
  translating_animation.start()--开始动画]]--
--change_sys("stop","0")
function onResume()

  notice()
  --toast(collectgarbage("count"))
  --collectgarbage("collect")
  mb()
  date_update()

  yyd()--电量监控
  po()
  zyzy()

  if t_timer==nil then
    --线程函数----------------------------------
    t_timer=Ticker()
    t_timer.Period=1000
    t_timer.onTick=function()
      mb()
      date_update()
    end
  end
  if t_long_timer==nil then
    --启动Ticker定时器
    t_long_timer=Ticker()
    t_long_timer.Period=20000
    t_long_timer.onTick=function()
      yyd()--电量监控
      po()
      zyzy()
    end
  end
  t_long_timer.start()
  t_timer.start()

end
function ap()
  --调用主线程函数
  require "import"
  while(true) do
    call("notice")
    Thread.sleep(1000)--延迟1000毫秒
  end
end


thread(ap)
--[[function dd()
  --调用主线程函数
  require "import"
  --Thread.sleep(1000)--延迟1000毫秒
  while( true ) do
    call("yyd")
    call("po")--电量监控
    call("zyzy")--作业
    -- call("hello")
    
    Thread.sleep(20000)--延迟1000毫秒
  end
end

thread(dd)]]--

--[[function py()
  --调用主线程函数
  require "import"
  --Thread.sleep(1000)--延迟1000毫秒
  while( true ) do
   
    call("zyzy")
    --call("ber")
    Thread.sleep(60000)--延迟60000毫秒
  end
end]]

--[[---------------------线程---------------------]]--
on = 0
function reload.onClick()
  --事件
  toast("布局已重置")
  asp.setVisibility(View.VISIBLE)
  --  asp2.setVisibility(View.VISIBLE)
  --  asp3.setVisibility(View.VISIBLE)
  date_1.setVisibility(View.VISIBLE)
  b.setVisibility(View.VISIBLE)
  last.setVisibility(View.VISIBLE)
  t.setVisibility(View.VISIBLE)
  hou.setVisibility(View.VISIBLE)
  min.setVisibility(View.VISIBLE)
  sec.setVisibility(View.VISIBLE)
  bszydxh.setVisibility(View.VISIBLE)
  xh.setVisibility(View.VISIBLE)
  wl.setVisibility(View.VISIBLE)
  azbb.setVisibility(View.VISIBLE)
  dianya.setVisibility(View.VISIBLE)
  dianliang.setVisibility(View.VISIBLE)
  dianwen.setVisibility(View.VISIBLE)
  hitokoto.setVisibility(View.VISIBLE)
  yun.setVisibility(View.VISIBLE)
  last.parent.setVisibility(View.VISIBLE)
  hou.parent.setVisibility(View.VISIBLE)
  asp.parent.setVisibility(View.VISIBLE)
  cw.setVisibility(View.VISIBLE)
  lastt=0
  bszydxht=0
  aspt=0
  datet=0
  bt=0
  hout=0
  xht=0
  yunt=0
  nett=0
  hitokotot=0
  dianyat=0
  dianwent=0
  dianliangt=0
  azbbt=0
  cwt=0
end

function cw.onClick()
  --事件
  if on==1 then
    cw.setVisibility(View.GONE)
    cwt=1
  end

end
function last.onClick()
  --事件
  if on==1 then
    last.parent.setVisibility(View.GONE)
    lastt=1
  end
  main.openDrawer(3)
end
function t.onClick()
  --事件
  if on==1 then
    last.parent.setVisibility(View.GONE)
    latt=1
  end
end
function bszydxh.onClick()
  if on==1 then
    --事件
    bszydxh.setVisibility(View.GONE)
    bszydxht=1
  end
end
function asp.onClick()
  if on==1 then
    --事件
    asp.parent.setVisibility(View.GONE)
    aspt=1
  end
end
--[[function asp2.onClick()
  if on==1 then
    --事件
    asp2.setVisibility(View.GONE)
  end
end
function asp3.onClick()
  if on==1 then
    --事件
    asp3.setVisibility(View.GONE)
  end
end]]--
function date_1.onClick()
  if on==1 then
    --事件
    date_1.setVisibility(View.GONE)
    datet=1
  end
end
function b.onClick()
  if on==1 then
    --事件
    b.setVisibility(View.GONE)
    bt=1
  end

end
function hou.onClick()
  if on==1 then
    --事件
    hou.parent.setVisibility(View.GONE)
    hout=1
  end
end
function xh.onClick()
  if on==1 then
    --事件
    xh.setVisibility(View.GONE)
    xht=1
  end
end
function min.onClick()
  if on==1 then
    --事件
    hou.parent.setVisibility(View.GONE)
    hout=1
  end
end
function sec.onClick()
  if on==1 then
    --事件
    hou.parent.setVisibility(View.GONE)
    hout=1
  end
end
function yun.onClick()
  if on==1 then
    --事件
    yun.setVisibility(View.GONE)
    yunt=1
  end
end

function hitokoto.onClick()
  if on==1 then
    --事件
    hitokoto.setVisibility(View.GONE)
    hitokotot=1
  end
end
function dianya.onClick()
  if on==1 then
    --事件
    dianya.setVisibility(View.GONE)
    dianyat=1
  end
end
function dianliang.onClick()
  if on==1 then
    --事件
    dianliang.setVisibility(View.GONE)
    dianliangt=1
  end
end
function dianwen.onClick()
  if on==1 then
    --事件
    dianwen.setVisibility(View.GONE)
    dianwent=1
  end
end
function azbb.onClick()
  if on==1 then
    --事件
    azbb.setVisibility(View.GONE)
    azbbt=1
  end
end
function last.onLongClick()
  if on~=1 then
    soti_start()
    --activity.finish()
  end
end
function t.onLongClick()
  if on~=1 then
    soti_start()
    --activity.finish()
  end
end
function asp.onLongClick()
  if on~=1 then
    
    packageName= "cc.forestapp"
    manager = activity.getPackageManager()
    open = manager.getLaunchIntentForPackage(packageName)
    this.startActivity(open)
  end
end
function dianliang.onLongClick()
  toast("已锁止")
  layoutr=
  {
    LinearLayout;
    layout_height="100%h";
    layout_width='100%h';
    background="#00000000";
    gravity="center";
    id="tv";
  };
  wm=activity.getApplicationContext().getSystemService(Context.WINDOW_SERVICE);
  lp=WindowManager.LayoutParams()

  lp.format = PixelFormat.RGBA_8888
  lp.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
  lp.type=WindowManager.LayoutParams.TYPE_PHONE

  --lp.width=WindowManager.LayoutParams.WRAP_CONTENT
  --lp.height=WindowManager.LayoutParams.WRAP_CONTENT
  wm.addView(loadlayout(layoutr),lp)
end


--[[------------------以下侧滑----------------]]--




function offc.onClick()
  if on == 0 then
    on = 1
    off.setText("布局锁定")
    toast("布局已解锁")

   elseif on == 1 then
    on = 0

    off.setText("布局解锁")
    toast("布局已锁定")
  end
end
ssr = 1

function sjzt.onClick()
  local intent= Intent(Intent.ACTION_PICK)
  -- intent.setData(MediaStore.Images.Media.EXTERNAL_CONTENT_URI)

  intent.setType("image/*")
  this.startActivityForResult(intent,1)
  -------

  --回调
  local fileSrc=0
  function onActivityResult(requestCode,resultCode,intent)
    if intent then
      local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
      cursor.moveToFirst()
      import "android.provider.MediaStore"
      local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
      local fileSrc = cursor.getString(idx)

      --fileSrc回调路径路径

      --Toast.makeText(activity,fileSrc,Toast.LENGTH_SHORT).show()
      if is_vertical()==true then
        change_sys("img",fileSrc)
       else change_sys("img_2",fileSrc)
      end
      activity.recreate()
      toast("保存成功")

    end
  end
end
function sjzt.onLongClick()
  if is_vertical()==true then
    read_me=read_sys("img")
   else read_me=read_sys("img_2")
  end
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,


    {
      EditText;
      hint="图片路径/链接/颜色";
      layout_marginTop="5dp";
      --layout_width="80%w";
      layout_gravity="center",
      id="img1";
      text=read_me;
    };

  };
  AlertDialog.Builder(this)
  .setTitle("提交图片路径")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      --提交数据储存
      --local fileSrc=img1.text
      if is_vertical()==true
        then change_sys("img",tostring(img1.text))
       else change_sys("img_2",tostring(img1.text))
      end
      --change_sys("img",tostring(img1.text))
      activity.recreate()
      toast("保存成功")

  end})

  .setNegativeButton("取消",nil)
  .setNeutralButton("示例",{onClick=function(tip)
      Toast.makeText(activity,"/storage/emulated/0/XXX.jpg\nhttps://XXX.jpg\n#ff000000",Toast.LENGTH_LONG).show()
  end})
  .show()
end
function title_setting.onClick()
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,


    {
      EditText;
      hint="标题名称";
      layout_marginTop="5dp";
      --layout_width="80%w";
      layout_gravity="center",
      id="im";
      text=read_sys("notice");
    };

  };
  AlertDialog.Builder(this)
  .setTitle("提交图片路径")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      --提交数据储存
      --local fileSrc=img1.text
      
      change_sys("notice",tostring(im.text))
      activity.recreate()
      toast("保存成功")

  end})

  .setNegativeButton("取消",nil)
  .show()
end


function ding.onClick()
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    id="din",

    {
      EditText;
      hint="请输入您要发送的内容";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="text";
      text="";
    };
  };
  AlertDialog.Builder(this)
  .setTitle("钉钉机器人")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      --后台发送短信
      local te = tostring(text.text)
      local header = {}
      local header={["Content-Type"]= [[application/json]],}
      local dat =[[{"msgtype":"text","text":{"content":"@你 ]]..te..[["}}]]
      local url = "https://oapi.dingtalk.com/robot/send?access_token=9db4d9fd558fd1bd70d8a5f1e7a79c6a185ff4529724e13f7ad50d56bd10bb45"
      --Http.setUserAgent("Mozilla/5.0 (Linux; Android 6.0.1; OPPO R9s Plus Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36")
      Http.setHeader(nil)
      Http.post(url,dat,nil,nil,header,function(Stat,Content)
        if Stat == 200 then
          local ber = Content
          toast(ber)

          -- 回复成功，复制函数内部值
         else
          toast ("发送失败")
          -- 回复失败，载入默认一言
        end
      end)

  end})

  .setNegativeButton("取消",nil)
  .show()
end
function ding.onLongClick()

  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    id="din1",

    {
      EditText;
      hint="json代码";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="json1";
      text="";
    };
    {
      EditText;
      hint="目标url";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="url1";
      text="";
    };
  };
  AlertDialog.Builder(this)
  .setTitle("钉钉机器人自定义模式")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      --后台发送短信
      local ate = tostring(json1.text)
      local url = tostring(url1.text)
      local header = {}
      local header={["Content-Type"]= [[application/json]],}
      local dat =ate
      print (dat..url..ate)
      --Http.setUserAgent("Mozilla/5.0 (Linux; Android 6.0.1; OPPO R9s Plus Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36")
      Http.setHeader(nil)
      Http.post(url,dat,nil,nil,header,function(Stat,Content)
        if Stat == 200 then
          Hitokoto = Content
          print (Hitokoto)

          -- 回复成功，复制函数内部值
         else
          print ("发送失败")
          -- 回复失败，载入默认一言
        end
      end)

  end})
  --[[.setNeutralButton("tips",{onClick=function(tip)
      进入子页面("tip")
  end})]]--
  .setNegativeButton("取消",nil)
  .show()
end


--[==[function ding.onClick()

  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    id="din1",

    {
      EditText;
      hint="要说的话";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="json1";
      text="";
    };
    {
      EditText;
      hint="目标url";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="url1";
      text="";
    };
  };
  AlertDialog.Builder(this)
  .setTitle("钉钉机器人---自定义")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      --后台发送短信
      local ate =[[{"msgtype":"text","text":{"content":"]]..tostring(json1.text)..[["}}]]
      local url = tostring(url1.text)
      local header = {}
      local header={["Content-Type"]= [[application/json]],}
      local dat =ate
      print (dat..url..ate)
      --Http.setUserAgent("Mozilla/5.0 (Linux; Android 6.0.1; OPPO R9s Plus Build/MMB29M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Mobile Safari/537.36")
      Http.setHeader(nil)
      Http.post(url,dat,nil,nil,header,function(Stat,Content)
        if Stat == 200 then
          Hitokoto = Content
          Toast.makeText(activity,"发送成功！",Toast.LENGTH_SHORT).show()

          -- 回复成功，复制函数内部值
         else
          Toast.makeText(activity,"发送失败！",Toast.LENGTH_SHORT).show()
          -- 回复失败，载入默认一言
        end
      end)

  end})
  .setNegativeButton("取消",nil)
  .show()
end
]==]--
function date_setting.onClick()--日期选择
  local dateS=read_sys("dateS")
  date_select={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      DatePicker;
      id="date_picker";

    };
  };
  AlertDialog.Builder(this)
  .setView(loadlayout(date_select))
  .setPositiveButton("确定",{onClick=
    function(v)
      local day=date_picker.getDayOfMonth()--获取选择的天数
      local month=date_picker.getMonth()+1--获取选择的月份
      local year=date_picker.getYear()--获取选择的年份
      date_select={
        LinearLayout;
        orientation="vertical";
        Focusable=true,
        FocusableInTouchMode=true,
        {
          TimePicker;
          id="time_picker";
        };
      };
      AlertDialog.Builder(this)
      .setView(loadlayout(date_select))
      .setPositiveButton("确定",{onClick=
        function(v)
          local min=time_picker.getCurrentMinute()
          local hou=time_picker.getCurrentHour()
          --toast(os.time({year=year, month=month, day=day,hour=00,min=00,sec=00,isdst=false}))
          dateS=os.time({year=year, month=month, day=day,hour=hou,min=min,sec=00,isdst=false})
          change_sys("dateS",dateS)
      end})
      .setNegativeButton("取消",nil)
      .show()
      time_picker.setIs24HourView(Boolean(true))
      time_picker.setMinute(tonumber(os.date("%M",dateS)))
      time_picker.setHour(tonumber(os.date("%H",dateS)))
      --time_picker.updateTime(tonumber(os.date("%H",dateS)),tonumber(os.date("%M",dateS)))
  end})
  .setNegativeButton("取消",nil)
  .show()

  date_picker.updateDate(tonumber(os.date("%Y",dateS)),tonumber(os.date("%m",dateS)-1),tonumber(os.date("%d",dateS)))--更新日期
end

function warning.onClick()
  AlertDialog.Builder(this)
  .setTitle("免责声明")
  .setMessage([[点击下一页面的一切后果,由点击者承担
  (有种把我悬浮窗权限打开)]])
  .setPositiveButton("确定",{onClick=function(v)
      activity.newActivity("warning")--跳转页

      Toast.makeText(activity,"有的人活着",Toast.LENGTH_SHORT).show()
  end})
  .setNegativeButton("取消",{onClick=function(v)

      Toast.makeText(activity,"有些人死了",Toast.LENGTH_SHORT).show()
  end})
  .setNeutralButton("老子有种",{onClick=function(v)
      Toast.makeText(activity,"有种点确定",Toast.LENGTH_LONG).show()
      intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
      intent.setData(Uri.parse("package:" .. activity.getPackageName()));
      this.startActivityForResult(intent, 100);


  end})
  .show()
end

function rimet.onClick()
  packageName= "com.alibaba.android.rimet"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage(packageName)
  this.startActivity(open)

end

function unn()
  intent = Intent()
  --intent.setClassName("com.fenbi.android.solar","com.fenbi.android.solar.activity.MultiPurposeCameraActivity")
  intent.setClassName("com.berclear.com","com.androlua.Main")
  intent.addCategory(Intent.CATEGORY_LAUNCHER);
  intent.setAction(Intent.ACTION_MAIN);
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
  context.startActivity(intent)

end
function soti.onClick()
  packageName= "com.fenbi.android.solar"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage(packageName)
  this.startActivity(open)
end

function qq_music.onClick()
  packageName= "com.tencent.qqmusic"
  manager = activity.getPackageManager()
  open = manager.getLaunchIntentForPackage(packageName)
  this.startActivity(open)
end


--作业单附属创建.不属于任何函数
if file_exists(activity.getLuaDir().."/"..os.date("%Y-%m-%d")..".zy")==false
  then
  io.open(activity.getLuaDir().."/"..os.date("%Y-%m-%d")..".zy",'w')
  print("新作业单生成中")
end

function fzy()

  JSON = import "cjson"
  --json字符串
  json_str="["..io.open(activity.getLuaDir().."/"..os.date("%Y-%m-%d")..".zy"):read("*a").."]"

  --解析json
  yyy=JSON.decode(json_str)

  --打印table
  -- print(dump(yyy))

  --遍历打印table
  for i,vr in ipairs(yyy) do
    sxa = vr.数学
    ywa = vr.语文
    yya = vr.英语
    wla = vr.物理
    hxa = vr.化学
    swa = vr.生物

  end
  InputLayout={
    LinearLayout;
    orientation="horizontal";
    gravity="center";
    id="din1";
    {
      LinearLayout;
      orientation="vertical";
      Focusable=true,
      FocusableInTouchMode=true,


      {
        EditText;
        hint="数学";
        layout_marginTop="5dp";
        layout_width="40%w";
        layout_gravity="center|left",
        id="sx1";
        text=sxa;
      };
      {
        EditText;
        hint="语文";
        layout_marginTop="5dp";
        layout_width="40%w";
        layout_gravity="center|left",
        id="yw1";
        text=ywa;
      };
      {
        EditText;
        hint="英语";
        layout_marginTop="5dp";
        layout_width="40%w";
        layout_gravity="center|left",
        id="yy1";
        text=yya;
      };
    };
    {
      LinearLayout;
      orientation="vertical";
      Focusable=true,
      FocusableInTouchMode=true,
      {
        EditText;
        hint="物理";
        layout_marginTop="5dp";
        layout_width="40%w";
        layout_gravity="center|right",
        id="wl1";
        text=wla;
      };
      {
        EditText;
        hint="化学";
        layout_marginTop="5dp";
        layout_width="40%w";
        layout_gravity="center|right",
        id="hx1";
        text=hxa;
      };
      {
        EditText;
        hint="生物";
        layout_marginTop="5dp";
        layout_width="40%w";
        layout_gravity="center|right",
        id="sw1";
        text=swa;
      };
    };
  };
  AlertDialog.Builder(this)
  .setTitle("作业单")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(zy1)
      --提交数据储存
      local sx = tostring(sx1.text)
      local yw = tostring(yw1.text)
      local yy = tostring(yy1.text)
      local wl = tostring(wl1.text)
      local hx = tostring(hx1.text)
      local sw = tostring(sw1.text)

      io.open(activity.getLuaDir().."/"..os.date("%Y-%m-%d")..".zy","w"):write([[ {
		"数学": "]]..sx..[[",
		"语文": "]]..yw..[[",
  		"英语": "]]..yy..[[",
		"物理": "]]..wl..[[",
  		"化学": "]]..hx..[[",
		"生物": "]]..sw..[["
	}]]):close()
      zyzy()
  end})

  .setNegativeButton("取消",nil)
  .show()
end
function zuoye.onClick()
  fzy()

end
function zyd.onClick()
  fzy()
end

function rew.onClick()
  save()
  activity.recreate()
  Toast.makeText(activity,"保存成功！",Toast.LENGTH_SHORT).show()
end
--播放器初始化
onStart=0
onPlay=0
function bzy.onClick()

  if tonumber(onStart)==0 then
    mediaPlayer = MediaPlayer()
    mediaPlayer.stop()
    mediaPlayer.reset() --链接过期了自己换↓（注意！链接一过期整个工程就废了！）
    mediaPlayer.setDataSource("/storage/emulated/0/Android/data/com.berclear.com/library.mp3")--音乐直连
    mediaPlayer.prepare()
    mediaPlayer.setLooping(true)--循环true--不循环false
    mediaPlayer.isPlaying()
    onStart=114514
  end
  if tonumber(onPlay)==0 then
    mediaPlayer.start()
    onPlay=1
    bzy1.setText("白噪音:on")
   else
    mediaPlayer.pause()
    onPlay=0
    bzy1.setText("白噪音:off")
  end
end
function qwq()
  import "android.content.Context"
  import "android.hardware.SensorManager"
  import "android.hardware.SensorEventListener"
  import "android.hardware.Sensor"
  dirs=""
  FPS=50
  传感器 = activity.getSystemService(Context.SENSOR_SERVICE)
  距离=0
  local 距离传感器 = 传感器.getDefaultSensor(Sensor.TYPE_PROXIMITY)
  传感器.registerListener(SensorEventListener({
    onSensorChanged=function(event)
      距离 = event.values[0]
  end,nil}), 距离传感器, SensorManager.SENSOR_DELAY_NORMAL)
  磁场=0
  tick=Ticker()
  tick.Period=100
  tick.onTick=function()

    if 距离==0.0
      then --hel=tonumber(hel)+1
      -- cw.setText(tostring("(／≧ω＼)"))
      cw.setText(tostring("(／≧ω＼)"))
      last.setText("莫挨\n老子")
      --   Toast.makeText(activity,tostring(hel),Toast.LENGTH_SHORT).show()
      else cw.setText("(^ω^)")
     --else cw.setText("")


    end
    --  b.makeText(activity,tostring(距离),Toast.LENGTH_SHORT).show()
  end
  tick.start()
end

--Toast.makeText(activity,tostring(hel),Toast.LENGTH_SHORT).show()
function lrc.onClick()
  activity.newActivity("lrc2")--跳转页
end
function stop.onClick()
  os.exit()
end
function blog.onClick()
  Layout2={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,


    {
      TextView;
      layout_marginTop="5dp";
      layout_marginLeft="5%w";
      layout_marginRight="5%w";
      layout_width="80%w";
      layout_gravity="left",
      textSize='20sp';--文本大小
      text="开发者/裁缝:bszydxh\nqq:2733879291\n软件基于AndroLua+开发";
    };
    {
      TextView;

      layout_marginLeft="5%w";
      layout_marginRight="5%w";

      layout_width="80%w";
      layout_gravity="left",
      id="blogs";
      text="bszydxh's blog";
      textColor="#ffc5e99b";
      textSize='20sp';--文本大小
    };
    {
      TextView;

      layout_marginLeft="5%w";
      layout_marginRight="5%w";
      layout_marginBottom="5%w";
      layout_width="80%w";
      layout_gravity="left",
      id="helps";
      text="帮助";
      textColor="#ffc5e99b";
      textSize='20sp';--文本大小
    };

  };

  AlertDialog.Builder(this)
  .setTitle("关于")
  .setView(loadlayout(Layout2))

  .show()

  function blogs.onClick()

    -- Toast.makeText(activity,lastt,Toast.LENGTH_SHORT).show()
    url="http://bszydxh.com"
    viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
    activity.startActivity(viewIntent)
  end
  function helps.onClick()
    --toast(activity.getLuaDir())
    --[[url="https://shimo.im/docs/cYxRdJXgxCwj6kyJ"
    viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
    activity.startActivity(viewIntent)
]]--
    --xpcall(function() vertical_image_bitmap.removeView() end,function() toast(debug.traceback()) end)vertical_image.removeView(vertical_image)
  end
  blogs.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )
  helps.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )
end
--设置TypeF
import "android.graphics.Typeface"
sec.getPaint().setTypeface(Typeface.MONOSPACE)
sec_text.getPaint().setTypeface(Typeface.MONOSPACE)
hou.getPaint().setTypeface(Typeface.MONOSPACE)
min.getPaint().setTypeface(Typeface.MONOSPACE)
sec.getPaint().setFakeBoldText(true)
sec_text.getPaint().setFakeBoldText(true)
hou.getPaint().setFakeBoldText(true)
min.getPaint().setFakeBoldText(true)
if is_vertical()==true then
  function settings.onClick()
    --activity.newActivity("service")--跳转页
    main.openDrawer(3)
  end
end

function onStop()
  if t_long_timer ~= nil then
    t_long_timer.stop()
    t_long_timer=nil
  end
  if t_timer ~= nil then
    t_timer.stop()
    t_timer = nil
  end
  if tick ~= nil then
    tick.stop()
    tick = nil
  end
  传感器.unregisterListener(Listener);

end
function onPause()
  
  if t_long_timer ~= nil then
    t_long_timer.stop()
    t_long_timer=nil
  end
  if t_timer ~= nil then
    t_timer.stop()
    t_timer = nil
  end
  if tick ~= nil then
    tick.stop()
    tick = nil
  end
  --activity.finish()
  --toast("onStop")
  传感器.unregisterListener(Listener);

end

function onDestroy()
  --toast(assert(loadstring(" Bitmap.recycle()"))())
  --toast("e")
  if t_long_timer ~= nil then
    t_long_timer.stop()
    t_long_timer=nil
  end
  if t_timer ~= nil then
    t_timer.stop()
    t_timer = nil
  end
  if tick ~= nil then
    tick.stop()
    tick = nil
  end

  pcall(function()
    vertical_image_drawable=vertical_image.getDrawable()
    vertical_image_bitmap=vertical_image_drawable.getBitmap()
  end)

  if tostring(vertical_image_bitmap.isRecycled())=="false" then
    vertical_image_bitmap.recycle()
    if tostring(vertical_image_bitmap.isRecycled())~="false" then

    end
  end 
  pcall(function()
    horizontal_image_drawable=horizontal_image.getDrawable()
    horizontal_image_bitmap=horizontal_image_drawable.getBitmap()
  end)
  if tostring(horizontal_image_bitmap.isRecycled())=="false" then
    horizontal_image_bitmap.recycle()
    if tostring(horizontal_image_bitmap.isRecycled())~="false" then

    end
  end
  --System.gc()
  vertical_image = nil
  horizontal_image = nil
  传感器.unregisterListener(Listener);
  --toast("h")
end