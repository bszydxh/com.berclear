require "import"
import "android.widget.*"
import "android.view.*"
import "android.widget.*"
import "android.os.*"
import "android.app.AlertDialog"
import "java.net.URLEncoder"
import"java.io.File"
import "android.content.pm.ActivityInfo"
import "android.content.*"
import "android.content.Intent"
import "android.content.pm.PackageManager"
import "android.net.ConnectivityManager"
import 'android.webkit.WebView'
import "android.net.Uri"
import "android.text.Layout"
import "android.graphics.*"
import "com.hw.lrcviewlib.*"
import "functionLib"--函数库
activity.setTheme(android.R.style.Theme_DeviceDefault_Light)--设置主题
activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
--activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);
activity.ActionBar.hide()
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
--这个需要系统SDK21以上才能用
function hide()
  activity.getDecorView().setSystemUiVisibility(
  View.SYSTEM_UI_FLAG_LAYOUT_STABLE
  | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
  | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
  | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
  | View.SYSTEM_UI_FLAG_FULLSCREEN
  | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
end
hide()
Toast.makeText(activity,"请选择对应的歌曲",Toast.LENGTH_LONG).show()
function ChooseFile()
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.net.URLDecoder"
  import "java.io.File"
  intent = Intent(Intent.ACTION_PICK)
  intent.setType("audio/*");
  activity.startActivityForResult(intent,1);
  function onActivityResult(requestCode,resultCode,data)
    if resultCode == activity.RESULT_OK then
      local str = data.getData().toString()
      decodeStr = URLDecoder.decode(str,"UTF-8")
      decodeStr=string.gsub(decodeStr,"content://com.android.fileexplorer.myprovider/external_files/","/storage/emulated/0/")
      -- print(decodeStr)
      findLrc()

    end
  end
end
function home()
  activity.finish()--关闭当前页面
end
function GetFileMime(name)
  import "android.webkit.MimeTypeMap"
  ExtensionName=tostring(name):match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  return tostring(Mime)
end
--首先创建一个布局，为教程提供良好的可视化
--导入cjson包
import'cjson'
ser=0
shamrock=
{
  LinearLayout;--线性布局
  Orientation='vertical';--布局方向
  layout_width='fill';--布局宽度
  layout_height='fill';--布局高度
  background="";--布局背景颜色(或者图片路径)
  id="main";
  {
    ScrollView;--纵向滚动
    layout_width='fill';--宽
    layout_height='fill';--高

    {
      LinearLayout;--线性布局
      Orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      background="";--布局背景颜色(或者图片路径)
      gravity='center';--设置居中
      {
        TextView;--文本控件
        id='数';--绑定ID
        layout_margin='5%w';--布局外边距
        layout_width='wrap';--文本宽度
        layout_height='wrap';--文本高度
        Gravity='center';--重力属性
        textColor='#000000';--文本颜色
        text='歌词预览';--显示的文本
        textSize='18sp';--文本大小
      };
    
      {
        TextView;--文本控件
        id='文本';--绑定ID
        layout_margin='5%w';--布局外边距
        layout_width='wrap';--文本宽度
        layout_height='wrap';--文本高度
        Gravity='center';--重力属性
        textColor='#000000';--文本颜色
        text='加载中';--显示的文本
        textSize='18sp';--文本大小
      };
      {
        LrcView;
        id="geci";
        layout_width="fill";
        layout_height="80%h";
      };
    };
  };
};

activity.setContentView(loadlayout(shamrock))--将布局添加至窗口
ChooseFile()
t_play=0
function 文本.onClick()
  if t_play==0 then
    Play.pause()
    t_play=1
   elseif t_play==1
    Play.start()
    t_play=0
  end
end
function findLrc()
  --decodeStr=string.gsub(decodeStr,"content://com.android.fileexplorer.myprovider/external_files/","/storage/emulated/0/")
  ssrt=File(decodeStr).getName()


  fileLine=File(decodeStr).getParentFile()
  --print(fileLine)
  ssrt=string.gsub(ssrt,".m4a","")
  ssrt=string.gsub(ssrt,".mp3","")
  ssrt=string.gsub(ssrt,".flac","")
  InputtLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      EditText;
      hint="请输入您要发送的内容";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="text";
      text=ssrt;
    };
  };
  AlertDialog.Builder(this)
  .setTitle("信息核对")
  .setView(loadlayout(InputtLayout))
  .setPositiveButton("确定",{onClick=function(v)
      ssrk=tostring(text.Text)
      get(ssrk)

  end})
  .setNegativeButton("取消",function()
    home()
  end)

  .show()
