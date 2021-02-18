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
--activity.setTheme(android.R.style.Theme_DeviceDefault_Light)--设置主题
activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);
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

local w=this.getWidth()
local h=this.getHeight()
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

--io封装
function file_exists(path)
  local f=io.open(path,'r')
  if f~=nil then io.close(f) return true else return false end
end
--cmd shell命令封装
function exec(cmd)
  local p=io.popen(string.format('%s',cmd))
  local s=p:read("*a")
  p:close()
  return s
end
hel=0
--img="#FF000000"
img=0
--ber.sys附属创建.不属于任何函数
if file_exists("/storage/emulated/0/Android/data/com.berclear/ber.sys")==false
  then
  io.open("/storage/emulated/0/Android/data/com.berclear/ber.sys",'w')
  import "java.io.File"--导入File类
  File("/storage/emulated/0/Android/data/com.berclear").mkdir()
  print("欢迎!初始化系统中")
  cwt=0
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
  img=0
  dateS=1623027600
  io.open("/storage/emulated/0/Android/data/com.berclear/ber.sys","w"):write([[ {
		"last": "]]..lastt..[[",
        "cw":"]]..cwt..[[",
		"bszydxh": "]]..bszydxht..[[",
  		"asp": "]]..aspt..[[",
		"date": "]]..datet..[[",
  		"b": "]]..bt..[[",
		"hou": "]]..hout..[[",
        "xh": "]]..xht..[[",
		"yun": "]]..yunt..[[",
  		"net": "]]..nett..[[",
		"hitokoto": "]]..hitokotot..[[",
  		"dianya": "]]..dianyat..[[",
		"dianwen": "]]..dianwent..[[",
        "dianliang": "]]..dianliangt..[[",
		"azbb": "]]..azbbt..[[",
        "imgBack":"#FF000000",
        "date":"]]..dateS..[["
        
	}]]):close()
end
--读取
function sys()
  JSON = import "cjson"
  --json字符串
  json_str ="["..io.open("/storage/emulated/0/Android/data/com.berclear/ber.sys"):read("*a").."]"

  --解析json
  yyyt=JSON.decode(json_str)

  --打印table(debug)
  --  print(dump(yyyt))

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
    nett=vrt.net
    hitokotot=vrt.hitokoto
    dianyat=vrt.dianya
    dianwent=vrt.dianwen
    dianliangt=vrt.dianliang
    azbbt=vrt.azbb
    img=vrt.imgBack
    dateS=vrt.date
  end
end

--重载布局
function rebj()


  asp.setVisibility(View.VISIBLE)
  --  asp2.setVisibility(View.VISIBLE)
  --  asp3.setVisibility(View.VISIBLE)
  date.setVisibility(View.VISIBLE)
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
    date.setVisibility(View.GONE)
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
  if tonumber(nett)==1 then
    net.setVisibility(View.GONE)
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
sys()

--开头先读一次

