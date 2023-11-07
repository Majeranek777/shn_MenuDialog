value = nil
RegisterCommand('qmenu', function(source, args)
    name = "Mariusz Bąk"
    --Thread się pauzuje, ponieważ skrypt czeka, aż gracz kliknie guzik 
    --Szybkie obejście to włożenie naszego "menu" w osobnego thread'a i reszta skryptu może działać sobie niezależnie!
    Citizen.CreateThread(function()
        Enter(source, name, "Witaj, jak się masz?",{{type="button",text="Chesz może gieta?🤔"}, {type="button",text="Dobrze!"}, {type="button",text="Spierdalaj!"}})
        if value == 1 then
            Enter(source, name, "Kurwa pewnie!",{{type="button",text="[Podaj weed]😍"}, {type="button",text="Spierdalaj!"}})
            if value == 1 then print("Odpala się animacja i oddajesz gieta") 
                Enter(source, name, "... [Podaj hasło]",{{type="input"}, {type="button",text="Spierdalaj!"}})
                if value == 1111 then print("Nie polecam trzymać haseł po cliencie")end
                if value == 1 then print("NPC się na ciebie wkurwia")end
                
            end
            if value == 2 then print("NPC się na ciebie wkurwia")end
        end
        if value == 2 then
            Enter(source, name, "Nie masz może weed?",{{type="button",text="[Podaj weed]"}, {type="button",text="Spierdalaj!"}})
            if value == 1 then print("Odpala się animacja i oddajesz gieta") 
                Enter(source, name, "... [Podaj hasło]🤔",{{type="input"}, {type="button",text="Spierdalaj!"}})
                if value == "Siema" then print("Nie polecam trzymać haseł po cliencie")end
                if value == 2 then print("NPC się na ciebie wkurwia")end
                
            end
            if value == 2 then print("NPC się na ciebie wkurwia")end
        end
        if value == 3 then print("NPC się na ciebie wkurwia")end
    end)
    --Jak robić pętle 101 
    --Pętle rób poza thread'em
    for i = 0, 10 do
        print(i)
    end

    --Funkcja aby kod wyglądał lepiej
    function Enter(source, name, text, array, action)
        value = exports.shn_q:QuestEnter(source, name, text, array, action)
    end
end)