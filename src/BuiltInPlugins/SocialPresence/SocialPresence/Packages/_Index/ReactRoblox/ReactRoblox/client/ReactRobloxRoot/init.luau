local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local _ = require(l_Parent_0.ReactReconciler);
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.ReactReconciler);
local v5 = require(script.Parent.ReactRobloxComponentTree);
local l_markContainerAsRoot_0 = v5.markContainerAsRoot;
local l_unmarkContainerAsRoot_0 = v5.unmarkContainerAsRoot;
local v8 = require(script.Parent.Parent["ReactReconciler.roblox"]);
local l_createContainer_0 = v8.createContainer;
local l_updateContainer_0 = v8.updateContainer;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableEagerRootListeners_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableEagerRootListeners;
local l_BlockingRoot_0 = v8.ReactRootTags.BlockingRoot;
local l_ConcurrentRoot_0 = v8.ReactRootTags.ConcurrentRoot;
local l_LegacyRoot_0 = v8.ReactRootTags.LegacyRoot;
local v16 = nil;
local v17 = {};
v17.__index = v17;
v17.new = function(v18, v19) --[[ Line: 60 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), v16 (ref), l_ConcurrentRoot_0 (copy)
    local v20 = setmetatable({}, v17);
    v20._internalRoot = v16(v18, l_ConcurrentRoot_0, v19);
    return v20;
end;
local function _(v21, v22, v23) --[[ Line: 67 ]] --[[ Name: createBlockingRoot ]]
    -- upvalues: v17 (copy), v16 (ref)
    local v24 = setmetatable({}, v17);
    v24._internalRoot = v16(v21, v22, v23);
    return v24;
end;
v17.render = function(v26, v27) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: l_updateContainer_0 (copy)
    local l__internalRoot_0 = v26._internalRoot;
    l_updateContainer_0(v27, l__internalRoot_0, nil);
end;
v17.unmount = function(v29) --[[ Line: 109 ]] --[[ Name: unmount ]]
    -- upvalues: l_updateContainer_0 (copy), l_unmarkContainerAsRoot_0 (copy)
    local l__internalRoot_1 = v29._internalRoot;
    local l_containerInfo_0 = l__internalRoot_1.containerInfo;
    l_updateContainer_0(nil, l__internalRoot_1, nil, function() --[[ Line: 120 ]]
        -- upvalues: l_unmarkContainerAsRoot_0 (ref), l_containerInfo_0 (copy)
        l_unmarkContainerAsRoot_0(l_containerInfo_0);
    end);
end;
v16 = function(v32, v33, v34) --[[ Line: 131 ]]
    -- upvalues: l_createContainer_0 (copy), l_markContainerAsRoot_0 (copy), l_enableEagerRootListeners_0 (copy)
    local v35 = false;
    if v34 ~= nil then
        v35 = v34.hydrate == true;
    end;
    local v36 = if v34 ~= nil then v34.hydrationOptions else nil;
    local v37 = v34 ~= nil and v34.hydrationOptions ~= nil and v34.hydrationOptions.mutableSources or nil;
    local v38 = l_createContainer_0(v32, v33, v35, v36);
    l_markContainerAsRoot_0(v38.current, v32);
    if l_enableEagerRootListeners_0 then

    end;
    if v37 then

    end;
    return v38;
end;
local v50 = {
    isValidContainer = function(v39) --[[ Line: 183 ]] --[[ Name: isValidContainer ]]
        return typeof(v39) == "Instance";
    end, 
    createRoot = function(v40, v41) --[[ Line: 200 ]]
        -- upvalues: l_invariant_0 (copy), v17 (copy)
        l_invariant_0(typeof(v40) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v40);
        return v17.new(v40, v41);
    end, 
    createBlockingRoot = function(v42, v43) --[[ Line: 213 ]]
        -- upvalues: l_invariant_0 (copy), l_BlockingRoot_0 (copy), v17 (copy), v16 (ref)
        l_invariant_0(typeof(v42) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v42);
        local l_l_BlockingRoot_0_0 = l_BlockingRoot_0;
        local v45 = setmetatable({}, v17);
        v45._internalRoot = v16(v42, l_l_BlockingRoot_0_0, v43);
        return v45;
    end, 
    createLegacyRoot = function(v46, v47) --[[ Line: 226 ]]
        -- upvalues: l_LegacyRoot_0 (copy), v17 (copy), v16 (ref)
        local l_l_LegacyRoot_0_0 = l_LegacyRoot_0;
        local v49 = setmetatable({}, v17);
        v49._internalRoot = v16(v46, l_l_LegacyRoot_0_0, v47);
        return v49;
    end
};
warnIfReactDOMContainerInDEV = function(_) --[[ Line: 233 ]] --[[ Name: warnIfReactDOMContainerInDEV ]]
    if _G.__DEV__ then

    end;
end;
return v50;