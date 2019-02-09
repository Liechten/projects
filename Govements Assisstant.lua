script_name("GOV")
script_description("/mgov - �������� �������.")
script_version("1.6")
script_author("Liechtenstein")
script_dependencies("SAMPFUNCS, SAMP")
require("lib.moonloader")
require("lib.sampfuncs")
local sampev = require 'lib.samp.events'
local imgui = require "imgui"
local key = require "vkeys"
local https = require 'ssl.https'
local dlstatus = require('moonloader').download_status
local window1 = imgui.ImBool(false)
local window2 = imgui.ImBool(false)
local mainwindow = imgui.ImBool(false)
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

jstart = 1

function main()
   while not isSampAvailable() do wait(5000) end
  checkUpdate()
    print("�������� �������...")
    	if sampGetCurrentServerAddress() == "176.32.37.62" then
    		gameServer = "Pears Project 1"
    		srv = 1
			else
    		print("������ �� �������, ������ ������� ���������")
    		sampAddChatMessage("[{00BFFF}GOV]{FFFFFF} � ���������, ������ ������ ���������� ��� ������ �� ������ �������.", 0x046D63)
    		sampAddChatMessage("[{00BFFF}GOV]{FFFFFF} ��������� � �������������, ���� ������ �������� ����������� ������� ������ ��������.", 0x046D63)
    		thisScript():unload()
    		return
    	end
    	print("�������� ��������, ������: "..tostring(gameServer))

 if jstart == 1 then-- ���������� ��������� � ������� ���
    sampAddChatMessage("{ffffff}* [{FFD700}GOV{ffffff}]: {00BFFF}������! ���������� Govement Assistant. ���� - [/mgov].", -1)
    sampAddChatMessage("{ffffff}* [{FFD700}GOV{ffffff}]: {00BFFF}�����������: Liechtenstein.", -1)
	sampAddChatMessage('{ffffff}* [{FFD700}GOV{ffffff}]: {00BFFF}������� ������: '..thisScript().version)
 elseif jstart == 2 then
    sampfuncsLog('{ffffff}* [{949055}'..thisScript().author..' Cop{ffffff}]: {949055}������� ������ : '..thisScript().version)
  end
sampRegisterChatCommand("gupd", updatesc)
sampRegisterChatCommand("cuf", cuffed)
sampRegisterChatCommand("iid", nickid)
sampRegisterChatCommand("get", agetcar)
sampRegisterChatCommand("obis", frisked)
sampRegisterChatCommand("in", carin)
sampRegisterChatCommand("fd", find)
sampRegisterChatCommand("hlp", hlpoga)
sampRegisterChatCommand("version", version)
sampRegisterChatCommand("udost", udost)
sampRegisterChatCommand("med", fheal)
sampRegisterChatCommand("zapr", zaprosreg)
sampRegisterChatCommand("zapokey", zaprokey)
sampRegisterChatCommand("zzapr", zregzapros)
sampRegisterChatCommand('mgov', window)
sampRegisterChatCommand("reload", reload)
sampRegisterChatCommand("dolg", doljnik)
sampRegisterChatCommand("arestdom", arrestdom)
sampRegisterChatCommand("arestbiz", arrestbiz)
sampRegisterChatCommand("udo", zapudo)
sampRegisterChatCommand("odo", zzudo)
sampRegisterChatCommand("odo1", zudo1)
resX, resY = getScreenResolution()
med = lua_thread.create_suspended(heal)
zzap = lua_thread.create_suspended(zregzapros)
while true do wait(0)
imgui.Process = window1.v or window2.v or  mainwindow.v
if odo1 == true then
	wait(1500)
	sampSendChat(" - ���������� �� ��� ����������� ������?")
	wait(1000)
	sampSendChat(" - ��� ����� ������ ��� �����!")
	odo1 = false
end 
if zudo == '2' then
--������� ������ � ���� ��� �� �� ���� �� ��������� ���������
sampSendChat("/do ������� ������ � ����� ����.")
wait(1500)
sampSendChat("/me �������� ���� �� ����,����� ���� ������ ��� � ������ �� ����� ����� ����� � �����.")
wait(1500)
sampSendChat(" -�������� ���������� ����� ������ ����.")
wait(1500)
sampSendChat("/b ��� ID ")
zudo = nil
    end
