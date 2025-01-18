local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local l_REACT_FORWARD_REF_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_FORWARD_REF_TYPE;
local v4 = nil;
return {
    resolveFunctionForHotReloading = function(v5) --[[ Line: 84 ]] --[[ Name: resolveFunctionForHotReloading ]]
        if _G.__DEV__ then
            return v5;
        else
            return v5;
        end;
    end, 
    resolveClassForHotReloading = function(v6) --[[ Line: 102 ]] --[[ Name: resolveClassForHotReloading ]]
        if _G.__DEV__ then
            return v6;
        else
            return v6;
        end;
    end, 
    resolveForwardRefForHotReloading = function(v7) --[[ Line: 108 ]] --[[ Name: resolveForwardRefForHotReloading ]]
        -- upvalues: l_REACT_FORWARD_REF_TYPE_0 (copy)
        if _G.__DEV__ then
            return v7;
        else
            return v7;
        end;
    end, 
    isCompatibleFamilyForHotReloading = function(_, _) --[[ Line: 146 ]]
        warn("isCompatibleFamilyForHotReloading is stubbed (returns false)");
        return false;
    end, 
    markFailedErrorBoundaryForHotReloading = function(_) --[[ Line: 226 ]]
        -- upvalues: v4 (ref)
        if _G.__DEV__ then
            return;
        else
            return;
        end;
    end
};