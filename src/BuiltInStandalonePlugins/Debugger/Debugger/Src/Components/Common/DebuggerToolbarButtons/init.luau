local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local l_UI_0 = v3.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local v10 = require(l_Parent_0.Src.Util.Constants);
local v11 = require(l_Parent_0.Src.Thunks.Callstack.StepHandlers);
local v12 = require(l_Parent_0.Src.Actions.Common.SetPausedState);
local v13 = v1.PureComponent:extend("DebuggerToolbarButtons");
v13.init = function(v14, v15) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v14.onResume = function() --[[ Line: 32 ]]
        -- upvalues: v15 (copy)
        v15.onSetPausedState(false);
        game:GetService("DebuggerUIService"):Resume();
    end;
    v14.onPause = function() --[[ Line: 38 ]]
        game:GetService("DebuggerUIService"):Pause();
    end;
    v14.onStepOver = function() --[[ Line: 43 ]]
        -- upvalues: v14 (copy), v10 (ref)
        v14.props.onStepAction(v10.StepActionIds.stepOverActionV2, "ToolbarButton", v14.props.CurrentDebuggerConnectionId, v14.props.CurrentThreadId);
    end;
    v14.onStepInto = function() --[[ Line: 52 ]]
        -- upvalues: v14 (copy), v10 (ref)
        v14.props.onStepAction(v10.StepActionIds.stepIntoActionV2, "ToolbarButton", v14.props.CurrentDebuggerConnectionId, v14.props.CurrentThreadId);
    end;
    v14.onStepOut = function() --[[ Line: 61 ]]
        -- upvalues: v14 (copy), v10 (ref)
        v14.props.onStepAction(v10.StepActionIds.stepOutActionV2, "ToolbarButton", v14.props.CurrentDebuggerConnectionId, v14.props.CurrentThreadId);
    end;
end;
v13.addAction = function(v16, v17, v18) --[[ Line: 71 ]] --[[ Name: addAction ]]
    if v17 then
        v17.Enabled = true;
        table.insert(v16.shortcuts, v17);
        table.insert(v16.connections, v17.Triggered:Connect(v18));
    end;
end;
v13.didMount = function(v19) --[[ Line: 79 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy)
    local l_PluginActions_1 = v19.props.PluginActions;
    v19.connections = {};
    v19.shortcuts = {};
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.stepOverActionV2), function() --[[ Line: 83 ]]
        -- upvalues: v19 (copy), v10 (ref)
        v19.props.onStepAction(v10.StepActionIds.stepOverActionV2, "PluginAction", v19.props.CurrentDebuggerConnectionId, v19.props.CurrentThreadId);
    end);
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.stepIntoActionV2), function() --[[ Line: 91 ]]
        -- upvalues: v19 (copy), v10 (ref)
        v19.props.onStepAction(v10.StepActionIds.stepIntoActionV2, "PluginAction", v19.props.CurrentDebuggerConnectionId, v19.props.CurrentThreadId);
    end);
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.stepOutActionV2), function() --[[ Line: 99 ]]
        -- upvalues: v19 (copy), v10 (ref)
        v19.props.onStepAction(v10.StepActionIds.stepOutActionV2, "PluginAction", v19.props.CurrentDebuggerConnectionId, v19.props.CurrentThreadId);
    end);
    v19:addAction(l_PluginActions_1:get(v10.StepActionIds.simulationResumeActionV2), function() --[[ Line: 107 ]]
        -- upvalues: v19 (copy)
        v19.onResume();
    end);
