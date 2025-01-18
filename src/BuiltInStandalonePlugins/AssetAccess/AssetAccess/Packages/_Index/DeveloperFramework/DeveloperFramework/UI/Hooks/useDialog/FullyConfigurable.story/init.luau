local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Parent.Dash);
local l_Components_0 = l_Parent_0.UI.Components;
local v4 = require(l_Components_0.IconButton);
local v5 = require(l_Components_0.SelectInput);
local v6 = require(l_Parent_0.UI.Hooks.useDialogDetailsAction);
local v7 = require(l_Parent_0.Util.DialogAction);
local v8 = require(script.Parent);
local v9 = {
    "Confirmation", 
    "Destructive", 
    "Error", 
    "Information", 
    "Question", 
    "Warning"
};
local v10 = {
    {
        name = "None"
    }, 
    {
        name = "Yes", 
        action = v7.YES
    }, 
    {
        name = "No", 
        action = v7.NO
    }, 
    {
        name = "OK", 
        action = v7.OK
    }, 
    {
        name = "Cancel", 
        action = v7.CANCEL
    }, 
    {
        name = "Close", 
        action = v7.CLOSE
    }, 
    {
        name = "Save", 
        action = v7.SAVE
    }, 
    {
        name = "ShowDetails"
    }
};
local v11 = {};
for _, v13 in v10 do
    table.insert(v11, v13.name);
end;
local function v18(v14, v15, v16, v17) --[[ Line: 64 ]] --[[ Name: Toggle ]]
    -- upvalues: v1 (copy), v4 (copy)
    return v1.createElement(v4, {
        OnClick = function() --[[ Line: 66 ]] --[[ Name: OnClick ]]
            -- upvalues: v15 (copy), v14 (copy)
            v15(not v14);
        end, 
        Text = if v14 then v16 else v17
    });
end;
local function v24(v19, v20, v21) --[[ Line: 73 ]] --[[ Name: Dropdown ]]
    -- upvalues: v1 (copy), v5 (copy)
    return v1.createElement(v5, {
        Items = v19, 
        OnItemActivated = function(_, v23) --[[ Line: 76 ]] --[[ Name: OnItemActivated ]]
            -- upvalues: v21 (copy)
            v21(v23);
        end, 
        SelectedIndex = v20
    });
end;
local function v27(v25, v26) --[[ Line: 83 ]] --[[ Name: SettingsRow ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        [v1.Tag] = "X-RowM X-FitY X-Middle"
    }, {
        Label = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = Enum.Font.SourceSans, 
            LayoutOrder = 1, 
            Text = v25, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = 16, 
            [v1.Tag] = "X-Fit"
        }), 
        Content = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            [v1.Tag] = "X-RowM X-Fit X-Middle"
        }, v26)
    });
end;
local function v32(v28, v29, v30) --[[ Line: 105 ]] --[[ Name: getAction ]]
    -- upvalues: v10 (copy), v2 (copy)
    local v31 = v10[v28];
    if v31.action then
        return v2.join(v31.action, {
            Enabled = v29
        });
    elseif v31.name == "ShowDetails" then
        return v2.join(v30, {
            Enabled = v29
        });
    else
        return nil;
    end;
end;
return {
    story = v1.createElement(function() --[[ Line: 116 ]] --[[ Name: FullyConfigurableStory ]]
        -- upvalues: v1 (copy), v6 (copy), v8 (copy), v9 (copy), v32 (copy), v4 (copy), v27 (copy), v24 (copy), v11 (copy), v18 (copy)
        local v33, v34 = v1.useState(1);
        local v35, v36 = v1.useState(false);
        local v37, v38 = v1.useState(2);
        local v39, v40 = v1.useState(true);
        local v41, v42 = v1.useState(1);
        local v43, v44 = v1.useState(true);
        local v45, v46 = v1.useState(1);
        local v47, v48 = v1.useState(true);
        local v49, v50 = v6("Here are the details:\n- This is a detail\n- You rock!\n- Have a nice day!");
        local v51, v52, v53 = v8({
            Intent = v9[v33], 
            Heading = "Are you sure you want to quit Roblox Studio?", 
            Body = "The details will be shown here. The details will be shown here.", 
            Contents = v50(), 
            ActionPrimary = v32(v37, v39, v49), 
            ActionSecondary = v32(v41, v43, v49), 
            ActionTertiary = v32(v45, v47, v49), 
            Modal = v35, 
            Title = "Dialog Story"
        });
        return v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            [v1.Tag] = "X-ColumnM X-Fit"
        }, {
            v1.createElement(v4, {
                OnClick = function() --[[ Line: 150 ]] --[[ Name: OnClick ]]
                    -- upvalues: v53 (copy), v52 (copy), v51 (copy)
                    if v53 then
                        v52();
                        return;
                    else
                        v51();
                        return;
                    end;
                end, 
                Text = ("%* Dialog"):format(v53 and "Hide" or "Show")
            }), 
            v27("Intent", {
                v24(v9, v33, v34)
            }), 
            v27("Primary Action", {
                v24(v11, v37, v38), 
                v18(v39, v40, "Enabled", "Disabled")
            }), 
            v27("Secondary Action", {
                v24(v11, v41, v42), 
                v18(v43, v44, "Enabled", "Disabled")
            }), 
            v27("Tertiary Action", {
                v24(v11, v45, v46), 
                v18(v47, v48, "Enabled", "Disabled")
            }), 
            v18(v35, v36, "Modal: ON", "Modal: OFF")
        });
    end)
};