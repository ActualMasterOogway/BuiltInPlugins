local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_get_0 = require(l_Parent_0.Shared).ReactInstanceMap.get;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v9 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v9.ClassComponent;
local l_HostComponent_0 = v9.HostComponent;
local l_HostRoot_0 = v9.HostRoot;
local l_HostPortal_0 = v9.HostPortal;
local l_HostText_0 = v9.HostText;
local l_FundamentalComponent_0 = v9.FundamentalComponent;
local l_SuspenseComponent_0 = v9.SuspenseComponent;
local v17 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v17.NoFlags;
local l_Placement_0 = v17.Placement;
local l_Hydrating_0 = v17.Hydrating;
local l_enableFundamentalAPI_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableFundamentalAPI;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local v23 = {};
local function v28(v24) --[[ Line: 49 ]] --[[ Name: getNearestMountedFiber ]]
    -- upvalues: l_Placement_0 (copy), l_Hydrating_0 (copy), l_NoFlags_0 (copy), l_HostRoot_0 (copy)
    local l_v24_0 = v24;
    local l_v24_1 = v24;
    if not v24.alternate then
        local l_l_v24_0_0 = l_v24_0;
        repeat
            l_v24_0 = l_l_v24_0_0;
            if bit32.band(l_v24_0.flags, (bit32.bor(l_Placement_0, l_Hydrating_0))) ~= l_NoFlags_0 then
                l_v24_1 = l_v24_0.return_;
            end;
            l_l_v24_0_0 = l_v24_0.return_;
        until not l_l_v24_0_0;
    else
        while l_v24_0.return_ do
            l_v24_0 = l_v24_0.return_;
        end;
    end;
    if l_v24_0.tag == l_HostRoot_0 then
        return l_v24_1;
    else
        return nil;
    end;
end;
v23.getNearestMountedFiber = v28;
v23.getSuspenseInstanceFromFiber = function(v29) --[[ Line: 82 ]]
    -- upvalues: l_SuspenseComponent_0 (copy)
    if v29.tag == l_SuspenseComponent_0 then
        local l_memoizedState_0 = v29.memoizedState;
        if l_memoizedState_0 == nil then
            local l_alternate_0 = v29.alternate;
            if l_alternate_0 ~= nil then
                l_memoizedState_0 = l_alternate_0.memoizedState;
            end;
        end;
        if l_memoizedState_0 then
            return l_memoizedState_0.dehydrated;
        end;
    end;
    return nil;
end;
v23.getContainerFromFiber = function(v32) --[[ Line: 98 ]]
    -- upvalues: l_HostRoot_0 (copy)
    return v32.tag == l_HostRoot_0 and v32.stateNode.containerInfo or nil;
end;
v23.isFiberMounted = function(v33) --[[ Line: 102 ]]
    -- upvalues: v28 (copy)
    return v28(v33) == v33;