if zudo == '3' then
sampSendChat("/todo ������.*������� ��������� �����.")
wait(1500)
sampSendChat("/me ��������� �������� �����,�������� ���� �������,����� ���� ������� ����� ������������.")
wait(1500)
sampSendChat("/todo ����������,����������� ����� � ��������.*������� ����� ������������.")
--���� ���� �������� �������.
zudo = nil
    end
if zudo == '4' then
sampSendChat("/todo ������.*������� ����������� ����� � ������������.")
zudo = nil
    end
end
end

function zzudo(param)
 zudo = string.match(param, '(%d+)')
  if zudo ~= nil then
    else
    sampAddChatMessage("{949055}[ RPW ]:{ffffff} �������� ���������� � ��������  {949055}[ /ammo � ]",949055)
    sampAddChatMessage("{949055}[{ffffff} /odo1 - ���������� ��. ������? | 2 - ��������� ���� � ������ � ����",949055)
    sampAddChatMessage("{949055}[{ffffff} 3 - ������ (��������� ������) | 4 - ���� �� ��",949055)
    print("[GOV] ���������� ������� zudo")
  end
end

function zudo1()
	local result, playerID = sampGetPlayerIdByCharHandle(playerPed)
	if result then
		local name = sampGetPlayerNickname(playerID)
		local tryname = string.gsub(name, "_", " ", 1)
		if tryname then
            sampSendChat(string.format(" - ������������, � ��� ������� %s.", tryname))
            odo1 = true
        end
    end
end

function zapudo(param) 
 lua_thread.create(function()
    local nick, nick2, id, article = param:match("(.+)%s+(.+)%s+(.+)%s+(.+)")
  if nick and nick2 and id and article ~= nil then
    sampSendChat('/d ����������� '..nick..' '..nick2..', �� ���� �'..id..', ������ �� ������ '..article..'.')
	wait(1000)
    sampSendChat('/d ����� ������������ ��� ���, ��� ��� �� ����� �������� �����')
    wait(500)
    sampSendChat('/time')
    else 
    sampAddChatMessage("[{1FAEE9}GOV]{ffffff}: ��������� ��� [/udo ��� id ������]", -1)
  end
 end)
end

function arrestdom(param)
lua_thread.create(function()
    local nomer = param:match("(.+)")
  if  nomer ~= nil then
			sampSendChat('/d ����������� '..nick..', �� ���� �, ������ �� ������ '..article..'.')
			wait(1000)
			sampSendChat('/d ����� ������������ ��� ���, ��� ��� �� ����� �������� �����')
    else 
    sampAddChatMessage("[{1FAEE9}GOV]{ffffff}: ��������� ����� �� ����� ���� [/arestdom �]", -1)
  end
 end)
end

function arrestbiz(param)
lua_thread.create(function()
    local nomer = param:match("(.+)")
  if nomer ~= nil then
			sampSendChat('/r ����� ������ ���������� ���� ���������� �������, ����� �� ����� ������� � '..nomer)
			wait(1000)
			sampSendChat('/r � ����� � ��������� �������.')
    else 
    sampAddChatMessage("[{1FAEE9}GOV]{ffffff}: ��������� ����� �� ����� ������� [/arestbiz �]", -1)
  end
 end)
end

function sampev.onSendChat(message) 
if message == ":((!))" then 
return {"�����"} 
end 
end

function doljnik(param)
 lua_thread.create(function()
    local id, summa = param:match("(.+)%s+(.+)")
  if id and summa ~= nil then
    sampSendChat('/me ������ ��� �� ������� �������.')
    wait(1000)
    sampSendChat('/me ���������� ����� ��������� � ���.')
    wait(1000)
    sampSendChat('/me ������ ������ \"���������\", � ���� ������ ��������')
    wait(1000)
    sampSendChat('/me ����� �� ������ \"��������� � �����������.\"')
    wait(1000)
    sampSendChat('/sms '..id..' ������������. ���� ����������� ���������� '..summa..'$.')
    wait(500)
	sampSendChat('/sms '..id..' �������� ������������ ����� � ����� � ��������� �����.')
	wait(500)
	sampSendChat('/sms '..id..' � ������ ���������� ������� �� ����� 500.000$ � ����..')
	wait(500)
	sampSendChat('/sms '..id..' �� ���������� ���� ����� ������ ����� ���������� ���� ���������.')
	wait(500)
	sampSendChat('/sms '..id..' � ������ ���������� ������ �� ����� 1.000.000$, �� ������ ��������� � ������.')
	wait(500)
    sampSendChat('/do ����������� ����������.')
    wait(100)
    sampSendChat('/time')
    else 
    sampAddChatMessage("[{1FAEE9}GOV]{ffffff}: ��������� �������� [/dolg id �����]", -1)
  end
 end)
