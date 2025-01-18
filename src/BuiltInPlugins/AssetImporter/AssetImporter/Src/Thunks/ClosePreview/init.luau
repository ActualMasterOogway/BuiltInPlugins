local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.ResetState);
local v3 = require(l_Actions_0.SetShowPreview);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
return function() --[[ Line: 10 ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    return function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v3 (ref), v2 (ref)
        local l_activeQueueItem_0 = v5:getState().Preview.activeQueueItem;
        v5:dispatch(v4(l_activeQueueItem_0));
        v5:dispatch(v3(false));
        v5:dispatch(v2());
    end;
end;