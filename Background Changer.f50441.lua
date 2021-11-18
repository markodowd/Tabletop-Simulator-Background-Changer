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
    fontSize = 48
    rows = 3

    for index, data in ipairs(entries) do

        -- Sets up input reference function
        inputNumber = spawnedInputCount
        inputFuncName = "input" .. index
        inputFunc = function(obj, player_clicker_color, input_value, selected,
                             index, inputNumber)
            input_function(obj, player_clicker_color, value, selected, index,
                           inputNumber)
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

        -- Sets up input reference function
        buttonNumber = spawnedButtonCount
        buttonFuncName = "button" .. index
        buttonFunc = function(obj, player_clicker_color, alt_click, index,
                              buttonNumber)
            button_function(obj, player_clicker_color, alt_click, index,
                            buttonNumber)
        end
        self.setVar(buttonFuncName, buttonFunc)

        self.createButton({
            label = "Change",
            click_function = buttonFuncName,
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

function button_function(obj, player_clicker_color, alt_click, index,
                         buttonNumber)
    print(obj)
    print(player_clicker_color)
    print(alt_click)
    print(index)
    print(buttonNumber)

    if (player_clicker_color == 'Black') then
        -- Do nothing with empty fields
        if (backgroundURL_0 == '') then return end
        if (backgroundURL_1 == '') then return end
        if (backgroundURL_2 == '') then return end

        if (buttonNumber == 0) then
            Backgrounds.setCustomURL(backgroundURL_0)
        end

        if (buttonNumber == 1) then
            Backgrounds.setCustomURL(backgroundURL_1)
        end

        if (buttonNumber == 2) then
            Backgrounds.setCustomURL(backgroundURL_2)
        end

    else
        broadcastToAll("Only the DM (Black) can make the change")
    end
end

function input_function(obj, player_clicker_color, input_value, selected, index,
                        inputNumber)
    if not selected then
        if (inputNumber == 0) then backgroundURL_0 = value end
        if (inputNumber == 1) then backgroundURL_1 = value end
        if (inputNumber == 2) then backgroundURL_2 = value end
    end
end

function click_none() print(backgroundURL) end
