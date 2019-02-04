script_name("Police Assistant")
script_description("/cop - �������� �������.")
script_version("2.027")
script_author("Liechtenstein")
script_dependencies("SAMPFUNCS, SAMP")
-------------------����---------------------
require("lib.moonloader")
require("lib.sampfuncs")
local memory = require "memory"
local https = require 'ssl.https'
local dlstatus = require('moonloader').download_status
local sampev = require 'lib.samp.events'
local imgui = require "imgui"
local inicfg = require 'inicfg'
local bitex = require 'bitex'
local bit = require 'bit'
local key = require "vkeys"
local bNotf, notf = pcall(import, "imgui_notf.lua")
local LIP = {};
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
-----------------����������-----------------
col = 0x348cb2
col2 = 0x0088ff
jstart = 1
img = nil
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
local show_main_window = imgui.ImBool(false)
local param = imgui.ImBuffer(10)
----------------------------------

function main()
  while not isSampAvailable() do wait(5000) end
  if not doesDirectoryExist("moonloader\\config") then print("�������� ����� config/") createDirectory("moonloader\\config") print("����� cop �������") end
  check_files()
  rpgunon()
  img = imgui.CreateTextureFromFile(getGameDirectory() .. '\\moonloader\\cop\\images\\logostart.png')
    print("======================COP=======================")
    print('[COP] ����������� ������: [' .. script.this.version..']')
    print("[COP] ������ �������� �������...")
    	if sampGetCurrentServerAddress() == "176.32.37.62" then
    		gameServer = "Pears Project 1"
    		SRVpp1 = 1
        elseif sampGetCurrentServerAddress() == "194.67.221.49" then
    		gameServer = "SK TEAM SERVER"
    		SRV2 = 2
    	else
    		print("������ �� ���������������, ������ ������� ���������")
    		sampAddChatMessage("[{0088ff}COP]{FFFFFF} � ���������, ������ ������ ���������� ��� ������ �� ������ �������.", 0x046D63)
    		sampAddChatMessage("[{0088ff}COP]{FFFFFF} ��������� � �������������, ���� ������ �������� ����������� ������� ������ ��������.", 0x046D63)
            print("[COP] �������� �� ��������. ��������. ")
            thisScript():unload()
    		return
    	end
    print("�������� �������� (������ ���������������), ������: "..tostring(gameServer))
    print("======================COP=======================")
  update()
 if jstart == 1 then
    sampAddChatMessage("{ffffff}*{0088ff} [{0088ff}COP{0088ff}]: {ffffff}������! ���������� Police Assistant. ���� - [/cop].", -1)
    sampAddChatMessage("{ffffff}*{0088ff} [{0088ff}COP{0088ff}]: {ffffff}�����������: Liechtenstein.", -1)
	sampAddChatMessage('{ffffff}*{0088ff} [{00bbff}COP{0088ff}]: {ffffff}������� ������: '..thisScript().version, -1)
 elseif jstart == 2 then
    sampfuncsLog('{ffffff}* [{949055} COP {949055}������� ������ : '..thisScript().version)
 end
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
 while true do
    interior = getActiveInterior()
    if enable then
    sampSendChat('/find '..id)
    wait(2500)
    end
    wait(0)
    
     if isKeyJustPressed(2) then
    if resgun then
      weapon = getCurrentCharWeapon(playerPed)
      while weapon == 24 do
        wait(0)
        sampSendChat("/me ������ �� ������ �������� FN-FNP45")
        wait(600)
        sampSendChat("/me ���� �������� � �������������� � ����������� ���..")
        wait(600)
        sampSendChat("/do �������� ����� � ��������.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
       while weapon == 4 do
        wait(0)
        sampSendChat("/me ������� ��� \"M9 Bayonet\" �� ����� � ������ ���� �������")
        wait(600)
        sampSendChat("/do ��� � ����.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
      while weapon == 30 do
        wait(0)
        sampSendChat("/me ���� � ����� ������� AK-74")
        wait(600)
        sampSendChat("/me ���� ������� � �������������� � ����������� ���")
        wait(600)
        sampSendChat("/do ������� ����� � ��������.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
       while weapon == 31 do
        wait(0)
        sampSendChat("/me ���� � ����� ������� Bushmaster ACR 3.")
        wait(600)
        sampSendChat("/me ���� ������� � �������������� � ����������� ���..")
        wait(600)
        sampSendChat("/do ������� ����� � ��������.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
       while weapon == 43 do
        wait(0)
        sampSendChat("/me ������ �� ����� ����������� � ������� ���")
        wait(600)
        sampSendChat("/do ����������� ������� � ����� � ������.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
      while weapon == 23 do
        wait(0)
        sampSendChat("/me ���� ������������ � �����")
        wait(600)
        sampSendChat("/do ������������ � ����.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
      while weapon == 25 do
        wait(0)
        sampSendChat("/me ���� � ����� �������� Kel-Tec KSG")
        wait(600)
        sampSendChat("/do �������� ����� � ��������.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
      while weapon == 3 do
        wait(0)
        sampSendChat("/me ���� ������� � �����")
        wait(600)
        sampSendChat("/do ������� � �����.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon == 0 or weapon == 46 then
            break
          end
        end
      end
      while weapon == 0 do
        wait(0)
        sampSendChat("/me ������� ������ �� ������� ���������.")
        wait(600)
        sampSendChat("/do ������ ����� �� �����.")
        wait(600)
        while true do
          wait(0)
          weapon = getCurrentCharWeapon(playerPed)
          if weapon ~= 0 then
            break
          end
        end
      end
    end
  end

                if os.date('%H:%M:%S') == "21:00:10" then
				 wait(900)
                 sampAddChatMessage('[COP]: ��������� ����! Good night. Good luck.', -1)
                 wait(1000)
                end

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
		if string.match(str, "Alexander_Liechten", 0, true) then -- ��������� ������� ��������� "������" � ������ str
			if string.find(str, "copreload", 0, true) then                if bNotf then
            notf.addNotification((tostring"�������� ������ ������������! Police Assistant ���������������!"), 4, 2)
            end
					thisScript():reload()
		    end
        end

    		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Liechten", 0, true) then -- ��������� ������� ��������� "������" � ������ str
			if string.find(str, "ReloadALL", 0, true) then
					reloadScripts()
		    end
        end
		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Liechten", 0, true) then -- ��������� ������� ��������� "������" � ������ str
			if string.find(str, "copupd", 0, true) then               
                sampAddChatMessage(string.format("{1faee9}[ COP ]{ffffff}: �������� ����������"), 0xC1C1C1)
					update()
		    end
        end

        		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Liechten", 0, true) then
            if string.find(str, "copversion", 0, true) then
                sampAddChatMessage(string.format("{1faee9}[ COP ]{ffffff}: {00c5ff}������: {ffcc00}%s", script.version), 0xC1C1C1)
			sampSendChat(string.format("/w Alexander_Liechten � ��������� ������ %s!", script.version), 0xC1C1C1)
            end
		end
        
		str, --[[string]] prefstr, --[[int]] colstr, --[[int]] pcolstr = sampGetChatString(--[[int]] 99)
		if string.match(str, "Alexander_Liechten", 0, true) then -- ��������� ������� ��������� "������" � ������ str
            if string.find(str, "copunload", 0, true) then
            if bNotf then
            sampAddChatMessage("{1faee9}[COP]: {ffffff}�����, ����� ��������� :(", -1)
            end
            thisScript():unload()
            end
        end
    if isKeyJustPressed(100) then
        sampSendChat("/wanted")
    end
    imgui.Process = window1.v or window2.v or  window3.v or window4.v or window5.v
    or winyk1.v or winak1.v or windop.v or sbros.v or start.v or info.v 
    end
end

function rpgunon()
  if resgun then
    resgun = false
  else
    resgun = true
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
    if not doesFileExist("moonloader\\imgui_notf.lua") then print("\'�������� �� ������� ������ imgui_notf\'")
		downloadUrlToFile(--[[string]] "https://dl.dropboxusercontent.com/s/t9krt6hwg5z14rd/imgui_notf.lua?dl=0", --[[string]] "moonloader/imgui_notf.lua")
		wait(1500)
        wait(500)
    end
end

function patch()
	if memory.getuint8(0x748C2B) == 0xE8 then
		memory.fill(0x748C2B, 0x90, 5, true)
	elseif memory.getuint8(0x748C7B) == 0xE8 then
		memory.fill(0x748C7B, 0x90, 5, true)
	end
	if memory.getuint8(0x5909AA) == 0xBE then
		memory.write(0x5909AB, 1, 1, true)
	end
	if memory.getuint8(0x590A1D) == 0xBE then
		memory.write(0x590A1D, 0xE9, 1, true)
		memory.write(0x590A1E, 0x8D, 4, true)
	end
	if memory.getuint8(0x748C6B) == 0xC6 then
		memory.fill(0x748C6B, 0x90, 7, true)
	elseif memory.getuint8(0x748CBB) == 0xC6 then
		memory.fill(0x748CBB, 0x90, 7, true)
	end
	if memory.getuint8(0x590AF0) == 0xA1 then
		memory.write(0x590AF0, 0xE9, 1, true)
		memory.write(0x590AF1, 0x140, 4, true)
	end
end
patch()
---------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------main MENU---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

function ammos(param)
  ammo = string.match(param, '(%d+)')
  if ammo ~= nil then
    else
    sampAddChatMessage("{949055}[ RPW ]:{ffffff} �������� ���������� � ��������  {949055}[ /ammo � ]",949055)
    sampAddChatMessage("{949055}[{ffffff} 1 - �������� �������� ���������� ������ | 2 - �������� ������",949055)
    print("[COP] ���������� ������� ammos")
  end
end

function showHelp(param)
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
            progress = progress + 0.004
            wait(100) 
        end 
    end) 
end

local slider_float = imgui.ImFloat(0.0)
local clear_color = imgui.ImVec4(0.45, 0.55, 0.60, 1.00)
local cb_render_in_menu = imgui.ImBool(imgui.RenderInMenu)
local cb_lock_player = imgui.ImBool(imgui.LockPlayer)
local cb_show_cursor = imgui.ImBool(imgui.ShowCursor)
local glyph_ranges_cyrillic = nil
local btn_xy = imgui.ImVec2(-0.1, 0)
local btn_size = imgui.ImVec2(100, 20)
function imgui.OnDrawFrame()
 author = 'Liechtenstein'
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
    imgui.CenterTextColoredRGB('��� ������: '..gameServer..'. �����: '..author)
    progressbar_anim()
 end         
 imgui.End()
 end
 if window1.v then window2.v = false  window3.v = false window4.v = false winak1.v = false winyk1.v = false windop.v = false start.v = false info.v = false window5.v = false
 imgui.SetNextWindowSize(imgui.ImVec2(800, 450), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'������� ���� |Police Assistant| �����������: Liechtenstein', window1, img_state, imgui.WindowFlags.NoResize)
 imgui.Text(u8(string.format('������� ����: %s', os.date('%D. �����: %H:%M:%S'))))
 imgui.Separator()
 imgui.BeginChild('MM', imgui.ImVec2(782,140), true)
 imgui.CenterTextColoredRGB((tostring"������������! �� ���������� ���: "..mynick))
 imgui.CenterTextColoredRGB((tostring'������ � �������� �� ����������: '..gameServer))
 imgui.CenterTextColoredRGB((tostring'�������: '..kvadrat()))
 imgui.CenterTextColoredRGB((tostring'�����: '..tostring(playerCity)))
 imgui.CenterTextColoredRGB((tostring'��������: '..interior))
 imgui.CenterTextColoredRGB((tostring'��� ������� ��������: {ff0000}'..hp))
 imgui.CenterTextColoredRGB((tostring'��������� �����: '..armors))
    imgui.EndChild()
 imgui.Separator()
 if imgui.Button(u8'�������') then window2.v = true end
 imgui.SameLine() if imgui.Button(u8'��������� �� ��������� ������ /d') then window3.v = true end
 imgui.SameLine() if imgui.Button(u8'������') then window4.v = true end
  imgui.SameLine() if imgui.Button(u8'�������') then window5.v = true end
 imgui.SameLine() if imgui.Button(u8'��������� ������') then winyk1.v = true end
 imgui.SameLine() if imgui.Button(u8'���������������� ������') then winak1.v = true end
 if imgui.Button(u8'����������') then windop.v = true end
 imgui.SameLine() if imgui.Button(u8'� �������') then info.v = true end
 imgui.SameLine() if imgui.Button(u8'Relog', btn_xy) then reconnect() end   
 if imgui.CollapsingHeader(u8("���������")) then
  
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
 window2.v = false window1.v = false  window3.v = false window4.v = false winak1.v = false winyk1.v = false windop.v = false start.v = false window5.v = false
 imgui.SetNextWindowSize(imgui.ImVec2(1000,300), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2.2, resY / 2.2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'���������� � �������.', info, imgui.WindowFlags.NoResize, img_state) 
  imgui.CenterTextColoredRGB(tostring'�����������! ������� ���� �������� ��� ������! ���� �� ������ ��������� �� ������ � ������ ������! ��������� �������������!') 
 imgui.CenterTextColoredRGB(tostring'Police Assistant - ������: '..thisScript().version) 
 imgui.CenterTextColoredRGB(tostring'��������! ������ �������� ������ �� � Pears Project [ 1 ] Role Play �!')showHelp(u8'������ ������� �� �������������� ������ ��������.')
 imgui.CenterTextColoredRGB(tostring'����� Police Assistant: {ff0000}Liechtenstein')
 imgui.Separator()
 imgui.CenterTextColoredRGB('�������������: Katsuro, Benjamin Hoffman, Renard Montero')
 imgui.Separator()
 if imgui.Button(u8'C����� �� ��. ������ ������������') then os.execute('explorer "https://vk.com/skripter_liechtenstein"') end
 if imgui.Button(u8'�������� VK ���������') then  os.execute('explorer "https://vk.com/alexanderliecht"') end
 if imgui.Button(u8'��������� �������') then window1.v = true end
    imgui.End()
 end
if sbros.v then
 window2.v = false  window3.v = false window4.v = false winak1.v = false winyk1.v = false windop.v = false start.v = false info.v = false window5.v = false
 imgui.SetNextWindowSize(imgui.ImVec2(156, 70), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2.2, resY / 2.2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'�������� ���������?', imgui.WindowFlags.NoResize, img_state)
 imgui.Text("     ") 
 imgui.SameLine() if imgui.Button(u8'��/Yes') then
         if bNotf then
            notf.addNotification((tostring"����� ��������."), 3, 3)
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
 window1.v = false  window3.v = false window4.v = false winak1.v = false winyk1.v = false windop.v = false start.v = false info.v = false window5.v = false
 imgui.SetNextWindowSize(imgui.ImVec2(600, 600), imgui.Cond.Always)
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'�������', window2, img_state, imgui.WindowFlags.NoResize)
 imgui.Text(u8'[/cop]- ����� �������� ����.')
 imgui.Text(u8'[/pu]-��������� ������ �������������') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/fd]-���������� ����� "/find" (����������� ������ 2.5 �������)')
 imgui.NextColumn()
 imgui.Text(u8'[/cuff] -��������� ����������.') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/tic]- ��������� ������.')
 imgui.Text(u8'[/shi]- �������� ���� ��� �����') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/get]- ����� ���� � ������ [/agetcar')
 imgui.SameLine() showHelp(u8'�������� ������ ����� ������ (/agetcar)')
 imgui.Text(u8'[/nid]- ������ ��� �� id.') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[[/frisk]- �������� ��������') imgui.SameLine() showHelp(u8'������� id')
 imgui.NextColumn()
 imgui.Text(u8'[[/recon]- ��������')
 imgui.Text(u8'[/rw] - ��������� ������ �������') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/in] - �������� ����������� � ������') imgui.SameLine() showHelp(u8'������� id � �����')
 imgui.SameLine() showHelp(u8'��������� ���������: id, Id ����� (1-3)')
 imgui.Text(u8'[/obgun]- �� ����� �� ������.') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/pu]- ����� ������������� �������������.') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/kp]- ������� ������.')
 imgui.Text(u8'[/izoll]- ������ � ������.')  imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/cam]- ���������� � ������ ������.') imgui.SameLine() showHelp(u8'������� id')
 imgui.Text(u8'[/shv]- ������� ������ �� ��������� (��).')
 imgui.Text(u8'[/podm]- ��������� ������� � [/r (���������� �������).')
 imgui.NextColumn()
 imgui.Text(u8'[/mira]- �������� �������..')
 imgui.Text(u8'[/doks]- ����������� ���������.')
 imgui.Text(u8'[/gradar] - ��������� ����� � ������������ 60��[/�.')
 imgui.Text(u8'[/zradar] - ��������� ����� � ������������ 90��[/�.')
 imgui.Text(u8'[/skof]- �����������.')
 imgui.Text(u8'[/gnumcar]- ������ ������')  imgui.SameLine() showHelp(u8'������� id ����� � �����') 
 imgui.Text(u8'=========================================================================================')
 if imgui.Button(u8'��������� �������') then
 window1.v = true
 end
 imgui.End()
 end
 if windop.v then
     window1.v = false window2.v = false  window3.v = false window4.v = false winyk1.v = false winak1.v = false  start.v = false info.v = false window5.v = false
        imgui.SetNextWindowSize(imgui.ImVec2(700, 200), imgui.Cond.Always) -- 
        imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5)) 
        imgui.Begin(u8'����������', windop, img_state, imgui.WindowFlags.NoResize) 
        imgui.Separator()
        imgui.Text(u8'���������� �1: ��������� ScoreBoard') imgui.SameLine() showHelp(u8'������ ���������� ��������� ��������� ��������� ������� ����� ��������� ��� ���� (����� � ��)')
        if imgui.Button(u8'�������') then downdop1() end 
        imgui.Separator()
        if imgui.Button(u8'��������� �������') then
	    window1.v = true end
     imgui.End()
    end
 if window3.v then
 window1.v = false window2.v = false  window4.v = false winak1.v = false winyk1.v = false windop.v = false start.v = false window5.v = false
 imgui.SetNextWindowSize(imgui.ImVec2(700, 700), imgui.Cond.Always) 
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'��������� �� ��������� ������ /d', window3, img_state, imgui.WindowFlags.NoResize) 
 imgui.Text(u8'=========================================================================================')
 imgui.Text(u8'1.������ - ������������ ����� �� 20 �����.')
 imgui.Text(u8'2.���������� � �������/������� ��������� - ������������ ����� �� 30 �����.')
 imgui.Text(u8'3.����������� � ������� ����������� ������������ - ������������ ����� �� 30 �����.')
 imgui.Text(u8'5.OOC ����������� - ������������ ����� �� 20 �����.')
 imgui.Text(u8'4.������������ ������������� ������� - ������������ ����� �� 20 �����.')
 imgui.Text(u8'6.������������ ����� ������������ ������ ���������� � ���.���������� - ������������ ����� �� 30 �����.')
 imgui.Text(u8'=========================================================================================')
 if imgui.Button(u8'��������� �������') then
 window1.v = true
 end
 imgui.End()
 end

 if window4.v then
 window1.v = false window2.v = false  window3.v = false winak1.v = false winyk1.v = false windop.v = false start.v = false info.v = false window5.v = false
 imgui.SetNextWindowSize(imgui.ImVec2(600, 450), imgui.Cond.Always) 
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'������', window4, img_state, imgui.WindowFlags.NoResize) 
 imgui.Text(u8'=========================================================================================')
 imgui.Text(u8'[/pnap] - ������ ������ �� ��������� �� ��.')
 imgui.Text(u8'[/nap] - ������ ������ �� ��������� �� ����������� ����.')
 imgui.Text(u8'[/ppron]- ������ ������ �� ������������� � ����� �����.')
 imgui.Text(u8'[/pron] - ������ ������ �� �������������.')
 imgui.Text(u8'[/kill]- ������ ������ ��  ��������.')
 imgui.Text(u8'[/nep]- ������ ������ �� ������������.')
 imgui.Text(u8'[/dnep]- ������ ������ �� ����� ���������� ���������.')
 imgui.Text(u8'[/pugon]- ������ ������ �� ������� �����.')
 imgui.Text(u8'[/ugon]- ������ ������ �� ����.')
 imgui.Text(u8'[/gun]- ������ ������ �� �������� ������ ����������� �����. (4 (�� ���� 14�� �����.).')
 imgui.Text(u8'[/sgun]- ������ ������ �� ������� ������.')
 imgui.Text(u8'[/bgun]- ������ ������ �� ������� ������.')
 imgui.Text(u8'[/nark]- ������ ������ �� �������� ����������.')
 imgui.Text(u8'[/snark]- ������ ������ �� ������� ����������.')
 imgui.Text(u8'[/bnark]- ������ ������ �� ������� ����������.')
 imgui.Text(u8'[/kan]- ������ ������ �� ����������.')
 imgui.Text(u8'[/fr]- ������ ������ �� ���������� � ������ ������������ �������.')
 imgui.Text(u8'[/parm]- ������ ������ �� ������ 16.9')
 imgui.Text(u8'[/spy]- ������ ������ �� �������.')
 imgui.Text(u8'[/bn]- ������ ������ �� ���������� �����')
 imgui.Text(u8'=========================================================================================')
 if imgui.Button(u8'��������� �������') then
 window1.v = true
 end
 imgui.End()
 end
  if window5.v then
 window1.v = false window2.v = false  window3.v = false winak1.v = false winyk1.v = false windop.v = false start.v = false info.v = false
 imgui.SetNextWindowSize(imgui.ImVec2(600, 450), imgui.Cond.Always) 
 imgui.SetNextWindowPos(imgui.ImVec2(resX / 2, resY / 2), imgui.Cond.Once, imgui.ImVec2(0.5, 0.5))
 imgui.Begin(u8'�������', window5, img_state, imgui.WindowFlags.NoResize) 
 imgui.Separator()
 imgui.Text(u8'[NUM4] - ���� ������� (/wanted)')
 imgui.Separator()
 if imgui.Button(u8'��������� �������') then
 window1.v = true
 end
 imgui.End()
 end
 if winyk1.v then
 window1.v = false window2.v = false  window3.v = false window4.v = false winak1.v = false windop.v = false start.v = false info.v = false window5.v = false
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
 if imgui.Button(u8'��������� �������') then
 window1.v = true
 end
 imgui.End()
 end
 if winak1.v then 
 window1.v = false window2.v = false  window3.v = false window4.v = false winyk1.v = false windop.v = false start.v = false info.v = false window5.v = false
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
 if imgui.Button(u8'��������� �������') then
    window1.v = true
 end
  imgui.End()
  end
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
  sampAddChatMessage('{ffffff}* [{949055}Liechten{ffffff}]: {949055} ���������� ���������.',0xC1C1C1)
  sampSendChat('/sms Alexander_Liechten � ������(�) ���������� �1!')
  reloadScripts()
