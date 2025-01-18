local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.TextLabel);
local v4 = require(l_Parent_0.Parent.Cryo);
local v5 = require(l_Parent_0.Util.Immutable);
local v6 = require(l_Parent_0.Util.LayoutOrderIterator);
return function(v7, v8) --[[ Line: 14 ]]
    -- upvalues: v5 (copy), v1 (copy), v2 (copy), v6 (copy), v4 (copy), v3 (copy)
    v8 = v5.JoinDictionaries({
        frameProps = {}, 
        storyRenderer = function(v9, v10) --[[ Line: 17 ]] --[[ Name: storyRenderer ]]
            -- upvalues: v1 (ref), v2 (ref)
            return v1.createElement(v2, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v10.LayoutOrder
            }, {
                Story = v9
            });
        end
    }, v8 or {});
    local v11 = v6.new();
    local v12 = {};
    local v13 = v7();
    local v14 = v4.Dictionary.keys(v13);
    table.sort(v14);
    for _, v16 in ipairs(v14) do
        local v17 = v13[v16];
        if v17 ~= nil then
            v12["Title_" .. v16] = v1.createElement(v3, {
                LayoutOrder = v11:getNextOrder(), 
                Style = "Bold", 
                Text = v16, 
                AutomaticSize = Enum.AutomaticSize.XY
            });
            v12["Story_" .. v16] = v8.storyRenderer(v17, {
                LayoutOrder = v11:getNextOrder()
            });
        end;
    end;
    return v1.createElement(v2, v5.JoinDictionaries({
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Spacing = 10, 
        Style = v8.Style
    }, v8.frameProps), v12);
end;