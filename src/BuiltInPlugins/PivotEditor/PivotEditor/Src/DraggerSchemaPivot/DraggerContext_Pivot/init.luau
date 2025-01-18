local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.DraggerFramework.Implementation.DraggerContext_PluginImpl);
return {
    new = function(...) --[[ Line: 8 ]] --[[ Name: new ]]
        -- upvalues: v2 (copy), l_StudioService_0 (copy)
        local v3 = v2.new(...);
        v3.shouldSnapPivotToGeometry = function(_) --[[ Line: 10 ]] --[[ Name: shouldSnapPivotToGeometry ]]
            -- upvalues: l_StudioService_0 (ref)
            return l_StudioService_0.PivotSnapToGeometry;
        end;
        return v3;
    end
};