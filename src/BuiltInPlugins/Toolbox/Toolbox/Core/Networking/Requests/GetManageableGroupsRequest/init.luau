local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Actions.SetManageableGroups);
local v2 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local _ = require(l_script_FirstAncestor_0.Core.Types.GroupTypes);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v1 (ref), v2 (ref)
        return v4:getManageableGroups():andThen(function(v6) --[[ Line: 11 ]]
            -- upvalues: v5 (copy), v1 (ref)
            local l_data_0 = v6.responseBody.data;
            v5:dispatch(v1(l_data_0));
        end, function(v8) --[[ Line: 14 ]]
            -- upvalues: v5 (copy), v2 (ref)
            v5:dispatch(v2(v8));
        end);
    end;
end;