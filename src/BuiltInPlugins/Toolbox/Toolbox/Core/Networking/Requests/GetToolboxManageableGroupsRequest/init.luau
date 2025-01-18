local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v2 = require(l_Parent_0.Core.Actions.SetToolboxManageableGroups);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
return function(v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    return function(v7) --[[ Line: 8 ]]
        -- upvalues: v4 (copy), v2 (ref), v6 (copy), v1 (ref), v5 (copy), v3 (ref)
        return v4:getManageableGroups():andThen(function(v8) --[[ Line: 9 ]]
            -- upvalues: v7 (copy), v2 (ref), v6 (ref), v1 (ref), v4 (ref), v5 (ref)
            local l_data_0 = v8.responseBody.data;
            v7:dispatch(v2(l_data_0));
            if v6 then
                v7:dispatch(v1(v4, v5, v6));
            end;
        end, function(v10) --[[ Line: 17 ]]
            -- upvalues: v7 (copy), v3 (ref)
            v7:dispatch(v3(v10));
        end);
    end;
end;