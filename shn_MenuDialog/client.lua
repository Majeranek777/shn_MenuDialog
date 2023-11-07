--[[
    ----------------------------------INSTRUKCJA OBSŁUGI-----------------------------------
export quest_exit - wyłącza nam menu
    Params:
        reason np. "postać nie żyje"
    Przykład:
        exports.shn_q:QuestExit("postać nie żyje")
    
export quest_enter - otwiera menu
    Params: 
        source, 
        name np. "Mariusz Bąk", 
        text np. "Witam, jak się masz?" ,
        array np. array = {{type="button",text="Witaj!"}, {type="button",text="Czego chcesz?"}, {type="button",text="Dobrze"}, {type="input"}}
        action np. "enter" lub "exit" (domyslna wartosc "enter"), -- NIE JEST WYMAGANE 
    Export zwraca nam wartość 1,2,3,4 itd. dla guzików lub np. 72124... dla pól tekstowych
    wartosc 1 dla pierwszego guzika w tablicy, 2 dla drugiego itd. np. {button[1], input[wartosc wpisana przez gracza], button[2], ...}
    Guzików jest max 7 (nie widzę potrzeby wciskać więcej)
    Przykład:
        array = {{type="button",text="Witaj!"}, {type="button",text="Czego chcesz?"}, {type="button",text="Dobrze"}, {type="input"}}
        exports.shn_q:QuestEnter(source, "Mariusz Bąk", "Witaj, jak się masz?", array)
        param = exports.shn_q:QuestEnter(source, name, text, array, action)
    -----------------------------------------KONIEC-----------------------------------------
]]--

RegisterNUICallback('exit', function()
	SetNuiFocus(false, false)
    Retwal:resolve("exit, esc pressed!")
end)

RegisterNUICallback("accept", function(data)
    Retwal:resolve(data.data)
end)

exports('QuestExit', function(reason)
    if reason ~= nil then
        data = reason
    else
        data = "exit"
    end
    SendNUIMessage({
        action = 'exit',
    })
    Retwal:resolve(data)
    return nil
end)

function enter(source, name, text, array, action)
    local obj = {}  
    for i = 1,(#array) do
        obj["p"..(#obj+i)]= array[i]
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = action, 
        name = name, 
        text = text,
        array = json.encode(obj)
    })
end

function Quest(source, name, text, array, action)
    Retwal = new()
    if action == nil then
        action = "enter"
    end
    enter(source, name, text, array, action)
    Citizen.Await(Retwal)
    SetNuiFocus(false, false)
    if tonumber(Retwal.value) ~= nil then
        return tonumber(Retwal.value)
    else
        if type(Retwal.value) == "string" then
            return Retwal.value
        else
            return nil
        end
    end
end

exports('QuestEnter', Quest)