activity.setContentView(loadlayout("layout"))--将布局添加至窗口
rebj()

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
  json_str="["..io.open("/storage/emulated/0/Android/data/com.berclear/"..os.date("%Y-%m-%d")..".zy"):read("*a").."]"

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
manager = activity.getSystemService(Context.CONNECTIVITY_SERVICE);
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
end
device_model = Build.MODEL
version_xtbb = Build.VERSION.RELEASE
xh.setText("手机型号: "..Build.MODEL)
azbb.setText("安卓版本: "..Build.VERSION.RELEASE)
d=0
hourl=0
minutel=0
secondl=0
function mb()
  local day =0
  local hour = 0
  local second = 0
  local minute = 0
  local hourSec =0
  local minuteSec=0
  
  --计算变量而非输出变量
  --[[
  if tonumber(os.date("%m"))==tonumber("1") then
    d = os.date("%d")
    d = 158 - d
    --158
   elseif tonumber(os.date("%m"))==tonumber("2") then
    d = os.date("%d")
    d = 127 - d
   elseif tonumber(os.date("%m"))==tonumber("3") then
    d = os.date("%d")
    d = 99 - d
   elseif tonumber(os.date("%m"))==tonumber("4") then
    d = os.date("%d")
    d = 68 - d
   elseif tonumber(os.date("%m"))==tonumber("5") then
    d = os.date("%d")
    d = 38 - d
   elseif tonumber(os.date("%m"))==tonumber("6") then
    d = os.date("%d")
    d = 7 - d
  end

  --下面开始小时变天运算
  if tonumber(os.date("%H"))>=tonumber("9") then
    d = d - 1
    --9
  end
  --倒计时小时运算
  if tonumber(os.date("%H"))<=tonumber("8") then
    --8两个 32
    hour = os.date("%H")
    hour = 8 - hour
   else
    hour = os.date("%H")
    hour = 32 - hour
  end

  --倒计时秒数运算
  if tonumber(os.date("%S"))==tonumber("00") then
    second = 00
   else
    second = os.date("%S")
    second = 60 - second
  end
  --倒计时分钟运算
  if tonumber(os.date("%M"))==tonumber("00") then
    minute = 59
   else
    minute = os.date("%M")
    minute = 59 - minute
  end
  sec.setText(string.format("%u",second).."秒")
  min.setText(string.format("%u",minute).."分")]]--

  -----------一座屎山-------

  dateSec=exec("date +%s")
  dateTarget=dateS
  local dateLast=dateTarget-dateSec
  hourSec=dateLast % 86400
  minuteSec=hourSec % 3600
  second=minuteSec % 60
  day=dateLast-hourSec
  day=day/86400
  hour=hourSec-minuteSec
  hour=hour/3600
  minute=minuteSec-second
  minute=minute/60
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
    sec.setText("0"..string.format("%u",second).."秒")
    secondl="0"..string.format("%u",second).."秒"
   else
    sec.setText(string.format("%u",second).."秒")
    secondl=string.format("%u",second).."秒"
  end
  dayl=string.format("%u",tostring(day)).."天"
  last.setText(string.format("%u",day))
  asp.setText(os.date("%H:%M"))
  -- asp2.setText(os.date(":%S"))
  --本地时间总和..高考倒计时
  date.setText(os.date("%Y年%m月%d日   %A"))
  --dayl..hourl..minutel..secondl剩余时间输出,其余均做本地变量处理
end
function notice()
  mBuilder = Notification.Builder(this,channel);
  mBuilder.setSmallIcon(R.drawable.icon)--设置图标
  mBuilder.setContentTitle("距离高考还有");--大标
  mBuilder.setContentText(dayl..hourl..minutel..secondl);--小标
  mBuilder.setAutoCancel(false);--设置这个标志当用户单击面板就可以让通知将自动取消
  mBuilder.setDefaults( Notification.DEFAULT_SOUND | Notification.DEFAULT_VIBRATE) --使用默认震动
  notificationManager =activity.getSystemService(Context.NOTIFICATION_SERVICE)
  --notificationIntent =Intent(Intent.ACTION_VIEW, Uri.parse("http://bszydxh.web.zhanhi.com/wap_bszydxh.html"))
  --pendingIntent = PendingIntent.getActivity(activity.getApplicationContext(), 0, notificationIntent, Intent.FLAG_ACTIVITY_NEW_TASK);
  --mBuilder.setContentIntent(pendingIntent).setAutoCancel(false)

  --intent.setClassName("com.fenbi.android.solar","com.fenbi.android.solar.activity.MultiPurposeCameraActivity")-

  notificationIntent =Intent()
  notificationIntent.setClassName("com.berclear.com","com.androlua.Main")
  pendingIntent = PendingIntent.getActivity(activity.getApplicationContext(), 0, notificationIntent, Intent.FLAG_ACTIVITY_NEW_TASK);
  mBuilder.setContentIntent(pendingIntent).setAutoCancel(false)

  mBuilder.setOngoing(true)--ture，设置他为一
  mBuilder.setPriority(Notification.PRIORITY_HIGH)
  --设置该通知优先级
  notificationManager.notify(1, mBuilder.build()) --发送通知
end

