local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Parent.Dash);
local v3 = require(l_Parent_0.UI.Components.LinkText);
local v4 = require(l_Parent_0.UI.Components.InlineLayout.BaseTextElement);
local v5 = require(l_Parent_0.UI.Components.InlineLayout.HoverContext);
local v6 = {};
HoverContextWrapper = function(v7) --[[ Line: 17 ]] --[[ Name: HoverContextWrapper ]]
    -- upvalues: v5 (copy), v1 (copy), v3 (copy), v2 (copy)
    local v8, v9 = v5.useHoverContext(v7.id);
    return v1.createElement(v3, v2.join(v7, {
        isHovered = v8, 
        onHover = v9
    }));
end;
v6.new = function(v10) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return v4.new(HoverContextWrapper, v10);
end;
return v6;