local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.CodeBlock);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (setmetatable({
        _root = v1.new(1, 1)
    }, v2));
end;
v2.GetRoot = function(v3) --[[ Line: 13 ]] --[[ Name: GetRoot ]]
    return v3._root;
end;
v2.TraverseBF = function(v4, v5) --[[ Line: 17 ]] --[[ Name: TraverseBF ]]
    local v6 = {
        v4._root
    };
    while #v6 > 0 do
        local v7 = v6[1];
        table.remove(v6, 1);
        for _, v9 in ipairs(v7.Children) do
            table.insert(v6, v9);
        end;
        v5(v7);
    end;
end;
v2.TraverseUp = function(v10, v11) --[[ Line: 32 ]] --[[ Name: TraverseUp ]]
    local l_v10_0 = v10;
    while true do
        if l_v10_0 then
            if v11(l_v10_0) then
                return;
            else
                l_v10_0 = l_v10_0.Parent;
            end;
        else
            return;
        end;
    end;
end;
return v2;