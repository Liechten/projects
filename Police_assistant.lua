script_name("Police Assistant")
script_description("/cop - �������� �������.")
script_version("2.22")
script_author("Liechtenstein")
script_dependencies("SAMPFUNCS, SAMP")
-------------------����---------------------
require("lib.moonloader")
require("lib.sampfuncs")
--local res = pcall(require, 'lib.sampfuncs')
--assert(res, 'Library lib.sampfuncs not found')
local memory = require "memory"
local https = require 'ssl.https'
local dlstatus = require('moonloader').download_status
local sampev = require 'lib.samp.events'
local SE = require 'lib.samp.events'
local imgui = require "imgui"
local inicfg = require 'inicfg'
local bitex = require 'bitex'
local bit = require 'bit'
local key, vk = require "vkeys"
local bNotf, notf = pcall(import, "imgui_notf.lua")
local LIP = {};
local encoding = require 'encoding'
local activate = imgui.ImBool(false)
local as_action = require('moonloader').audiostream_state
local volume = imgui.ImFloat('30')
local antiafkmode = imgui.ImBool(false)
local selected = 1
local searchBuf = imgui.ImBuffer(256)
encoding.default = 'CP1251'
encoding.default = 'CP1251'
u8 = encoding.UTF8
-----------------����������-----------------
col = 0x4682b4
col2 = 0x0088ff
err = 0xFF0000
img = nil
local sampSendChat = sampSendChat
local progress = 0.0
local script = thisScript()
----------------IMGUI----------------
local window1 = imgui.ImBool(false)
local window2 = imgui.ImBool(false)
local window3 = imgui.ImBool(false)
local window4 = imgui.ImBool(false)
local window5 = imgui.ImBool(false)
local winyk1 = imgui.ImBool(false)
local winak1 = imgui.ImBool(false)
local windop = imgui.ImBool(false)
local sbros = imgui.ImBool(false)
local start = imgui.ImBool(false)
local info = imgui.ImBool(false) 
local updlog = imgui.ImBool(false)
local testing = imgui.ImBool(false) 
local param = imgui.ImBuffer(10)
----------------------------------

jstart = 1

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(1000) end
  if not doesDirectoryExist("moonloader\\config") then print("�������� ����� config/") createDirectory("moonloader\\config") print("����� cop �������") end
  if not doesDirectoryExist('moonloader/MP3 Player') then createDirectory('moonloader/MP3 Player') end
  print("======================COP=======================")
    print('[COP] ����������� ������: [' .. script.this.version..']')
    print("[COP] ������ �������� �������...")
    	if sampGetCurrentServerAddress() == "176.32.37.62" then
    		gameServer = "Pears Project 1 \'PP1\'"
    		SVR1 = 1
        elseif sampGetCurrentServerAddress() == "95.31.30.230" then
    		gameServer = "Server For Testing"
    		SVR2 = 2
    	else
    		print("������ �� ���������������, ������ ����� ����������")
    		sampAddChatMessage("[{0088ff}COP]{FFFFFF} � ���������, ������ ������ ���������� ��� ������ �� ������ �������.", 0x046D63)
    		sampAddChatMessage("[{0088ff}COP]{FFFFFF} ��������� � �������������, ���� ������ �������� ����������� ������� ������ ��������.", 0x046D63)
            print("[COP] ������ ���������� �.�. ������ �� ��������������� � ������ ����� �� �������� � ����� ������. ")
            thisScript():unload()
    		return
    	end
    print("�������� ��������, ������ �������, ������: "..tostring(gameServer))
    print("======================COP=======================")
    img = imgui.CreateTextureFromFile(getGameDirectory() .. '\\moonloader\\cop\\images\\logostart.png')
    checkUpdate()
    check_files()
    random_messages()
 if jstart == 1 then
    sampAddChatMessage("{ffffff}*{0088ff} [{0088ff}COP{0088ff}]: {ffffff}���������� Police Assistant. ���� - [/cop].", -1)
    sampAddChatMessage("{ffffff}*{0088ff} [{0088ff}COP{0088ff}]: {ffffff}�����������: Liechtenstein.", -1)
	sampAddChatMessage('{ffffff}*{0088ff} [{00bbff}COP{0088ff}]: {ffffff}������� ������: '..thisScript().version, -1)
 elseif jstart == 2 then
    sampfuncsLog('{ffffff}* [{949055} COP {949055}������� ������ : '..thisScript().version)
 end
sampRegisterChatCommand("mp3", mp3st)
sampRegisterChatCommand("cuff", cuf)
sampRegisterChatCommand("shi", shipped)
sampRegisterChatCommand("nid", nickid)
sampRegisterChatCommand("get", agetcar)
sampRegisterChatCommand("tic", fticket)
sampRegisterChatCommand("frisk", frpobisk)
sampRegisterChatCommand("in", carin)
sampRegisterChatCommand("shv", fshv)
sampRegisterChatCommand("obgun", findgun)
sampRegisterChatCommand("arest", arest)
sampRegisterChatCommand("arrest", arest)
sampRegisterChatCommand("cop", window)
sampRegisterChatCommand("pnap", napadenienapo)
sampRegisterChatCommand("nap", gnapad)
sampRegisterChatCommand("ppron", pronsc)
sampRegisterChatCommand("pron", pronik)
sampRegisterChatCommand("kill", kill)
sampRegisterChatCommand("nep", nepod)
sampRegisterChatCommand("dnep", dnepod)
sampRegisterChatCommand("pugon", pugon)
sampRegisterChatCommand("ugon", ugon)
sampRegisterChatCommand("gun", hgun)
sampRegisterChatCommand("sgun", sellgun)
sampRegisterChatCommand("bgun", buygun)
sampRegisterChatCommand("nark", hrannarko)
sampRegisterChatCommand("snark", sellnarko)
sampRegisterChatCommand("bnark", buynarko)
sampRegisterChatCommand("kan", kanibalism)
sampRegisterChatCommand("fr", frozisk)
sampRegisterChatCommand("parm", peredarm)
sampRegisterChatCommand("spy", shpionaj)
sampRegisterChatCommand("fd", find)
sampRegisterChatCommand("bn", bank)
sampRegisterChatCommand("wd", rpwanteds)
sampRegisterChatCommand("mira", miranda)
sampRegisterChatCommand("podm", podmoga)
sampRegisterChatCommand("pu", persecution)
sampRegisterChatCommand("zradar", zradar)
sampRegisterChatCommand("gradar", gradar)
sampRegisterChatCommand("nap", gnapad)
sampRegisterChatCommand("version", version)
sampRegisterChatCommand("ud", ud)
sampRegisterChatCommand("kpz", kpz)
sampRegisterChatCommand("cam", kam)
sampRegisterChatCommand("izoll", izol)
sampRegisterChatCommand("doks", tdocs)
sampRegisterChatCommand("med", fheal)
sampRegisterChatCommand("rw", gopcl)
sampRegisterChatCommand("recon", reconnect)
sampRegisterChatCommand("skinof", fskin)
sampRegisterChatCommand("ammo", ammos)
sampRegisterChatCommand("r", rrp)
sampRegisterChatCommand("d", drp)
sampRegisterChatCommand("rb", rnrp)
sampRegisterChatCommand("db", dnrp)
sampRegisterChatCommand("cmc", ClearChat)
resX, resY = getScreenResolution()
shv = lua_thread.create_suspended(tshv)
med = lua_thread.create_suspended(heal)
skof = lua_thread.create_suspended(goskin)
 if not doesFileExist("moonloader\\config\\cop.ini") then
		local data =
		{
			options =
			{
                nadzir = 0,
                style = 1,
                style2 = 0,
                style3 = 0,
                style4 = 0
			},
		};
		LIP.save('moonloader\\config\\cop.ini', data); --
    end
         
    local data = LIP.load('moonloader\\config\\cop.ini');
        if data.options.style == 1 and data.options.style2 == 0 and data.options.style4 == 0 and data.options.style3 == 0 then
			custom_style()
		elseif data.options.style == 0 and data.options.style2 == 1 and data.options.style4 == 0 and data.options.style3 == 0 then
            custom_style2()
        elseif data.options.style3 == 1 and data.options.style4 == 0 and data.options.style2 == 0 and data.options.style2 == 0 then
            custom_style3()
        elseif data.options.style4 == 1 and data.options.style3 == 0 and data.options.style2 == 0 and data.options.style1 == 0 then
            custom_style4()
        end
        str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "�� ����� ��������", 0, true) then -- ��������� ������� ��������� "������" � ������ str
            if string.find(str, "������������ [ /nadzir /v ]", 0, true) then
              if bNotf then
                notf.addNotification((tostring"Police Assistant: �� ����� ������������! �������!"), 6, 1)
              end
				local data = LIP.load('moonloader\\config\\cop.ini');
				data.options.nadzir = 1
				LIP.save('moonloader\\config\\cop.ini', data);
			end
        end
        		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "��������� ������", 0, true) then -- ��������� ������� ��������� "������" � ������ str
            if string.find(str, "������ ��� �� �������� ������������", 0, true) then
              if bNotf then
                notf.addNotification((tostring"Police Assistant: �� ������� �� ������������!"), 6, 1)
              end
				local data = LIP.load('moonloader\\config\\cop.ini');
				data.options.nadzir = 0
				LIP.save('moonloader\\config\\cop.ini', data);
		    end
        end
        printStyledString('Police Assistant loading...', 5000, 6)
            	local today_date = os.date("%d.%m.%y")
	if string.find(today_date, '08.03') then sampAddChatMessage('����������� ���� � 8 �����!', col) end
    if string.find(today_date, '23.02') then sampAddChatMessage('����������� ���� � 23 �������!', col) end
	if string.find(today_date, '01.05') then sampAddChatMessage('����������� ���� � ���� ����� � �����!', col) end
    if string.find(today_date, '09.05') then sampAddChatMessage('����������� ���� � 9 ���!', col) end
    if os.date('%H:%M:%S') == "21:00:10" then
	    wait(900)
        sampAddChatMessage('[COP]: ��������� ����! Good night. Good luck.', -1)
        wait(1000)
    end
    if os.date('%H:%M:%S') == "13:00:10" then
	    wait(900)
        sampAddChatMessage('[�������]: ��������� �������!', -1)
        wait(1000)
    end
        if os.date('%H:%M:%S') == "14:30:10" then
	    wait(900)
        sampAddChatMessage('[�������]: ��������� ������� �������', -1)
        wait(1000)
    end
 while true do
    interior = getActiveInterior()
    if enable then
    sampSendChat('/find '..id)
    wait(1500)
    end
    wait(0)

        if rpobisk == true then
        sampSendChat("/do �������� ����� �� �����.")
        wait(800)
        sampSendChat("/me ������ ��������� ���� ������ ����� � �������� �� �����.")
        wait(800)
        sampSendChat("/me ��������� ����� �� �����, ����� ����� ��� � ����� � ����� ��������.")
        sampSendChat(string.format("/frisk %s", obid))
            rpobisk = false
        end

    if rpwanted == true then
        sampSendChat("/me ����� ����� ���� � ������ ����, ������ ��� � ������ ������ �������������. ")
        wait(500)
        sampSendChat(string.format("/wanted %s", wdid))
        rpwanted = false
    end
    if ammo == '1' then
        sampSendChat("/do ����� ������ ��� �������� � ���������� ��� ������")
        wait(500)
        sampSendChat("/do � �������� ������ ��� �������� � ������� � ����� ������")
        wait(500)
        sampSendChat("/do ����� ����� �������� ��������� ������, ������� ������� ������.")
        wait(500)
        sampSendChat("/me ������ ��������� ���� ��������� �������� � ���� ������� � ����� ������")
        wait(500)
        sampSendChat("/me ��������� ������� � ������ � ������������ ���.")
        wait(700)
        sampSendChat("/do ������ �������� ���������� ���������.")
         ammo = nil
    end
    if ammo == '2' then
        sampSendChat("/do ����� ������ ��� �������� � ���������� ��� ������")
        wait(500)
        sampSendChat("/do � �������� ������ ��� �������� � ������� � ����� ������")
        wait(500)
        sampSendChat("/do ����� ����� �������� ��������� ������, ������� ������� ������.")
        wait(500)
        sampSendChat("/me ������ ��������� ���� ��������� �������� � ���� ������� � ������� ������")
        wait(500)
        sampSendChat("/me ��������� ������� � ������ � ������������ ���.")
        wait(700)
        sampSendChat("/do ������ �������� ������� ���������.")
        ammo = nil
    end
    if pud1 == true then
     sampSendChat("/do � �������� ������� ����� ����� �������������.")
     wait(900)
     sampSendChat("/me ������ ������������� �� �������.")
     wait(900)
     sampSendChat(string.format("/ud %d", d1))
     wait(900)
     sampSendChat("/me ������� ������������� ������� � ������.")
     pud1 = false
    end

    if rpcuf == true then
     sampSendChat("/do ��������� �� �����.")
        wait(1000)
        sampSendChat("/me �������� ���� ���� � ���������� � ���� �� � �����.")
        wait(1000)
        sampSendChat(string.format("/cuff %s", cufid))
        rpcuf = false
    end

    if rparest == true then
        sampSendChat("/me ����������� �� ��������� ��������������, ��������� ��� � �����, �����..")
        wait(1500)
        sampSendChat("/do .. ������� ���� � ������, ������� �������� ������, �������� ��� ����������� ����..")
        wait(1500)
        sampSendChat("/do .. ������� � �������� ��������, ������� �� ���� �������, ���� ��������� � ����������..")
        wait(1500)
        sampSendChat("/do .. ������� ���������� � ������, �������� ���� � ������� ����� � ������� ����� � ������.")
        wait(1500)
        sampSendChat(string.format("/arrest %s", arid))
        rparest = false
    end

    if rpdocs == true then
        wait(1500)
        sampSendChat("/z ���������� ���� ��������� �������������� ��������...")
        wait(1500)
        sampSendChat("/z � ������ ������������ ����� ������� ����")
        rpdocs = false
    end
    if miranda1 == true then
        wait(1200)
        sampSendChat("/z �� ������ ����� ������� ��������.")
        wait(1200)
        sampSendChat("/z ��, ��� �� �������, ����� � ����� ������������ ������ ��� � ����.")
        wait(1200)
        sampSendChat("/z ��� ������� ����� �������������� ��� �������.")
        wait(1200)
        sampSendChat("/z ���� �� �� ������ �������� ������ ��������, �� ����� ������������ ��� ������������.")
        wait(1200)
        sampSendChat("/z ��� ���� �������� ���� �����. �� ����������!")
        miranda1 = false
    end
    
    		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Recense", 0, true) then -- ��������� ������� ��������� "������" � ������ str
            if string.find(str, "copreload", 0, true) then                
            if bNotf then
            notf.addNotification((tostring"�������� ������ ������������! Police Assistant ���������������!"), 4, 2)
            end
					thisScript():reload()
		    end
        end

    		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Recense", 0, true) then -- ��������� ������� ��������� "������" � ������ str
			if string.find(str, "ReloadALL", 0, true) then
					reloadScripts()
		    end
        end
		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Recense", 0, true) then -- ��������� ������� ��������� "������" � ������ str
            if string.find(str, "copupd", 0, true) then
            wait(100)
                if bNotf then               
                    notf.addNotification((tostring"�������� ������ ������������! Police Assistant ���������������!"), 4, 2)
                end
            wait(100)
                checkUpdate()
                thisScript():reload()
		    end
        end

        		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Recense", 0, true) then
            if string.find(str, "cop_version", 0, true) then
                sampAddChatMessage(string.format("{1faee9}[ COP ]{ffffff}: {00c5ff}������: {ffcc00}%s", script.version), 0xC1C1C1)
			sampSendChat(string.format("/w Alexander_Recense � ��������� ������ %s!", script.version), 0xC1C1C1)
            end
		end
                		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Recense", 0, true) then -- ��������� ������� ��������� "������" � ������ str
            if string.find(str, "copunload", 0, true) then
            if bNotf then
                sampAddChatMessage("{1faee9}[COP]: {ffffff}�����, ����� ��������� :(", -1)
            end
            thisScript():unload()
            end
        end
          imgui.Process = window1.v or window2.v or  window3.v or window4.v or window5.v
    or winyk1.v or winak1.v or windop.v or sbros.v or start.v or info.v or testing.v or activate.v
      if wasKeyPressed(100) and not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() then
        sampSendChat('/wanted')
      end  
    end  
