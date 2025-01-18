local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = l_ContextItem_0:extend("LuaMeshEditingModuleContext");
v4.new = function(v5) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v4 (copy)
    return (setmetatable({
        _currentTool = nil, 
        _tools = v5, 
        _toolChangedSignal = l_Signal_0.new()
    }, v4));
end;
v4.getInnerCageContext = function(v6) --[[ Line: 20 ]] --[[ Name: getInnerCageContext ]]
    return v6._innerCageContext;
end;
v4.setInnerCageContext = function(v7, v8) --[[ Line: 24 ]] --[[ Name: setInnerCageContext ]]
    if v7._innerCageContext == v8 then
        return;
    else
        if v7._innerCageContext then
            for _, v10 in pairs(v7._tools) do
                v10:removeContext(v7._innerCageContext);
            end;
        end;
        v7._innerCageContext = v8;
        if v8 then
            for _, v12 in pairs(v7._tools) do
                v12:addContext(v7._innerCageContext);
            end;
        end;
        return;
    end;
end;
v4.getOuterCageContext = function(v13) --[[ Line: 42 ]] --[[ Name: getOuterCageContext ]]
    return v13._outerCageContext;
end;
v4.setOuterCageContext = function(v14, v15) --[[ Line: 46 ]] --[[ Name: setOuterCageContext ]]
    if v14._outerCageContext == v15 then
        return;
    else
        if v14._outerCageContext then
            for _, v17 in pairs(v14._tools) do
                v17:removeContext(v14._outerCageContext);
            end;
        end;
        v14._outerCageContext = v15;
        if v15 then
            for _, v19 in pairs(v14._tools) do
                v19:addContext(v14._outerCageContext);
            end;
        end;
        return;
    end;
end;
v4.updateCageLocationsFromInstance = function(v20, v21) --[[ Line: 65 ]] --[[ Name: updateCageLocationsFromInstance ]]
    v20:setCurrentToolEnabled(false);
    if v20._outerCageContext then
        v20._outerCageContext:updateCageLocationFromInstance(Enum.CageType.Outer, v21);
    end;
    if v20._innerCageContext then
        v20._innerCageContext:updateCageLocationFromInstance(Enum.CageType.Inner, v21);
    end;
    v20:setCurrentToolEnabled(true);
    local v22 = v20:getCurrentTool();
    if not v22 then
        return;
    else
        local v23 = v22:getCurrentContext();
        if not v23 then
            return;
        else
            v23:getMeshDataChangedSignal():Fire();
            return;
        end;
    end;
end;
v4.changeEditingCage = function(v24, v25) --[[ Line: 91 ]] --[[ Name: changeEditingCage ]]
    if not v24._currentToolKey then
        return;
    elseif v25 == Enum.CageType.Outer then
        v24:getCurrentTool():setCurrentContext(v24._outerCageContext);
        return;
    else
        if v25 == Enum.CageType.Inner then
            v24:getCurrentTool():setCurrentContext(v24._innerCageContext);
        end;
        return;
    end;
end;
v4.getCurrentTool = function(v26) --[[ Line: 102 ]] --[[ Name: getCurrentTool ]]
    return v26._tools[v26._currentToolKey];
end;
v4.getCurrentContext = function(v27) --[[ Line: 106 ]] --[[ Name: getCurrentContext ]]
    if v27._currentToolKey then
        return v27:getCurrentTool():getCurrentContext();
    else
        return;
    end;
end;
v4.setCurrentToolEnabled = function(v28, v29) --[[ Line: 112 ]] --[[ Name: setCurrentToolEnabled ]]
    if v28._currentToolKey then
        v28:getCurrentTool():setEnabled(v29);
    end;
end;
v4.setCurrentTool = function(v30, v31) --[[ Line: 118 ]] --[[ Name: setCurrentTool ]]
    v30:setCurrentToolEnabled(false);
    if not v31 then
        v30._currentToolKey = nil;
        return;
    else
        assert(v30._tools[v31], "Tool not found in context.");
        v30._currentToolKey = v31;
        v30:setCurrentToolEnabled(true);
        return;
    end;
end;
v4.getTransparency = function(v32, _) --[[ Line: 132 ]] --[[ Name: getTransparency ]]
    local v34 = v32:getCurrentTool();
    if v34 then
        return v34:getTransparency();
    else
        return;
    end;
end;
v4.setTransparency = function(v35, v36) --[[ Line: 139 ]] --[[ Name: setTransparency ]]
    for _, v38 in pairs(v35._tools) do
        v38:setTransparency(v36);
    end;
end;
v4.resetTools = function(v39) --[[ Line: 145 ]] --[[ Name: resetTools ]]
    for _, v41 in pairs(v39._tools) do
        v41:resetCurrentContext();
    end;
end;
v4.getToolChangedSignal = function(v42) --[[ Line: 151 ]] --[[ Name: getToolChangedSignal ]]
    return v42._toolChangedSignal;
end;
v4.disableEditing = function(v43) --[[ Line: 155 ]] --[[ Name: disableEditing ]]
    if v43._currentToolKey then
        v43._previousContext = v43:getCurrentContext();
        v43._previousTool = v43._currentToolKey;
        v43:setCurrentTool(nil);
    end;
end;
v4.enableEditing = function(v44) --[[ Line: 163 ]] --[[ Name: enableEditing ]]
    if v44._previousTool then
        v44:setCurrentTool(v44._previousTool);
        v44:getCurrentTool():setCurrentContext(v44._previousContext);
    end;
    v44._previousTool = nil;
    v44._previousContext = nil;
end;
v4.cleanup = function(v45) --[[ Line: 173 ]] --[[ Name: cleanup ]]
    for _, v47 in pairs(v45._tools) do
        if v45._innerCageContext then
            v47:removeContext(v45._innerCageContext);
        end;
        if v45._outerCageContext then
            v47:removeContext(v45._outerCageContext);
        end;
        v47:cleanup();
    end;
    v45._currentToolKey = nil;
    v45._innerCageContext = nil;
    v45._outerCageContext = nil;
end;
return v4;