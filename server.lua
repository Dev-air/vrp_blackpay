local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vrp_blackpay")

RegisterServerEvent("vrp_blackpay:menu")
AddEventHandler("vrp_blackpay:menu",function()
    open_menu(source)
end)

function open_menu(source)
  local user_id = vRP.getUserId({source})
  local menu = {name="환전소",css={top="75px", header_color="rgba(0,125,255,0.75)"}}
  menu["검은돈 환전"] = {function(player) dirty_money(player) end}
  menu["보석 환전"] = {function(player) jewelry(player) end}
  menu["다이아몬드 박스 환전"] = {function(player) dia_box(player) end}
  menu["골드바 환전"] = {function(player) gold_bar(player) end}
  -- if vRP.hasPermission({user_id, "exchange.menu"}) then
  --   vRP.openMenu({source,menu})
  -- else
  --   vRPclient.notify(source,{"~r~권한이 없습니다."})
  -- end
  vRP.openMenu({source,menu})
end

function dirty_money(source)
	local user_id = vRP.getUserId({source})
  local check = vRP.getInventoryItemAmount({user_id,"dirty_money"})
  vRP.prompt({source, "검은돈 몇개를 환전하시겠습니까? / 보유 개수("..comma_value(check).."개)", "", function(source, value)
    if value ~= nil and value ~= "" then
      value = tonumber(value)
      if vRP.tryGetInventoryItem({user_id,"dirty_money",value,true}) then
        TriggerClientEvent('dirty_money_progressbar', source)
        Citizen.Wait(5000)
        local amount = value * 0.9
        vRP.giveMoney({user_id,amount})
        vRPclient.notify(source,{"~g~검은돈 "..comma_value(value).."개를 환전하여 "..comma_value(amount).."원을 환전하였습니다."})
        vRP.dirty_moneydiscord("16711680", "OO서버 검은돈 환전 로그", "[ 환전자 고유번호 : ".. user_id .."번 ]\n\n[ 환전자 닉네임 : ".. GetPlayerName(source).." ]\n\n[ 환전 개수 : "..comma_value(value).."개 ]\n\n[ 지급 금액 : "..comma_value(amount).."원 ]\n\n", os.date("환전 일시 : %Y년 %m월 %d일 %H시 %M분 %S초 | Made by : ! 에어#5285"))
      else
        vRPclient.notify(source,{"~r~검은돈이 부족합니다."})
      end
    else
      vRPclient.notify(source,{"~r~정확히 입력해주세요."})
    end
  end})
end

function jewelry(source)
	local user_id = vRP.getUserId({source})
  local check = vRP.getInventoryItemAmount({user_id,"jewelry"})
  vRP.prompt({source, "보석 몇개를 환전하시겠습니까? / 보유 개수("..comma_value(check).."개)", "", function(source, value)
    if value ~= nil and value ~= "" then
      value = tonumber(value)
      if vRP.tryGetInventoryItem({user_id,"jewelry",value,true}) then
        TriggerClientEvent('jewelry_progressbar', source)
        Citizen.Wait(5000)
        local amount = value * 5000000
        vRP.giveMoney({user_id,amount})
        vRPclient.notify(source,{"~g~보석 "..comma_value(value).."개를 환전하여 "..comma_value(amount).."원을 환전하였습니다."})
        vRP.jewelrydiscord("16711680", "OO서버 보석 환전 로그", "[ 환전자 고유번호 : ".. user_id .."번 ]\n\n[ 환전자 닉네임 : ".. GetPlayerName(source).." ]\n\n[ 환전 개수 : "..comma_value(value).."개 ]\n\n[ 지급 금액 : "..comma_value(amount).."원 ]\n\n", os.date("환전 일시 : %Y년 %m월 %d일 %H시 %M분 %S초 | Made by : ! 에어#5285"))
      else
        vRPclient.notify(source,{"~r~보석이 부족합니다."})
      end
    else
      vRPclient.notify(source,{"~r~정확히 입력해주세요."})
    end
  end})
end

