local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = {
        VideoId = "rbxassetid://5608250999"
    };
    return {
        Default = v1.createElement(v2, v3)
    };
end;