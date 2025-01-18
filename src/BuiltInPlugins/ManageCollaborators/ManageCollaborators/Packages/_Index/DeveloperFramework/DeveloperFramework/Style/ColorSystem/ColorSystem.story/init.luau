local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.TextLabel);
local v4 = require(l_Parent_0.UI.Components.TitledFrame);
local v5 = require(script.Parent);
return (function() --[[ Line: 10 ]] --[[ Name: createThemePane ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    local function v8(v6, v7) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref)
        return v1.createElement(v2, {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v6:match("%d+"), 
            Style = "BorderBox", 
            Spacing = 5, 
            Padding = 5
        }, {
            ColorSwatch = v1.createElement("Frame", {
                Size = UDim2.fromOffset(100, 75), 
                BackgroundColor3 = v7, 
                LayoutOrder = 1
            }), 
            ColorName = v1.createElement(v3, {
                Text = v6, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2
            }), 
            HexCode = v1.createElement(v3, {
                Text = ("#%s"):format(v7:ToHex()), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3
            })
        });
    end;
    local function v14(v9, v10) --[[ Line: 37 ]]
        -- upvalues: v1 (ref), v8 (copy), v4 (ref), v2 (ref)
        local v11 = {
            Layout = v1.createElement("UIGridLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                CellPadding = UDim2.fromOffset(5, 5), 
                CellSize = UDim2.fromOffset(200, 200)
            })
        };
        for v12, v13 in pairs(v10) do
            table.insert(v11, v8(v9 .. v12, v13));
        end;
        return v1.createElement(v4, {
            Title = v9
        }, {
            ColorList = v1.createElement(v2, {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2
            }, v11)
        });
    end;
    local v15 = {};
    for v16, v17 in pairs(v5) do
        table.insert(v15, v14(v16, v17));
    end;
    return v1.createElement(v2, {
        Spacing = 50, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical
    }, v15);
end)();