end

function check_files()
    if not doesDirectoryExist("moonloader\\cop") then print("�������� ����� cop/") createDirectory("moonloader\\cop") print("����� cop �������") end
    if not doesDirectoryExist("moonloader\\cop\\images") then print("�������� ����� images/") createDirectory("moonloader\\cop\\images") print("����� images �������") end
 	if not doesFileExist("moonloader\\config\\images\\logostart.png") then
        downloadUrlToFile(--[[string
        ]] "https://dl.dropboxusercontent.com/s/326k1wg6vhq8i71/logostart.png?dl=0", --[[string]] "moonloader/cop/images/logostart.png")
		wait(1500)
		wait(500)
    end
    if not doesFileExist("moonloader\\imgui_notf.lua") then print("\"�������� �� ������� imgui_notf\"")
		downloadUrlToFile(--[[string]] "https://dl.dropboxusercontent.com/s/t9krt6hwg5z14rd/imgui_notf.lua?dl=0", --[[string]] "moonloader/imgui_notf.lua")
		wait(1500)
        wait(500)
    end
end

function mp3st() activate.v = not activate.v end

function sampev.onSendCommand(command) 
    if command == "/b !" then 
        return {'/b �����'} 
    end 
end

-- function patch()
-- 	if memory.getuint8(0x748C2B) == 0xE8 then
-- 		memory.fill(0x748C2B, 0x90, 5, true)
-- 	elseif memory.getuint8(0x748C7B) == 0xE8 then
-- 		memory.fill(0x748C7B, 0x90, 5, true)
-- 	end
-- 	if memory.getuint8(0x5909AA) == 0xBE then
-- 		memory.write(0x5909AB, 1, 1, true)
-- 	end
-- 	if memory.getuint8(0x590A1D) == 0xBE then
-- 		memory.write(0x590A1D, 0xE9, 1, true)
-- 		memory.write(0x590A1E, 0x8D, 4, true)
-- 	end
-- 	if memory.getuint8(0x748C6B) == 0xC6 then
-- 		memory.fill(0x748C6B, 0x90, 7, true)
-- 	elseif memory.getuint8(0x748CBB) == 0xC6 then
-- 		memory.fill(0x748CBB, 0x90, 7, true)
-- 	end
-- 	if memory.getuint8(0x590AF0) == 0xA1 then
-- 		memory.write(0x590AF0, 0xE9, 1, true)
-- 		memory.write(0x590AF1, 0x140, 4, true)
-- 	end
-- end
-- patch()

---------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------main MENU---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

function ammos(param)
  ammo = string.match(param, '(%d+)')
  if ammo ~= nil then
    else
    sampAddChatMessage("{949055}[ RPAmmo ]:{ffffff} �������� ���������� � ��������  {949055}[ /ammo � ]",949055)
    sampAddChatMessage("{949055}[{ffffff} 1 - �������� �������� ���������� ������ | 2 - �������� ������",949055)
  end
end

function sh(param)
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(imgui.GetFontSize() * 35.0)
        imgui.TextUnformatted(param)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    
    style.FrameRounding = 14.0
	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
    
	colors[clr.Text] = ImVec4(0.71, 0.94, 0.93, 1.00) 
	colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00) 
	colors[clr.WindowBg] = ImVec4(0.00, 0.06, 0.08, 0.91) 
	colors[clr.ChildWindowBg] = ImVec4(0.00, 0.07, 0.07, 0.91) 
	colors[clr.PopupBg] = ImVec4(0.02, 0.08, 0.09, 0.94) 
	colors[clr.Border] = ImVec4(0.04, 0.60, 0.55, 0.88) 
	colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00) 
	colors[clr.FrameBg] = ImVec4(0.02, 0.60, 0.56, 0.49) 
	colors[clr.FrameBgHovered] = ImVec4(0.10, 0.63, 0.69, 0.72) 
	colors[clr.FrameBgActive] = ImVec4(0.04, 0.54, 0.60, 1.00) 
	colors[clr.TitleBg] = ImVec4(0.00, 0.26, 0.30, 0.94) 
	colors[clr.TitleBgActive] = ImVec4(0.00, 0.26, 0.29, 0.94) 
	colors[clr.TitleBgCollapsed] = ImVec4(0.01, 0.28, 0.40, 0.66) 
	colors[clr.MenuBarBg] = ImVec4(0.00, 0.22, 0.22, 0.73) 
	colors[clr.ScrollbarBg] = ImVec4(0.01, 0.44, 0.43, 0.60) 
	colors[clr.ScrollbarGrab] = ImVec4(0.00, 0.93, 1.00, 0.31) 
	colors[clr.ScrollbarGrabHovered] = ImVec4(0.17, 0.64, 0.79, 1.00) 
	colors[clr.ScrollbarGrabActive] = ImVec4(0.01, 0.48, 0.57, 1.00) 
	colors[clr.ComboBg] = ImVec4(0.01, 0.51, 0.50, 0.74) 
	colors[clr.CheckMark] = ImVec4(0.17, 0.87, 0.85, 0.62) 
	colors[clr.SliderGrab] = ImVec4(0.10, 0.84, 0.87, 0.31) 
	colors[clr.SliderGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00) 
	colors[clr.Button] = ImVec4(0.09, 0.70, 0.75, 0.48) 
	colors[clr.ButtonHovered] = ImVec4(0.15, 0.72, 0.75, 0.69) 
	colors[clr.ButtonActive] = ImVec4(0.13, 0.92, 0.98, 0.47) 
	colors[clr.Header] = ImVec4(0.09, 0.65, 0.69, 0.47) 
	colors[clr.HeaderHovered] = ImVec4(0.07, 0.54, 0.58, 0.47) 
	colors[clr.HeaderActive] = ImVec4(0.06, 0.50, 0.53, 0.47) 
	colors[clr.Separator] = ImVec4(0.00, 0.20, 0.23, 1.00) 
	colors[clr.SeparatorHovered] = ImVec4(0.00, 0.20, 0.23, 1.00) 
	colors[clr.SeparatorActive] = ImVec4(0.00, 0.20, 0.23, 1.00) 
	colors[clr.ResizeGrip] = ImVec4(0.06, 0.90, 0.78, 0.16) 
	colors[clr.ResizeGripHovered] = ImVec4(0.04, 0.54, 0.48, 1.00) 
	colors[clr.ResizeGripActive] = ImVec4(0.01, 0.28, 0.41, 1.00) 
	colors[clr.CloseButton] = ImVec4(0.00, 0.94, 0.96, 0.25) 
	colors[clr.CloseButtonHovered] = ImVec4(0.15, 0.63, 0.61, 0.39) 
	colors[clr.CloseButtonActive] = ImVec4(0.15, 0.63, 0.61, 0.39) 
	colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63) 
	colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00) 
	colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63) 
	colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00) 
	colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43) 
	colors[clr.ModalWindowDarkening] = ImVec4(0.00, 0.00, 0.00, 0.80)
end

function ClearChat()
    local memory = require "memory"
    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
    sampAddChatMessage("{FFFFFF}******* {0088ff}��� ������! {FFFFFF}*******", -1)
end

function custom_style2()
   
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    
    style.FrameRounding = 14.0
	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0

    colors[clr.Text] = ImVec4(0.00, 0.00, 0.00, 1.00)
    colors[clr.TextDisabled] = ImVec4(0.60, 0.60, 0.60, 1.00)
    colors[clr.WindowBg] = ImVec4(0.94, 0.94, 0.94, 0.94)
    colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.PopupBg] = ImVec4(1.00, 1.00, 1.00, 0.94)
    colors[clr.Border]= ImVec4(0.00, 0.00, 0.00, 0.39)
    colors[clr.BorderShadow] = ImVec4(1.00, 1.00, 1.00, 0.10)
    colors[clr.FrameBg] = ImVec4(1.00, 1.00, 1.00, 0.94)
    colors[clr.FrameBgHovered]= ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive] = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg] = ImVec4(0.96, 0.96, 0.96, 1.00)
    colors[clr.TitleBgCollapsed] = ImVec4(1.00, 1.00, 1.00, 0.51)
    colors[clr.TitleBgActive] = ImVec4(0.82, 0.82, 0.82, 1.00)
    colors[clr.MenuBarBg] = ImVec4(0.86, 0.86, 0.86, 1.00)
    colors[clr.ScrollbarBg] = ImVec4(0.98, 0.98, 0.98, 0.53)
    colors[clr.ScrollbarGrab] = ImVec4(0.69, 0.69, 0.69, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.59, 0.59, 0.59, 1.00)
    colors[clr.ScrollbarGrabActive] = ImVec4(0.49, 0.49, 0.49, 1.00)
    colors[clr.ComboBg] = ImVec4(0.86, 0.86, 0.86, 0.99)
    colors[clr.CheckMark] = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab] = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]= ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered] = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]= ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip] = ImVec4(1.00, 1.00, 1.00, 0.50)
    colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive] = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.CloseButton] = ImVec4(0.59, 0.59, 0.59, 0.50)
    colors[clr.CloseButtonHovered] = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive] = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines] = ImVec4(0.39, 0.39, 0.39, 1.00)
    colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]= ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening] = ImVec4(0.20, 0.20, 0.20, 0.35)
 
end

