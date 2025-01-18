local function _(v0) --[[ Line: 12 ]] --[[ Name: unimplemented ]]
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
local l_updateFiberProps_0 = v11.updateFiberProps;
local v14 = require(script.Parent.ReactRobloxComponent);
local l_setInitialProperties_0 = v14.setInitialProperties;
local l_diffProperties_0 = v14.diffProperties;
local l_updateProperties_0 = v14.updateProperties;
local l_cleanupHostComponent_0 = v14.cleanupHostComponent;
local l_enableCreateEventHandleAPI_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableCreateEventHandleAPI;
local v20 = {};
l_Object_0.assign(v20, require(l_Parent_0.Shared).ReactFiberHostConfig.WithNoPersistence);
v20.getRootHostContext = function(v21) --[[ Line: 206 ]]
    return v21.ClassName;
end;
v20.getChildHostContext = function(v22, _, _) --[[ Line: 246 ]]
    return v22;
end;
v20.getPublicInstance = function(v25) --[[ Line: 267 ]]
    return v25;
end;
v20.prepareForCommit = function(_) --[[ Line: 271 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
    return nil;
end;
v20.beforeActiveInstanceBlur = function() --[[ Line: 286 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v20.afterActiveInstanceBlur = function() --[[ Line: 295 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v20.resetAfterCommit = function(_) --[[ Line: 304 ]]

end;
v20.createInstance = function(v28, v29, _, _, v32) --[[ Line: 312 ]]
    -- upvalues: l_precacheFiberNode_0 (copy), l_updateFiberProps_0 (copy)
    local v33 = Instance.new(v28);
    if v32.key then
        v33.Name = v32.key;
    else
        local l_return__0 = v32.return_;
        while l_return__0 do
            if l_return__0.key then
                v33.Name = l_return__0.key;
                break;
            else
                l_return__0 = l_return__0.return_;
            end;
        end;
    end;
    l_precacheFiberNode_0(v32, v33);
    l_updateFiberProps_0(v33, v29);
    return v33;
end;
v20.appendInitialChild = function(v35, v36) --[[ Line: 379 ]]
    v36.Parent = v35;
end;
v20.finalizeInitialChildren = function(v37, v38, v39, v40, _) --[[ Line: 387 ]]
    -- upvalues: l_setInitialProperties_0 (copy)
    l_setInitialProperties_0(v37, v38, v39, v40);
    return false;
end;
v20.prepareUpdate = function(v42, v43, v44, v45, v46, _) --[[ Line: 399 ]] --[[ Name: prepareUpdate ]]
    -- upvalues: l_diffProperties_0 (copy)
    return l_diffProperties_0(v42, v43, v44, v45, v46);
end;
v20.shouldSetTextContent = function(_, _) --[[ Line: 432 ]]
    return false;
end;
v20.createTextInstance = function(_, _, _, _) --[[ Line: 448 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"));
    error("FIXME (roblox): " .. "createTextInstance" .. " is unimplemented", 2);
    return nil;
end;
v20.isPrimaryRenderer = true;
v20.warnsIfNotActing = true;
v20.scheduleTimeout = l_setTimeout_0;
v20.cancelTimeout = l_clearTimeout_0;
v20.noTimeout = -1;
v20.supportsMutation = true;
v20.commitMount = function(_, _, _, _) --[[ Line: 474 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"));
    error("FIXME (roblox): " .. "commitMount" .. " is unimplemented", 2);
end;
v20.commitUpdate = function(v58, v59, _, v61, v62, _) --[[ Line: 496 ]]
    -- upvalues: l_updateFiberProps_0 (copy), l_updateProperties_0 (copy)
    l_updateFiberProps_0(v58, v62);
    l_updateProperties_0(v58, v59, v61);
end;
local function v65(v64) --[[ Line: 525 ]] --[[ Name: checkTags ]]
    -- upvalues: l_console_0 (copy), l_inspect_0 (copy), l_CollectionService_0 (copy)
    if typeof(v64) ~= "Instance" then
        l_console_0.warn("Could not check tags on non-instance %s.", l_inspect_0(v64));
        return;
    else
        if not v64:IsDescendantOf(game) and #l_CollectionService_0:GetTags(v64) > 0 then
            l_console_0.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via" .. " CollectionService:GetTagged. If you're relying on tag" .. " behavior in a unit test, consider mounting your test " .. "root into the DataModel.", v64.ClassName, v64.Name);
        end;
        return;
    end;
end;
v20.appendChild = function(v66, v67) --[[ Line: 544 ]]
    -- upvalues: v65 (copy)
    v67.Parent = v66;
    if _G.__DEV__ then
        v65(v67);
    end;
end;
v20.appendChildToContainer = function(v68, v69) --[[ Line: 556 ]]
    -- upvalues: v20 (copy)
    v20.appendChild(v68, v69);
end;
v20.insertBefore = function(v70, v71, _) --[[ Line: 588 ]]
    -- upvalues: v65 (copy)
    v71.Parent = v70;
    if _G.__DEV__ then
        v65(v71);
    end;
end;
v20.insertInContainerBefore = function(v73, v74, v75) --[[ Line: 601 ]]
    -- upvalues: v20 (copy)
    v20.insertBefore(v73, v74, v75);
end;
v20.removeChild = function(_, v77) --[[ Line: 643 ]]
    -- upvalues: l_cleanupHostComponent_0 (copy)
    l_cleanupHostComponent_0(v77);
    v77.Parent = nil;
end;
v20.removeChildFromContainer = function(v78, v79) --[[ Line: 655 ]]
    -- upvalues: v20 (copy)
    v20.removeChild(v78, v79);
end;
v20.clearSuspenseBoundary = function(_, _) --[[ Line: 669 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"));
    error("FIXME (roblox): " .. "clearSuspenseBoundary" .. " is unimplemented", 2);
end;
v20.clearSuspenseBoundaryFromContainer = function(_, _) --[[ Line: 709 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"));
    error("FIXME (roblox): " .. "clearSuspenseBoundaryFromContainer" .. " is unimplemented", 2);
end;
v20.hideInstance = function(_) --[[ Line: 726 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"));
    error("FIXME (roblox): " .. "hideInstance" .. " is unimplemented", 2);
end;
v20.hideTextInstance = function(_) --[[ Line: 740 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"));
    error("FIXME (roblox): " .. "hideTextInstance" .. " is unimplemented", 2);
end;
v20.unhideInstance = function(_, _) --[[ Line: 745 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"));
    error("FIXME (roblox): " .. "unhideInstance" .. " is unimplemented", 2);
end;
v20.unhideTextInstance = function(_, _) --[[ Line: 759 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"));
    error("FIXME (roblox): " .. "unhideTextInstance" .. " is unimplemented", 2);
end;
v20.clearContainer = function(v90) --[[ Line: 767 ]]
    for _, v92 in pairs(v90:GetChildren()) do
        v92.Parent = nil;
    end;
end;
v20.preparePortalMount = function(_) --[[ Line: 1210 ]]

end;
return v20;