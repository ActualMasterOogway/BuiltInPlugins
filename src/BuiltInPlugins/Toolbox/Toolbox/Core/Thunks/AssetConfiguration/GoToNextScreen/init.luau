local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.SetCurrentScreen);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.AssetConfigConstants);
return function() --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v2 (copy)
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (ref), v2 (ref)
        if v5:getState().screenFlowType == v4.FLOW_TYPE.UPLOAD_FLOW then
            v5:dispatch(v2(v4.SCREENS.ASSET_VALIDATION));
            return;
        else
            v5:dispatch(v2(v4.SCREENS.CONFIGURE_ASSET));
            return;
        end;
    end;
end;