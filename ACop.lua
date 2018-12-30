script_name("ACOP")
script_description("/ACOP - �������� �������.")
script_version("v2.2")
script_author("Liechtenstein")
script_dependencies("SAMPFUNCS, SAMP")
require("lib.moonloader")
require("lib.sampfuncs")
local sampev = require 'lib.samp.events'
local sampev = require 'lib.samp.events'
local imgui = require "imgui"
local key = require "vkeys"
local window1 = imgui.ImBool(false)
local window2 = imgui.ImBool(false)
local window3 = imgui.ImBool(false)
local window4 = imgui.ImBool(false)
local window5 = imgui.ImBool(false)
local window6 = imgui.ImBool(false)
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

jstart = 1

function main()
   while not isSampAvailable() do wait(5000) end
   print("�������� �������...")
     if sampGetCurrentServerAddress() == "176.32.37.62" then
       gameServer = "Pears Project 1"
       srv = 1
     else
       print("������ �� �������, ������ ������� ���������")
       sampAddChatMessage("[{506077}ACop]{FFFFFF} � ���������, ������ ������ ���������� ��� ������ �� ������ �������.", 0x046D63)
       sampAddChatMessage("[{506077}ACop]{FFFFFF} ��������� � �������������, ���� ������ �������� ����������� ������� ������ ��������.", 0x046D63)
       thisScript():unload()
       return
     end
     print("�������� ��������, ������: "..tostring(gameServer))
  if jstart == 1 then
  sampAddChatMessage("{ffffff}* [{FFCC00}Liechten{ffffff}]: ����������� ������ ��� ����������� ������ �� ������� ��������.",949055)
	sampAddChatMessage("{ffffff}* [{FFCC00}Liechten{ffffff}]: ��� ��������� �������: {ffffff}/acop.",949055)
	sampAddChatMessage("{ffffff}* [{FFCC00}Liechten{ffffff}]: �����������: Liechtenstein.",949055)
	sampAddChatMessage('{ffffff}* [{FFCC00}Liechten{ffffff}]: ������� ������: '..thisScript().version,949055)
	sampAddChatMessage("{ffffff}* [{FFCC00}Liechten{ffffff}]: ������� �� ��������� � ���. ������!",949055)
  elseif jstart == 2 then
    sampfuncsLog('{ffffff}* [{949055}Liechten{ffffff}]: {949055}������� ������: v'..thisScript().version)

  end
