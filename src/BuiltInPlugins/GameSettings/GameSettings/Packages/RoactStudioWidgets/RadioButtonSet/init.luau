local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.Constants);
local v2 = require(script.Parent.Internal.ThemeChangeListener);
local v3 = require(script.Parent.Internal.Theme);
local v4 = require(script.Parent.Parent.Framework);
local v5 = require(script.Parent.RadioButton);
local l_TitledFrame_0 = v4.UI.TitledFrame;
local v7 = nil;
local function v22(v8) --[[ Line: 29 ]] --[[ Name: RadioButtonSet ]]
    -- upvalues: v0 (copy), v7 (ref), v1 (copy), v5 (copy), l_TitledFrame_0 (copy), v2 (copy)
    local function v21() --[[ Line: 30 ]] --[[ Name: renderInternal ]]
        -- upvalues: v8 (copy), v0 (ref), v7 (ref), v1 (ref), v5 (ref), l_TitledFrame_0 (ref)
        local v9 = nil;
        v9 = if v8.Selected ~= nil then v8.Selected else 1;
        local l_Buttons_0 = v8.Buttons;
        local v11 = {
            Layout = v0.createElement("UIListLayout", {
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v12 = v7(v8);
        if v8.Description then
            table.insert(v11, v0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v1.RADIO_BUTTON_SIZE + 5), 
                TextColor3 = v12.TextDescriptionColor, 
                TextTransparency = v8.Enabled and 0 or 0.5, 
                Font = Enum.Font.SourceSans, 
                TextSize = 22, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v8.Description
            }));
        end;
        local v13 = 0;
        for v14, v15 in ipairs(l_Buttons_0) do
            local l_v11_0 = v11;
            local l_createElement_0 = v0.createElement;
            local l_v5_0 = v5;
            local v19 = {
                Title = v15.Title, 
                Id = v15.Id, 
                Description = v15.Description
            };
            local v20 = true;
            if v15.Id ~= v9 then
                v20 = v14 == v9;
            end;
            v19.Selected = v20;
            v19.Index = v14;
            v19.Enabled = v8.Enabled;
            v19.LayoutOrder = v14;
            v19.Mouse = v8.Mouse;
            v19.OnClicked = function() --[[ Line: 74 ]] --[[ Name: OnClicked ]]
                -- upvalues: v8 (ref), v15 (copy)
                v8.SelectionChanged(v15);
            end;
            table.insert(l_v11_0, l_createElement_0(l_v5_0, v19));
            v13 = v13 + v1.RADIO_BUTTON_SIZE + (v15.Description ~= nil and v1.RADIO_BUTTON_SIZE or 0);
        end;
        if v8.SubDescription then
            table.insert(v11, v0.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 16)
            }, {
                v0.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0, 4, 0, 0), 
                    TextColor3 = v12.TextDescriptionColor, 
                    TextTransparency = v8.Enabled and 0 or 0.5, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 16, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Text = v8.SubDescription
                })
            }));
        end;
        return v0.createElement(l_TitledFrame_0, {
            LayoutOrder = v8.LayoutOrder or 1, 
            Title = v8.Title
        }, v11);
    end;
    return v0.createElement(v2, {
        render = v21
    });
end;
v7 = function(v23) --[[ Line: 115 ]]
    -- upvalues: v3 (copy)
    return {
        TextDescriptionColor = v23.Style and v23.Style.TextDescriptionColor or v3.getRadioButtonTextColor()
    };
end;
return v22;