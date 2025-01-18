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
local l_flushSync_0 = v8.flushSync;
local l_flushPassiveEffects_0 = v8.flushPassiveEffects;
local l_BlockingRoot_0 = v8.ReactRootTags.BlockingRoot;
local l_ConcurrentRoot_0 = v8.ReactRootTags.ConcurrentRoot;
local l_LegacyRoot_0 = v8.ReactRootTags.LegacyRoot;
local v18 = nil;
local v19 = {};
v19.__index = v19;
v19.new = function(v20, v21) --[[ Line: 65 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy), v18 (ref), l_ConcurrentRoot_0 (copy)
    local v22 = setmetatable({}, v19);
    v22._internalRoot = v18(v20, l_ConcurrentRoot_0, v21);
    return v22;
end;
local function _(v23, v24, v25) --[[ Line: 72 ]] --[[ Name: createBlockingRoot ]]
    -- upvalues: v19 (copy), v18 (ref)
    local v26 = setmetatable({}, v19);
    v26._internalRoot = v18(v23, v24, v25);
    return v26;
end;
v19.render = function(v28, v29) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: l_updateContainer_0 (copy)
    local l__internalRoot_0 = v28._internalRoot;
    l_updateContainer_0(v29, l__internalRoot_0, nil);
end;
v19.unmount = function(v31) --[[ Line: 112 ]] --[[ Name: unmount ]]
    -- upvalues: l_flushSync_0 (copy), l_updateContainer_0 (copy), l_unmarkContainerAsRoot_0 (copy), l_flushPassiveEffects_0 (copy)
    local l__internalRoot_1 = v31._internalRoot;
    local l_containerInfo_0 = l__internalRoot_1.containerInfo;
    l_flushSync_0(function() --[[ Line: 125 ]]
        -- upvalues: l_updateContainer_0 (ref), l__internalRoot_1 (copy), l_unmarkContainerAsRoot_0 (ref), l_containerInfo_0 (copy)
        l_updateContainer_0(nil, l__internalRoot_1, nil, function() --[[ Line: 126 ]]
            -- upvalues: l_unmarkContainerAsRoot_0 (ref), l_containerInfo_0 (ref)
            l_unmarkContainerAsRoot_0(l_containerInfo_0);
        end);
    end);
    l_flushPassiveEffects_0();
end;
v18 = function(v34, v35, v36) --[[ Line: 140 ]]
    -- upvalues: l_createContainer_0 (copy), l_markContainerAsRoot_0 (copy), l_enableEagerRootListeners_0 (copy)
    local v37 = false;
    if v36 ~= nil then
        v37 = v36.hydrate == true;
    end;
    local v38 = if v36 ~= nil then v36.hydrationOptions else nil;
    local v39 = v36 ~= nil and v36.hydrationOptions ~= nil and v36.hydrationOptions.mutableSources or nil;
    local v40 = l_createContainer_0(v34, v35, v37, v38);
    l_markContainerAsRoot_0(v40.current, v34);
    if l_enableEagerRootListeners_0 then

    end;
    if v39 then

    end;
    return v40;
end;
local v52 = {
    isValidContainer = function(v41) --[[ Line: 188 ]] --[[ Name: isValidContainer ]]
        return typeof(v41) == "Instance";
    end, 
    createRoot = function(v42, v43) --[[ Line: 205 ]]
        -- upvalues: l_invariant_0 (copy), v19 (copy)
        l_invariant_0(typeof(v42) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v42);
        return v19.new(v42, v43);
    end, 
    createBlockingRoot = function(v44, v45) --[[ Line: 216 ]]
        -- upvalues: l_invariant_0 (copy), l_BlockingRoot_0 (copy), v19 (copy), v18 (ref)
        l_invariant_0(typeof(v44) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v44);
        local l_l_BlockingRoot_0_0 = l_BlockingRoot_0;
        local v47 = setmetatable({}, v19);
        v47._internalRoot = v18(v44, l_l_BlockingRoot_0_0, v45);
        return v47;
    end, 
    createLegacyRoot = function(v48, v49) --[[ Line: 226 ]]
        -- upvalues: l_LegacyRoot_0 (copy), v19 (copy), v18 (ref)
        local l_l_LegacyRoot_0_0 = l_LegacyRoot_0;
        local v51 = setmetatable({}, v19);
        v51._internalRoot = v18(v48, l_l_LegacyRoot_0_0, v49);
        return v51;
    end
};
warnIfReactDOMContainerInDEV = function(_) --[[ Line: 230 ]] --[[ Name: warnIfReactDOMContainerInDEV ]]
    if _G.__DEV__ then

    end;
end;
return v52;