sampRegisterChatCommand("sob", sob) -- ������� �� ���������� �������������.
sampRegisterChatCommand("aupd", aupd) -- ����������.
sampRegisterChatCommand("vb", vb) -- ������� �����.
sampRegisterChatCommand("lvl", lvl)
sampRegisterChatCommand("mg", mg)
sampRegisterChatCommand('rb', rnrp) -- ��� (//) ��� /rb
sampRegisterChatCommand('db', dnrp) -- ��� (//) ��� /db
sampRegisterChatCommand("nudo", narudo)
sampRegisterChatCommand("invit", invited)
sampRegisterChatCommand("sobeson", sobes1)
sampRegisterChatCommand("sobesoff", sobes2)
sampRegisterChatCommand("cle", clearerr)
sampRegisterChatCommand("psj", fpsj)
sampRegisterChatCommand("cc", ClearChat)
sampRegisterChatCommand("law", flawyer)
sampRegisterChatCommand("ja", jail)
sampRegisterChatCommand("fs", fskin)
sampRegisterChatCommand("gr", giverank)
sampRegisterChatCommand("nab", nabor)
sampRegisterChatCommand("invitinfo", infosobesms)
sampRegisterChatCommand("oft", offtop)
sampRegisterChatCommand("dmg", departmg)
sampRegisterChatCommand("acop", window)
sampRegisterChatCommand("version", version)
sampRegisterChatCommand("ncarinfo", numbercarinfo)
sampRegisterChatCommand("gnumcar", numbercars)
sampRegisterChatCommand("fdrang", firstrang)
	resX, resY = getScreenResolution()
sobeson = lua_thread.create_suspended(gosobes)
sobesoff = lua_thread.create_suspended(endsobes)
 while true do   wait(0)	imgui.Process = window1.v or window2.v or window3.v or window4.v or window5.v or window6.v
		if sobid == '1' then
			sampSendChat("/todo ������ ���� * ������ ������� � �����")
                        wait(2000)
			sampSendChat("/todo �� �� �������������?* ������ �������� � �����.")
			sobid = nil
		end
		if sobid == '2' then
			sampSendChat("������, ��� ��� �����?")
			sobid = nil
		end
		if sobid == '3' then
			sampSendChat("������, ����� ��� �������?")
			sobid = nil
		end
		if sobid == '4' then
			sampSendChat("/me ���� ������� �� ��� �������� �� ������.")
			wait(2000)
			sampSendChat("/do ������� � �����.")
                        wait(1500)
			sampSendChat("/me ����������� ������ ������� � ������ ���� � ����.")
                        wait(1500)
			sampSendChat("/todo ������� * ��������� ������� � ��������� ���������.")
			sobid = nil
		end
		if sobid == '5' then
			sampSendChat("������ ����� ���� ������ ��������������?")
      wait(1000)
      sampSendChat("/b /ss")
			sobid = nil
		end
		if sobid == '6' then
			sampSendChat("/me ���� ������� �� ��� �������� �� ������.")
			wait(1500)
			sampSendChat("/do ������� � �����.")
                        wait(1500)
			sampSendChat("/me ����������� ������ �������.")
                        wait(1500)
                        sampSendChat("/todo ������� * ��������� �������.")
			sobid = nil
		end
			if sobid == '7' then
            sampSendChat("���-�, ������, ������ �� ������ ������� ��� � ��������?")
			sobid = nil
		end
		if sobid == '8' then
                        sampSendChat("���, ������ ���� �� �������.")
						wait(2000)
						sampSendChat("��� � ���� ��� �������?")
						sobid = nil
		end

		if sobid == '81' then
                        sampSendChat("������, ��� ������ ����� �� � ��?")
						wait(7000)
						sampSendChat("/b ��, ��, ��, ��, �� ��� � /sms")
			sobid = nil
    end

      if sobid == '9' then
              sampSendChat("/z ������, ����������!")
  						wait(7000)
  						sampSendChat("/z �� ������� � �������� ������� ��� �������.")
  			sobid = nil
          end
  		end
		end

function nabor() snabor = 1 end

function sob(param)
  sobid = string.match(param, '(%d+)')
  if sobid ~= nil then
  else
   sampAddChatMessage("{949055}[ ACOP ]:{ffffff} ���������� {949055}[ /sob ����� ] | ������:",949055)
   sampAddChatMessage("{949055}[{ffffff} 1 - ����������� | 2 - ������ ��� | 3 - ��������� �������| 4 - ��������� �������� /pass | 5 - ���������� ������ |{949055}]",949055)
   sampAddChatMessage("{949055}[{ffffff} 6 - �������� ������� | 7 - ������ ������ ������� � ��������?{949055}]",949055)
   sampAddChatMessage("{949055}[{ffffff} 8 - ���� �� ������� 2 | 81 - ���� �� ������� 3 | 9 - ������",949055)
	end
end

function snabor()
  sampSendChat("/lmenu")
  wait(100)
  sampSendDialogResponse(615, 1, 2)
  wait(100)
  sampShowDialog(1376, "test", "test", "test")
  local resultMain, buttonMain, listMain = sampHasDialogRespond(1376)
  if sampIsDialogActive(1376) == true then sampCloseCurrentDialogWithButton(0) end
  nabor = 0
end

function firstrang(param)
  lua_thread.create(function()
 id = tonumber(param)
 if param then
     if id ~= nil then
sampSendChat('/dmute '..id..' 30 // 1 rang � /d')
else
sampAddChatMessage("{949055}[ ACOP ]:{ffffff} ����� ������ ��������� 1 ����� ������� id!")
end
end
end)
end

function offtop(param)
 lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/dmute '..id..' 20 //Offtop')
else
sampSendChat("/d // offtop off|____________________________________Next mute")
sampAddChatMessage("{949055}[ ACOP ]:{ffffff} ����� ������ ��������� �� ������ ������� id!")
  end
end
end)
end

function departmg(param)
 lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/dmute '..id..' 20 ���� // MG')
else
sampSendChat("/d // mg off")
  end
end
end)
end

