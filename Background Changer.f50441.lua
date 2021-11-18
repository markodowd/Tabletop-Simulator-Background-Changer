backgroundURL = ''

entries = {
    -- 1
    {
        textboxPosition = {0, 0.1, -1.00},
        changeButtonPosition = {1.1, 0.1, -0.65}
    }, -- 2
    {textboxPosition = {0, 0.1, -0.20}, changeButtonPosition = {1.1, 0.1, 0.15}}, -- 3
    {textboxPosition = {0, 0.1, 0.60}, changeButtonPosition = {1.1, 0.1, 0.95}}
    -- -- 4
    -- {textboxPosition = {0, 0.1, 0.80}, changeButtonPosition = {1.1, 0.1, 1.00}},
    -- -- 5
    -- {textboxPosition = {0, 0.1, 1.40}, changeButtonPosition = {1.1, 0.1, 1.20}}
}

-- Startup procedure
function onload(saved_data)
    -- if disableSave == true then saved_data = "" end
    -- if saved_data ~= "" then
    --     local loaded_data = JSON.decode(saved_data)
    --     ref_buttonData = loaded_data
    -- else
    --     ref_buttonData = defaultButtonData
    -- end

    -- spawnedButtonCount = 0
    -- createCheckbox()
    -- createCounters()
    createTextboxes()
end

-- Makes counters to add/remove entries
-- function createCounters()
--     -- Add
--     self.createButton({
--         label = "+",
--         click_function = "click_none",
--         function_owner = self,
--         position = {0, 10, 0},
--         -- height = size,a
--         -- width = size,
--         -- font_size = data.size,
--         -- scale = buttonScale,
--         color = {1, 1, 1}
--         -- font_color = buttonFontColor
--     })

--     -- Subtract
--     self.createButton({
--         label = "-",
--         click_function = "click_none",
--         function_owner = self,
--         position = {1, 10, 0},
--         -- height = size,
--         -- width = size,
--         -- font_size = data.size,
--         -- scale = buttonScale,
--         color = {1, 1, 1}
--         -- font_color = buttonFontColor
--     })
-- end

function createTextboxes()
    for i, data in ipairs(entries) do
        local fontSize = 48
        local rows = 3

        self.createInput({
            input_function = 'input_function',
            function_owner = self,

            label = "Enter/Paste URL",
            value = "",
            position = entries[i].textboxPosition,
            width = 1800,
            height = (fontSize * rows) + 24,
            font_size = 48,
            color = {1, 1, 1},
            font_color = {0, 0, 0},
            tab = 2,
            rows = 3
        })

        self.createButton({
            label = "Change",
            click_function = "change_background",
            function_owner = self,
            position = entries[i].changeButtonPosition,
            -- height = 60,
            width = 600,
            font_size = 48,
            -- scale = 1,
            color = {0, 1, 0},
            font_color = {1, 1, 1}
        })
    end
end

function change_background()
    if (backgroundURL == '') then return end
    Backgrounds.setCustomURL(backgroundURL)
end

function input_function(obj, player_clicker_color, input_value, selected)
    if not stillEditing then backgroundURL = input_value end
end

function click_none() print(backgroundURL) end
