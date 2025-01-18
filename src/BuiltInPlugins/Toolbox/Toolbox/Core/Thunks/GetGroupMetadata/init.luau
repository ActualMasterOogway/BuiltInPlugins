local l_Actions_0 = script.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.SetGroupMetadata);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v1 (ref)
        spawn(function() --[[ Line: 8 ]]
            -- upvalues: v2 (ref), v3 (copy), v1 (ref)
            local l_GroupInfoAsync_0 = game:GetService("GroupService"):GetGroupInfoAsync(v2);
            if l_GroupInfoAsync_0 then
                v3:dispatch(v1(l_GroupInfoAsync_0));
            end;
        end);
    end;
end;