function sobes1() sobeson:run() end
function sobes2() sobesoff:run() end
function fmyclock() tm:run() end

function ClearChat()
    local memory = require "memory"
    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
end

function fskin(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/forceskin '..id)
end
	end
		end)
			end

function flawyer(param)
    lua_thread.create(function()
    local id, ids = param:match("(.+)%s+(.+)")
	-- %s+(.+)
sampSendChat('/lawyer '..id..' '..ids)
wait(1500)
sampSendChat("/d ����� �����.")
  end)
end

function numbercars(param)
    lua_thread.create(function()
    local id, summa, number = param:match("(.+)%s+(.+)%s+(.+)")
sampSendChat("/do �� ����� ����� ������ ���� � � ��� ������ ������")
wait(1500)
sampSendChat("/me ���� ���� ���� ��� � ������ � ������� ��� �������� ��������")
wait(1500)
sampSendChat("/todo ������� * ��������� �������� ���� � ��������.")
wait(1500)
sampSendChat('/numbercar '..id..' '..summa.. ' '..number)
end)
end

function giverank(param)
    lua_thread.create(function()
    local id, rank = param:match("(.+)%s+(.+)")
	-- %s+(.+)
sampSendChat('/giverank '..id..' '..rank)
  end)
end

function jail()
sampSendChat("/jailed")
end

function fpsj(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat("/do �� ����� ����� ������ �� �������� �� ������.")
wait(1500)
sampSendChat("/me ����� ����� ���������� ������ ����� � ����.")
wait(1500)
sampSendChat("/do � ����������� ����� ������� �����")
wait(1500)
sampSendChat("/me ������ ����� ���� ������� ����� � ������ � ����� :�������:")
wait(1500)
sampSendChat("/me ������ ����� �������� ������� � ������ �����.")
wait(1500)
sampSendChat('/uninvite '..id..' �.�.�.')
else
sampAddChatMessage('{ffffff}* [{FFCF48}Police{ffffff}]: �� �� ����� id!', -1)
end
	end
		end)
			end

function infosobesms(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/sms '..id..' ����� � �������� ������� �������������� ������ �� ����� �������������, � ������� �� ������� � ��������')
wait(500)
sampSendChat('/sms '..id..' ��������: 4 LvL �� ����| ������� ����� | �� ������ Gun warn, Game Wann, ��� � �� LSPD.')
wait(500)
sampSendChat('/sms '..id..' �� ����� ������� ���: ����� �����/�����, � ��, ����� ����� ����� �� �������� (� ���.�: ����� ���� � ��� ��� �� �����)')
end
	end
		end)
			end

function numbercarinfo(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/sms '..id..' ����� ������� ������ ��� ���������� ������������ �� ���� � ����� ����������� PD �� 11 �����...')
wait(300)
sampSendChat('/sms '..id..' ..�������� ����� ��� ����� ������: FBI. ����� ��� ������� ���� � ����� ����� ����� ����� ������� �� ��������')
wait(300)
sampSendChat('/sms '..id..' � ������ ����� ������������ �� ������ �� ����...')
wait(300)
sampSendChat('/sms '..id..' ..����������� - ������� - ����������� ����������� - ����������� ����������� ��')
end
	end
		end)
			end

