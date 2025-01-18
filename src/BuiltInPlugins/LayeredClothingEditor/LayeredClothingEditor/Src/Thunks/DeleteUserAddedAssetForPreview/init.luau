local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetUserAddedAssets);
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: l_deepCopy_0 (copy), v1 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: l_deepCopy_0 (ref), v3 (copy), v4 (copy), v1 (ref)
        local l_userAddedAssets_0 = v5:getState().previewStatus.userAddedAssets;
        local v7 = l_deepCopy_0(l_userAddedAssets_0);
        if v7[v3] and v7[v3][v4] then
            v7[v3][v4] = nil;
            v5:dispatch(v1(v7));
        end;
    end;
end;