end

function dotkat()
	sampSendChat("/d // �����")
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------MENU--------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
function apply_custom_style()
			imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    
    style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0

	colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled] = ImVec4(0.60, 0.60, 0.60, 1.00)
	colors[clr.WindowBg] = ImVec4(0.11, 0.10, 0.11, 1.00)
	colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PopupBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.Border] = ImVec4(0.86, 0.86, 0.86, 1.00)
	colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg] = ImVec4(0.21, 0.20, 0.21, 0.60)
	colors[clr.FrameBgHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.FrameBgActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.TitleBg] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.TitleBgActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.MenuBarBg] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ScrollbarBg] = ImVec4(0.00, 0.46, 0.65, 0.00)
	colors[clr.ScrollbarGrab] = ImVec4(0.00, 0.46, 0.65, 0.44)
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.00, 0.46, 0.65, 0.74)
	colors[clr.ScrollbarGrabActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ComboBg] = ImVec4(0.15, 0.14, 0.15, 1.00)
	colors[clr.CheckMark] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.SliderGrab] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.SliderGrabActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.Button] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ButtonHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ButtonActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.Header] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.HeaderHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.HeaderActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
	colors[clr.ResizeGrip] = ImVec4(1.00, 1.00, 1.00, 0.30)
	colors[clr.ResizeGripHovered] = ImVec4(1.00, 1.00, 1.00, 0.60)
	colors[clr.ResizeGripActive] = ImVec4(1.00, 1.00, 1.00, 0.90)
	colors[clr.CloseButton] = ImVec4(1.00, 0.10, 0.24, 0.00)
	colors[clr.CloseButtonHovered] = ImVec4(0.00, 0.10, 0.24, 0.00)
	colors[clr.CloseButtonActive] = ImVec4(1.00, 0.10, 0.24, 0.00)
	colors[clr.PlotLines] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PlotLinesHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PlotHistogram] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PlotHistogramHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.TextSelectedBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.ModalWindowDarkening] = ImVec4(0.00, 0.00, 0.00, 0.00)
end
apply_custom_style()
do
	local cb_render_in_menu = imgui.ImBool(imgui.RenderInMenu)
	local cb_lock_player = imgui.ImBool(imgui.LockPlayer)
	local cb_show_cursor = imgui.ImBool(imgui.ShowCursor)
	local glyph_ranges_cyrillic = nil
function imgui.OnDrawFrame()
if mainwindow.v then window1.v = false window2.v = false
imgui.SetNextWindowSize(imgui.ImVec2(700, 500), imgui.Cond.Always)
imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
imgui.Begin(u8'������� ���� |Govement Assistant| �����������: Liechtenstein.', mainwindow, img_state) --imgui.WindowFlags.NoResize)
imgui.Text(u8(string.format('������� ����: %s', os.date())))
imgui.Text(u8'=========================================================================================')
imgui.Text(u8'Govement Assistant - ��� ����������� ������ ��� ����������� �������������, ������� �������� �� ������!')
imgui.Text(u8'������! � ������� ������ ��  � Pears Project [ 1 ] Role Play �!')
imgui.Text(u8'=========================================================================================')
if imgui.Button(u8'�������') then window1.v = true end
imgui.SameLine() if imgui.Button(u8'����������') then windop.v = true end
imgui.SameLine() if imgui.Button(u8'�����') then window2.v = true end
imgui.Text(u8'=========================================================================================')
if imgui.CollapsingHeader(u8'�����') then
	if imgui.Checkbox(u8'���������� ���� � �����', cb_render_in_menu) then
		imgui.RenderInMenu = cb_render_in_menu.v
	end
	if imgui.Checkbox(u8'������������� ���������', cb_lock_player) then
		imgui.LockPlayer = cb_lock_player.v
	end
	if imgui.Checkbox(u8'���������� ������', cb_show_cursor) then
		imgui.ShowCursor = cb_show_cursor.v
	end