function gosobes()
wait(0)
sampSendChat("/d ������� ��������������� �����.")
wait(1500)
sampSendChat("/gov �������� ������������� � ��������� ������ ������ ��� ������.")
wait(5500)
sampSendChat("/gov ��� ���� �����: ��, ���������, ������� �� ����, �������� ������� ���.")
wait(1500)
sampSendChat("/d ��������� ��������������� �����.")
wait(300)
sampSendChat("/time")
wait(100)
sampSendChat("/nabor")
wait(1000)
sampAddChatMessage("[{949055}Liechten{ffffff}]:����� 11 ������ ����� ����������� �������� (/action)")
wait(10000)
sampSendChat("/action [��������]������������� � �������� ������� �������� �� 2 �����.")
end

function endsobes()
 wait(0)
sampSendChat("/d ������� ��������������� �����.")
wait(2000)
sampSendChat("/gov ��������! ������������� � ��������� ������ ��� ������� ��������.")
wait(5500)
sampSendChat("/gov ���������� ������� �� ���������.")
wait(2000)
sampSendChat("/d ��������� ��������������� �����.")
wait(300)
sampSendChat("/time")
wait(100)
sampSendChat("/nabor")
wait(1000)
sampAddChatMessage("[{949055}Liechten{ffffff}]: �������� ��������!")
wait(500)
sampSendChat("/delaction ")
end
function invited(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat("/do �� ����� ����� ����� � ������ � �������.")
wait(1500)
sampSendChat("/me ������� ����� ���� � �����..")
wait(1500)
sampSendChat("/me ���� ���� ����� �� ����� ��������� � ������ �� ����� � ���� � ������ ��.")
wait(1500)
sampSendChat("/do �� ����� ����� ������ � ����������� �� ������...")
wait(300)
sampSendChat('/invite '..id)
wait(2000)
sampSendChat("/r // 1 ���� � /color")
end
	end
		end)
			end
function narudo(param)
narudo = tonumber(param)
if param then
    if narudo ~= nil then
        sampSendChat('/dmute '..narudo..' 20 ��������� ������ ���.')
		end
	end
end
function mg()
  local mg =
sampSendChat("��������, �� �� ��� �� ��������� ��� ��� �� ������ �� ���������.")
end
function lvl()
  local lvl =
	sampSendChat("��������, �� ��� �� ��������� ��� ��� �� ���������� ����� 4 ��� � �����.")
	end
function vb()
  local vb =
sampSendChat("��������, �� �� ��� �� ��������� ��� ��� � ��� ��� �������� ������.")
end
function aupd()
  downloadUrlToFile( "https://dl.dropboxusercontent.com/s/5bziwu9osmnqxvk/ACop.luac?dl=0", "moonloader/ACop.luac")
  sampAddChatMessage('{ffffff}* [{949055}Liechten{ffffff}]: {949055} ������ ��������. ������: v'..thisScript().version..' {ffffff}[ /acop ]',0xC1C1C1)
  sampSendChat('/sms Alexander Liechten � ������� ������ '..thisScript().name..' ������ '..thisScript().version)
  end

  function rnrp (param)
	local lenght = string.len(param)
	if lenght == 0 then
		sampAddChatMessage("[ ����� ]: ��� ����� ����� [ /rb ����� ]", 0xC1C1C1)
		return false
	else
		sampSendChat('/r // '..param)
	end
end

function dnrp (param)
	local lenght = string.len(param)
	if lenght == 0 then
		sampAddChatMessage("[ ����� ]: ��� ��� ������������ [ /db ����� ]", 0xC1C1C1)
		return false
	else
		sampSendChat('/d // '..param)
	end
end

function clearerr(param)
clearerr = tonumber(param)
if param then
    if clearerr ~= nil then
        sampSendChat('/clear '..clearerr..' ������')
		end
	end
end

