local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.makeTheme);
local v5 = require(l_Parent_0.Core.Components.Toolbox);
local v6 = require(l_Parent_0.Core.Types.Suggestion);
local v7 = require(l_Parent_0.Core.Types.Background);
local v8 = v2.PureComponent:extend("ToolboxTestWrapper");
v8.init = function(v9) --[[ Line: 14 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v9.state = {
        theme = v4()
    };
end;
v8.render = function(v10, _) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy), v7 (copy), v6 (copy)
    local _ = v10.state.theme;
    return v2.createElement(v5, {
        backgrounds = v7.BACKGROUNDS, 
        suggestions = v6.SUGGESTIONS, 
        Size = UDim2.new(0, 400, 0, 400)
    });
end;
return v8;