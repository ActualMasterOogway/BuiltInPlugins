local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.RequestReason);
local v2 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
return function(v3, v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v6) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v3 (copy), v4 (copy), v5 (copy), v1 (ref)
        v6:dispatch(v2(v3, v4, {
            sortIndex = v5, 
            targetPage = 1, 
            currentPage = 0, 
            requestReason = v1.ChangeSort
        }));
    end;
end;