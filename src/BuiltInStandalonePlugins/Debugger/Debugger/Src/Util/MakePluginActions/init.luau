local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local v2 = require(script.Parent.Constants);
local function _(v3, v4, v5, v6) --[[ Line: 8 ]] --[[ Name: makeAction ]]
    return {
        Id = v4, 
        Text = v3:getText("Common", v4), 
        Data = v5, 
        OnItemClicked = v6
    };
end;
local function _(v8, v9) --[[ Line: 17 ]] --[[ Name: makePluginAction ]]
    return {
        id = v9, 
        text = v8:getText("Common", v9), 
        allowBinding = false
    };
end;
local function v15(v11) --[[ Line: 25 ]] --[[ Name: getStepActions ]]
    -- upvalues: v2 (copy)
    local v12 = {};
    for _, v14 in pairs(v2.StepActionIds) do
        v12[v14] = {
            id = v14, 
            text = v11:getText("Common", v14), 
            allowBinding = false
        };
    end;
    v12[v2.StepActionIds.stepOverActionV2].defaultShortcut = "F10";
    v12[v2.StepActionIds.stepIntoActionV2].defaultShortcut = "F11";
    v12[v2.StepActionIds.stepOutActionV2].defaultShortcut = "Shift+F11";
    v12[v2.StepActionIds.simulationResumeActionV2].defaultShortcut = "F5";
    return v12;
end;
return {
    getCallstackActions = function(v16, v17) --[[ Line: 52 ]] --[[ Name: getCallstackActions ]]
        -- upvalues: v2 (copy)
        local v18 = {};
        for _, v20 in pairs(v2.CallstackActionIds) do
            v18[v20] = {
                Id = v20, 
                Text = v16:getText("Common", v20), 
                Data = nil, 
                OnItemClicked = v17
            };
        end;
        return v18;
    end, 
    getWatchActions = function(v21, v22, v23) --[[ Line: 66 ]] --[[ Name: getWatchActions ]]
        -- upvalues: v2 (copy)
        local v24 = {};
        for _, v26 in pairs(v2.WatchActionIds) do
            v24[v26] = {
                Id = v26, 
                Text = v21:getText("Common", v26), 
                Data = v22, 
                OnItemClicked = v23
            };
        end;
        return v24;
    end, 
    getBreakpointActions = function(v27, v28, v29, v30, v31) --[[ Line: 75 ]] --[[ Name: getBreakpointActions ]]
        -- upvalues: v2 (copy)
        local v32 = {};
        local l_BreakpointActions_0 = v2.BreakpointActions;
        if v29 then
            l_BreakpointActions_0 = v2.LogpointActions;
        end;
        for _, v35 in pairs(l_BreakpointActions_0) do
            v32[v35] = {
                Id = v35, 
                Text = v27:getText("Common", v35), 
                Data = v30, 
                OnItemClicked = v31
            };
        end;
        for _, v37 in pairs(v2.CommonActions) do
            v32[v37] = {
                Id = v37, 
                Text = v27:getText("Common", v37), 
                Data = v30, 
                OnItemClicked = v31
            };
        end;
        if v28 then
            if v29 then
                v32[v2.LogpointActions.EnableLogpoint] = nil;
                return v32;
            else
                v32[v2.BreakpointActions.EnableBreakpoint] = nil;
                return v32;
            end;
        elseif v29 then
            v32[v2.LogpointActions.DisableLogpoint] = nil;
            return v32;
        else
            v32[v2.BreakpointActions.DisableBreakpoint] = nil;
            return v32;
        end;
    end, 
    getActionsWithShortcuts = function(v38) --[[ Line: 119 ]] --[[ Name: getActionsWithShortcuts ]]
        -- upvalues: v15 (copy)
        local v39 = {};
        local v40 = v15(v38);
        for v41, v42 in pairs(v40) do
            v39[v41] = v42;
        end;
        return v39;
    end, 
    getBreakpointActionsOrder = function(v43, v44) --[[ Line: 107 ]] --[[ Name: getBreakpointActionsOrder ]]
        -- upvalues: l_deepCopy_0 (copy), v2 (copy)
        local v45 = if v44 then l_deepCopy_0(v2.LogpointActionsOrder) else l_deepCopy_0(v2.BreakpointActionsOrder);
        if v43 then
            table.remove(v45, v2.EnableKey);
            return v45;
        else
            table.remove(v45, v2.DisableKey);
            return v45;
        end;
    end
};