local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Examples.renderStories);
local v2 = require(script.Parent.stories);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1(v2, {});
end;