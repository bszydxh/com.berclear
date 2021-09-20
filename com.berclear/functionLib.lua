--toast封装
--[[function toast(msg)
  Toast.makeText(activity,tostring(msg),Toast.LENGTH_SHORT).show()
end]]--
require "import"
import "android.widget.Toast"
import "java.io.File"
import "android.content.Intent"
local Ttoast=nil
function toast(view)
  if Ttoast == nil then
    Ttoast = Toast.makeText(activity,tostring(view), Toast.LENGTH_SHORT);
    Ttoast.show();
   else
    Ttoast.setText(view);
    Ttoast.show();
  end
end
function toast_long(view)
  if Ttoast == nil then
    Ttoast = Toast.makeText(activity,tostring(view), Toast.LENGTH_LONG);
    Ttoast.show();
   else
    Ttoast.setText(view);
    Ttoast.show();
  end
end
function is_vertical()--判断横竖屏
  local AWidth=activity.getWidth()--新宽
  local AHeight=activity.getHeight()--新高

  local w=tostring(config):match("w(.-)dp")
  local h=tostring(config):match("h(.-)dp")
  if AWidth<AHeight then
    --toast("竖屏")--竖屏
    return true
   else--info=land
    --toast("横屏")--横屏
    --设置宽度
  return false
  end
  end
--xpcall(,function() toast_long(debug.traceback()) end)--备用

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
--小猿搜题
--toast封装
--[[function toast(msg)
  Toast.makeText(activity,tostring(msg),Toast.LENGTH_SHORT).show()
end]]--
--xpcall(,function() toast_long(debug.traceback()) end)--备用


--函数池--bszydxh
function read_sys_all()
  if file_exists(activity.getLuaDir().."/bszydxh.sys")==false
    
    then
    File(activity.getLuaDir().."").mkdir()
    io.open(activity.getLuaDir().."/bszydxh.sys","w"):write(tostring([[ {}]])):close()
    restart_sys()

   
    toast("欢迎!初始化系统中")

  end
  function to_table(tab)
    local script=[[ return ]]..tab
    local tb=loadstring(script)()
    return tb
  end
  local table=to_table(io.open(activity.getLuaDir().."/bszydxh.sys"):read("*a"))
  --toast (dump(table))
  return table
end

function read_sys(read)
  local table=read_sys_all()
  return table[read]
end

function change_sys(name,change_to)--增删改数据

  local table_all=read_sys_all()
  table_all[name]=change_to
  --toast(dump(table_all))
  io.open(activity.getLuaDir().."/bszydxh.sys","w"):write(tostring(dump(table_all))):close()
end

function restart_sys()
  change_sys("cwt","0")
  change_sys("lastt","0")
  change_sys("bszydxht","0")
  change_sys("aspt","0")
  change_sys("datet","0")
  change_sys("bt","0")
  change_sys("hout","0")
  change_sys("xht","0")
  change_sys("yunt","0")
  change_sys("nett","0")
  change_sys("hitokotot","0")
  change_sys("dianyat","0")
  change_sys("dianwent","0")
  change_sys("dianliangt","0")
  change_sys("azbbt","0")
  change_sys("img",activity.getLuaDir().."/welcome.png")
  change_sys("img_2",activity.getLuaDir().."/welcome.png")
  change_sys("dateS","1623027600")
  change_sys("notice","距离高考还有")
end