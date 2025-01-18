local l_DraggerFramework_0 = script.Parent.Parent.Parent.Packages.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Implementation.DraggerContext_FixtureImpl);
return {
    new = function(...) --[[ Line: 8 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy)
        local v2 = v1.new(...);
        v2.shouldSnapPivotToGeometry = function(_) --[[ Line: 10 ]] --[[ Name: shouldSnapPivotToGeometry ]]
            return true;
        end;
        return v2;
    end
};