backgroundURL = ''

entries = {
    {textPos = {0, 0.1, -1.00}, buttonPos = {1.1, 0.1, -0.65}},
    {textPos = {0, 0.1, -0.20}, buttonPos = {1.1, 0.1, 0.15}},
    {textPos = {0, 0.1, 0.60}, buttonPos = {1.1, 0.1, 0.95}}
}

-- Startup procedure
function onload(saved_data) createTextboxes() end

function createTextboxes()
    for i, data in ipairs(entries) do
        local fontSize = 48
        local rows = 3

        self.createInput({
            input_function = 'input_function',
            function_owner = self,

            label = "Enter/Paste URL",
            value = "",
            position = entries[i].textPos,
            width = 1800,
            height = (fontSize * rows) + 24,
            font_size = 48,
            tab = 2
        })

        self.createButton({
            label = "Change",
            click_function = "change_background",
            function_owner = self,
            position = entries[i].buttonPos,
            width = 600,
            font_size = 48,
            color = {0, 1, 0},
            font_color = {1, 1, 1}
        })
    end
end

function change_background(obj, player_clicker_color, alt_click)
    if (player_clicker_color == 'Black') then
        if (backgroundURL == '') then return end
        Backgrounds.setCustomURL(backgroundURL)
    else
        broadcastToAll("Only the DM (Black) can change the background")
    end
end

function input_function(obj, player_clicker_color, input_value, selected)
    if not stillEditing then backgroundURL = input_value end
end

function click_none() print(backgroundURL) end