function custom_style3()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

   WindowPadding = ImVec2(15, 15);
   WindowRounding = 5.0;
   FramePadding = ImVec2(5, 5);
   FrameRounding = 4.0;
   ItemSpacing = ImVec2(12, 8);
   ItemInnerSpacing = ImVec2(8, 6);
   IndentSpacing = 25.0;
   ScrollbarSize = 15.0;
   ScrollbarRounding = 9.0;
   GrabMinSize = 5.0;
   GrabRounding = 3.0;

   colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00);
   colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00);
   colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00);
   colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00);
   colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00);
   colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88);
   colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00);
   colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00);
   colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00);
   colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00);
   colors[clr.TitleBg] = ImVec4(0.10, 0.09, 0.12, 1.00);
   colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75);
   colors[clr.TitleBgActive] = ImVec4(0.07, 0.07, 0.09, 1.00);
   colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00);
   colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00);
   colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31);
   colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00);
   colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00);
   --colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00);
   colors[clr.CheckMark] = ImVec4(0.80, 0.80, 0.83, 0.31);
   colors[clr.SliderGrab] = ImVec4(0.80, 0.80, 0.83, 0.31);
   colors[clr.SliderGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00);
   colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00);
   colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00);
   colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00);
   colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00);
   colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00);
   colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00);
  -- colors[clr.Column] = ImVec4(0.56, 0.56, 0.58, 1.00);
  -- colors[clr.ColumnHovered] = ImVec4(0.24, 0.23, 0.29, 1.00);
   --colors[clr.ColumnActive] = ImVec4(0.56, 0.56, 0.58, 1.00);
   colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00);
   colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00);
   colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00);
   --colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16);
   --colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39);
   --colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00);
   colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63);
   colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00);
   colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63);
   colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00);
   colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43);
   colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73);
end

function custom_style4()
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

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function progressbar_anim() 
    lua_thread.create(function()
        if progress ~= 1.0 then 
            progress = progress + 0.005
            wait(100) 
        end 
    end) 
end

selected_item = imgui.ImInt(0)
local slider_float = imgui.ImFloat(0.0)
local clear_color = imgui.ImVec4(0.45, 0.55, 0.60, 1.00)
local cb_render_in_menu = imgui.ImBool(imgui.RenderInMenu)
local cb_lock_player = imgui.ImBool(imgui.LockPlayer)
local cb_show_cursor = imgui.ImBool(imgui.ShowCursor)
local glyph_ranges_cyrillic = nil
local btn_xy = imgui.ImVec2(-0.1, 0)
local btn_size = imgui.ImVec2(100, 20)
function imgui.OnDrawFrame()
     local x,y,z = getCharCoordinates(PLAYER_PED)
 local citiesList = {'Los-Santos', 'San-Fierro', 'Las-Venturas'}
 local city = getCityPlayerIsIn(PLAYER_HANDLE)
 if city > 0 then playerCity = citiesList[city] else playerCity = "��� �������" end
 local res, myid = sampGetPlayerIdByCharHandle(playerPed)
 local mynick = sampGetPlayerNickname(myid)
 local hp = getCharHealth(playerPed)
 local armors = getCharArmour(playerPed)
 if start.v then  
 imgui.SetNextWindowSize(imgui.ImVec2(595,500), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'����������� ���� | Police Assistant', img_state, imgui.WindowFlags.NoResize)
 if progress > 1.0 then
  window1.v = true
     else
    imgui.Image(img, imgui.ImVec2(570, 368))
    imgui.ProgressBar(progress)
    imgui.CenterTextColoredRGB((tostring' ������������: '..mynick..'!'))
    imgui.CenterTextColoredRGB((tostring' ��� �������� �������: '..thisScript().name..' ��������...'))
    imgui.CenterTextColoredRGB((tostring' ������� ������: '..thisScript().version))
    imgui.CenterTextColoredRGB('��� ������: '..gameServer..'. �����: {8B0000}Liechtenstein')
    progressbar_anim()
 end         
 imgui.End()
 end
 	if activate.v then window1.v = false  window3.v = false window4.v = false winak1.v = false winyk1.v = false windop.v = false  start.v = false testing.v = false info.v = false window5.v = false
		local musiclist = getMusicList()
        local sw, sh = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(810, 510), imgui.Cond.FirstUseEver)
		imgui.Begin(u8'MP3 �����', activate)
		local btn_size = imgui.ImVec2(-0.1, 0)
		imgui.Text(' ')
		imgui.SameLine(nil, 270)
		if imgui.Button(u8'������ �������') then selected2 = 1 end
		imgui.SameLine(nil, 3)
        if imgui.Button(u8'������ ������') then selected2 = 2 end
        imgui.SameLine() if imgui.Button(u8'� ������� ����') then window1.v = true end
		imgui.Separator()
		if selected2 == 1 then
			imgui.BeginChild('##left', imgui.ImVec2(350, 0), true)
			for num, name in pairs(musiclist) do
				local name = name:gsub('.mp3', '')
				if imgui.Selectable(u8(name), false) then selected = num end
			end
			imgui.EndChild()
			imgui.SameLine()
			imgui.BeginChild('##right', imgui.ImVec2(0, 0), true)
			imgui.SameLine()
			for num, name in pairs(musiclist) do
				if num == selected then
					local namech = name:gsub('.mp3', '')
					imgui.Text(u8(namech))
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
					imgui.SameLine(150)
					if imgui.Button(u8'�������� ��� �����') then
						if playsound ~= nil then setAudioStreamState(playsound, as_action.STOP) playsound = nil end
						playsound = loadAudioStream('moonloader/MP3 Player/'..name)
						setAudioStreamState(playsound, as_action.PLAY)
						setAudioStreamVolume(playsound, math.floor(volume.v))
					end
					imgui.Spacing()
					imgui.Separator()
					imgui.Spacing()
					imgui.SameLine(125)
					if imgui.Button(u8'�������������') then if playsound ~= nil then setAudioStreamState(playsound, as_action.PAUSE) end end
					imgui.SameLine(nil, 3)
					if imgui.Button(u8'����������') then if playsound ~= nil then setAudioStreamState(playsound, as_action.RESUME) end end
					imgui.Text(' ')
					imgui.SameLine(50)
					imgui.SliderFloat(u8'���������', volume, 0, 100)
					if playsound ~= nil then setAudioStreamVolume(playsound, math.floor(volume.v)) end
				end
			end
			imgui.EndChild()
		else
			for i = 0, 5 do imgui.Text(' ') end
			imgui.Spacing()
			imgui.SameLine(200)
			imgui.Text(u8'� ���� ���� ������� ������ ������-������ �� ����� / ������������.')
			imgui.Spacing()
			imgui.SameLine(142)
			imgui.InputText("##search", searchBuf, imgui.InputTextFlags.EnterReturnsTrue + imgui.InputTextFlags.CharsNoBlank)
			imgui.Spacing()
			imgui.SameLine(337)
			if imgui.Button(u8'��������� �� ������') then
				if searchBuf.v ~= '' and string.lower(searchBuf.v):find('http') then
					if onlinesong ~= nil then setAudioStreamState(onlinesong, as_action.STOP) end
					onlinesong = loadAudioStream(searchBuf.v)
					setAudioStreamState(onlinesong, as_action.PLAY)
					setAudioStreamVolume(onlinesong, math.floor(volume.v))
				end
			end
			imgui.Spacing()
			imgui.SameLine(311)
			if imgui.Button(u8'�������������') then if onlinesong ~= nil then setAudioStreamState(onlinesong, as_action.PAUSE) end end
			imgui.SameLine(nil, 3)
			if imgui.Button(u8'����������') then if onlinesong ~= nil then setAudioStreamState(onlinesong, as_action.RESUME) end end
			imgui.Spacing()
			imgui.SameLine(142)
			imgui.SliderFloat(u8'���������', volume, 0, 100)
			if onlinesong ~= nil then setAudioStreamVolume(onlinesong, math.floor(volume.v)) end
		end
		imgui.End()
	end
 if window1.v then window2.v = false  window3.v = false window4.v = false winak1.v = false  winyk1.v = false windop.v = false start.v = false info.v = false window5.v = false   activate.v = false testing.v = false   
 imgui.SetNextWindowSize(imgui.ImVec2(800, 450), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'������� ���� |Police Assistant| �����������: Liechtenstein', window1, img_state, imgui.WindowFlags.NoResize)
 imgui.Text(u8(os.date('������� ����: %w. %A. �����: %H:%M:%S %p')))
 imgui.Separator()
 imgui.BeginChild('#MM', imgui.ImVec2(782,155), true)
 imgui.CenterTextColoredRGB((tostring"������������! �� ���������� ���: "..mynick))
 imgui.CenterTextColoredRGB((tostring'������ � �������� �� ����������: '..gameServer))
 imgui.CenterTextColoredRGB((tostring'��� ����: '..sampGetPlayerPing(pgid)))
 imgui.CenterTextColoredRGB((tostring'�������: '..kvadrat()))
 imgui.CenterTextColoredRGB((tostring'�����: '..tostring(playerCity)))
 imgui.CenterTextColoredRGB((tostring'��������: '..interior))
 imgui.CenterTextColoredRGB((tostring'��� ������� ��������: {ff0000}'..hp))
 imgui.CenterTextColoredRGB((tostring'��������� �����: {808080}'..armors))
 imgui.CenterTextColoredRGB(calculateZone(x, y, z))
 imgui.EndChild()
 imgui.Separator()

 if imgui.Button(u8'�������') then window2.v = true end
 imgui.SameLine() if imgui.Button(u8'��������� �� ��������� ������ /d') then window3.v = true end
 imgui.SameLine() if imgui.Button(u8'������') then window4.v = true end
  imgui.SameLine() if imgui.Button(u8'�������') then window5.v = true end
 imgui.SameLine() if imgui.Button(u8'��������� ������') then winyk1.v = true end
 imgui.SameLine() if imgui.Button(u8'���������������� ������') then winak1.v = true end
 if imgui.Button(u8'����������') then windop.v = true end
 imgui.SameLine() if imgui.Button(u8'MP3 �����') then mp3st() end
 imgui.SameLine() if imgui.Button(u8'� �������') then info.v = true end
 imgui.SameLine() if imgui.Button(u8'Relog') then reconnect() end
if imgui.CollapsingHeader(u8("���������")) then
   imgui.InputText(u8'������� ������.', param) 
if imgui.Button(u8'���������� ������') then
if param.v == "166088" then
        sampAddChatMessage('[COP] ������ ������!', col2)
        testing.v = true
else
    sampAddChatMessage('[COP] ������ �� ������!', col2)
end
end
   if imgui.TreeNode(u8'�����.') then ------------------------------------------------
   if imgui.Button(u8"����� #1 (�����������)") then 
        if bNotf then
            notf.addNotification((tostring"��������� ��������� � COP ������������."), 4, 2)
        end
     local data = LIP.load('moonloader\\config\\cop.ini');
     data.options.style = 1 
      data.options.style2 = 0
      data.options.style3 = 0
      data.options.style4 = 0
     LIP.save('moonloader\\config\\cop.ini', data);
     print("============== STYLE 1 ==============")
     thisScript():reload()
   end
   if imgui.Button(u8"����� #2 (�����)") then 
        if bNotf then
            notf.addNotification((tostring"��������� ��������� � COP ������������."), 4, 2)
        end
     local data = LIP.load('moonloader\\config\\cop.ini');
     data.options.style = 0
      data.options.style2 = 1
      data.options.style3 = 0
      data.options.style4 = 0
     LIP.save('moonloader\\config\\cop.ini', data);
     print("============== STYLE 2 ==============")
     thisScript():reload()
   end
   if imgui.Button(u8"����� #3 (׸����)") then 
        if bNotf then
            notf.addNotification((tostring"��������� ��������� � COP ������������."), 4, 2)
        end
     local data = LIP.load('moonloader\\config\\cop.ini');
     data.options.style = 0
      data.options.style2 = 0
      data.options.style3 = 1
      data.options.style4 = 0
     LIP.save('moonloader\\config\\cop.ini', data);
     
     print("============== STYLE 3 ==============")
     thisScript():reload()
   end
if imgui.Button(u8"����� #4 (�����)") then 
        if bNotf then
            notf.addNotification((tostring"��������� ��������� � COP ������������."), 4, 2)
        end
     local data = LIP.load('moonloader\\config\\cop.ini');
     data.options.style = 0
      data.options.style2 = 0
      data.options.style3 = 0
      data.options.style4 = 1
     LIP.save('moonloader\\config\\cop.ini', data);
     print("============== STYLE 4 ==============")
     thisScript():reload()
   end
    imgui.TreePop()
    if imgui.Button(u8'�������������� ������������') then thisScript():reload() end
 end ------------------------------------------------
    imgui.Text("_____________________")
 if imgui.Button(u8'����� ��������', btn_size) then
     sbros.v = not sbros.v
   end
 end
 imgui.End()
 end
 if info.v then
 
 window2.v = false window1.v = false  window3.v = false window4.v = false winak1.v = false  winyk1.v = false windop.v = false start.v = false  activate.v = false testing.v = false    window5.v = false   
 imgui.SetNextWindowSize(imgui.ImVec2(900,400), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2.2, resY / 2.2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'���������� � �������.', info, imgui.WindowFlags.NoResize) 
  imgui.CenterTextColoredRGB(tostring'�����������! ������� ���� �������� ��� ������! ���� �� ������ ��������� �� ������ � ������ ������! ��������� �������������!') 
 imgui.CenterTextColoredRGB(tostring'Police Assistant - ������: '..thisScript().version) 
 imgui.CenterTextColoredRGB(tostring'��������! ������ �������� ������ �� � Pears Project [ 1 ] Role Play �!')
 imgui.SameLine() sh(u8'�� ������ ������ ������ ������� �� �������������� ������ ��������.')
 imgui.CenterTextColoredRGB(tostring'����� Police Assistant:  {8B0000}Liechtenstein')
 imgui.Separator()
   	imgui.BeginChild('left pane', imgui.ImVec2(495, 230), true, imgui.WindowFlags.VerticalScrollbar)
	imgui.Text(u8'� ���������� 2.22\n  - �������� LOG ����������\n  - ������ ������� ���.\n - ������� ������ �������')
    imgui.EndChild() 
    imgui.SameLine()