function sampev.onServerMessage(color, msg)
	if msg:find('reloadlll') then
		sampAddChatMessage('{ffffff}* [{1FAEE9}Liechtenstein{ffffff}]: ���������������� ������������ ��������!')
		sampAddChatMessage('{ffffff}* [{1FAEE9}Liechtenstein{ffffff}]: ��������!')
		reloadScripts()
	end
end

function sampev.onServerMessage(color, msg)
	if msg:find('acopreload') then
		sampAddChatMessage('{ffffff}* [{1FAEE9}AGov{ffffff}]: ���������������� ������������ �������!')
		sampAddChatMessage('{ffffff}* [{1FAEE9}AGov{ffffff}]: ������������ ����� ��������� ����������!')
		sampSendChat('/sms Alexander_Liechten ������: '..thisScript().name..' ������: '..thisScript().version..' ��� ������������.')
		thisScript():reload()
	end
end

function apply_custom_style()
	imgui.SwitchContext()
					local style = imgui.GetStyle()
					local colors = style.Colors
					local clr = imgui.Col
					local ImVec4 = imgui.ImVec4

					style.Alpha = 1.0
		style.ChildWindowRounding = 3
		style.WindowRounding = 3
		style.GrabRounding = 1
		style.GrabMinSize = 20
		style.FrameRounding = 3


		colors[clr.Text]                   = ImVec4(0.00, 0.00, 0.00, 1.00);
		colors[clr.TextDisabled]           = ImVec4(0.10, 0.10, 0.10, 1.00);
		colors[clr.WindowBg]               = ImVec4(0.88, 0.88, 0.88, 1.00);
		colors[clr.Border]                 = ImVec4(0.00, 1.00, 0.29, 1.00);
		colors[clr.BorderShadow]           = ImVec4(0.21, 1.00, 0.00, 0.00);
		colors[clr.FrameBg]                = ImVec4(0.00, 0.00, 0.00, 0.18);
		colors[clr.FrameBgHovered]         = ImVec4(1.00, 0.04, 0.04, 0.27);
		colors[clr.FrameBgActive]          = ImVec4(0.96, 0.00, 0.00, 1.00);
		colors[clr.TitleBg]                = ImVec4(0.14, 0.18, 0.21, 0.73);
		colors[clr.TitleBgActive]          = ImVec4(0.00, 0.39, 1.00, 1.00);
		colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.54);
		colors[clr.MenuBarBg]              = ImVec4(0.00, 0.00, 0.00, 0.20);
		colors[clr.ScrollbarBg]            = ImVec4(0.22, 0.29, 0.30, 0.71);
		colors[clr.ScrollbarGrab]          = ImVec4(0.02, 0.00, 1.00, 1.00);
		colors[clr.ScrollbarGrabHovered]   = ImVec4(0.97, 0.97, 0.00, 0.74);
		colors[clr.ScrollbarGrabActive]    = ImVec4(1.00, 0.00, 0.00, 1.00);
		colors[clr.ComboBg]                = ImVec4(0.16, 0.24, 0.22, 0.60);
		colors[clr.CheckMark]              = ImVec4(0.00, 1.00, 1.00, 0.68);
		colors[clr.SliderGrab]             = ImVec4(0.00, 1.00, 1.00, 0.36);
		colors[clr.SliderGrabActive]       = ImVec4(0.00, 1.00, 1.00, 0.76);
		colors[clr.Button]                 = ImVec4(0.61, 0.61, 0.61, 0.46);
		colors[clr.ButtonHovered]          = ImVec4(0.97, 0.39, 0.39, 0.43);
		colors[clr.ButtonActive]           = ImVec4(1.00, 0.00, 0.00, 0.62);
		colors[clr.Header]                 = ImVec4(0.00, 1.00, 1.00, 0.33);
		colors[clr.HeaderHovered]          = ImVec4(0.00, 1.00, 1.00, 0.42);
		colors[clr.HeaderActive]           = ImVec4(0.00, 1.00, 1.00, 0.54);
		colors[clr.ResizeGrip]             = ImVec4(0.00, 1.00, 1.00, 0.54);
		colors[clr.ResizeGripHovered]      = ImVec4(0.00, 1.00, 1.00, 0.74);
		colors[clr.ResizeGripActive]       = ImVec4(0.00, 1.00, 1.00, 1.00);
		colors[clr.CloseButton]            = ImVec4(0.00, 0.78, 0.78, 0.35);
		colors[clr.CloseButtonHovered]     = ImVec4(0.00, 0.78, 0.78, 0.47);
		colors[clr.CloseButtonActive]      = ImVec4(0.00, 0.78, 0.78, 1.00);
		colors[clr.PlotLines]              = ImVec4(0.33, 0.63, 0.63, 1.00);
		colors[clr.PlotLinesHovered]       = ImVec4(0.00, 1.00, 1.00, 1.00);
		colors[clr.PlotHistogram]          = ImVec4(0.00, 1.00, 1.00, 1.00);
		colors[clr.PlotHistogramHovered]   = ImVec4(0.00, 1.00, 1.00, 1.00);
		colors[clr.TextSelectedBg]         = ImVec4(0.19, 0.19, 0.19, 0.22);
		colors[clr.ModalWindowDarkening]   = ImVec4(0.04, 0.10, 0.09, 0.51);
	end
	apply_custom_style()
	do
		local cb_render_in_menu = imgui.ImBool(imgui.RenderInMenu)
		local cb_lock_player = imgui.ImBool(imgui.LockPlayer)
		local cb_show_cursor = imgui.ImBool(imgui.ShowCursor)
		local glyph_ranges_cyrillic = ni
