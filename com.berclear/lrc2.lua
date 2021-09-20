require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "cjson"
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
require "import"
import "android.widget.*"
import "android.view.*"
import "android.widget.*"
import "android.view.*"
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
activity.setTheme(android.R.style.Theme_DeviceDefault_Light)--设置主题
activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
--activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR);
activity.ActionBar.hide()
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
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN)
--这个需要系统SDK21以上才能用
function 写入文件(路径,内容)
  import "java.io.File"
  f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
  io.open(tostring(路径),"w"):write(tostring(内容)):close()
end
--Toast.makeText(activity,"点击屏幕开始",Toast.LENGTH_LONG).show()
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
      --decodeStr=string.gsub(decodeStr,"content://com.android.fileexplorer.myprovider/external_files/","/storage/emulated/0/")
      -- print(decodeStr)
      ssrt=File(decodeStr).getName()
      findLrc()
    end
  end
end
function ChooseFile2()
local intent= Intent(Intent.ACTION_GET_CONTENT)
intent.setType("audio/*")
this.startActivityForResult(intent, 1)
-------

--回调
function onActivityResult(requestCode,resultCode,intent)
  if intent then
    local cursor =this.getContentResolver ().query(intent.getData(), nil, nil, nil, nil)
    cursor.moveToFirst()
    import "android.provider.MediaStore"
    local idx = cursor.getColumnIndex(MediaStore.Audio.Media.DISPLAY_NAME)
    ssrt = cursor.getString(idx)
   --print (ssrt)
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
  background='#ffffff';--布局背景颜色(或者图片路径)
  
  {
    ScrollView;--纵向滚动
    layout_width='fill';--宽
    layout_height='fill';--高
    id='main';
    {
      LinearLayout;--线性布局
      Orientation='vertical';--布局方向
      layout_width='fill';--布局宽度
      layout_height='fill';--布局高度
      background='';--布局背景颜色(或者图片路径)
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
        text='点我开始';--显示的文本
        textSize='18sp';--文本大小
      };
    
    };
  };
};

activity.setContentView(loadlayout(shamrock))--将布局添加至窗口
--ChooseFile()
function 文本.onClick()
  AlertDialog.Builder(this)
  .setTitle("请选择获取方式")
  .setPositiveButton("方法二",{onClick=function(v)
      ChooseFile2()
  end})
  .setNegativeButton("方法一",{onClick=function(v)
      ChooseFile()

  end})
 .setNeutralButton("小米专用方法",{onClick=function(tip)
      activity.newActivity("lrc")
  end})

  .show()
end

function findLrc()
  --decodeStr=string.gsub(decodeStr,"content://com.android.fileexplorer.myprovider/external_files/","/storage/emulated/0/")
  --ssrt=File(decodeStr).getName()
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
          文本.setText(nn)
          写入文件("/sdcard/lyrics/"..ssrt..".lrc",nn)
         -- io.open("/sdcard/lyrics/"..ssrt..".lrc", 'w')
       --   io.open("/sdcard/lyrics/"..ssrt..".lrc","w"):write(nn):close()
          Toast.makeText(activity,"歌词文件已成功保存至\n".."/sdcard/lyrics/"..ssrt..".lrc",Toast.LENGTH_LONG).show()
        end
      end)
    end
  end)
end