function yyd()
  Hitokoto = 555
  Http.get("https://v1.hitokoto.cn/?encode=text&c=i",nil,nil,nil,
  function(Stat,Content)
    -- 一言 (Hitokoto) 请求端口，示例用
    if Stat == 200 then
      Hitokoto = Content
      bszydxh.setText(""..Hitokoto)
      -- 回复成功，复制函数内部值
     else
      Hitokoto = "用代码表达言语的魅力，用代码书写山河的壮丽。"
      -- 回复失败，载入默认一言
    end
  end)

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
function hide()
  activity.getDecorView().setSystemUiVisibility(
          View.SYSTEM_UI_FLAG_LAYOUT_STABLE
              | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
              | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
              | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
         --     | View.SYSTEM_UI_FLAG_FULLSCREEN
              | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
end
hide()
--线程函数----------------------------------
function ap()
  --调用主线程函数
  require "import"
  --Thread.sleep(1000)--延迟1000毫秒
  while( true ) do
    call("mb")
    call("notice")

    Thread.sleep(1000)--延迟1000毫秒
  end
end

thread(ap)
function dd()
  --调用主线程函数
  require "import"
  --Thread.sleep(1000)--延迟1000毫秒
  while( true ) do
    call("yyd")
    -- call("hello")
    
    Thread.sleep(7000)--延迟1000毫秒
  end
end

thread(dd)

function py()
  --调用主线程函数
  require "import"
  --Thread.sleep(1000)--延迟1000毫秒
  while( true ) do
    call("po")
    call("zyzy")
    --call("ber")
    Thread.sleep(60000)--延迟60000毫秒
  end
end
--[[---------------------线程---------------------]]--
on = 0

thread(py)
function reload.onClick()
  --事件
  print ("布局已重置")
  asp.setVisibility(View.VISIBLE)
  --  asp2.setVisibility(View.VISIBLE)
  --  asp3.setVisibility(View.VISIBLE)
  date.setVisibility(View.VISIBLE)
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
function date.onClick()
  if on==1 then
    --事件
    date.setVisibility(View.GONE)
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
function net.onClick()
  if on==1 then
    --事件
    net.setVisibility(View.GONE)
    nett=1
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
    intent = Intent()
    intent.setClassName("com.fenbi.android.solar","com.fenbi.android.solar.activity.MultiPurposeCameraActivity")
    --intent.setClassName("com.berclear","com.androlua.Main")
    activity.startActivity(intent)
    activity.finish()
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



--[[------------------以下侧滑----------------]]--




function offc.onClick()
  if on == 0 then
    on = 1
    off.setText("布局锁定")


   elseif on == 1 then
    on = 0

    off.setText("布局解锁")
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
  fileSrc=0
  function onActivityResult(requestCode,resultCode,intent)
    if intent then
      local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
      cursor.moveToFirst()
      import "android.provider.MediaStore"
      local idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA)
      local fileSrc = cursor.getString(idx)

      --fileSrc回调路径路径

      Toast.makeText(activity,fileSrc,Toast.LENGTH_SHORT).show()
      img=fileSrc
      io.open("/storage/emulated/0/Android/data/com.berclear/ber.sys","w"):write([[ {
        "cw":"]]..cwt..[[",
		"last": "]]..lastt..[[",
		"bszydxh": "]]..bszydxht..[[",
  		"asp": "]]..aspt..[[",
		"date": "]]..datet..[[",
  		"b": "]]..bt..[[",
		"hou": "]]..hout..[[",
        "xh": "]]..xht..[[",
		"yun": "]]..yunt..[[",
  		"net": "]]..nett..[[",
		"hitokoto": "]]..hitokotot..[[",
  		"dianya": "]]..dianyat..[[",
		"dianwen": "]]..dianwent..[[",
        "dianliang": "]]..dianliangt..[[",
		"azbb": "]]..azbbt..[[",
        "imgBack":"]]..img..[[" ,
         "date":"]]..dateS..[["
	}]]):close()
      Toast.makeText(activity,"保存成功！重启后生效！",Toast.LENGTH_SHORT).show()
    end
  end
end
function sjzt.onLongClick()
  JSON = import "cjson"
  --json字符串
  json_str="["..io.open("/storage/emulated/0/Android/data/com.berclear/ber.sys"):read("*a").."]"

  --解析json
  yyy2=JSON.decode(json_str)

  --打印table
  -- print(dump(yyy))

  --遍历打印table
  for i,vr in ipairs(yyy2) do
    imga = vr.img


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
      layout_width="80%w";
      layout_gravity="center",
      id="img1";
      text=img;
    };

  };
  AlertDialog.Builder(this)
  .setTitle("提交图片路径")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(zy1)
      --提交数据储存

      local img = tostring(img1.text)

      io.open("/storage/emulated/0/Android/data/com.berclear/ber.sys","w"):write([[ {
        "cw":"]]..cwt..[[",
		"last": "]]..lastt..[[",
     	"bszydxh": "]]..bszydxht..[[",
  		"asp": "]]..aspt..[[",
		"date": "]]..datet..[[",
  		"b": "]]..bt..[[",
		"hou": "]]..hout..[[",
        "xh": "]]..xht..[[",
		"yun": "]]..yunt..[[",
  		"net": "]]..nett..[[",
		"hitokoto": "]]..hitokotot..[[",
  		"dianya": "]]..dianyat..[[",
		"dianwen": "]]..dianwent..[[",
        "dianliang": "]]..dianliangt..[[",
		"azbb": "]]..azbbt..[[",
        "imgBack":"]]..img..[[",
         "date":"]]..dateS..[["
	}]]):close()
      Toast.makeText(activity,"保存成功！重启后生效！",Toast.LENGTH_SHORT).show()
  end})

  .setNegativeButton("取消",nil)
  .setNeutralButton("示例",{onClick=function(tip)
      Toast.makeText(activity,"/storage/emulated/0/XXX.jpg\nhttps://XXX.jpg\n#ff000000",Toast.LENGTH_LONG).show()
  end})
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
          print (ber)
          print ("ok")

          -- 回复成功，复制函数内部值
         else
          print ("发送失败")
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
  .setNeutralButton("tips",{onClick=function(tip)
      进入子页面("tip")
  end})
  .setNegativeButton("取消",nil)
  .show()