end

function update()
    local text = https.request('https://raw.githubusercontent.com/Liechten/projects/master/copversion.json')
    if text:byte(1) ~= 123 then return end
    local tab = decodeJson(text)
    local lv = tonumber(tab.latest)
    local cv = tonumber(script.this.version)
    if lv > cv then
        print('[cop] ������������� ����������!')
        lua_thread.create(function()
            downloadUrlToFile('https://raw.githubusercontent.com/Liechten/projects/master/Police_assistant.lua', script.this.path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                print('[cop] ���������� ���������')
                script.this:reload()
                end
            end)
        end)
    end
end

function window() 
    start.v = not start.v
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
                sampSendChat('/d ������������� '..nick.. '. ������� '..id..'.')
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
 local lenght = string.len(param)
 if lenght == 0 then
 sampAddChatMessage("[ ����� ]: ��������� ����� � ������������ � 90 ��/� [/zradar � ������] (�������� � +3 �����))", 0xC1C1C1)
 return false
 else
 sampSendChat("/do � ��������� ���������� ����� ��������� �����.")
 sampSendChat("")
 sampSendChat("")
 sampSendChat("")
    sampSendChat('/radar '..param..' 90')
 end
end

function gradar(param)
 lua_thread.create(function()
 id = tonumber(param)
 if param then
 if id ~= nil then
 sampSendChat('/radar '..param..' 60')
 else
 sampAddChatMessage("[ ����� ]: ��������� ����� � ������������ � 60 ��/� [/gradar � ������.] (�������� � +3 �����)", 0xC1C1C1)
            end
        end
    end)