function imgui.OnDrawFrame()
	if window1.v then window2.v = false window3.v = false window4.v = false window5.v = false window6.v = false
imgui.SetNextWindowSize(imgui.ImVec2(650, 200), imgui.Cond.Always)
imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
imgui.Begin(u8'������� ���� |ACop| �����������: Liechtenstein.', window1, img_state, imgui.WindowFlags.NoResize)
imgui.Text(u8(string.format('������� ����: %s', os.date())))
imgui.Text(u8'=========================================================================================')
imgui.Text(u8'ACop - ��� ����������� ������ ��� ������������ �������, ������� �������� �� ������! ')
imgui.Text(u8'������! ������ �������� ������ �� {0088ff} � Pears Project [ 1 ] Role Play �!')
imgui.Text(u8'=========================================================================================')
if imgui.Button(u8'�������') then window2.v = true end
imgui.SameLine() if imgui.Button(u8'������ � �����') then window3.v = true end
imgui.SameLine() if imgui.Button(u8'� ���') then window4.v = true end
imgui.SameLine() if imgui.Button(u8'��������� �� ��������� ������ /d') then window5.v = true end
imgui.SameLine() if imgui.Button(u8'������� ������ � /gov') then window6.v = true end
imgui.Text(u8'=========================================================================================')
imgui.End()
end

if window2.v then
window1.v = false window3.v = false window4.v = false window5.v = false window6.v = false
imgui.SetNextWindowSize(imgui.ImVec2(600, 600), imgui.Cond.Always)
imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
imgui.Begin(u8'������� �������', window2, img_state, imgui.WindowFlags.NoResize)
imgui.Text(u8'��������� ������� �������:')

