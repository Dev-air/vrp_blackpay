vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_blackpay")

Citizen.CreateThread(function()
    while true do 
        DrawMarker(27, 1122.3070068359,-3194.4426269531,-40.398338317871-0.9978, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 232, 255, 155, 0, 0, 0, 0, 0, 0, 0)
        if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),1122.3070068359,-3194.4426269531,-40.398338317871, true) <= 1) then
            if IsControlJustPressed(1, 38) then
                TriggerServerEvent("vrp_blackpay:menu")
            end
        end
        Wait(5)
    end
end)

RegisterNetEvent('dirty_money_progressbar')
AddEventHandler('dirty_money_progressbar', function()
    exports['progressBars']:startUI(5000, "검은돈 환전 진행중")
end)

RegisterNetEvent('jewelry_progressbar')
AddEventHandler('jewelry_progressbar', function()
    exports['progressBars']:startUI(5000, "보석 환전 진행중")
end)

RegisterNetEvent('dia_box_progressbar')
AddEventHandler('dia_box_progressbar', function()
    exports['progressBars']:startUI(5000, "다이아 박스 환전 진행중")
end)

RegisterNetEvent('gold_bar_progressbar')
AddEventHandler('gold_bar_progressbar', function()
    exports['progressBars']:startUI(5000, "골드바 환전 진행중")
end)