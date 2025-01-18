local l_Parent_0 = script.Parent.Parent.Parent;
local l_PreviewUtil_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.PreviewUtil;
local v2 = require(l_Parent_0.Src.Actions.SetUserAddedAssets);
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
return function(v4, v5, v6) --[[ Line: 10 ]]
    -- upvalues: l_PreviewUtil_0 (copy), l_deepJoin_0 (copy), v2 (copy)
    return function(v7) --[[ Line: 11 ]]
        -- upvalues: v4 (copy), l_PreviewUtil_0 (ref), v5 (copy), l_deepJoin_0 (ref), v2 (ref), v6 (copy)
        local l_userAddedAssets_0 = v7:getState().previewStatus.userAddedAssets;
        local v9 = 1;
        if l_userAddedAssets_0[v4] then
            v9 = #l_userAddedAssets_0[v4] + 1;
        end;
        local v10 = l_PreviewUtil_0.createUserAddedAsset(v5);
        local v11 = l_deepJoin_0(l_userAddedAssets_0, {
            [v4] = {
                [v9] = v10
            }
        });
        v7:dispatch(v2(v11));
        if v6 then
            v6(v10);
        end;
    end;
end;