imgui.Text(u8'���� ������� - {949055}/acop')
imgui.Text(u8'������� ��� ������������� {949055} - {949055}/sob.')
imgui.Text(u8'������� ������ ��� ������: /lvl - ������ �������| /vb - ��� �������� ������ |/mg - ������ ')
imgui.Text(u8'���������� ������� - {949055}/aupd ')
imgui.Text(u8'��� ��� ������������ � ����� (//) {949055}/rb /db')
imgui.Text(u8'������ ��� �� ������ - {949055}/oft ')
imgui.Text(u8'������ ��� �� �� - {949055}/dmg ')
imgui.Text(u8'��������� ������������� - {949055}/fc ')
imgui.Text(u8'������ ���� - {949055}/rg ')
imgui.Text(u8'������ ������� {949055}/version ')
imgui.Text(u8'������������� {949055}/sobeson � /sobesoff ')
imgui.Text(u8'������� ��� ������ � ��� ������������ [/r � /d] �������: [/rb � /db] ')
imgui.Text(u8'������� ��� ������� ���� {949055}[/cc] ')
imgui.Text(u8'��������� ���������� �� ������ {949055}[/invitinfo] ')
imgui.Text(u8'��������� ���������� � ��������� ������� {949055}[/ncarinfo] ')
imgui.Text(u8'������ ������. {949055}[/gnumcar] ')
imgui.Text(u8'���������� ������ �����������. {949055}[/ja] ')
imgui.Text(u8'������ ����� {949055}[/law] ')
imgui.Text(u8'������ ��� ������� ����� /d {949055}[/fdrang] ')
imgui.Text(u8'==============================================================')
if imgui.Button(u8'��������� �������') then
window1.v = true
end
					imgui.End()
			end
			if window3.v then
					window1.v = false window2.v = false window4.v = false window5.v = false window6.v = false
					imgui.SetNextWindowSize(imgui.ImVec2(300, 200), imgui.Cond.Always)
					imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
					imgui.Begin(u8'������ � �����', window3, img_state, imgui.WindowFlags.NoResize)
					if imgui.Button(u8'C����� �� ��. ������ ������������') then os.execute('explorer "https://vk.com/skripter_liechtenstein"') end
					if imgui.Button(u8'��������� ���������') then  os.execute('explorer "https://vk.com/alexanderliecht"') end
					if imgui.Button(u8'��������� �������') then
								window1.v = true
						end
					imgui.End()
			end
	if window4.v then
	window1.v = false
					window1.v = false window2.v = false window3.v = false window5.v = false window6.v = false
	 imgui.SetNextWindowSize(imgui.ImVec2(800, 700), imgui.Cond.Always)
	 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
	 imgui.Begin(u8'���������� � ���', window4, img_state)
	 imgui.Text(u8'1.1 ��������� �� ����� ��. {949055}(��� ���)')
	 imgui.Text(u8'1.2 ���� ������ ������ ���������� (��������, ����.�������� � �.�). {949055}(��� ���),')
	 imgui.Text(u8'1.3 ������� ������� � ������� (��, ����� � �.�).{949055} (��� ���),')
		imgui.Text(u8'1.4 ������������ ������ �������. {949055}(��� ���),')
		imgui.Text(u8'1.5 ������ ��� ������������ ��������� ������ �������. {949055}(��� 30 ����),')
		imgui.Text(u8'1.6 ������������ ��������� ���������� �������. {949055}(��� 20 ����),')
		imgui.Text(u8'1.7 �������� ���� ��� ������� �� ����������� �����. {949055}(��� 15 ����),')
		imgui.Text(u8'1.8 ������������� /clear ��� ������� ������. {949055}(��� 30 ����),')
		imgui.Text(u8'1.9 ������������ ���������� ��� ������������ ��������� � ������/�����������. {949055}(��� 15 ����),')
		imgui.Text(u8'1.10 ������������ ��������� �����, ������������� �����������. {949055}(��� 20 ����),')
		imgui.Text(u8'1.11 ����� ������ �� ������ ����������� ��� ������������� � ������ �����. {949055}(��� 20 ����),')
		imgui.Text(u8'1.12 NonRP �����, ���� ����� ��� �������� �� Role Play �����. {949055}(��� 30 ����),')
		imgui.Text(u8'1.13 ������ ������� ����� ������. {949055}(��� 15 ����),')
		imgui.Text(u8'1.14 ������������ ������ ������������ ���������(3 ���� � �����). ��������� ��� � IC ��� � ��� �����. {949055}(��� 15 ����).')
		imgui.Text(u8'1.15 ������������ ��������� ������. {949055}(��� 20 ����),')
		imgui.Text(u8'1.16 ������������� ������������ ������� � ������ ����� (����, �����, ���� � �.�). {949055}(��� 10 ����),')
		imgui.Text(u8'1.17 �������� ������������� �������� ����, �� ��������� � ����������� ��������������� �������. {949055}(��� 10 ����),')
		imgui.Text(u8'1.18 �������������. (������ FBI). {949055}(��� 15 ����),')
		imgui.Text(u8'1.18 ������������� �� ���������� FBI ��� ���������� ������� ������. {949055}(��� 5 ����),')
		imgui.Text(u8'1.19 ���� ������ ���������� ������� ����� �������� � ������ ������������ ������/�����������. {949055}(��� 30 ����),')
		imgui.Text(u8'1.20 ������������ ������������ ������� ������� �� ������. {949055}(��� 15 ����),')
		imgui.Text(u8'1.21 ������������� �� ���������� NGSA ��� ���������� ������� ������. {949055}(��� 5 ����).')
		imgui.Text(u8'1.22 ���� � ������� ����� � ������/���������� �� ��������� �������. {949055}(��� 5 ����).')
		imgui.Text(u8'1.23 ���������� � �������� ���� ��������� ��� �������� � ���������� (NGSA). {949055}(��� 5 ����).')
		if imgui.Button(u8'��������� �������') then
					window1.v = true
			end
					imgui.End()
			end
			if window5.v then