imgui.BulletText(u8'�������������: \nKatsuro - ����� � ��������� ������� \nBenjamin Hoffman - ����� � ������ ������ \nRenard Montero - ����� � ������ ������')
imgui.BulletText(u8'�������������: \nHasvord Rashford - �������� ������ � (/b !)')
 imgui.Separator()
 if imgui.Button(u8'��. ������ ������� � ��') then os.execute('explorer "https://vk.com/skripter_liechtenstein"') end
 if imgui.Button(u8'�������� VK ���������') then  os.execute('explorer "https://vk.com/alexanderliecht"') end
 if imgui.Button(u8'����') then  os.execute('explorer "http://liechtenstein.forum2x2.ru"') end
 if imgui.Button(u8'� ������� ����') then window1.v = true end
    imgui.End()
 end
if sbros.v then

 window2.v = false  window3.v = false window4.v = false winak1.v = false  winyk1.v = false windop.v = false start.v = false  activate.v = false testing.v = false    info.v = false window5.v = false       
 imgui.SetNextWindowSize(imgui.ImVec2(156, 70), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2.2, resY / 2.2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'�������� ���������?', imgui.WindowFlags.NoResize, img_state)
 imgui.Text("     ") 
 imgui.SameLine() if imgui.Button(u8'��/Yes') then
         if bNotf then
            notf.addNotification((tostring"��� �������� ������ ����� Police Assistant."), 3, 3)
        end
      local data = LIP.load('moonloader\\config\\cop.ini'); 
      data.options.style = 0
      data.options.style2 = 0
      data.options.style3 = 0
      data.options.style4 = 0
      data.options.nadzir = 0
     LIP.save('moonloader\\config\\cop.ini', data);
     print("============== RESET ==============")
     thisScript().reload()
 end
 imgui.SameLine() if imgui.Button(u8'���/No') then
 sbros.v = false
 window1.v = true
 end
 imgui.End()
 end
 if window2.v then
 
 window1.v = false  window3.v = false window4.v = false winak1.v = false winyk1.v = false windop.v = false  start.v = false  activate.v = false testing.v = false    info.v = false window5.v = false       
 imgui.SetNextWindowSize(imgui.ImVec2(600, 520), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'�������', window2, img_state, imgui.WindowFlags.NoResize)
 imgui.BulletText(u8'[/cop]- ����� �������� ����.')
 imgui.BulletText(u8'[/mp3]- MP3 �����') imgui.SameLine() sh(u8'������� ���� Mp3 ������.. � ������ ���� ������:) ')
 imgui.BulletText(u8'[/pu]-��������� ������ �������������') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/fd]-���������� ����� "/find" (����������� ������ 2.5 �������)') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.NextColumn()
 imgui.BulletText(u8'[/cuff] -��������� ����������.') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/tic]- ��������� ������.')
 imgui.BulletText(u8'[/shi]- �������� ���� ��� �����') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/get]- ����� ���� � ������ [/agetcar]')
 imgui.BulletText(u8'[/nid]- ������ ��� �� id.') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/frisk]- �������� ��������') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.NextColumn()
 imgui.BulletText(u8'[/recon]- ��������')
 imgui.BulletText(u8'[/rw] - ��������� ������ �������') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/in] - �������� ����������� � ������') imgui.SameLine() sh(u8'��������� ���������: id, Id ����� (1-3)')
 imgui.BulletText(u8'[/obgun]- �� ����� �� ������.') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/pu]- ����� ������������� �������������.') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/kp]- ������� ������.')
 imgui.BulletText(u8'[/izoll]- ������ � ������.')  imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/cam]- ���������� � ������ ������.') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/shv]- ������� ������ �� ��������� (��).')
 imgui.BulletText(u8'[/podm]- ��������� ������� � [/r]')
 imgui.BulletText(u8'[/cmc]- �������� ���')
 imgui.NextColumn()
 imgui.BulletText(u8'[/mira]- �������� �������..')
 imgui.BulletText(u8'[/doks]- ����������� ���������.') imgui.SameLine() sh(u8'��������� ��������: id')
 imgui.BulletText(u8'[/gradar] - ��������� ����� � ������������ 60��[/�.') imgui.SameLine() sh(u8'��������� ��������: � ������')
 imgui.BulletText(u8'[/zradar] - ��������� ����� � ������������ 90��[/�.') imgui.SameLine() sh(u8'��������� ��������: � ������')
 imgui.BulletText(u8'[/skof]- ����������� � ����������� �����.')
 imgui.BulletText(u8'[/gnumcar]- ������ ������')  imgui.SameLine() sh(u8'��������� ��������: id, �����, �����') 
 if imgui.Button(u8'� ������� ����') then
 window1.v = true
 end
 imgui.End()
 end
 if windop.v then
 
     window1.v = false window2.v = false  window3.v = false window4.v = false winyk1.v = false winak1.v = false  start.v = false  activate.v = false testing.v = false   info.v = false
        imgui.SetNextWindowSize(imgui.ImVec2(700, 200), imgui.Cond.Always) -- 
        imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5)) 
        imgui.Begin(u8'����������', windop, img_state, imgui.WindowFlags.NoResize) 
        imgui.Separator()
        imgui.Text(u8'���������� �1: ��������� ScoreBoard') imgui.SameLine() sh(u8'������ ���������� ��������� ��������� ��������� ������� ����� ��������� ��� ���� (����� � ��)')
        if imgui.Button(u8'�������') then downdop1() end 
        imgui.Text(u8'���������� �2: �� ��������� ������') imgui.SameLine() sh(u8'������ ���������� ��������� ��������� ������ (�������� ����� �������� ��-�� ���������������)')
        if imgui.Button(u8'�������') then downdop2() end 
        imgui.Separator()
        if imgui.Button(u8'� ������� ����') then
	    window1.v = true end
     imgui.End()
    end
 if window3.v then
 
 window1.v = false window2.v = false  window4.v = false winak1.v = false winyk1.v = false windop.v = false  start.v = false  activate.v = false testing.v = false    window5.v = false      
 imgui.SetNextWindowSize(imgui.ImVec2(700, 700), imgui.Cond.Always) 
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'������� ����� ������������', window3, img_state, imgui.WindowFlags.NoResize) 
 imgui.Text(u8'=========================================================================================')
 imgui.Text(u8'1.������ - ������������ ����� �� 20 �����.')
 imgui.Text(u8'2.���������� � �������/������� ��������� - ������������ ����� �� 30 �����.')
 imgui.Text(u8'3.����������� � ������� ����������� ������������ - ������������ ����� �� 30 �����.')
 imgui.Text(u8'5.OOC ����������� - ������������ ����� �� 20 �����.')
 imgui.Text(u8'4.������������ ������������� ������� - ������������ ����� �� 20 �����.')
 imgui.Text(u8'6.������������ ����� ������������ ������ ���������� � ���.���������� - ������������ ����� �� 30 �����.')
 imgui.Text(u8'=========================================================================================')
 if imgui.Button(u8'� ������� ����') then
 window1.v = true
 end
 imgui.End()
 end

 if window4.v then
 
 window1.v = false window2.v = false  window3.v = false winak1.v = false winyk1.v = false windop.v = false  start.v = false  activate.v = false testing.v = false       info.v = false window5.v = false     
 imgui.SetNextWindowSize(imgui.ImVec2(600, 450), imgui.Cond.Always) 
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'������', window4, img_state, imgui.WindowFlags.NoResize) 
 imgui.BulletText(u8'[/pnap] - ������ ������ �� ��������� �� ��.')
 imgui.BulletText(u8'[/nap] - ������ ������ �� ��������� �� ����������� ����.')
 imgui.BulletText(u8'[/ppron]- ������ ������ �� ������������� � ����� �����.')
 imgui.BulletText(u8'[/pron] - ������ ������ �� �������������.')
 imgui.BulletText(u8'[/kill]- ������ ������ ��  ��������.')
 imgui.BulletText(u8'[/nep]- ������ ������ �� ������������.')
 imgui.BulletText(u8'[/dnep]- ������ ������ �� ����� ���������� ���������.')
 imgui.BulletText(u8'[/pugon]- ������ ������ �� ������� �����.')
 imgui.BulletText(u8'[/ugon]- ������ ������ �� ����.')
 imgui.BulletText(u8'[/gun]- ������ ������ �� �������� ������ ����������� �����. (4 (�� ���� 14�� �����.).')
 imgui.BulletText(u8'[/sgun]- ������ ������ �� ������� ������.')
 imgui.BulletText(u8'[/bgun]- ������ ������ �� ������� ������.')
 imgui.BulletText(u8'[/nark]- ������ ������ �� �������� ����������.')
 imgui.BulletText(u8'[/snark]- ������ ������ �� ������� ����������.')
 imgui.BulletText(u8'[/bnark]- ������ ������ �� ������� ����������.')
 imgui.BulletText(u8'[/kan]- ������ ������ �� ����������.')
 imgui.BulletText(u8'[/fr]- ������ ������ �� ���������� � ������ ������������ �������.')
 imgui.BulletText(u8'[/parm]- ������ ������ �� ������ 16.9')
 imgui.BulletText(u8'[/spy]- ������ ������ �� �������.')
 imgui.BulletText(u8'[/bn]- ������ ������ �� ���������� �����')
 if imgui.Button(u8'� ������� ����') then
 window1.v = true
 end
 imgui.End()
 end
  if window5.v then
  
 window1.v = false window2.v = false  window3.v = false winak1.v = false winyk1.v = false windop.v = false  start.v = false  activate.v = false testing.v = false    info.v = false       
 imgui.SetNextWindowSize(imgui.ImVec2(600, 450), imgui.Cond.Always) 
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'�������(���� ��� �����)', window5, img_state, imgui.WindowFlags.NoResize) 
 imgui.Separator()
 imgui.BulletText(u8'[NUM4] - ������ ������������') sh(u8'/wanted')
 imgui.Separator()
 if imgui.Button(u8'� ������� ����') then
 window1.v = true
 end
 imgui.End()
 end
 if winyk1.v then
 
 window1.v = false window2.v = false  window3.v = false window4.v = false winak1.v = false windop.v = false  start.v = false  activate.v = false testing.v = false    info.v = false window5.v = false       
 imgui.SetNextWindowSize(imgui.ImVec2(1290, 600), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'��������� ������', winyk1, img_state) 
 imgui.Text(u8'����� 1 ��������� �� �����.')
 imgui.Text(u8'������ 1.1 �� ��������� �� ����������� ���� �������������� ������������� 4 ������� �������.')
 imgui.Text(u8'������ 1.2 �� ��������� �� ���������� ������������������ ������� �������������� ������������� 5 ������� �������.')
 imgui.Text(u8'������ 1.3 �� ����������� ��������� �� ����������� ���� �������������� ������������� 6 ������� �������.')
 imgui.Text(u8'������ 1.4 �� ����������� ��������� �� ���������� ������������������ ������� �������������� ������������� 6 ������� �������. ')
 imgui.Text(u8'..�� ������������ ��������� ������ ������ ��������� � ����������� ������ ������������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 2 ��������.')
 imgui.Text(u8'������ 2.1 �� �������� ������������ ���� �������������� ������������� 6 ������� �������. �� ������������ ��������� ������ ������ ��������� � ����������� ������ ������������.')
 imgui.Text(u8'������ 2.2 �� �������� ���������� ������������������ ������� �������������� ������������� 6 ������� �������.')
 imgui.Text(u8'�� ������������ ��������� ������ ������ ��������� � ����������� ������ ������������.')
 imgui.Text("")
 imgui.Text(u8'������ 2.3 �� �������� ������������������ ���: ���������� ���.����������, ������ ����� ������ (���������, ��������, ��������')
 imgui.Text(u8'..�������������� ������������� 6 ������� �������, � ����� ��������� � ����������� ������ ������������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 3 ������������.')
 imgui.Text(u8'������ 3.1 �� ������������ ���������� ������������������ �������, ���� ���� ������� ���������, �������������� ������������� 2 ������� �������.')
 imgui.Text(u8'������ 3.2 �� �����/������������� ������� ������ �������������� ������������� 1 ������� �������.')
 imgui.Text(u8'������ 3.3 �� ����� ���������� �������� �������������� �������� �������������� ������������� 1 ������� �������.')
 imgui.Text(u8'������ 3.4 �� ������������� �������� � ��� ����������� ������������� 2 ������� �������. ')
 imgui.Text(u8'������ 3.5 �����������, ����������� ��� ���� �� ����� ��������� ��������, ������������� 2 ������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 4 ����������� ���������. ')
 imgui.Text(u8'������ 4.1 �� ������/����������� ���������� ������������������ ������� �� ����� ������������ ����������� (�����, ������ � ��.) ���������� ������������� 1 ������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 5 ���� ������������� ��������')
 imgui.Text(u8'������ 5.1 �� ������� ����� ������������� �������� �������������� ������������� 2 ������� �������.')
 imgui.Text(u8'������ 5.2 �� ���� ������������� �������� �������������� ������������� 3 ������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 6 ���������/������ � ���������')
 imgui.Text(u8'������ 6.1 �� ������ � ��������� ������ ��� ������ ���������� �������������� ������������� 6 ������� �������, � ����� ��������� � ����������� ������ ������������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 7 ���������')
 imgui.Text(u8'������ 7.1 �� ������������/���������� ������� �������������� ������������� 6 ������� ������� � ���������� �������� ����������� ������� ������������/��������� ������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 8 �����/�������/���������')
 imgui.Text(u8'������ 8.1 �� ������/������ ���������������� ��� �������������� ������������ � ����� �������������� ��� ������� ���� ������� �������������� ������������� 3 ������� �������.')
 imgui.Text(u8'������ 8.2 �� ��������� ������ ��������� ���������� � ���������� ��������������� ��������, �������� �� �� ��������, �������������� ������������� 1 ������� �������.')
 imgui.Text(u8'������ 8.3 �� ���������� ������������, ���� �������, �������������� ������������� 1 ������� �������.')
 imgui.Text(u8'������ 8.4 �� �������������� �������������� ������������� 3 ������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 9 ������')
 imgui.Text(u8'������ 9.1 �� ������� ������ � ������ ���������� ���������, �� ����: M4(���), AK-47(�����), Shotgun(���) - ����� ������������� 4 ������� �������. ')
 imgui.Text(u8'� ��� �� ���� �������� ������� ������ ������������� ������ ������� ��� ������������, �� �������� �������� �� �����. ')
 imgui.Text(u8'��������� ������, Country Rifla(�����/��������) � ������� 15 ��������, Desert Eagle 2 ������(14 ��������), ��� ������� ���������� ��� ������������� 3 ������� �������.') 
 imgui.Text(u8'������ 9.2 �� ����������� ������� ������ �������������� ������������� 4 ������� �������, � ����� ������� ������.')
 imgui.Text(u8'������ 9.3 ���������� ������������ ������ ������������ �� ������ 9.2, ��� ���������� ������������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 10 ������������� ��������')
 imgui.Text(u8'������ 10.1 �� ��������/��������� ������������� ������� � ����������� ���������� ����� ������� �������������� ������������� 3 ������� �������, � ����� ������� ������������� �������. ')
 imgui.Text(u8'������ 10.2 �� c��� ������������� ������� �������������� ������������� 5 ������� �������, � ����� ������� ������������� �������.')
 imgui.Text(u8'������ 10.3 �� ������������ ������������� ������� �������������� ������������� 2 ������� �������, � ����� ������� ������������� �������.')
 imgui.Text(u8'������ 10.4 �� ������� ������������� ������� ����������� �������������� 3 ������� �������, � ����� ������� ������������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 11 C�������� � ������������')
 imgui.Text(u8'������ 11.1 �� ���������/������ �������� �������������� ������������� ����� �� ������� ������� ��� � � �����������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 12 ������� ��������')
 imgui.Text(u8'������ 12.1 �� �������������(/iznas), �� ���� �������� � ����������� �������, �������������� ������������� 2 ������� �������.')
 imgui.Text(u8'������ 12.2 �� �������� ������������, ������� ������������� ����������� ����������� ������ ��������� �����, �������������� ������������� 4 ������� �������. ')
 imgui.Text(u8'')
 imgui.Text(u8'����� 13 ������������ ������ ����� � �������� ��������')
 imgui.Text(u8'������ 13.1 �� ����������� �������� ��� ��������� �����������, � ������: �����������/�����������, �������������� ������������� 6 ������� �������. ')
 imgui.Text(u8'')
 imgui.Text(u8'����� 14 ������.')
 imgui.Text(u8'������ 14.1 �� ����������� ������ ������������ ���� �������������� ������������� 2 ������� �������.')
 imgui.Text(u8'������ 14.2 �� ������ ������ ����������� ����� ��� ������������� 2 ������� �������, ���������� �� �����������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 15 ���� � ������.')
 imgui.Text(u8'������ 15.1 �� ������������/�����������/��������� � ������������������� ��������, ���� ������, �������������� ������������� 3 ������� �������.')
 imgui.Text(u8'������ 15.2 �� ������������/�����������/��������� � ������ c ����������� ������ �������������� ������������� 6 ������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 16 ��������������� ������������.')
 imgui.Text(u8'������ 16.1 �� �������� ����������, ������� ������������ ��������������� ��������, �� ���� ������ ���� �� ���������������� ����, �������������� ������������� 1 ������� �������.')
 imgui.Text(u8'������ 16.2 �� ������� ��������������� ����.������, ��� �������������� � �����, �������������� ������������� 1 ������� �������.')
 imgui.Text(u8'������ 16.3 �� ����� ���������������� ��������� � �������������� ������ �������� (����������� �������, ������� ����, �����) �������������� ������������� 3 ������� �������.')
 imgui.Text(u8'������ 16.4 �� ������� ���������������� ��������� � �������������� ������ �������� (����������� �������, ������� ����, �����) �������������� ������������� 3 ������� �������. ')
 imgui.Text(u8'���� ��� ������ ��������� ����������� - �� ����������� � �������� ������ ������.')
 imgui.Text(u8'������ 16.5 �� �������, �������, ����������� ��������������� ����������, �������������� ������������� 6 ������� �������.')
 imgui.Text(u8'������ 16.6 �� ������������ ��������� ������� ����������� � ��������� � �������� ����������� ')
 imgui.Text(u8'..(������ ��������������� ����������, �������� �������� ����������� ������) ������� ���, ���������� ������������� 6 ������� ������� � ������������ ������������ �����.')
 imgui.Text(u8'������ 16.7 �� ������������� ������ � �������� ����������� (������� �������� � �����) ����� ������ ��� ������������� 6 ������� �������, � ����� ���������������� ����������� [��������].')
 imgui.Text(u8'����������: ������ ������ ������ ������ ���� ������������ ������ ������� ������. [��������� - ��������, �������� ��� - ����� �������, �������� �������, �����]')
 imgui.Text(u8'������ 16.8 �� ���������� � ����������� �������, ����� ����������� ������������ ��������� �������,') 
 imgui.Text(u8'..�������������� ������ ��� ������������� 6 ������� ������� � ����������� ����� ��� ��������������. [����������� ������]')
 imgui.Text(u8'������ 16.9 �� �������� ���������������� ������������ ( ����� ) ,����� �� ��������� � ��������������� ������������,��������� ����� ������ �� �������,� ���������� ������������� 6 ������� �������.')
 imgui.BulletText(u8'����������: ���������� ����� ���� ������������� � ���. ������������� � �� ����� ��������� ����� ������ 6 ��. (/bn)')
 imgui.Text(u8'')
 imgui.Text(u8'����� 17 ��������������� ����������')
 imgui.Text(u8'������ 17.1 �� ������������� �� �����������/��������� ���������� ���������� ������������ ��� ���� ����� ��� �� �������������� �������� �������������� ������������� 4 ������� �������.')
 imgui.Text(u8'��������: �������, ���, �����, ����� (� ��������� �������).�������������, ������� �������� �� ��������/���������� ���������� ����� ���� ���������� �������.')
 imgui.Text(u8'������ 17.2 �� ������������� �� �����������/��������� ���������� ���������� ������������ � ����� �����, �������� ��� ������ �������������� ��������, ����������� ������������� 6 ������� �������.') 
 imgui.Text(u8'��������: �������, ���, �����, ����� (� ��������� �������) �������������, ������� �������� �� ��������/���������� ����������, ����� ���� ���������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 18 �����������')
 imgui.Text(u8'������ 18.1 �� ����������� ������������ �����������, ��� ������������ � ��������, �������������� ������������� 2 ������� �������.')
 imgui.Text(u8'������ 18.2 �� c��� �����������, ������������ �������������� �������� �� �����������, �������������� ������������� 3 ������� �������.')
 imgui.Separator()
 if imgui.Button(u8'� ������� ����') then
 window1.v = true
 end
 imgui.End()
 end
 if winak1.v then 
 
 window1.v = false    window2.v = false  window3.v = false window4.v = false winyk1.v = false windop.v = false  start.v = false  activate.v = false testing.v = false    info.v = false window5.v = false     
 imgui.SetNextWindowSize(imgui.ImVec2(1300, 600), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'���������������� ������', winak1, img_state)  
 imgui.Text(u8'����� 1. ���������� ������������ ��������� � ��������� ����.')
 imgui.Text(u8'������ 1.1. �� ���������� ������������ ��������� � ��������� ������������/�������������� ��������� ���������� ������ ��������� ����� � ������� $25.000,') 
 imgui.Text(u8'� ����� ��������� ������������������ ������� ������ ������ �������� �� ����� ���������� ����������� �� ������� ���� ���������� ���������. ')
 imgui.Text(u8'��� ������������� ��������� ���������� ���� ��������� ��������������� �� ������ 10.3 ���������� �������')
 imgui.Text(u8'������ 1.2. �� ���������� ������������ ��������� � ��������� ������������/�������������� ���������, � ��������� ���� ��������� ���, ���������� ������ ��������� ����� � ������� $25.000, ')
 imgui.Text(u8'a ����� ��������� ������������������ ������� ������ ������ ������������ �������������. ���� ��� ������� �� ����� ������ ������������,') 
 imgui.Text(u8'���������� ���� ��������� ��������������� �� ������ ����� ���������� �������. ��� ������������� ��������� ���������� ���� ��������� ��������������� �� ������ 10.3 ���������� �������')
 imgui.Text(u8'')
 imgui.Text(u8'����� 2. ������������� ��������� ������������ �������� � ������ �����.')
 imgui.Text(u8'������ 2.1. �� ������������� ���������������� ������������� ��������(������ ����� ������, ������������ �������� �����, ���, �������) ���������� ������ ��������� ����� � ������� ')
 imgui.Text(u8'$10.000, � ����� ������������� ���� ��������� ��������������� �� ������ 16.3 ���������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 3. ���������� ������������ ��������� �� �������� ������ ��������.')
 imgui.Text(u8'������ 3.1. �� ���������� ������������ ��������� �� ������ ���������� �������� ���������� ������ ��������� ����� � ������� $25.000, ')
 imgui.Text(u8'� ����� ��������� ������������������ ������� ������ ������ ������������ �������������.')
 imgui.Text(u8'������ 3.2. �� ���������� ������������ ��������� �� ������ ���������� ��������, � ��������� ���� ��������� ���, ���������� ������ ��������� ����� � ������� $25.000,')
 imgui.Text(u8'a ����� ��������� ������������������ ������� ������ ������ ������������ �������������. ')
 imgui.Text(u8'���� ��� ������� �� ����� ������ ������������ ���������� ���� ��������� ��������������� �� ������ ����� ���������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 4. ���������� ����������� ������.')
 imgui.Text(u8'������ 4.1. �� ���������� ����������� ������, ���� ��� ������������� ������, ���������� ������ ��������� ����� � ������� $500 �� ������ ��������������� ����������. ')
 imgui.Text(u8'������ 4.2. �� ���������� ����������� ������, � ��������� �������� ��������� ���, ���������� ������ ��������� ����� � ������� $25.000, a ����� ��������� ������������������ ')
 imgui.Text(u8'������� ������ ������ ������������ �������������. ���� ��� ������� �� ����� ������ ������������ ���������� ���� ��������� ��������������� �� ������ ����� ���������� �������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 5. ���������� ������������ ���������.')
 imgui.Text(u8'������ 5.1. �� ���� �� �����/�������� ������/��������� ���������� ������ ��������� ����� � ������� $3.000.')
 imgui.Text(u8'������ 5.2. �� ���� � ������������ ������ � ������ 21:00 - 06:00 ���������� ������ ��������� ����� � ������� $3.000.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 6. �������-������������ ������������. ')
 imgui.Text(u8'������ 6.1. ��� ��������� � �������� ������� ��������� � ��������� ��� ��� � ����������, ��� ��������� ����������������, � ����� ���������� ������������������ ������� �� ����������.')
 imgui.Text(u8'������ 6.2. ��� ����� � ����� ��� �������� ������������� ��������� �������� � ����������� � ������ (2 ������� �������), ��� ����� ���� ��������� ���������������. ')
 imgui.Text(u8'��������� ������������������ ������� ������ ������ ������������ �������������.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 7. ������������� ������.')
 imgui.Text(u8'������ 7.1. �� ������������� ������, ��� ����� ���������� ����/��� �� �� ����������, ���������� ������ ��������� $5.000. ��� ������������ ��������� ������������������ ������� ')
 imgui.Text(u8'������ ������ ������������ �������������.')
 imgui.Text(u8'������ 7.2. �� ������������� ������, � ��������� ���� ��������� ���, ���������� ������ ��������� ����� � ������� $25.000, a ����� ��������� ������������������ �������') 
 imgui.Text(u8'������ ������ ������������ �������������. ���� ��� ������� �� ����� ������ ������������ ���������� ���� ��������� ��������������� �� ������ ����� ���������� �������')
 imgui.Text(u8'')
 imgui.Text(u8'����� 8. ����������� ��������.')
 imgui.Text(u8'������ 8.1. �� ����������� �������� �� �������� ������ (������ ������� ������ ��� �� ��������� ������) ���������� ������ ��������� ����� � ������� $3.000.')
 imgui.Text(u8'������ 8.2. �� ����������� �������� �� �������� ������,� ��������� ���� ��������� ���, ���������� ������ ��������� ����� � ������� $25.000,')
 imgui.Text(u8' a ����� ��������� ������������������ ������� ������ ������ ������������ �������������. ���� ��� ������� �� ����� ')
 imgui.Text(u8'������ ������������ ���������� ���� ��������� ��������������� �� ������ ����� ���������� �������')
 imgui.Text(u8'')
 imgui.Text(u8'����� 9. �������������� � ������� ������ �������������.')
 imgui.Text(u8'������ 9.1. �� ����� ���.��������� (�������, �����, ���������� � ������) ���������� ������ ��������� ����� � ������� $15.000.')
 imgui.Text(u8'������ 9.2. �� ����������� ���������� ������ ��������� ����� � ������� $20.000.')
 imgui.Text(u8'')
 imgui.Text(u8'����� 10. �������������� �� ����� �������.')
 imgui.Text(u8'������ 10.1. �� �������� ����������� �������� � ������������ ������ ���������� ������ ��������� ����� � ������� $5.000.')
 imgui.Text(u8'������ 10.2. �� ���������� ����� � ������������ ����� (/piss) ���������� ������ ��������� ����� � ������� $1.000.')
 imgui.Text(u8'������ 10.3. �� �������� � ������ ������� �� ������� ���������� ������ ��������� ����� � ������� $50.000.')
 imgui.Text(u8'������ 10.4. �� ������������� ����������� ������� � ������������ ������ �� ��������� � ��������� ����� ���������� ������ ��������� ����� � ������� $15.000 ')
 imgui.Text(u8'������ 10.5. �� ������������� ����������� ������� � ������������ ������ �� ��������� � �������������� ������ ���������� ������ ��������� ����� � ������� $20.000')
 imgui.Text(u8'')
 imgui.Text(u8'����� 11. �������������.')
 imgui.Text(u8'������ 11.1. �� ������ ����� ��������� ������, ���������� ������ ��������� ����� � ������� $10.000.')
 imgui.Separator()
 if imgui.Button(u8'� ������� ����') then
    window1.v = true
 end
  imgui.End()
    end
     if testing.v then
 window2.v = false window1.v = false  window3.v = false window4.v = false winak1.v = false winyk1.v = false  windop.v = false start.v = false window5.v = false     
 imgui.SetNextWindowSize(imgui.ImVec2(600,300), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2.2, resY / 2.2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'���� ������������.', testing, imgui.WindowFlags.NoResize, img_state) 
  imgui.CenterTextColoredRGB(tostring'�������� ����. ������� ��� ������������ ����� ������� � ��.') 
  if imgui.Button(u8'�����-�� �����') then  lua_thread.create(function()
  sampSendChat("/b 123")
  wait(1000)
  sampSendChat("/b 1234")
  wait(1000)
  sampSendChat("/b 12345")
end)
end
   if imgui.Combo(u8'�����-�� �����', selected_item, {'fz 1', 'fz 2', 'fz 3', 'fz 4'}, 4) then
  if selected_item.v == 0 then
    sampAddChatMessage('����� ���-�� ������ 1', -1)
  end
    if selected_item.v == 1 then
        sampAddChatMessage('����� ���-�� ������ 2', -1)
    end
    if selected_item.v == 2 then
        sampAddChatMessage('����� ���-�� ������ 3', -1)
    end
    if selected_item.v == 3 then
        sampAddChatMessage('����� ���-�� ������ 4', -1)
    end
