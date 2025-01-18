local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.TextLabel);
local v4 = require(l_Parent_0.UI.Components.TitledFrame);
local v5 = require(script.Parent.StudioColorClasses);
local function v21(v6) --[[ Line: 10 ]] --[[ Name: createThemePane ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v7 = 0;
    local function v10(v8, v9) --[[ Line: 13 ]]
        -- upvalues: v7 (ref), v1 (ref), v2 (ref), v3 (ref)
        v7 = v7 + 1;
        return v1.createElement(v2, {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v7, 
            Style = "BorderBox", 
            Padding = 5, 
            Spacing = 5
        }, {
            ColorSwatch = v1.createElement("Frame", {
                Size = UDim2.fromOffset(100, 75), 
                BackgroundColor3 = v9, 
                LayoutOrder = 1
            }), 
            ColorName = v1.createElement(v3, {
                Text = v8, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2
            }), 
            HexCode = v1.createElement(v3, {
                Text = ("#%s"):format(v9:ToHex()), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3
            })
        });
    end;
    local v11 = 0;
    local function v17(v12, v13) --[[ Line: 41 ]]
        -- upvalues: v1 (ref), v10 (copy), v6 (copy), v11 (ref), v4 (ref), v2 (ref)
        local v14 = {
            Layout = v1.createElement("UIGridLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                CellPadding = UDim2.fromOffset(5, 5), 
                CellSize = UDim2.fromOffset(200, 200)
            })
        };
        for v15, v16 in pairs(v13) do
            table.insert(v14, v10(v15, v16[v6]));
        end;
        v11 = v11 + 1;
        return v1.createElement(v4, {
            Title = v12
        }, {
            ColorList = v1.createElement(v2, {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2
            }, v14)
        });
    end;
    local v18 = {};
    for v19, v20 in pairs(v5) do
        table.insert(v18, v17(v19, v20));
    end;
    return v1.createElement(v2, {
        Spacing = 50, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical
    }, v18);
end;
return {
    stories = {
        LightTheme = v21("Light"), 
        DarkTheme = v21("Dark")
    }
};