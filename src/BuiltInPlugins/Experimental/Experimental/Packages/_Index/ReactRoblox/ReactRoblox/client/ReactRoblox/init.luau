local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local v3 = nil;
v3 = require(script.Parent.ReactRobloxRoot);
local l_createRoot_0 = v3.createRoot;
local l_createBlockingRoot_0 = v3.createBlockingRoot;
local l_createLegacyRoot_0 = v3.createLegacyRoot;
local l_isValidContainer_0 = v3.isValidContainer;
local v8 = require(script.Parent.Parent["ReactReconciler.roblox"]);
local l_batchedUpdates_0 = v8.batchedUpdates;
local l_injectIntoDevTools_0 = v8.injectIntoDevTools;
local l_flushPassiveEffects_0 = v8.flushPassiveEffects;
local l_IsThisRendererActing_0 = v8.IsThisRendererActing;
local l_createPortal_0 = v8.createPortal;
local l_ReactVersion_0 = require(l_Parent_0.Shared).ReactVersion;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableNewReconciler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableNewReconciler;
local v17 = require(script.Parent.ReactRobloxComponentTree);
local l_getInstanceFromNode_0 = v17.getInstanceFromNode;
local l_getNodeFromInstance_0 = v17.getNodeFromInstance;
local l_getFiberCurrentPropsFromNode_0 = v17.getFiberCurrentPropsFromNode;
local l_getClosestInstanceFromNode_0 = v17.getClosestInstanceFromNode;
local v22 = require(script.Parent.roblox.PropMarkers.Event);
local v23 = require(script.Parent.roblox.PropMarkers.Change);
local function v27(v24, v25, v26) --[[ Line: 123 ]] --[[ Name: createPortal ]]
    -- upvalues: l_invariant_0 (copy), l_isValidContainer_0 (copy), l_createPortal_0 (copy)
    l_invariant_0(l_isValidContainer_0(v25), "Target container is not a Roblox Instance.");
    return l_createPortal_0(v24, v25, nil, v26);
end;
local v28 = {
    Events = {
        getInstanceFromNode = l_getInstanceFromNode_0, 
        getNodeFromInstance = l_getNodeFromInstance_0, 
        getFiberCurrentPropsFromNode = l_getFiberCurrentPropsFromNode_0, 
        flushPassiveEffects = l_flushPassiveEffects_0, 
        IsThisRendererActing = l_IsThisRendererActing_0
    }
};
local v30 = {
    createPortal = v27, 
    unstable_batchedUpdates = l_batchedUpdates_0, 
    __SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = v28, 
    version = l_ReactVersion_0, 
    createRoot = l_createRoot_0, 
    createBlockingRoot = l_createBlockingRoot_0, 
    createLegacyRoot = l_createLegacyRoot_0, 
    Event = v22, 
    Change = v23, 
    unstable_isNewReconciler = l_enableNewReconciler_0, 
    act = function(_) --[[ Line: 255 ]] --[[ Name: act ]]
        error("ReactRoblox.act is only available in testing environments, not " .. "production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your " .. "test configuration in order to use `act`.");
    end
};
if _G.__ROACT_17_MOCK_SCHEDULER__ then
    v30.act = v8.act;
end;
local _ = l_injectIntoDevTools_0({
    findFiberByHostInstance = l_getClosestInstanceFromNode_0, 
    bundleType = _G.__DEV__ and 1 or 0, 
    version = l_ReactVersion_0, 
    rendererPackageName = "ReactRoblox"
});
if _G.__DEV__ then

end;
return v30;