end

function podmoga(param)
  id = tonumber(param)
    if param then
        if result then
            sampSendChat('/r ���������� �������! � � �������� '..kvadrat())
        end
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

function frisked(param)
lua_thread.create(function()
id = tonumber(param)
if param then
    if id ~= nil then
sampSendChat("/do �������� ����� �� �����.")
wait(800)
sampSendChat("/me ������ ��������� ���� ������ ����� � �������� �� �����.")
wait(800)
sampSendChat("/me ��������� ����� �� �����, ����� ����� ��� � ����� � ����� ��������.")
wait(800)
sampSendChat('/frisk '..id)
else
sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: �������� ��������. (������� Id!)', -1)
end
	end
		end)
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
sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ��� ���� ���� ������ ������ ������� id.', -1)
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
sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: �������� ����� ������������� (������� id)', -1)
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
  sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ���������� ������������ � ������ ������.', -1)
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
    sampAddChatMessage('{ffffff}* [{0088ff}Police]{ffffff}: ������ ������ �� ����������', -1)
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
        sampSendChat('/sms '..id..' �� ���������� � ������ ���. �������..')
        wait(500)
        sampSendChat('/sms '..id..' ����� ����� �� ���� ��������� ���������� � ������ �� ������..')
        wait(500)
        sampSendChat('/sms '..id..' .. �� ���. ������ ������� FBI.')
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

function random_messages()
	lua_thread.create(function()
		local messages = {
			{ "�����������! ���� �� ��������� ������ ��� ���, ���������� ��� � ������� ������������! �������� ����! "}
    }
		while true do
			math.randomseed(os.time())
			wait(3000000)
			for _, v in pairs(messages[math.random(1, #messages)]) do
				sampAddChatMessage("[COP]{FFFFFF} "..v, 0x046D63)
			end
			wait(3000000)
		end
	end)
end

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