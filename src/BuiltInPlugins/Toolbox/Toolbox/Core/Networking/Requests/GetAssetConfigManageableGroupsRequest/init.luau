local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.SetAssetConfigManageableGroups);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (ref)
        return v3:getManageableGroups():andThen(function(v5) --[[ Line: 8 ]]
            -- upvalues: v4 (copy), v1 (ref)
            local l_data_0 = v5.responseBody.data;
            v4:dispatch(v1(l_data_0));
        end, function(v7) --[[ Line: 11 ]]
            -- upvalues: v4 (copy), v2 (ref)
            v4:dispatch(v2(v7));
        end);
    end;
end;