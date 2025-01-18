local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Types.RequestReason);
local v2 = require(l_Parent_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
return function(v3, v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v5) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v3 (copy), v4 (copy), v1 (ref)
        local l_assets_0 = v5:getState().assets;
        if l_assets_0.isLoading or l_assets_0.hasReachedBottom then
            return;
        else
            local v7 = v5:getState().pageInfo.currentPage or 0;
            v5:dispatch(v2(v3, v4, {
                targetPage = v7 + 1, 
                requestReason = v1.NextPage
            }));
            return;
        end;
    end;
end;