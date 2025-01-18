local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Components.SimplePadding);
local v4 = v2.PureComponent:extend("HotkeyUsageInfo");
local function v6(v5) --[[ Line: 43 ]] --[[ Name: HotkeyRow ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        Padding = v2.createElement(v3, {
            Padding = 3
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 3)
        }), 
        Tab = v2.createElement("TextLabel", {
            Text = v5.Hotkey, 
            TextColor3 = v5.ForegroundColor, 
            BackgroundColor3 = v5.BackgroundColor, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1
        }, {
            Padding = v2.createElement(v3, {
                Padding = 3
            }), 
            Corner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            })
        }), 
        Text = v2.createElement("TextLabel", {
            Text = v5.Label, 
            TextColor3 = v5.ForegroundColor, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            Padding = v2.createElement(v3, {
                Padding = 3
            })
        })
    });
end;
v4.render = function(v7) --[[ Line: 78 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy)
    local l_props_0 = v7.props;
    local v9 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.Tooltip);
    local v10 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.Border);
    local v11 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.MainText);
    local v12 = l_props_0.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.DimmedText);
    local v13 = {};
    for v14, v15 in l_props_0.HotkeyList do
        v13[v14] = v2.createElement(v6, {
            ForegroundColor = v11, 
            BackgroundColor = v12, 
            Hotkey = v15.Hotkey, 
            Label = l_props_0.DraggerContext:getText("HotkeyHelp", v15.LabelLocEntry)
        });
    end;
    return v2.createElement(v2.Portal, {
        target = l_props_0.DraggerContext:getGuiParent()
    }, {
        SummonHandlesNoteGui = v2.createElement("ScreenGui", {}, {
            Frame = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 1), 
                Position = UDim2.new(1, -10, 1, -10), 
                Size = UDim2.fromOffset(200, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundColor3 = v9, 
                BorderColor3 = v10
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 3)
                }), 
                Corner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }), 
                Stroke = v2.createElement("UIStroke", {
                    Color = v10
                }), 
                Hotkeys = v2.createFragment(v13)
            })
        })
    });
end;
return v4;