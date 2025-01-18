local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(script.Parent.Parent);
return function(_) --[[ Line: 59 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.resolve():andThen(function() --[[ Line: 65 ]]
        -- upvalues: v2 (ref)
        local v4 = v2.new();
        v4.__mockRootPath = script.Parent.Parent.__tests__.test_root;
        return v4;
    end);
end;