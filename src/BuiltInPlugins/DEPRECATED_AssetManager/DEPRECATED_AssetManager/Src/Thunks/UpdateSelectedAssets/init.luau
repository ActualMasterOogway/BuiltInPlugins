local l_Parent_0 = script.Parent.Parent.Parent;
local l_shallowEqual_0 = require(l_Parent_0.Packages.Framework).Dash.shallowEqual;
local v2 = require(l_Parent_0.Src.Actions.SetSelectedAssets);
return function(v3) --[[ Line: 12 ]]
    -- upvalues: l_shallowEqual_0 (copy), v2 (copy)
    return function(v4) --[[ Line: 13 ]]
        -- upvalues: l_shallowEqual_0 (ref), v3 (copy), v2 (ref)
        local l_selectedAssets_0 = v4:getState().AssetManagerReducer.selectedAssets;
        if not l_shallowEqual_0(v3, l_selectedAssets_0) then
            v4:dispatch(v2(v3));
        end;
    end;
end;