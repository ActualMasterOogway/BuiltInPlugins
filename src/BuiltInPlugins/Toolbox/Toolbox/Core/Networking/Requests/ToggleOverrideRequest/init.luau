local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.SetAssetConfigTab);
local v3 = require(l_Actions_0.ClearChange);
local v4 = require(l_Parent_0.Core.Types.ConfigTypes);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.AssetConfigConstants);
return function(v7) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), v6 (copy)
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v4 (ref), v7 (copy), v2 (ref), v3 (ref), v6 (ref)
        if v4:isOverride(v7) then
            v8:dispatch(v2(v4:getGeneralTab()));
            v8:dispatch(v3(v6.OVERRIDE_ASSET_ID));
            return;
        else
            v8:dispatch(v2(v4:getOverrideTab()));
            return;
        end;
    end;
end;