end

function music.onClick()
  进入子页面("music")
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



--作业单附属创建.不属于任何函数
if file_exists("/storage/emulated/0/Android/data/com.berclear/"..os.date("%Y-%m-%d")..".zy")==false
  then
  io.open("/storage/emulated/0/Android/data/com.berclear/"..os.date("%Y-%m-%d")..".zy",'w')
  print("新作业单生成中")
end

function fzy()

  JSON = import "cjson"
  --json字符串
  json_str="["..io.open("/storage/emulated/0/Android/data/com.berclear/"..os.date("%Y-%m-%d")..".zy"):read("*a").."]"

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
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    id="din1",

    {
      EditText;
      hint="数学";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="sx1";
      text=sxa;
    };
    {
      EditText;
      hint="语文";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="yw1";
      text=ywa;
    };
    {
      EditText;
      hint="英语";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="yy1";
      text=yya;
    };
    {
      EditText;
      hint="物理";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="wl1";
      text=wla;
    };
    {
      EditText;
      hint="化学";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="hx1";
      text=hxa;
    };
    {
      EditText;
      hint="生物";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="sw1";
      text=swa;
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

      io.open("/storage/emulated/0/Android/data/com.berclear/"..os.date("%Y-%m-%d")..".zy","w"):write([[ {
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
  io.open("/storage/emulated/0/Android/data/com.berclear/ber.sys","w"):write([[ {
        "cw":"]]..cwt..[[",
		"last": "]]..lastt..[[",
		"bszydxh": "]]..bszydxht..[[",
  		"asp": "]]..aspt..[[",
		"date": "]]..datet..[[",
  		"b": "]]..bt..[[",
		"hou": "]]..hout..[[",
        "xh": "]]..xht..[[",
		"yun": "]]..yunt..[[",
  		"net": "]]..nett..[[",
		"hitokoto": "]]..hitokotot..[[",
  		"dianya": "]]..dianyat..[[",
		"dianwen": "]]..dianwent..[[",
        "dianliang": "]]..dianliangt..[[",
		"azbb": "]]..azbbt..[[",
        "imgBack":"]]..img..[[",
         "date":"]]..dateS..[["
	}]]):close()
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
    mediaPlayer.setDataSource("/storage/emulated/0/Android/data/com.berclear/library.mp3")--音乐直连
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
  tick.Period=1000/FPS
  tick.onTick=function()

    if 距离==0.0
      then --hel=tonumber(hel)+1
      cw.setText(tostring("(／≧ω＼)"))
      --   Toast.makeText(activity,tostring(hel),Toast.LENGTH_SHORT).show()
     else cw.setText("(^ω^)")

    end
    --  b.makeText(activity,tostring(距离),Toast.LENGTH_SHORT).show()
  end
  tick.start()
end
qwq()
function onDestroy()
  tick.stop()
  传感器.unregisterListener(Listener);
end
--Toast.makeText(activity,tostring(hel),Toast.LENGTH_SHORT).show()
function lrc.onClick()
  activity.newActivity("lrc2")--跳转页
end
function stop.onClick()
  os.exit()
  tick.stop()
  传感器.unregisterListener(Listener);
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
    url="http://bszydxh.com"
    viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
    activity.startActivity(viewIntent)
  end
  function helps.onClick()
    url="https://shimo.im/docs/cYxRdJXgxCwj6kyJ"
    viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
    activity.startActivity(viewIntent)
  end
  blogs.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )
  helps.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )
end
--[[import "android.graphics.*"
mgr=getAssets()
b.getPaint().setTypeface(Typeface.createFromAsset(getAssets(), "fangzheng.ttf") )]]--



