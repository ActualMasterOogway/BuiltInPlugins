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
local l_flushSync_0 = v8.flushSync;
local l_injectIntoDevTools_0 = v8.injectIntoDevTools;
local l_flushPassiveEffects_0 = v8.flushPassiveEffects;
local l_IsThisRendererActing_0 = v8.IsThisRendererActing;
local l_createPortal_0 = v8.createPortal;
local l_ReactVersion_0 = require(l_Parent_0.Shared).ReactVersion;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableNewReconciler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableNewReconciler;
local v18 = require(script.Parent.ReactRobloxComponentTree);
local l_getInstanceFromNode_0 = v18.getInstanceFromNode;
local l_getNodeFromInstance_0 = v18.getNodeFromInstance;
local l_getFiberCurrentPropsFromNode_0 = v18.getFiberCurrentPropsFromNode;
local l_getClosestInstanceFromNode_0 = v18.getClosestInstanceFromNode;
local l_Event_0 = require(l_Parent_0.Shared).Event;
local l_Change_0 = require(l_Parent_0.Shared).Change;
local l_Tag_0 = require(l_Parent_0.Shared).Tag;
local function v29(v26, v27, v28) --[[ Line: 124 ]] --[[ Name: createPortal ]]
    -- upvalues: l_invariant_0 (copy), l_isValidContainer_0 (copy), l_createPortal_0 (copy)
    l_invariant_0(l_isValidContainer_0(v27), "Target container is not a Roblox Instance.");
    return l_createPortal_0(v26, v27, nil, v28);
end;
local v30 = {
    Events = {
        getInstanceFromNode = l_getInstanceFromNode_0, 
        getNodeFromInstance = l_getNodeFromInstance_0, 
        getFiberCurrentPropsFromNode = l_getFiberCurrentPropsFromNode_0, 
        flushPassiveEffects = l_flushPassiveEffects_0, 
        IsThisRendererActing = l_IsThisRendererActing_0
    }
};
local v32 = {
    createPortal = v29, 
    unstable_batchedUpdates = l_batchedUpdates_0, 
    flushSync = l_flushSync_0, 
    __SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = v30, 
    version = l_ReactVersion_0, 
    createRoot = l_createRoot_0, 
    createBlockingRoot = l_createBlockingRoot_0, 
    createLegacyRoot = l_createLegacyRoot_0, 
    Event = l_Event_0, 
    Change = l_Change_0, 
    Tag = l_Tag_0, 
    unstable_isNewReconciler = l_enableNewReconciler_0, 
    act = function(_) --[[ Line: 257 ]] --[[ Name: act ]]
        error("ReactRoblox.act is only available in testing environments, not " .. "production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your " .. "test configuration in order to use `act`.");
    end
};
if _G.__ROACT_17_MOCK_SCHEDULER__ then
    v32.act = v8.act;
end;
local _ = l_injectIntoDevTools_0({
    findFiberByHostInstance = l_getClosestInstanceFromNode_0, 
    bundleType = _G.__DEV__ and 1 or 0, 
    version = l_ReactVersion_0, 
    rendererPackageName = "ReactRoblox"
});
if _G.__DEV__ then

end;
v32.robloxReactProfiling = v8.robloxReactProfiling;
return v32;