end
imgui.End()
end
	if window1.v then
         window2.v = false mainwindow.v = false 
    imgui.SetNextWindowSize(imgui.ImVec2(500, 500), imgui.Cond.Always)
	  imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
    imgui.Begin(u8'�������� ���� | �����������: Liechtenstein.##w2', window1,img_state, imgui.WindowFlags.NoResize)
		imgui.Text(u8(string.format('������� ����: %s', os.date())))
		imgui.Text(u8'��� ����������� ������ ��� �������������, ������� �������� �� ������!')
		imgui.Text(u8'������! ������ �������� ������ ��� � Pears Project [ 1 ] Role Play �!')
		imgui.Text(u8'=====================�������:=====================')
		imgui.Text(u8'/mgov - ����� ��������������� ����.')
		imgui.Text(u8'/fd [id]-���������� ����� "/find" (����������� ������ 2.5 �������)')
		imgui.Text(u8'/asupd - �������� ������.')
		imgui.Text(u8'/get - ����� ���� � ������ /agetcar')
		imgui.Text(u8'/iid - ������ ��� �� id.')
		imgui.Text(u8'/in [id] [id ����� 1-3] - �������� ����������� � �����')
		imgui.Text(u8'/shv [id] - �������� ������ �� ��������� (��).')
		imgui.Text(u8'/hlp [id] - ��������� ������� � /r (���������� �������).')
		imgui.Text(u8'/version - ������� ������ �������.')
		imgui.Text(u8'/gupd - �������� ������.')
		imgui.Text(u8'/reload - ������������� ������������� ������.')
		imgui.Text(u8'[/zapr] - ������� ��� �� ������ ������� ������/����������� � ��.')
		imgui.Text(u8'[/zapokey] - ������� ��� ��������� ������� �� ������������')
		imgui.Text(u8'[/zzap]- ������� ��� �� ������ ������� ������/����������� � �� � /z.')
		imgui.Text(u8'=======================������===================================')
		if imgui.Button(u8'�����') then
		window2.v = true
		end
		imgui.SameLine()
		    if imgui.Button(u8'�����') then
			           mainwindow.v = true
			        end
			        imgui.End()
			    end
			    if window2.v then 
			        window1.v = false mainwindow.v = false
			        imgui.SetNextWindowSize(imgui.ImVec2(500, 500), imgui.Cond.Always)
			        imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
			        imgui.Begin(u8'������', window2, imgui.WindowFlags.NoResize)
			        if imgui.Button(u8'����������� ������ �� ������ ������������') then os.execute('explorer "https://vk.com/skripter_liechtenstein"') end
					if imgui.Button(u8'��������� ���������') then  os.execute('explorer "https://vk.com/alexanderliecht"') end
			        if imgui.Button(u8'�����') then
			           mainwindow.v = true
			        end
			        imgui.End()
					end
			end
        end

			function window()
			mainwindow.v = not mainwindow.v
			end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

function fheal() med:run() end
function fzzapros() zzap:run() end

function zaprosreg(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/sms '..id..' ������������! � ���� ������� ���� �����������/������ � �.� � �������� ��� ����������!')
wait(500)
sampSendChat('/sms '..id..' ��� ���� ����� � ��� ������ ��� ����� ����� � ���� ��������� ��� �� ������')
wait(500)
sampSendChat('/sms '..id..' ����� �������� ��� ������ ����� ��������� �� ������������, � ��� ��..')
wait(500)
sampSendChat('/sms '..id..' ..���������� �� ��������� ���������.')
end
  end
    end)
      end

function zaprokey(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/sms '..id..' ������������! ��� ������� ���������������!')
wait(500)
sampSendChat('/sms '..id..' ��� ���� ����� � ��� ������ ��� ����� ����� � ���� ��������� ��� �� ������')
wait(500)
sampSendChat('/sms '..id..' ��� ������ ����� ��������� �� ������������, ��..')
wait(500)
sampSendChat('/sms '..id..' ..���������� � ������� �� ��������� ���������.')
end
  end
    end)
      end

