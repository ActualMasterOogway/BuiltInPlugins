local function _(v0) --[[ Line: 12 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_setTimeout_0 = v3.setTimeout;
local l_clearTimeout_0 = v3.clearTimeout;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local v8 = require(script.Parent.ReactRobloxComponentTree);
local l_precacheFiberNode_0 = v8.precacheFiberNode;
local l_updateFiberProps_0 = v8.updateFiberProps;
local v11 = require(script.Parent.ReactRobloxComponent);
local l_setInitialProperties_0 = v11.setInitialProperties;
local l_diffProperties_0 = v11.diffProperties;
local l_updateProperties_0 = v11.updateProperties;
local l_cleanupHostComponent_0 = v11.cleanupHostComponent;
local l_enableCreateEventHandleAPI_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableCreateEventHandleAPI;
local v17 = {};
l_Object_0.assign(v17, require(l_Parent_0.Shared).ReactFiberHostConfig.WithNoPersistence);
v17.getRootHostContext = function(v18) --[[ Line: 203 ]]
    return v18.ClassName;
end;
v17.getChildHostContext = function(v19, _, _) --[[ Line: 243 ]]
    return v19;
end;
v17.getPublicInstance = function(v22) --[[ Line: 264 ]]
    return v22;
end;
v17.prepareForCommit = function(_) --[[ Line: 268 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
    return nil;
end;
v17.beforeActiveInstanceBlur = function() --[[ Line: 283 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v17.afterActiveInstanceBlur = function() --[[ Line: 292 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): " .. "enableCreateEventHandleAPI" .. " is unimplemented", 2);
    end;
end;
v17.resetAfterCommit = function(_) --[[ Line: 301 ]]

end;
v17.createInstance = function(v25, v26, _, _, v29) --[[ Line: 309 ]]
    -- upvalues: l_precacheFiberNode_0 (copy), l_updateFiberProps_0 (copy)
    local v30 = Instance.new(v25);
    if v29.key then
        v30.Name = v29.key;
    else
        local l_return__0 = v29.return_;
        while l_return__0 do
            if l_return__0.key then
                v30.Name = l_return__0.key;
                break;
            else
                l_return__0 = l_return__0.return_;
            end;
        end;
    end;
    l_precacheFiberNode_0(v29, v30);
    l_updateFiberProps_0(v30, v26);
    return v30;
end;
v17.appendInitialChild = function(v32, v33) --[[ Line: 376 ]]
    v33.Parent = v32;
end;
v17.finalizeInitialChildren = function(v34, v35, v36, v37, _) --[[ Line: 384 ]]
    -- upvalues: l_setInitialProperties_0 (copy)
    l_setInitialProperties_0(v34, v35, v36, v37);
    return false;
end;
v17.prepareUpdate = function(v39, v40, v41, v42, v43, _) --[[ Line: 396 ]] --[[ Name: prepareUpdate ]]
    -- upvalues: l_diffProperties_0 (copy)
    return l_diffProperties_0(v39, v40, v41, v42, v43);
end;
v17.shouldSetTextContent = function(_, _) --[[ Line: 429 ]]
    return false;
end;
v17.createTextInstance = function(_, _, _, _) --[[ Line: 445 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"));
    error("FIXME (roblox): " .. "createTextInstance" .. " is unimplemented", 2);
    return nil;
end;
v17.isPrimaryRenderer = true;
v17.warnsIfNotActing = true;
v17.scheduleTimeout = l_setTimeout_0;
v17.cancelTimeout = l_clearTimeout_0;
v17.noTimeout = -1;
v17.supportsMutation = true;
v17.commitMount = function(_, _, _, _) --[[ Line: 471 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"));
    error("FIXME (roblox): " .. "commitMount" .. " is unimplemented", 2);
end;
v17.commitUpdate = function(v55, v56, v57, v58, v59, _) --[[ Line: 493 ]]
    -- upvalues: l_updateFiberProps_0 (copy), l_updateProperties_0 (copy)
    l_updateFiberProps_0(v55, v59);
    l_updateProperties_0(v55, v56, v57, v58, v59);
end;
v17.appendChild = function(v61, v62) --[[ Line: 522 ]]
    v62.Parent = v61;
end;
v17.appendChildToContainer = function(v63, v64) --[[ Line: 531 ]]
    -- upvalues: v17 (copy)
    v17.appendChild(v63, v64);
end;
v17.insertBefore = function(v65, v66, _) --[[ Line: 563 ]]
    v66.Parent = v65;
end;
v17.insertInContainerBefore = function(v68, v69, _) --[[ Line: 573 ]]
    v69.Parent = v68;
end;
v17.removeChild = function(_, v72) --[[ Line: 614 ]]
    -- upvalues: l_cleanupHostComponent_0 (copy)
    l_cleanupHostComponent_0(v72);
    v72.Parent = nil;
end;
v17.removeChildFromContainer = function(v73, v74) --[[ Line: 626 ]]
    -- upvalues: v17 (copy)
    v17.removeChild(v73, v74);
end;
v17.clearSuspenseBoundary = function(_, _) --[[ Line: 640 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"));
    error("FIXME (roblox): " .. "clearSuspenseBoundary" .. " is unimplemented", 2);
end;
v17.clearSuspenseBoundaryFromContainer = function(_, _) --[[ Line: 680 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"));
    error("FIXME (roblox): " .. "clearSuspenseBoundaryFromContainer" .. " is unimplemented", 2);
end;
v17.hideInstance = function(_) --[[ Line: 697 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"));
    error("FIXME (roblox): " .. "hideInstance" .. " is unimplemented", 2);
end;
v17.hideTextInstance = function(_) --[[ Line: 711 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"));
    error("FIXME (roblox): " .. "hideTextInstance" .. " is unimplemented", 2);
end;
v17.unhideInstance = function(_, _) --[[ Line: 716 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"));
    error("FIXME (roblox): " .. "unhideInstance" .. " is unimplemented", 2);
end;
v17.unhideTextInstance = function(_, _) --[[ Line: 730 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"));
    error("FIXME (roblox): " .. "unhideTextInstance" .. " is unimplemented", 2);
end;
v17.clearContainer = function(v85) --[[ Line: 738 ]]
    for _, v87 in pairs(v85:GetChildren()) do
        v87.Parent = nil;
    end;
end;
v17.preparePortalMount = function(_) --[[ Line: 1181 ]]

end;
return v17;