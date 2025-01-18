local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetAssets);
local v2 = require(l_Parent_0.Src.Actions.SetAssetsModerationData);
local v3 = require(l_Parent_0.Src.Actions.SetIsFetchingAssets);
local v4 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v5 = require(l_Parent_0.Src.Actions.SetSelectedAssets);
local v6 = require(l_Parent_0.Src.Actions.SetSearchTerm);
local v7 = require(l_Parent_0.Src.Thunks.GetAssets);
local v8 = require(l_Parent_0.Src.Util.Screens);
return function(v9, v10) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v8 (copy), v7 (copy)
    return function(v11) --[[ Line: 15 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v10 (copy), v8 (ref), v7 (ref), v9 (copy)
        v11:dispatch(v1({
            assets = {}
        }));
        v11:dispatch(v2({}));
        v11:dispatch(v3(false));
        v11:dispatch(v4({}));
        v11:dispatch(v5({}));
        v11:dispatch(v6(""));
        if v10.Path ~= v8.MAIN.Path then
            v11:dispatch(v7(v9, v10.AssetType));
        end;
    end;
end;