function dia_box(source)
	local user_id = vRP.getUserId({source})
  local check = vRP.getInventoryItemAmount({user_id,"dia_box"})
  vRP.prompt({source, "다이아몬드 박스 몇개를 환전하시겠습니까? / 보유 개수("..comma_value(check).."개)", "", function(source, value)
    if value ~= nil and value ~= "" then
      value = tonumber(value)
      if vRP.tryGetInventoryItem({user_id,"dia_box",value,true}) then
        TriggerClientEvent('dia_box_progressbar', source)
        Citizen.Wait(5000)
        local amount = value * 4000000
        vRP.giveMoney({user_id,amount})
        vRPclient.notify(source,{"~g~다이아몬드 박스 "..comma_value(value).."개를 환전하여 "..comma_value(amount).."원을 환전하였습니다."})
        vRP.dia_boxdiscord("16711680", "OO서버 다이아몬드 박스 환전 로그", "[ 환전자 고유번호 : ".. user_id .."번 ]\n\n[ 환전자 닉네임 : ".. GetPlayerName(source).." ]\n\n[ 환전 개수 : "..comma_value(value).."개 ]\n\n[ 지급 금액 : "..comma_value(amount).."원 ]\n\n", os.date("환전 일시 : %Y년 %m월 %d일 %H시 %M분 %S초 | Made by : ! 에어#5285"))
      else
        vRPclient.notify(source,{"~r~다이아몬드 박스가 부족합니다."})
      end
    else
      vRPclient.notify(source,{"~r~정확히 입력해주세요."})
    end
  end})
end

function gold_bar(source)
	local user_id = vRP.getUserId({source})
  local check = vRP.getInventoryItemAmount({user_id,"gold_bar"})
  vRP.prompt({source, "골드바 몇개를 환전하시겠습니까? / 보유 개수("..comma_value(check).."개)", "", function(source, value)
    if value ~= nil and value ~= "" then
      value = tonumber(value)
      if vRP.tryGetInventoryItem({user_id,"gold_bar",value,true}) then
        TriggerClientEvent('gold_bar_progressbar', source)
        Citizen.Wait(5000)
        local amount = value * 2000000
        vRP.giveMoney({user_id,amount})
        vRPclient.notify(source,{"~g~골드바 "..comma_value(value).."개를 환전하여 "..comma_value(amount).."원을 환전하였습니다."})
        vRP.gold_bardiscord("16711680", "OO서버 골드바 환전 로그", "[ 환전자 고유번호 : ".. user_id .."번 ]\n\n[ 환전자 닉네임 : ".. GetPlayerName(source).." ]\n\n[ 환전 개수 : "..comma_value(value).."개 ]\n\n[ 지급 금액 : "..comma_value(amount).."원 ]\n\n", os.date("환전 일시 : %Y년 %m월 %d일 %H시 %M분 %S초 | Made by : ! 에어#5285"))
      else
        vRPclient.notify(source,{"~r~골드바가 부족합니다."})
      end
    else
      vRPclient.notify(source,{"~r~정확히 입력해주세요."})
    end
  end})
end

function comma_value(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

function vRP.dirty_moneydiscord(color, name, message, footer)
  local embed = {
      {
        ["color"] = color,
        ["title"] = "**".. name .."**",
        ["description"] = message,
        ["footer"] = {
        ["text"] = footer,
        },
      }
    }
  
  PerformHttpRequest('웹훅링크', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function vRP.jewelrydiscord(color, name, message, footer)
  local embed = {
      {
        ["color"] = color,
        ["title"] = "**".. name .."**",
        ["description"] = message,
        ["footer"] = {
        ["text"] = footer,
        },
      }
    }
  
  PerformHttpRequest('웹훅링크', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function vRP.dia_boxdiscord(color, name, message, footer)
  local embed = {
      {
        ["color"] = color,
        ["title"] = "**".. name .."**",
        ["description"] = message,
        ["footer"] = {
        ["text"] = footer,
        },
      }
    }
  
  PerformHttpRequest('웹훅링크', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function vRP.gold_bardiscord(color, name, message, footer)
  local embed = {
      {
        ["color"] = color,
        ["title"] = "**".. name .."**",
        ["description"] = message,
        ["footer"] = {
        ["text"] = footer,
        },
      }
    }
  
  PerformHttpRequest('웹훅링크', function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end