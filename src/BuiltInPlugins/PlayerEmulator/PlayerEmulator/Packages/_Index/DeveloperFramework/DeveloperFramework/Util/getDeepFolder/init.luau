local l_Parent_0 = script.Parent.Parent;
local l_reduce_0 = require(l_Parent_0.Parent.Dash).reduce;
return function(v2, v3) --[[ Line: 13 ]] --[[ Name: getDeepFolder ]]
    -- upvalues: l_reduce_0 (copy)
    local v4 = v3 or game;
    return l_reduce_0(v2, function(v5, v6) --[[ Line: 15 ]]
        local l_v5_FirstChild_0 = v5:FindFirstChild(v6);
        if not l_v5_FirstChild_0 then
            l_v5_FirstChild_0 = Instance.new("Folder");
            l_v5_FirstChild_0.Name = v6;
            l_v5_FirstChild_0.Parent = v5;
        end;
        return l_v5_FirstChild_0;
    end, v4);
end;