end;
v23.isMounted = function(v34) --[[ Line: 108 ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_ClassComponent_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_get_0 (copy), v28 (copy)
    if _G.__DEV__ then
        local l_current_0 = l_ReactCurrentOwner_0.current;
        if l_current_0 ~= nil and l_current_0.tag == l_ClassComponent_0 then
            local l_stateNode_0 = l_current_0.stateNode;
            if not l_stateNode_0._warnedAboutRefsInRender then
                l_console_0.error("%s is accessing isMounted inside its render() function. " .. "render() should be a pure function of props and state. It should " .. "never access something that requires stale data from the previous " .. "render, such as refs. Move this logic to componentDidMount and " .. "componentDidUpdate instead.", l_getComponentName_0(l_current_0.type) or "A component");
            end;
            l_stateNode_0._warnedAboutRefsInRender = true;
        end;
    end;
    local v37 = l_get_0(v34);
    if not v37 then
        return false;
    else
        return v28(v37) == v37;
    end;
end;
local function _(v38) --[[ Line: 138 ]] --[[ Name: assertIsMounted ]]
    -- upvalues: l_invariant_0 (copy), v28 (copy)
    l_invariant_0(v28(v38) == v38, "Unable to find node on an unmounted component.");
end;
local function v51(v40) --[[ Line: 145 ]] --[[ Name: findCurrentFiberUsingSlowPath ]]
    -- upvalues: v28 (copy), l_invariant_0 (copy), l_HostRoot_0 (copy)
    local l_alternate_1 = v40.alternate;
    if not l_alternate_1 then
        local v42 = v28(v40);
        l_invariant_0(v42 ~= nil, "Unable to find node on an unmounted component.");
        if v42 ~= v40 then
            return nil;
        else
            return v40;
        end;
    else
        local l_v40_0 = v40;
        local l_l_alternate_1_0 = l_alternate_1;
        while true do
            local l_return__0 = l_v40_0.return_;
            if l_return__0 ~= nil then
                local l_alternate_2 = l_return__0.alternate;
                if l_alternate_2 == nil then
                    local l_return__1 = l_return__0.return_;
                    if l_return__1 ~= nil then
                        l_v40_0 = l_return__1;
                        l_l_alternate_1_0 = l_return__1;
                    else
                        break;
                    end;
                else
                    if l_return__0.child == l_alternate_2.child then
                        local l_child_0 = l_return__0.child;
                        while true do
                            if l_child_0 then
                                if l_child_0 == l_v40_0 then
                                    l_invariant_0(v28(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                    return v40;
                                elseif l_child_0 == l_l_alternate_1_0 then
                                    l_invariant_0(v28(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                    return l_alternate_1;
                                else
                                    l_child_0 = l_child_0.sibling;
                                end;
                            else
                                l_invariant_0(false, "Unable to find node on an unmounted component.");
                                break;
                            end;
                        end;
                    end;
                    if l_v40_0.return_ ~= l_l_alternate_1_0.return_ then
                        l_v40_0 = l_return__0;
                        l_l_alternate_1_0 = l_alternate_2;
                    else
                        local v49 = false;
                        local l_child_1 = l_return__0.child;
                        while l_child_1 do
                            if l_child_1 == l_v40_0 then
                                v49 = true;
                                l_v40_0 = l_return__0;
                                l_l_alternate_1_0 = l_alternate_2;
                                break;
                            elseif l_child_1 == l_l_alternate_1_0 then
                                v49 = true;
                                l_l_alternate_1_0 = l_return__0;
                                l_v40_0 = l_alternate_2;
                                break;
                            else
                                l_child_1 = l_child_1.sibling;
                            end;
                        end;
                        if not v49 then
                            l_child_1 = l_alternate_2.child;
                            while l_child_1 do
                                if l_child_1 == l_v40_0 then
                                    v49 = true;
                                    l_v40_0 = l_alternate_2;
                                    l_l_alternate_1_0 = l_return__0;
                                    break;
                                elseif l_child_1 == l_l_alternate_1_0 then
                                    v49 = true;
                                    l_l_alternate_1_0 = l_alternate_2;
                                    l_v40_0 = l_return__0;
                                    break;
                                else
                                    l_child_1 = l_child_1.sibling;
                                end;
                            end;
                            l_invariant_0(v49, "Child was not found in either parent set. This indicates a bug " .. "in React related to the return pointer. Please file an issue.");
                        end;
                    end;
                    l_invariant_0(l_v40_0.alternate == l_l_alternate_1_0, "Return fibers should always be each others' alternates. " .. "This error is likely caused by a bug in React. Please file an issue.");
                end;
            else
                break;
            end;
        end;
        l_invariant_0(l_v40_0.tag == l_HostRoot_0, "Unable to find node on an unmounted component.");
        if l_v40_0.stateNode.current == l_v40_0 then
            return v40;
        else
            return l_alternate_1;
        end;
    end;
end;
v23.findCurrentFiberUsingSlowPath = v51;
v23.findCurrentHostFiber = function(v52) --[[ Line: 280 ]]
    -- upvalues: v51 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy)
    local v53 = v51(v52);
    if not v53 then
        return nil;
    else
        local l_v53_0 = v53;
        while true do
            local l_child_2 = l_v53_0.child;
            if l_v53_0.tag == l_HostComponent_0 or l_v53_0.tag == l_HostText_0 then
                return l_v53_0;
            elseif l_child_2 then
                l_child_2.return_ = l_v53_0;
                l_v53_0 = l_child_2;
            elseif l_v53_0 == v53 then
                return nil;
            else
                local l_return__2 = l_v53_0.return_;
                local l_sibling_0 = l_v53_0.sibling;
                while true do
                    if not l_sibling_0 then
                        if not l_return__2 or l_return__2 == v53 then
                            return nil;
                        else
                            l_v53_0 = l_return__2;
                        end;
                    else
                        l_sibling_0.return_ = l_return__2;
                        l_v53_0 = l_sibling_0;
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
v23.findCurrentHostFiberWithNoPortals = function(v58) --[[ Line: 318 ]]
    -- upvalues: v51 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy), l_enableFundamentalAPI_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy)
    local v59 = v51(v58);
    if not v59 then
        return nil;
    else
        local l_v59_0 = v59;
        while true do
            local l_child_3 = l_v59_0.child;
            if l_v59_0.tag == l_HostComponent_0 or l_v59_0.tag == l_HostText_0 or l_enableFundamentalAPI_0 and l_v59_0.tag == l_FundamentalComponent_0 then
                return l_v59_0;
            elseif l_child_3 and l_v59_0.tag ~= l_HostPortal_0 then
                l_child_3.return_ = l_v59_0;
                l_v59_0 = l_child_3;
            elseif l_v59_0 == v59 then
                return nil;
            else
                local l_return__3 = l_v59_0.return_;
                local l_sibling_1 = l_v59_0.sibling;
                while true do
                    if not l_sibling_1 then
                        if not l_return__3 or l_return__3 == v59 then
                            return nil;
                        else
                            l_v59_0 = l_return__3;
                        end;
                    else
                        l_sibling_1.return_ = l_return__3;
                        l_v59_0 = l_sibling_1;
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
v23.isFiberSuspenseAndTimedOut = function(v64) --[[ Line: 358 ]]
    -- upvalues: l_SuspenseComponent_0 (copy)
    local l_memoizedState_1 = v64.memoizedState;
    local v66 = false;
    if v64.tag == l_SuspenseComponent_0 then
        v66 = false;
        if l_memoizedState_1 ~= nil then
            v66 = l_memoizedState_1.dehydrated == nil;
        end;
    end;
    return v66;
end;
v23.doesFiberContain = function(v67, v68) --[[ Line: 365 ]]
    local l_v68_0 = v68;
    local l_alternate_3 = v67.alternate;
    while true do
        if l_v68_0 ~= nil then
            if l_v68_0 == v67 or l_v68_0 == l_alternate_3 then
                return true;
            else
                l_v68_0 = l_v68_0.return_;
            end;
        else
            return false;
        end;
    end;
end;
return v23;