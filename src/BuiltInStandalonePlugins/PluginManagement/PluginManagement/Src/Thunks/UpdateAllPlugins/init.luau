local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Src.Thunks.UpdatePlugin);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: l_StudioService_0 (copy), v2 (copy)
    return function(v4) --[[ Line: 6 ]]
        -- upvalues: l_StudioService_0 (ref), v2 (ref), v3 (copy)
        local l_plugins_0 = v4:getState().Management.plugins;
        for _, v7 in pairs(l_plugins_0) do
            if not l_StudioService_0:IsPluginUpToDate(v7.assetId, v7.latestVersion) then
                v4:dispatch(v2(v7, v3));
            end;
        end;
    end;
end;