window1.v = false window2.v = false window3.v = false window4.v = false window6.v = false
imgui.SetNextWindowSize(imgui.ImVec2(700, 700), imgui.Cond.Always)
imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
imgui.Begin(u8'��������� �� ��������� ������ /d', window5, img_state, imgui.WindowFlags.NoResize)
imgui.Text(u8'1.������ - ������������ ����� �� 20 �����. [/oft]')
imgui.Text(u8'2.���������� � �������/������� ��������� - ������������ ����� �� 30 �����. [/drek]')
imgui.Text(u8'3.����������� � ������� ����������� ������������ - ������������ ����� �� 30 �����. [/dosk]')
imgui.Text(u8'5.OOC ����������� - ������������ ����� �� 20 �����. [/dhi]')
imgui.Text(u8'4.������������ ������������� ������� - ������������ ����� �� 20 �����. [/mat]')
imgui.Text(u8'6.������������ ����� ������������ ������ ���������� � ���.���������� - ������������ ����� �� 30 �����. [/frd]')
if imgui.Button(u8'��������� �������') then
window1.v = true
end
imgui.End()
end
if window6.v then
window1.v = false window2.v = false window3.v = false window4.v = false window5.v = false
imgui.SetNextWindowSize(imgui.ImVec2(700, 700), imgui.Cond.Always)
imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
imgui.Begin(u8'������� ������ � /gov', window6, img_state, imgui.WindowFlags.NoResize)
imgui.Text(u8'1. �������� ����� ������� ���.����� - 10 �����')
imgui.Text(u8'2. �������� ������ ���.����� (�������� � ��� �� �������) - 20 �����')
imgui.Text(u8'3. �������� ������� ���.����� (�������� � ��� �� �������)- 5 �����')
imgui.Text(u8'4. ���.������� � ���������� �������� �������� ��� �������.')
imgui.Text(u8'5. ������������ ���������� ����� [/gov ] - 2.')

imgui.Text(u8'����������:')
imgui.Text(u8'�� ��������� ������ ������ �� � ����� ����� �������')
imgui.Text(u8'�������� ������ �� ����������� ��� �� ���������������.')
if imgui.Button(u8'��������� �������') then
window1.v = true
end
imgui.End()
end
end

			function window()
			window1.v = not window1.v
		end
