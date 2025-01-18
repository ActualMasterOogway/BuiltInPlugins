local function _(v0) --[[ Line: 13 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.LuauPolyfill);
local l_inspect_0 = v4.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Object_0 = v4.Object;
local l_setTimeout_0 = v4.setTimeout;
local l_clearTimeout_0 = v4.clearTimeout;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local v11 = require(script.Parent.ReactRobloxComponentTree);
local l_precacheFiberNode_0 = v11.precacheFiberNode;
local l_uncacheFiberNode_0 = v11.uncacheFiberNode;
local l_updateFiberProps_0 = v11.updateFiberProps;
local v15 = require(script.Parent.ReactRobloxComponent);
local l_setInitialProperties_0 = v15.setInitialProperties;
local l_diffProperties_0 = v15.diffProperties;
local l_updateProperties_0 = v15.updateProperties;
local l_cleanupHostComponent_0 = v15.cleanupHostComponent;
local l_enableCreateEventHandleAPI_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableCreateEventHandleAPI;
local _ = function(v21) --[[ Line: 205 ]] --[[ Name: recursivelyUncacheFiberNode ]]
    -- upvalues: l_uncacheFiberNode_0 (copy)
    if typeof(v21) ~= "Instance" then
        return;
    else
        l_uncacheFiberNode_0(v21);
        for _, v23 in v21:GetDescendants() do
            l_uncacheFiberNode_0(v23);
        end;
        return;
    end;
end;
local v25 = {};
l_Object_0.assign(v25, require(l_Parent_0.Shared).ReactFiberHostConfig.WithNoPersistence);
v25.getRootHostContext = function(v26) --[[ Line: 223 ]]
    return v26.ClassName;
end;
v25.getChildHostContext = function(v27, _, _) --[[ Line: 261 ]]
    return v27;
end;
v25.getPublicInstance = function(v30) --[[ Line: 282 ]]
    return v30;
end;
v25.prepareForCommit = function(_) --[[ Line: 286 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
    return nil;
end;
v25.beforeActiveInstanceBlur = function() --[[ Line: 301 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v25.afterActiveInstanceBlur = function() --[[ Line: 310 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v25.resetAfterCommit = function(_) --[[ Line: 319 ]]

end;
v25.createInstance = function(v33, v34, _, _, v37) --[[ Line: 327 ]]
    -- upvalues: l_precacheFiberNode_0 (copy), l_updateFiberProps_0 (copy)
    local v38 = Instance.new(v33);
    if v37.key then
        v38.Name = v37.key;
    else
        local l_return__0 = v37.return_;
        while l_return__0 do
            if l_return__0.key then
                v38.Name = l_return__0.key;
                break;
            else
                l_return__0 = l_return__0.return_;
            end;
        end;
    end;
    l_precacheFiberNode_0(v37, v38);
    l_updateFiberProps_0(v38, v34);
    return v38;
end;
v25.appendInitialChild = function(v40, v41) --[[ Line: 394 ]]
    v41.Parent = v40;
end;
v25.finalizeInitialChildren = function(v42, v43, v44, v45, _) --[[ Line: 399 ]]
    -- upvalues: l_setInitialProperties_0 (copy)
    l_setInitialProperties_0(v42, v43, v44, v45);
    return false;
end;
v25.prepareUpdate = function(v47, v48, v49, v50, v51, _) --[[ Line: 411 ]] --[[ Name: prepareUpdate ]]
    -- upvalues: l_diffProperties_0 (copy)
    return l_diffProperties_0(v47, v48, v49, v50, v51);
end;
v25.shouldSetTextContent = function(_, _) --[[ Line: 438 ]]
    return false;
end;
v25.createTextInstance = function(_, _, _, _) --[[ Line: 454 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"));
    error("FIXME (roblox): " .. "createTextInstance" .. " is unimplemented", 2);
    return nil;
end;
v25.isPrimaryRenderer = true;
v25.warnsIfNotActing = true;
v25.scheduleTimeout = l_setTimeout_0;
v25.cancelTimeout = l_clearTimeout_0;
v25.noTimeout = -1;
v25.supportsMutation = true;
v25.commitMount = function(_, _, _, _) --[[ Line: 480 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"));
    error("FIXME (roblox): " .. "commitMount" .. " is unimplemented", 2);
end;
v25.commitUpdate = function(v63, v64, _, v66, v67, _) --[[ Line: 502 ]]
    -- upvalues: l_updateFiberProps_0 (copy), l_updateProperties_0 (copy)
    l_updateFiberProps_0(v63, v67);
    l_updateProperties_0(v63, v64, v66);
end;
local function v70(v69) --[[ Line: 531 ]] --[[ Name: checkTags ]]
    -- upvalues: l_console_0 (copy), l_inspect_0 (copy), l_CollectionService_0 (copy)
    if typeof(v69) ~= "Instance" then
        l_console_0.warn("Could not check tags on non-instance %s.", l_inspect_0(v69));
        return;
    else
        if not v69:IsDescendantOf(game) and #l_CollectionService_0:GetTags(v69) > 0 then
            l_console_0.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via" .. " CollectionService:GetTagged. If you're relying on tag" .. " behavior in a unit test, consider mounting your test " .. "root into the DataModel.", v69.ClassName, v69.Name);
        end;
        return;
    end;
end;
v25.appendChild = function(v71, v72) --[[ Line: 550 ]]
    -- upvalues: v70 (copy)
    v72.Parent = v71;
    if _G.__DEV__ then
        v70(v72);
    end;
end;
v25.appendChildToContainer = function(v73, v74) --[[ Line: 559 ]]
    -- upvalues: v25 (copy)
    v25.appendChild(v73, v74);
end;
v25.insertBefore = function(v75, v76, _) --[[ Line: 589 ]]
    -- upvalues: v70 (copy)
    v76.Parent = v75;
    if _G.__DEV__ then
        v70(v76);
    end;
end;
v25.insertInContainerBefore = function(v78, v79, v80) --[[ Line: 599 ]]
    -- upvalues: v25 (copy)
    v25.insertBefore(v78, v79, v80);
end;
v25.removeChild = function(_, v82) --[[ Line: 637 ]]
    -- upvalues: l_uncacheFiberNode_0 (copy), l_cleanupHostComponent_0 (copy)
    if typeof(v82) == "Instance" then
        l_uncacheFiberNode_0(v82);
        for _, v84 in v82:GetDescendants() do
            l_uncacheFiberNode_0(v84);
        end;
    end;
    l_cleanupHostComponent_0(v82);
    v82.Parent = nil;
    v82:Destroy();
end;
v25.removeChildFromContainer = function(v85, v86) --[[ Line: 649 ]]
    -- upvalues: v25 (copy)
    v25.removeChild(v85, v86);
end;
v25.clearSuspenseBoundary = function(_, _) --[[ Line: 661 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"));
    error("FIXME (roblox): " .. "clearSuspenseBoundary" .. " is unimplemented", 2);
end;
v25.clearSuspenseBoundaryFromContainer = function(_, _) --[[ Line: 699 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"));
    error("FIXME (roblox): " .. "clearSuspenseBoundaryFromContainer" .. " is unimplemented", 2);
end;
v25.hideInstance = function(_) --[[ Line: 713 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"));
    error("FIXME (roblox): " .. "hideInstance" .. " is unimplemented", 2);
end;
v25.hideTextInstance = function(_) --[[ Line: 727 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"));
    error("FIXME (roblox): " .. "hideTextInstance" .. " is unimplemented", 2);
end;
v25.unhideInstance = function(_, _) --[[ Line: 732 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"));
    error("FIXME (roblox): " .. "unhideInstance" .. " is unimplemented", 2);
end;
v25.unhideTextInstance = function(_, _) --[[ Line: 746 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"));
    error("FIXME (roblox): " .. "unhideTextInstance" .. " is unimplemented", 2);
end;
v25.clearContainer = function(v97) --[[ Line: 751 ]]
    -- upvalues: v25 (copy)
    for _, v99 in v97:GetChildren() do
        v25.removeChild(v97, v99);
    end;
end;
v25.preparePortalMount = function(_) --[[ Line: 1194 ]]

end;
return v25;