end
   if imgui.Button(u8'� ������� ����') then window1.v = true end
    imgui.End()
 end
end

function window() 
    start.v = true
end

function imgui.SetWindowProperties(pos_x, pos_y, pos_c, size_x, size_y, size_c)
	imgui.SetNextWindowPos(imgui.ImVec2(pos_x, pos_y), pos_c)
	imgui.SetNextWindowSize(imgui.ImVec2(size_x, size_y), size_c)
end

function rnrp(param)
	local lenght = string.len(param)
	if lenght == 0 then
		sampAddChatMessage("[ ����� ]: ��� ����� ����� [ /rb ����� ]", 0xC1C1C1)
		return false
	  else
		sampSendChat('/r // '..param)
	end
end

function dnrp(param)
	local lenght = string.len(param)
	if lenght == 0 then
		sampAddChatMessage("[ ����� ]: ��� ��� ������������ [ /db ����� ]", 0xC1C1C1)
		return false
	else
		sampSendChat('/d // '..param)
	end
end
--------------------------------------------------------------------------------
--------------------------------�������� �������--------------------------------
--------------------------------------------------------------------------------
-- function sampev.onSendTakeDamage(playerId, damage, weapon, bodypart)
--         if lastdid == playerId then

-- 		else
-- 			if weapon == 0 then