end;
v13.renderButtons = function(v21, v22) --[[ Line: 112 ]] --[[ Name: renderButtons ]]
    -- upvalues: v10 (copy), v1 (copy), l_PluginButton_0 (copy)
    local l_DebuggerUIService_0 = game:GetService("DebuggerUIService");
    local v24 = false;
    if v21.props.CurrentDebuggerConnectionId ~= v10.kInvalidDebuggerConnectionId then
        v24 = l_DebuggerUIService_0:IsConnectionForPlayDataModel(v21.props.CurrentDebuggerConnectionId);
    end;
    local l_IsPaused_0 = v21.props.IsPaused;
    local l_HitException_0 = v21.props.HitException;
    local v27 = {
        ResumeButton = v1.createElement(l_PluginButton_0, {
            Name = "simulationResumeActionV2", 
            Toolbar = v22, 
            Active = false, 
            Enabled = l_IsPaused_0, 
            Title = "Resume", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Resume", 
            OnClick = v21.onResume, 
            ClickableWhenViewportHidden = true
        }), 
        PauseButton = v1.createElement(l_PluginButton_0, {
            Name = "simulationPauseActionV2", 
            Toolbar = v22, 
            Active = false, 
            Enabled = not l_IsPaused_0 and v24, 
            Title = "Pause", 
            Tooltip = "", 
            icon = "rbxlocaltheme://Pause", 
            OnClick = v21.onPause, 
            ClickableWhenViewportHidden = true
        })
    };
    local l_createElement_0 = v1.createElement;
    local l_l_PluginButton_0_0 = l_PluginButton_0;
    local v30 = {
        Name = "stepOverActionV2", 
        Toolbar = v22, 
        Active = false
    };
    local v31 = false;
    if v21.props.CurrentThreadId ~= nil then
        v31 = not l_HitException_0;
    end;
    v30.Enabled = v31;
    v30.Title = "StepOver";
    v30.Tooltip = "";
    v30.icon = "rbxlocaltheme://StepOver";
    v30.OnClick = v21.onStepOver;
    v30.ClickableWhenViewportHidden = true;
    v27.StepOverButton = l_createElement_0(l_l_PluginButton_0_0, v30);
    l_createElement_0 = v1.createElement;
    l_l_PluginButton_0_0 = l_PluginButton_0;
    v30 = {
        Name = "stepIntoActionV2", 
        Toolbar = v22, 
        Active = false
    };
    v31 = false;
    if v21.props.CurrentThreadId ~= nil then
        v31 = not l_HitException_0;
    end;
    v30.Enabled = v31;
    v30.Title = "StepInto";
    v30.Tooltip = "";
    v30.icon = "rbxlocaltheme://StepInto";
    v30.OnClick = v21.onStepInto;
    v30.ClickableWhenViewportHidden = true;
    v27.StepIntoButton = l_createElement_0(l_l_PluginButton_0_0, v30);
    l_createElement_0 = v1.createElement;
    l_l_PluginButton_0_0 = l_PluginButton_0;
    v30 = {
        Name = "stepOutActionV2", 
        Toolbar = v22, 
        Active = false
    };
    v31 = false;
    if v21.props.CurrentThreadId ~= nil then
        v31 = not l_HitException_0;
    end;
    v30.Enabled = v31;
    v30.Title = "StepOut";
    v30.Tooltip = "";
    v30.icon = "rbxlocaltheme://StepOut";
    v30.OnClick = v21.onStepOut;
    v30.ClickableWhenViewportHidden = true;
    v27.StepOutButton = l_createElement_0(l_l_PluginButton_0_0, v30);
    return v27;
end;
v13.render = function(v32) --[[ Line: 180 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_PluginToolbar_0 (copy)
    if v32.shortcuts then
        for _, v34 in pairs(v32.shortcuts) do
            v34.Enabled = v32.props.IsPaused;
        end;
    end;
    return v1.createElement(l_PluginToolbar_0, {
        Title = "Debugger", 
        RenderButtons = function(v35) --[[ Line: 189 ]] --[[ Name: RenderButtons ]]
            -- upvalues: v32 (copy)
            return v32:renderButtons(v35);
        end
    });
end;
v13 = l_ContextServices_0.withContext({
    Analytics = l_Analytics_0, 
    PluginActions = l_PluginActions_0
})(v13);
return (v2.connect(function(v36, _) --[[ Line: 200 ]]
    local l_Common_0 = v36.Common;
    local l_isPaused_0 = l_Common_0.isPaused;
    local v40 = l_Common_0.debuggerConnectionIdToCurrentThreadId[l_Common_0.currentDebuggerConnectionId];
    local l_currentDebuggerConnectionId_0 = l_Common_0.currentDebuggerConnectionId;
    return {
        IsPaused = l_isPaused_0, 
        CurrentThreadId = v40, 
        CurrentDebuggerConnectionId = l_currentDebuggerConnectionId_0, 
        HitException = if v40 then l_Common_0.hitException[v40] else false
    };
end, function(v42) --[[ Line: 212 ]]
    -- upvalues: v12 (copy), v11 (copy)
    return {
        onSetPausedState = function(v43) --[[ Line: 214 ]] --[[ Name: onSetPausedState ]]
            -- upvalues: v42 (copy), v12 (ref)
            return v42(v12(v43));
        end, 
        onStepAction = function(v44, v45, v46, v47) --[[ Line: 217 ]] --[[ Name: onStepAction ]]
            -- upvalues: v42 (copy), v11 (ref)
            return v42(v11(v44, v45, v46, v47));
        end
    };
end)(v13));