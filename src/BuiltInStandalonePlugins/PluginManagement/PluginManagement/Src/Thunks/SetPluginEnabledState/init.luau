local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Actions.SetPluginEnabledState);
return function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: l_StudioService_0 (copy), v2 (copy)
    return function(v5) --[[ Line: 6 ]]
        -- upvalues: v3 (copy), l_StudioService_0 (ref), v4 (copy), v2 (ref)
        local l_assetId_0 = v3.assetId;
        l_StudioService_0:SetPluginEnabled(l_assetId_0, v4);
        v5:dispatch(v2(l_assetId_0, v4));
    end;
end;