-- 			else
-- 			if protect_work == true then
-- 			lastdid = playerId
-- 			sampSendChat('/r [���-�� ������������]: �� '..thisPlayerRpNick..' ��������� ���������.')
-- 			sampSendChat('/r [���-�� ������������]: ��������, '..thisPlayerRpNick..' ��������� ������. ��������� GPS-�������...')
-- 			sampSendChat('/su '..thisPlayerId..' 1 GPS-������')
-- 			end
-- 			end
-- 		end
-- end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function sampGetDistanceLocalPlayerToPlayerByPlayerId(playerId)
	local playerId = tonumber(playerId, 10)
	if not playerId then return end
	local res, han = sampGetCharHandleBySampPlayerId(playerId)
	if res then
		local x, y, z = getCharCoordinates(playerPed)
		local xx, yy, zz = getCharCoordinates(han)
		return true, getDistanceBetweenCoords3d(x, y, z, xx, yy, zz)
	end
	return false
end



function rrp(param)
	local id = string.match(param, '%s*(.+)')
	local data = LIP.load('moonloader\\config\\cop.ini');
	if id ~= nil then
		if data.options.nadzir == 0 then
            sampSendChat(string.format("/r %s", id))
            sampSendChat("/me ������� ���-�� � �����..")
		elseif data.options.nadzir == 1 then
            sampSendChat(string.format("/r [NADZIR] %s", id))
            sampSendChat("/me ������� ���-�� � �����..")
		end
	else
		sampAddChatMessage("{0088ff}[ COP ]{ffffff}: ����� �������. [\'IC\' {0088ff}/r �����{ffffff} ]", 0xC1C1C1)
	end
end

function drp(param)
	local id = string.match(param, '%s*(.+)')
	local data = LIP.load('moonloader\\config\\cop.ini');
	if id ~= nil then
		if data.options.nadzir == 0 then
            sampSendChat(string.format("/d %s", id))
            sampSendChat("/me ������� ���-�� � �����..")
		elseif data.options.nadzir == 1 then
            sampSendChat(string.format("/d [NADZIR] %s", id))
            sampSendChat("/me ������� ���-�� � �����..")
		end
	else
		sampAddChatMessage("{0088ff}[ COP ]{ffffff}: ����� ������������. [\'IC\' {0088ff}/r �����{ffffff} ]", 0xC1C1C1)
	end
end

function downdop1()
  downloadUrlToFile( "https://dl.dropboxusercontent.com/s/6hkyebat9jo9a2v/scoreboard.lua?dl=0", "moonloader/scoreboard.lua")
  sampAddChatMessage('{ffffff}* [{949055}Liechten{ffffff}]: {949055} ���������� ���������.', 0xC1C1C1)
  sampSendChat('/sms Alexander_Recense � ������(�) ���������� �1!')
  reloadScripts()
end

function downdop2()
  downloadUrlToFile( "https://dl.dropboxusercontent.com/s/4nbymbrt0fva9qd/RPWeapon.lua?dl=0", "moonloader/RPWeapon.lua")
  sampAddChatMessage('{ffffff}* [{949055}Liechten{ffffff}]: {949055} ���������� ���������.', 0xC1C1C1)
  sampSendChat('/sms Alexander_Recense � ������(�) ���������� �2!')
  reloadScripts()
end

function checkUpdate()
    local text = https.request('https://raw.githubusercontent.com/Liechten/projects/master/copversionl.json')
    if text:byte(1) ~= 123 then return end
    local tab = decodeJson(text)
    local lv = tonumber(tab.latest)
    local cv = tonumber(script.this.version)
    if lv > cv then
        print('[COP] ������������� ����������!')
        lua_thread.create(function()
            downloadUrlToFile('https://raw.githubusercontent.com/Liechten/projects/master/Police_assistant.lua', script.this.path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                sampAddChatMessage(('���� ��������� ����������! ����������!'), col2)
                print('[COP] ���������� ���������')
                script.this:reload()
                end
            end)
        end)
    end
end

function fshv() shv:run() end
function fheal() med:run() end
function fskin() skof:run() end

function goskin()
    wait(0)
    sampSendChat("/do �� ����� ���� ����� � �������.")  
    wait(500)
    sampSendChat("/me ������ ��������� ��� ������� ����� � ���������� �..")
    wait(500)
    sampSendChat("/skin")
    wait(100)
    sampSendChat("/color")
    wait(500)
    sampSendChat("/me ��������� ����� � ���������� � �� �����.")
    wait(500)
    sampSendChat("/do �������� ����� ����� �� �����.")
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

function fticket(param)
 lua_thread.create(function()
    local id, summa, reason = param:match("(.+)%s+(.+)%s+(.+)")
  if id and summa and reason ~= nil then
    sampSendChat("/do ����� ��������� ����� � �������� �����.")
    wait(1000)
    sampSendChat("/me ������ ��������� ���� ������ ����� ���������.")
    wait(1000)
    sampSendChat("/me ������ ����� �� �����, ����� ���� ����� ������� ���������� ������ ����������.")
    wait(1000)
    sampSendChat("/do ����� ��������.")
    wait(1000)
    sampSendChat("�������� ������������ ����� � ��������� ����� ��� ���������")
    wait(1000)
    sampSendChat('/ticket '..id..' '..summa..' '..reason)
    else 
    sampAddChatMessage("[{1FAEE9}Police Assistant]{ffffff}: ��� ���� ����� ������ ����� ������� /tic id ����� �������")
  end
 end)
end

function gopcl(param)
id = tonumber(param)
    if param then
        if id ~= nil then
            nick = sampGetPlayerNickname(id)
            result = sampIsPlayerConnected(id)
            if result then
                sampSendChat('/d ������������� '..nick.. '. ���� �: '..id..'.')
                wait(900)
                sampSendChat('/d ������� '..id..'. ����� ���������� ��� �� ������ �������������.')
                sampAddChatMessage('[ ����� ] � �������� ����� ������ �: '..nick.. '. Id: '..id, -1)
            end
            else
                sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ����� ������� ��� id �� ����� �����.', -1)
        end
    end
end

function zradar(param)
 lua_thread.create(function()
 if param ~= nil then
 sampSendChat("/do � ��������� ���������� ����� ��������� ����� � ����. �����.")
 wait(1500)
 sampSendChat("/me ����� ����� ������ ��������, � ������ ������ �����.")
  wait(1500)
 sampSendChat("/me ������ ������ �������� � ����� ����� ����� � �����.")
  wait(1500)
 sampSendChat("/me ������ ����� ������� ������ � �����")
  wait(1500)
 sampSendChat("/me ��������� ����� �� ������, �������� ��� �� ������ ������ � ...")
  wait(1500)
 sampSendChat("/me ��������� �������� \"�.�\"")
  wait(500)
 sampSendChat('/radar '..param..' 90')
    else
 sampAddChatMessage("[ ����� ]: ��������� ����� � ������������ � 90 ��/� [/zradar � ������] (�������� � +3 �����))", 0xC1C1C1)
        end
    end)
