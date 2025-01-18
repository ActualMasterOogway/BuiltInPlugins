local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getStackByFiberInDevAndProd_0 = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactDebugCurrentFrame_0 = l_ReactSharedInternals_0.ReactDebugCurrentFrame;
local v6 = {
    current = nil, 
    isRendering = false
};
v6.getCurrentFiberOwnerNameInDevOrNull = function() --[[ Line: 37 ]]
    -- upvalues: v6 (copy), l_getComponentName_0 (copy)
    if _G.__DEV__ then
        if v6.current == nil then
            return nil;
        else
            local l__debugOwner_0 = v6.current._debugOwner;
            if l__debugOwner_0 then
                return l_getComponentName_0(l__debugOwner_0.type);
            end;
        end;
    end;
    return nil;
end;
local function v8() --[[ Line: 51 ]] --[[ Name: getCurrentFiberStackInDev ]]
    -- upvalues: v6 (copy), l_getStackByFiberInDevAndProd_0 (copy)
    if _G.__DEV__ then
        if v6.current == nil then
            return "";
        else
            return l_getStackByFiberInDevAndProd_0(v6.current);
        end;
    else
        return "";
    end;
end;
v6.resetCurrentFiber = function() --[[ Line: 64 ]]
    -- upvalues: l_ReactDebugCurrentFrame_0 (copy), v6 (copy)
    if _G.__DEV__ then
        l_ReactDebugCurrentFrame_0.getCurrentStack = nil;
        v6.current = nil;
        v6.isRendering = false;
    end;
end;
v6.setCurrentFiber = function(v9) --[[ Line: 73 ]]
    -- upvalues: l_ReactDebugCurrentFrame_0 (copy), v8 (copy), v6 (copy)
    if _G.__DEV__ then
        l_ReactDebugCurrentFrame_0.getCurrentStack = v8;
        v6.current = v9;
        v6.isRendering = false;
    end;
end;
v6.setIsRendering = function(v10) --[[ Line: 82 ]]
    -- upvalues: v6 (copy)
    if _G.__DEV__ then
        v6.isRendering = v10;
    end;
end;
v6.getIsRendering = function() --[[ Line: 88 ]]
    -- upvalues: v6 (copy)
    if _G.__DEV__ then
        return v6.isRendering;
    else
        return false;
    end;
end;
return v6;