end

function get(ssr)
  --后台发送短信

  ssrz= string.gsub(ssr,"-"," ")
  ssrz=URLEncoder.encode(ssrz)
  -- print(ssrz)
  url = 'https://api.qq.jsososo.com/search/quick?key='..ssrz

  --使用Http访问该网站，获取网页源码
  Http.get(url,nil,'utf8',nil,function(状态码,网页源码)
    --判断返回状态码，确定网站的正常运行
    if 状态码 ==200 then
      --使用cjson库将获取到的json数据table化
      数据 = cjson.decode(网页源码)
      ser=0
      --数.setText(dump(数据))
      --取出需要的数据
      数据列表 = 数据.data.song.itemlist
      ser=数据.data.song.itemlist[1].mid
      文本.setText(ser)
      --文本.setText(dump(数据列表))


      urlbs = "https://api.qq.jsososo.com/lyric?songmid="..ser
      --使用Http访问该网站，获取网页源码
      Http.get(urlbs,nil,'utf8',nil,function(状态码,nnn)
        --判断返回状态码，确定网站的正常运行
        if 状态码 ==200 then
          nnn = cjson.decode(nnn)
          local nn=nnn.data.lyric
          nn=nn..nnn.data.trans
          --nn=string.gsub(nn,"//","")
          nn=string.gsub(nn,"&apos;","'")
          --文本.setText(nn)
          io.open(tostring(fileLine).."/"..ssrt..".lrc", 'w')
          io.open(tostring(fileLine).."/"..ssrt..".lrc","w"):write(nn):close()
        --  Toast.makeText(activity,"歌词文件已成功保存至\n"..tostring(fileLine).."/"..ssrt..".lrc",Toast.LENGTH_LONG).show()
          play(decodeStr,tostring(fileLine).."/"..ssrt..".lrc")
        end
      end)
    end
  end)
end
function play(song_name,lrc_name)
  import "android.media.MediaPlayer"
  Play=MediaPlayer()
  Play.reset()
  Play.setDataSource(song_name)
  Play.prepare()
  Play.setLooping(false)--循环true--不循环false
  local seekToTime
  local mediaTime=Play.getDuration()
  local time=0
  Playti=Ticker()
  Playti.Period=300
  Playti.onTick=function()
    time=time+300
    geci.smoothScrollToTime(time)
    --Playii.setProgress(time/mediaTime*100)
    
  end
  import "android.graphics.Color"
  lrcRows =LrcDataBuilder().Build(File(lrc_name))
  geci.setLrcData(lrcRows)
  geci.getLrcSetting().setNormalRowTextSize(35)
  .setHeightLightRowTextSize(48)
  .setTrySelectRowTextSize(45)
  .setNormalRowColor(Color.parseColor("#000000"))
  .setHeightRowColor(Color.parseColor("#00ff00"))
  .setTrySelectRowColor(Color.parseColor("#ffffff"))
  .setTimeTextSize(45)
  geci.setLrcViewSeekListener(ILrcViewSeekListener{
    onSeek=function(view, seekTime)
      time=seekTime
      Play.seekTo(seekTime)
    end
  })
  Play.setOnPreparedListener(MediaPlayer.OnPreparedListener{
    onPrepared=function()
      Play.start()
      Playti.start()
    end
  })

  .setOnCompletionListener({
    onCompletion=function()
      --Play.release()
  --    Playti.stop()
     time=0
     Play.start()
    end
  })
end
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    Play.stop()
    activity.finish()
    -- os.exit()
    return true
  end
end