end

function gradar(param)
 lua_thread.create(function()
 if param ~= nil then
 sampSendChat("/do � ��������� ���������� ����� ��������� ����� � ����. �����.")
 wait(1500)
 sampSendChat("/me ����� ����� ������ ��������, � ������ ������ �����.")
  wait(1500)
 sampSendChat("/me ������ ������ �������� � ����� ����� ����� � �����.")
  wait(1500)
 sampSendChat("/me ������ ����� ������� ������ � �����")
  wait(1500)
 sampSendChat("/me ��������� ����� �� ������, �������� ��� �� ������ ������ � ...")
  wait(1500)
 sampSendChat("/me ��������� �������� \"�.�\"")
 wait(500)
 sampSendChat('/radar '..param..' 60')
 else
 sampAddChatMessage("[ ����� ]: ��������� ����� � ������������ � 60 ��/� [/gradar � ������.] (�������� � +3 �����)", 0xC1C1C1)
        end
    end)
end

function podmoga()
     local citiesList = {'���-������', '���-������', '���-��������'}
 local city = getCityPlayerIsIn(PLAYER_HANDLE)
 if city > 0 then playerCity = citiesList[city] else playerCity = "��� �������" end
        if city then
            sampSendChat('/d ���������� �������! ������� '..kvadrat()..'. �����: '..playerCity)
    end
end

function nickid(param) 
id = tonumber(param) 
    if id ~= nil then 
        if sampIsPlayerConnected(id) then 
            nick = sampGetPlayerNickname(id) 
            sampAddChatMessage(nick, -1) 
        else    
            sampAddChatMessage('{ffffff}* [{1FAEE9}Police{ffffff}]: Id ������: '..id..'. {1FAEE9}��� ������ : '..nick, -1)
        end 
     else 
        sampAddChatMessage('{ffffff}* [{1FAEE9}Police{ffffff}]: ����� �������', -1)
    end
end

function miranda()
	local result, playerID = sampGetPlayerIdByCharHandle(playerPed)
	if result then
		local name = sampGetPlayerNickname(playerID)
		local tryname = string.gsub(name, "_", " ", 1)
		if tryname then
            sampSendChat(string.format("/z ��� �������� ����������� %s.", tryname))
            miranda1 = true
		end
	end
end

function tdocs()
	local result, playerID = sampGetPlayerIdByCharHandle(playerPed)
	if result then
		local name = sampGetPlayerNickname(playerID)
		local tryname = string.gsub(name, "_", " ", 1)
		if tryname then
            sampSendChat(string.format("/z ��� ��������� ��������� ������������������ ������� %s.", tryname))
            rpdocs = true
        end
    end
end

