local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v3 = require(l_Parent_0.UI.Components.ScrollingFrame);
local v4 = require(l_Parent_0.Util.LayoutOrderIterator).new();
local function v6(v5) --[[ Line: 11 ]] --[[ Name: createButton ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy)
    return v1.createElement(v2, {
        LayoutOrder = v4:getNextOrder(), 
        Style = "Round", 
        Text = v5, 
        Size = UDim2.new(1, -8, 0, 32), 
        OnClick = function() --[[ Line: 17 ]] --[[ Name: OnClick ]]
            -- upvalues: v5 (copy)
            print(v5);
        end
    });
end;
return function() --[[ Line: 23 ]]
    -- upvalues: v1 (copy), v3 (copy), v6 (copy)
    return v1.createElement(v3, {
        Size = UDim2.fromOffset(300, 100), 
        [v1.Tag] = "X-ColumnM"
    }, {
        ButtonA = v6("Cat"), 
        ButtonB = v6("Dog"), 
        ButtonC = v6("Mouse"), 
        ButtonD = v6("Horse"), 
        ButtonE = v6("Bird"), 
        ButtonF = v6("Jellyfish"), 
        ButtonG = v6("Caterpiller"), 
        ButtonH = v6("Badger"), 
        ButtonI = v6("Catfish")
    });
end;