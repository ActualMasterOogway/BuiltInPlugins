local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.PagedRequestCursor);
return function(_, _) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return {
        idToAssetMap = {}, 
        idsToRender = {}, 
        isLoading = true, 
        currentCursor = v1.createDefaultCursor(), 
        totalAssets = 0, 
        assetsReceived = 0, 
        hasReachedBottom = false, 
        manageableAssets = {}
    };
end;