function getMusicList()
	local files = {}
	local handleFile, nameFile = findFirstFile('moonloader/MP3 Player/*.mp3')
	while nameFile do
		if handleFile then
			if not nameFile then
				findClose(handleFile)
			else
				files[#files+1] = nameFile
				nameFile = findNextFile(handleFile)
			end
		end
	end
	return files
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

function ud(param)
	local id = string.match(param, '(%d+)')
	if id ~= nil then
		d1 = id
		pud1 = true
	else
		sampAddChatMessage("{0088ff}[ COP ]{ffffff}: �������� ������������� ������. [ {0088ff}/ud ID{ffffff} ]", 0xC1C1C1)
	end
end

function kvadrat()
		if interior == 0 then
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
			local X, Y, Z = getCharCoordinates(PLAYER_PED)
			X = math.ceil((X + 3000) / 250)
			Y = math.ceil((Y * - 1 + 3000) / 250)
			Y = KV[Y]
			if Y ~= nil then
				KVX = (Y.."-"..X)
				if getActiveInterior() == 0 then BOL = KVX end
				if getActiveInterior() == 0 then cX, cY, cZ = getCharCoordinates(PLAYER_PED) cX = math.ceil(cX) cY = math.ceil(cY) cZ = math.ceil(cZ) end
				return KVX
			else
				KVX = ("ZERO -"..X)
				if getActiveInterior() == 0 then BOL = KVX end
				if getActiveInterior() == 0 then cX, cY, cZ = getCharCoordinates(PLAYER_PED) cX = math.ceil(cX) cY = math.ceil(cY) cZ = math.ceil(cZ) end
				return KVX
			end
		else
			return "N/A"
        end
end

function rpwanteds(param)
	local id = string.match(param, '%s*(.+)')
	if id ~= nil then
		wdid = id
		rpwanted = true
	else
		sampAddChatMessage("{0088ff}[ COP ]{ffffff}:����� ��������� ������ ������ ������� id [{0088ff}/wd ID{ffffff} ]", 0xC1C1C1)
        sampSendChat("/wanted")
    end
end
 function frpobisk(param)
	local id = string.match(param, '%s*(.+)')
	if id ~= nil then
		obid = id
		rpobisk = true
	else
		sampAddChatMessage("{0088ff}[ COP ]{ffffff}:����� �������� ������ ������� id [{0088ff}/frisk ID{ffffff} ]", 0xC1C1C1)
    end
end

function tshv()
  wait(0)
sampSendChat("/me ������ ��������� ���� ������� �������� �� ���������..")
wait(1000)
sampSendChat("/me ..� ����� ���� �� �����.")
end

function findgun(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat("/do �������� ����� �� �����.")
wait(1000)
sampSendChat("/me ������ ��������� ���� ������ ����� � �������� �� �����.")
wait(1000)
sampSendChat("/me ��������� ����� �� �����, ����� ����� ��� � ����� � ����� ��������.")
wait(1000)
sampSendChat('/findgun '..id)
else
sampAddChatMessage("[ ����� ] ��� ������ ����� ������ id.")
end
	end
		end)
			end

function carin(param)
    lua_thread.create(function()
    local id, mesto = param:match("(.+)%s+(.+)")
        if id and mesto ~= nil then
sampSendChat("/me ��������� �� ������ �����������, ����� ������ ����� ������, ����� ����..")
 wait(1500)
sampSendChat("/do .. ������ ����������� � ������ � ������ �����.")
 wait(1500)
sampSendChat('/incar '..id..' '..mesto)
else
    sampAddChatMessage("{ffffff}* [{0088ff}Police]{ffffff}: ����� �������� ����������� � ������ ������� ��� id � ����� ����� (1-3)" -1)
        end 
    end)
end

function cuf(param)
	local id = string.match(param, '%s*(.+)')
	if id ~= nil then
		cufid = id
		rpcuf = true
	else
		sampAddChatMessage("{0088ff}[ COP ]{ffffff}: ����� ��������� �� ������. [ {0088ff}/cuff ID{ffffff} ]", 0xC1C1C1)
	end
end

function arest(param)
	local id = string.match(param, '%s*(.+)')
	if id ~= nil then
		arid = id
		rparest = true
	else
		sampAddChatMessage("{0088ff}[ COP ]{ffffff}: ���������� ������. [ {0088ff}/arrest ID{ffffff} ]", 0xC1C1C1)
	end
end
            
function agetcar()
sampSendChat("/agetcar")
end

function shipped(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat("/do ����� � ������ ������.")
wait(300)
sampSendChat("/me �������� ���� � ������ � ����� �� ������.")
wait(300)
sampSendChat('/ship '..id)
else
sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ���� ��� ����� (������� id)', -1)
end
	end
		end)
            end
            
function wantedchec(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/wanted '..id)
else
sampSendChat("/wanted")
sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ [/wd id].', -1)
end
	end
		end)
            end
            
function persecution(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat('/pursuit '..id)
else
sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ����� ������������� [/pu id]', -1)
end
	end
		end)
            end
            
function sampGetPlayerIdByNickname(nick)
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    if tostring(nick) == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1000 do if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == tostring(nick) then return i end end
end

function kpz()
sampSendChat("/me ������� � ������� �������� ������, ������� ��, ������� ���� � �������� �������� � �������� �.")
sampSendChat("/kpz")
end

function izol(param)
lua_thread.create(function()
  id = tonumber(param)
  if param then
  if id ~= nil then
sampSendChat("/todo �� ������ �� ����, ��� ����*����� ���� ������ ������� �� ������.")
wait(300)
sampSendChat("/me ��������� �� ������ �����������.")
wait(300)
sampSendChat('/izol '..id)
else
sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ��������� ������������ � ������.', -1)
end
  end
    end)
          end
          
  function kam(param)
  lua_thread.create(function()
  id = tonumber(param)
  if param then
  if id ~= nil then
  sampSendChat("/todo �� ������ �� ����, ��� ����*����� ���� ������ ������� �� ������.")
  wait(300)
  sampSendChat("/me ��������� �� ������ �����������.")
  wait(300)
  sampSendChat('/kam '..id)
  else
  sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ���������� ������������ � ������ ������. [/cam id]', -1)
  end
    end
      end)
         end
           
 function bank(param)
  bank = tonumber(param)
  if param then
  if bank ~= nil then
  sampSendChat('/su'..bank..'6 ���������� �����')
    else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ���������� [/bn id]', -1)
		    end
	    end
    end

  function peredarm(param)
  peredarm = tonumber(param)
  if param then
  if peredarm ~= nil then
  sampSendChat('/su'..peredarm..'6 16.9')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ', -1)
		end
	end
end

function shpionaj(param)
shpionaj = tonumber(param)
if param then
if shpionaj ~= nil then
sampSendChat('/su'..shpionaj..'6 ������� 16.5')
else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� �������', -1)
end
	end
		end
function gnapad(param)
    gnapad = tonumber(param)
    if param then
    if gnapad ~= nil then
    sampSendChat('/su'..gnapad..'5 ��������� �� ����������� ����.')
    else
        sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ��������� �� ����������� ����', -1)
    end
    	end
    		end
function napadenienapo(param)
napadenienapo = tonumber(param)
if param then
    if napadenienapo ~= nil then
        sampSendChat('/su '..napadenienapo..' 6 ��������� �� ���������� ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ��������� �� ��.', -1)
		end
	end
end

function proniksc(param)
proniksc = tonumber(param)
if param then
    if proniksc ~= nil then
	   sampSendChat('/su '..proniksc..' 5 ������������� � ����� ����� 17.2 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ������������� � ����� �����', -1)
		end
    end
end

function pronik(param)
pronik = tonumber(param)
if param then
    if pronik ~= nil then
        sampSendChat('/su '..pronik..' 4 ������������� 17.1 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ������������.', -1)
		end
	end
end

function kill(param)
kill = tonumber(param)
if param then
    if kill ~= nil then
        sampSendChat('/su '..kill..' 6 ��������')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ��������.', -1)
		end
	end
end

function nepod(param)
nepod = tonumber(param)
if param then
    if pronik ~= nil then
        sampSendChat('/su '..nepod..' 2 ������������ 3.1 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ������������', -1)
		end
	end
end

function dnepod(param)
dnepod = tonumber(param)
if param then
    if dnepod ~= nil then
        sampSendChat('/su '..dnepod..' 2 �� �������������� ���������� 3.3 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: �� �� ����� Id!', -1)
		end
	end
end

function pugon(param)
pugon = tonumber(param)
if param then
    if pugon ~= nil then
        sampSendChat('/su '..pugon..' 2 ������� ����� 5.2 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ������� �����.', -1)
		end
	end
end

function ugon(param)
ugon = tonumber(param)
if param then
    if ugon ~= nil then
        sampSendChat('/su '..ugon..' 3 ���� �.�. 5.1 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ���� �/�', -1)
		end
	end
end

function hgun(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/su '..id..' 4 �������� ������ ���� �����.  9.1 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� �������� ������ ���� ����� ������� id!', -1)
		end
	end
end

function sgun(param)
sgun = tonumber(param)
if param then

    if sgun ~= nil then
        sampSendChat('/su '..sgun..' 4 ����������� ������� ������ 9.2 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ����������� ������� ������, ������� id!', -1)
		end
	end
end

function hrannarko(param)
hrannarko = tonumber(param)
if param then

    if hrannarko ~= nil then
        sampSendChat('/su '..hrannarko..' 3 �������� ������������� �������')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� �������� ����� ������� id!', -1)
		end
	end
end

function onScriptTerminate(LuaScript, quitGame)
	if LuaScript == thisScript() then
	-- deleteObject(klad)
	-- removePickup(klad3)
	-- sampDestroy3dText(544)
	-- deleteObject(ccobject)
	-- delobj()
	-- questremove()
	-- deleteObject(armorobj)
	sampAddChatMessage('{4682b4}[COP]: {FF0000}Police Assistant ����������.', err)
    sampAddChatMessage('{4682b4}[COP]: {FF0000}��������, ��� ��������� �� ������. ��� ������������ ������� CTRL + R.', err)
    printStyledString(' A collection of the work of the Police Assistant', 7000, 6)
	if enablestr then
		callMethod(7086336, vehptr, 2, 0, 0, 0)
		callMethod(7086336, vehptr, 2, 0, 1, 0)
		callMethod(7086336, vehptr, 2, 0, 3, 0)
	end
	end
end

function sampev.onSendEnterVehicle(vehId, isPassager)
	if vehId == 387 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-L-1.')
	end
	if vehId == 386 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-L-2.')
	end
	if vehId == 385 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-12.')
	end
	if vehId == 384 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-1.')
	end
	if vehId == 383 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-2.')
	end
	if vehId == 382 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-3.')
	end
	if vehId == 381 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-4.')
	end
	if vehId == 380 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-5.')
	end
	if vehId == 379 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-6.')
	end
	if vehId == 378 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-7.')
	end
	if vehId == 377 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-8.')
	end
	if vehId == 376 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-9.')
	end
	if vehId == 375 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-10.')
	end
	if vehId == 374 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-A-11.')
	end
	if vehId == 373 and isPassager == false then
		sampSendChat('�� ���� � ����������� ����������. ���� ����������: 1-STAFF-1.')
	end
end

function sellnarko(param)
sellnarko = tonumber(param)
if param then
    if sellnarko ~= nil then
        sampSendChat('/su '..sellnarko..' 5 ������� ������������� ������� 10.2 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ������� ����� ������� id!', -1)
		end
    end
end

function buynarko(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/su '..id..' 3 ������� ������������� ������� 10.4 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ������� ����� �������! Id!', -1)
		end
	end
end

function kanibalism(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/su '..id..' 6 ���������� 13.1 ��')
		else
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ���������� id!', -1)
		end
	end
end

function frozisk(param)
id = tonumber(param)
if param then
    if id ~= nil then
        sampSendChat('/su '..id..' 6 ����������� ������ 16.8 ��')
        wait(500)
        sampSendChat('/w '..id..' �� ���������� � ������ ���. �������. � �� ��������� ��������.')
        wait(500)
        sampSendChat('/w '..id..' ����� ����� �� ���� ��������� ���������� � ������ �� ������..')
        wait(500)
        sampSendChat('/w '..id..' .. �� ���. ������ FBI.')
		else
        sampAddChatMessage('{ffffff}* [{1FAEE9}Police]{ffffff}: ����� ������ ������ �� �� ������� id!', -1)
		end
	end
end

function LIP.load(fileName)
	assert(type(fileName) == 'string', 'Parameter "fileName" must be a string.');
	local file = assert(io.open(fileName, 'r'), 'Error loading file : ' .. fileName);
	local data = {};
	local section;
	for line in file:lines() do
		local tempSection = line:match('^%[([^%[%]]+)%]$');
		if(tempSection)then
			section = tonumber(tempSection) and tonumber(tempSection) or tempSection;
			data[section] = data[section] or {};
		end
		local param, value = line:match('^([%w|_]+)%s-=%s-(.+)$');
		if(param and value ~= nil)then
			if(tonumber(value))then
				value = tonumber(value);
			elseif(value == 'true')then
				value = true;
			elseif(value == 'false')then
				value = false;
			end
			if(tonumber(param))then
				param = tonumber(param);
			end
			data[section][param] = value;
		end
	end
	file:close();
	return data;
end

function reconnect() 
	lua_thread.create(function()
		sampSetGamestate(5)
		sampDisconnectWithReason()
		wait(1000) 
		sampSetGamestate(1)
	end)
end

function WriteLog(text, path, file)
	if not doesDirectoryExist(getWorkingDirectory()..'\\'..path..'\\') then
		createDirectory(getWorkingDirectory()..'\\'..path..'\\')
	end
	local file = io.open(getWorkingDirectory()..'\\'..path..'\\'..file..'.txt', 'a+')
	file:write(text..'\n')
	file:flush()
	file:close()
end

function sampev.onServerMessage(color, text)
  WriteLog(os.date('[%H:%M:%S | %d.%m.%Y]')..' '..text:gsub("{.-}", ""),  'cop', 'chatlog')
end

function calculateZone(x, y, z)
    local streets = {{"Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169},
    {"Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406},
    {"Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700},
    {"Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406},
    {"Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000},
    {"Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000},
    {"East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916},
    {"LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916},
    {"Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916},
    {"Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100},
    {"Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916},
    {"Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508},
    {"LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916},
    {"Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916},
    {"Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916},
    {"Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000},
    {"Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916},
    {"Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000},
    {"Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874},
    {"Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406},
    {"Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000},
    {"Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000},
    {"Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074},
    {"Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916},
    {"Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916},
    {"Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916},
    {"Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000},
    {"Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916},
    {"Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916},
    {"Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916},
    {"Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916},
    {"Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916},
    {"Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000},
    {"Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916},
    {"Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916},
    {"Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916},
    {"Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916},
    {"Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916},
    {"Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511},
    {"Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916},
    {"Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916},
    {"Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916},
    {"The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916},
    {"Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916},
    {"Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916},
    {"Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916},
    {"Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000},
    {"Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000},
    {"Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916},
    {"Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916},
    {"Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916},
    {"Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916},
    {"The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916},
    {"Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916},
    {"Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916},
    {"Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000},
    {"Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916},
    {"Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916},
    {"Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916},
    {"LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916},
    {"Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916},
    {"Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916},
    {"Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916},
    {"Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916},
    {"Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916},
    {"Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000},
    {"Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500},
    {"Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916},
    {"Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916},
    {"East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916},
    {"Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916},
    {"Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916},
    {"Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916},
    {"Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916},
    {"Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916},
    {"Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000},
    {"Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916},
    {"Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916},
    {"Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916},
    {"Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916},
    {"Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916},
    {"Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916},
    {"Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916},
    {"Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916},
    {"Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000},
    {"Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916},
    {"Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916},
    {"Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916},
    {"Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916},
    {"Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916},
    {"Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916},
    {"Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916},
    {"Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916},
    {"Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916},
    {"Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916},
    {"Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916},
    {"Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916},
    {"Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916},
    {"Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916},
    {"Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916},
    {"Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000},
    {"Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000},
    {"The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916},
    {"Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916},
    {"Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916},
    {"Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916},
    {"Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916},
    {"Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000},
    {"Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916},
    {"The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000},
    {"Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916},
    {"Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916},
    {"Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916},
    {"Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000},
    {"Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916},
    {"Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916},
    {"Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916},
    {"Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916},
    {"Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916},
    {"Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916},
    {"Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916},
    {"Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916},
    {"Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916},
    {"Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916},
    {"King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000},
    {"Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916},
    {"Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000},
    {"Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916},
    {"Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916},
    {"Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000},
    {"Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916},
    {"Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916},
    {"LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916},
    {"Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000},
    {"Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916},
    {"East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916},
    {"Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916},
    {"Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916},
    {"Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916},
    {"Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916},
    {"Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000},
    {"Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000},
    {"Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916},
    {"East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916},
    {"Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916},
    {"Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916},
    {"Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916},
    {"East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916},
    {"Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916},
    {"Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000},
    {"Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916},
    {"Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916},
    {"The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916},
    {"Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916},
    {"Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000},
    {"Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916},
    {"Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916},
    {"Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916},
    {"Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916},
    {"Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916},
    {"Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916},
    {"Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916},
    {"Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916},
    {"Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916},
    {"Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916},
    {"Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916},
    {"Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916},
    {"Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916},
    {"Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916},
    {"Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916},
    {"Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916},
    {"East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916},
    {"Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000},
    {"Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916},
    {"Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000},
    {"El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000},
    {"Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916},
    {"Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000},
    {"The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916},
    {"Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000},
    {"Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916},
    {"Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000},
    {"Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916},
    {"Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916},
    {"East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916},
    {"Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916},
    {"Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916},
    {"Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916},
    {"Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385},
    {"Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916},
    {"East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916},
    {"Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916},
    {"Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916},
    {"Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916},
    {"Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916},
    {"East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916},
    {"Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916},
    {"Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000},
    {"Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916},
    {"Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000},
    {"The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916},
    {"Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916},
    {"Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916},
    {"Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000},
    {"King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000},
    {"El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916},
    {"Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916},
    {"The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916},
    {"Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916},
    {"Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916},
    {"The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916},
    {"Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916},
    {"Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916},
    {"Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916},
    {"Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916},
    {"Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916},
    {"Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916},
    {"King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000},
    {"Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916},
    {"Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916},
    {"Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916},
    {"Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000},
    {"The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916},
    {"Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916},
    {"Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916},
    {"Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916},
    {"Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916},
    {"Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916},
    {"Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000},
    {"Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000},
    {"Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000},
    {"Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916},
    {"City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000},
    {"Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000},
    {"The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916},
    {"Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000},
    {"Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916},
    {"Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916},
    {"Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916},
    {"El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916},
    {"Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000},
    {"Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000},
    {"Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000},
    {"Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000},
    {"Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916},
    {"Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916},
    {"Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000},
    {"Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916},
    {"Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385},
    {"Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916},
    {"Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916},
    {"Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916},
    {"Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916},
    {"Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916},
    {"Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000},
    {"Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000},
    {"K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916},
    {"Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916},
    {"Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916},
    {"Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916},
    {"Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916},
    {"Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916},
    {"East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916},
    {"Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916},
    {"Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000},
    {"Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916},
    {"Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916},
    {"Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000},
    {"Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916},
    {"Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916},
    {"Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000},
    {"Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000},
    {"Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916},
    {"Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916},
    {"Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916},
    {"The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916},
    {"El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000},
    {"Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000},
    {"Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916},
    {"Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916},
    {"Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000},
    {"Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916},
    {"Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916},
    {"Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916},
    {"Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916},
    {"'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000},
    {"Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000},
    {"El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000},
    {"Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000},
    {"Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000},
    {"Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000},
    {"Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916},
    {"East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916},
    {"San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000},
    {"Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000},
    {"Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916},
    {"Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916},
    {"Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916},
    {"Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000},
    {"Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000},
    {"LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916},
    {"Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916},
    {"Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000},
    {"El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000},
    {"Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000},
    {"Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916},
    {"San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000},
    {"Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000},
    {"The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916},
    {"Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916},
    {"Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000},
    {"Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000},
    {"Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916},
    {"Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916},
    {"Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916},
    {"Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000},
    {"Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000},
    {"Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000},
    {"The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981},
    {"The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000},
    {"Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000},
    {"Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000},
    {"Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000},
    {"Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000},
    {"Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916},
    {"Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916},
    {"Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916},
    {"Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916},
    {"Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000},
    {"Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000},
    {"Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000},
    {"Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916},
    {"Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916},
    {"Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916},
    {"Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916},
    {"Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916},
    {"Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000},
    {"Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916},
    {"Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000},
    {"Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916},
    {"Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000},
    {"Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916},
    {"Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000},
    {"Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000},
    {"Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916},
    {"Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000},
    {"Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083},
    {"Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000},
    {"Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000},
    {"Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000},
    {"Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000},
    {"Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000},
    {"Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916},
    {"Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000},
    {"Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000},
    {"North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000},
    {"Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761},
    {"Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916},
    {"Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000},
    {"San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000},
    {"Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000},
    {"Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083},
    {"Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083},
    {"Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000},
    {"The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000},
    {"Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000},
    {"Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000},
    {"Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083},
    {"Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000},
    {"Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000},
    {"Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000},
    {"Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000},
    {"Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000},
    {"San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000},
    {"Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000},
    {"Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000},
    {"Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000}}
    for i, v in ipairs(streets) do
        if (x >= v[2]) and (y >= v[3]) and (z >= v[4]) and (x <= v[5]) and (y <= v[6]) and (z <= v[7]) then
            return v[1]
        end
    end
    return "Unknown"
end

function random_messages()
	lua_thread.create(function()
		local messages = {
			{ "�����������! ���� �� ��������� ������ ��� ���, ���������� ��� � ������� ������������! �������� ����! "}
    }
		while true do
			math.randomseed(os.time())
			wait(600000)
			for _, v in pairs(messages[math.random(1, #messages)]) do
				sampAddChatMessage("{0088ff}[COP]{FFFFFF} "..v)
			end
			wait(600000)
		end
	end)
end

--[[function direction()
    if sampIsLocalPlayerSpawned() then
        local angel = math.ceil(getCharHeading(PLAYER_PED))
        if angel then
            if (angel >= 0 and angel <= 30) or (angel <= 360 and angel >= 330) then
                return "�����"
            elseif (angel > 80 and angel < 100) then
                    return "�����"
            elseif (angel > 260 and angel < 280) then
                    return "������"
            elseif (angel >= 170 and angel <= 190) then
                    return "��"
            elseif (angel >= 31 and angel <= 79) then
                    return "������-�����"
            elseif (angel >= 191 and angel <= 259) then
                    return "���-������"
            elseif (angel >= 81 and angel <= 169) then
                    return "���-�����"
            elseif (angel >= 259 and angel <= 329) then
                    return "������-������"
            else
                return angel
            end
        else
            return "����������"
        end
    else
        return "����������"
    end
end]]

function imgui.CenterTextColoredRGB(text)
    local width = imgui.GetWindowWidth()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local textsize = w:gsub('{.-}', '')
            local text_width = imgui.CalcTextSize(u8(textsize))
            imgui.SetCursorPosX( width / 2 - text_width .x / 2 )
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else
                imgui.Text(u8(w))
            end
        end
    end
    render_text(text)
end

function LIP.save(fileName, data)
	assert(type(fileName) == 'string', 'Parameter "fileName" must be a string.');
	assert(type(data) == 'table', 'Parameter "data" must be a table.');
	local file = assert(io.open(fileName, 'w+b'), 'Error loading file :' .. fileName);
	local contents = '';
	for section, param in pairs(data) do
		contents = contents .. ('[%s]\n'):format(section);
		for key, value in pairs(param) do
			contents = contents .. ('%s=%s\n'):format(key, tostring(value));
		end
		contents = contents .. '\n';
	end
	file:write(contents);
	file:close();
end

return LIP;