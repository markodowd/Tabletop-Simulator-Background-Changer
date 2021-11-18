backgroundURL_0 = ''
backgroundURL_1 = ''
backgroundURL_2 = ''

entries = {
    {textPos = {0, 0.1, -1.00}, buttonPos = {1.1, 0.1, -0.65}},
    {textPos = {0, 0.1, -0.20}, buttonPos = {1.1, 0.1, 0.15}},
    {textPos = {0, 0.1, 0.60}, buttonPos = {1.1, 0.1, 0.95}}
}

-- Startup procedure
function onload(saved_data)
    spawnedInputCount = 0
    spawnedButtonCount = 0
    createTextboxes()
end

function createTextboxes()
    for index, data in ipairs(entries) do
        local fontSize = 48
        local rows = 3

        -- Sets up input reference function
        local inputNumber = spawnedInputCount
        local inputFuncName = "input" .. index
        local inputFunc = function(_, _, value, selected)
            input_function(index, inputNumber, value, selected)
        end
        self.setVar(inputFuncName, inputFunc)

        self.createInput({
            input_function = inputFuncName,
            function_owner = self,
            label = "Enter/Paste URL",
            value = "",
            position = entries[index].textPos,
            width = 1800,
            height = (fontSize * rows) + 24,
            font_size = 48,
            tab = 2
        })

        spawnedInputCount = spawnedInputCount + 1

        self.createButton({
            label = "Change",
            click_function = "change_background",
            function_owner = self,
            position = entries[index].buttonPos,
            width = 600,
            font_size = 48,
            color = {0, 1, 0},
            font_color = {1, 1, 1}
        })

        spawnedButtonCount = spawnedButtonCount + 1
    end
end

function change_background(obj, player_clicker_color, alt_click)
    print(backgroundURL_0)
    print(backgroundURL_1)
    print(backgroundURL_2)

    if (player_clicker_color == 'Black') then
        if (backgroundURL == '') then return end

        Backgrounds.setCustomURL(backgroundURL_1)
        -- end
        -- if (buttonIndex == 1) then
        -- Backgrounds.setCustomURL(backgroundURL_1)
        -- end
        -- if (buttonIndex == 2) then
        -- Backgrounds.setCustomURL(backgroundURL_1)
        -- end
    else
        broadcastToAll("Only the DM (Black) can change the background")
    end
end

function input_function(index, inputNumber, value, selected)
    print(index)
    print(inputNumber)
    print(value)
    print(selected)

    if not selected then
        if (inputNumber == 0) then backgroundURL_0 = value end
        if (inputNumber == 1) then backgroundURL_1 = value end
        if (inputNumber == 2) then backgroundURL_2 = value end
    end
end

function click_none() print(backgroundURL) end