function heal()
wait(0)
sampSendChat("/do �� ����� ����� ��������� ������� � �������������.")
wait(700)
sampSendChat("/me ������ ��������� ���� ���������� �����..")
wait(700)
sampSendChat("/me ������ �����, �������� �������� � �����")
wait(700)
sampSendChat("/me ������ ����� � �������� �������� ������ ����� �� �� ����..")
wait(700)
sampSendChat("/me ������� ������� � ����� ������ �������� ������..")
wait(700)
sampSendChat("/me � ������ ������ ��������� ����.")
wait(100)
sampSendChat("/usemed")
end

function zregzapros()
wait(0)
sampSendChat("/z ������������ �������, � ������� ����� ��� �������, � ��������� ����������� �������� ������")
wait(1000)
sampSendChat("/z � ��-����, �� ��������� �� ��� �� ������ �� ������ ��� �������, � �� ��� �������� � ������� ����������")
wait(1000)
sampSendChat("/z � ����� ��� ��������������� �� ��������� �������.")
wait(1000)
sampSendChat("/z ���� ���� �����-�� ��������� ��������.")
wait(1000)
sampSendChat("/z ���� �� ���� ��� �� ������ � ���")
wait(100)
sampSendChat("/b /sms")
end

function hlpoga()
sampSendChat('/r ����� ������! ������� '..kvadrat())
end

function nickid(param)
    id = tonumber(param)
    if param then
        if id ~= nil then
            nick = sampGetPlayerNickname(id)
            result = sampIsPlayerConnected(id)
            if result then
                sampAddChatMessage('{ffffff}* [{1FAEE9}Govement{ffffff}]: Id ������: '..id..' {1FAEE9}��� ������ : '..nick, -1)
            else
                sampAddChatMessage('{ffffff}* [{1FAEE9}Govement{ffffff}]: ����� �������', -1)
            end
        end
    end
end

function find(param)
	if enable then
	enable = false
else
id = tonumber(param)
if param then
	if id ~= nil then
	enable = true
end
	end
		end
			end

      function udost(param)
      lua_thread.create(function()
      id = tonumber(param)
      if param then
          if id ~= nil then
      sampSendChat("/do � �������� ������� ������ ����� �������������..")
      wait(1000)
      sampSendChat("/me ������ ������������� �� �������")
      wait(1000)
      sampSendChat('/ud '..id)
      wait(1000)
      sampSendChat("/me ������� ������������� � ������.")
      else
      sampAddChatMessage('{ffffff}* [{1FAEE9}Govement{ffffff}]: �� �� ����� �������� !', -1)
      end
      	end
      		end)
      			end

function kvadrat()
    local KV = {
        [1] = "�",
        [2] = "�",
        [3] = "�",
        [4] = "�",
        [5] = "�",
        [6] = "�",
        [7] = "�",
        [8] = "�",
        [9] = "�",
        [10] = "�",
        [11] = "�",
        [12] = "�",
        [13] = "�",
        [14] = "�",
        [15] = "�",
        [16] = "�",
        [17] = "�",
        [18] = "�",
        [19] = "�",
        [20] = "�",
        [21] = "�",
        [22] = "�",
        [23] = "�",
        [24] = "�",
    }
    local X, Y, Z = getCharCoordinates(playerPed)
    X = math.ceil((X + 3000) / 250)
    Y = math.ceil((Y * - 1 + 3000) / 250)
    Y = KV[Y]
    local KVX = (Y.."-"..X)
    return KVX
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------OTIGROVKI------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

function agetcar()
sampSendChat("/agetcar")
end

function sampGetPlayerIdByNickname(nick)
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    if tostring(nick) == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1000 do if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == tostring(nick) then return i end end
end
---------
function checkUpdate()
    local text = https.request('https://raw.githubusercontent.com/Liechten/projects/master/gov_version.json')
    if text:byte(1) ~= 123 then return end
    local tab = decodeJson(text)
    local lv = tonumber(tab.latest)
    local cv = tonumber(script.this.version)
    if lv > cv then
        print('[gov] ������������� ����������!')
        lua_thread.create(function()
            downloadUrlToFile('https://github.com/Liechten/projects/raw/master/Govements_Assistant.lua', script.this.path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                print('[gov] ���������� ���������')
                script.this:reload()
                end
            end)
        end)
    end
end
