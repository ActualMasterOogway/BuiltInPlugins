local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
    return game:GetService("TutorialService");
end);
local v5 = if l_status_0 then l_result_0 else nil;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v7 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v7.join;
local l_collect_0 = v7.collect;
local v10 = require(l_Parent_0.Packages.Framework);
local l_Dialog_0 = v10.UI.Dialog;
local l_CrossPluginCommunication_0 = v10.Util.CrossPluginCommunication;
local l_ContextServices_0 = v10.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v16 = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocol);
local v17 = require(l_Parent_0.Src.Util.Telemetry.SkipStep);
local v18 = require(l_Parent_0.Src.Util.Telemetry.StartStep);
local v19 = require(l_Parent_0.Src.Util.Telemetry.CompleteStep);
local v20 = require(l_Parent_0.Src.Util.Telemetry.IntermediateStep);
local v21 = require(l_Parent_0.Src.Util.Telemetry.ExtraAction);
local _ = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocolTypes);
local v23 = Vector2.new(460, 300);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v26 = require(l_Parent_0.Src.Reducers.MainReducer);
local v27 = require(l_Parent_0.Src.Resources.MakeTheme);
local v28 = require(l_Parent_0.Src.Util.Tutorial);
local l_Components_0 = l_Parent_0.Src.Components;
local v30 = require(l_Components_0.CompletedTutorialDialog);
local v31 = require(l_Components_0.TourWidget);
local v32 = v1.PureComponent:extend("AssetRoot");
v32.init = function(v33, v34) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v26 (copy), v16 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v10 (copy), l_RbxAnalyticsService_0 (copy), v5 (copy), l_join_0 (copy), l_CrossPluginCommunication_0 (copy), l_Parent_0 (copy), v28 (copy)
    v33.state = {
        tutorialData = nil, 
        tutorialDialogEnabled = true, 
        completed = false, 
        completedDialogEnabled = false, 
        pressedKeys = {}, 
        widget = nil
    };
    v33.store = v2.Store.new(v26, nil, {
        v2.thunkMiddleware
    }, nil);
    v33.telemetry = v16.new();
    v33.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Tutorials", 
        libraries = {
            [v10.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v10.Resources.SourceStrings, 
                translationResourceTable = v10.Resources.LocalizedStrings
            }
        }
    });
    v33.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 82 ]]
        return {};
    end, {});
    v33.log = function(v35, v36) --[[ Line: 86 ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), v5 (ref), v33 (copy), l_join_0 (ref)
        local l_l_RbxAnalyticsService_0_SessionId_0 = l_RbxAnalyticsService_0:GetSessionId();
        local l_l_RbxAnalyticsService_0_ClientId_0 = l_RbxAnalyticsService_0:GetClientId();
        local l_v5_MainViewSessionId_0 = v5:GetMainViewSessionId();
        local v40 = v33.tutorial:getCurrentStep();
        v33.telemetry:logRobloxTelemetryEvent(v35, nil, l_join_0({
            tutorialId = v33.tutorial.data.id, 
            currentStep = v33.tutorial.currentStep, 
            stepId = v40.data.id, 
            studioSid = l_l_RbxAnalyticsService_0_SessionId_0, 
            clientId = l_l_RbxAnalyticsService_0_ClientId_0, 
            mainViewSessionId = l_v5_MainViewSessionId_0
        }, v36));
    end;
    v33.toolboxConnection = l_CrossPluginCommunication_0.new("Toolbox");
    local l_v5_TutorialIDToLaunch_0 = v5:GetTutorialIDToLaunch();
    local l_FirstChild_0 = l_Parent_0.Src.Tutorials:FindFirstChild(l_v5_TutorialIDToLaunch_0);
    if l_FirstChild_0 and l_FirstChild_0:IsA("ModuleScript") then
        local v43 = require(l_FirstChild_0);
        v33.tutorial = v28.new(game, v43, v33.localization, v33.toolboxConnection, v34.Plugin);
        v33:loadTutorial(v33.tutorial);
    end;
    v33.onBack = function() --[[ Line: 116 ]]
        -- upvalues: v33 (copy)
        v33.tutorial:back();
    end;
    v33.onNext = function() --[[ Line: 119 ]]
        -- upvalues: v33 (copy)
        v33.tutorial:increment(not v33.state.tutorialData.showNext);
    end;
    v33.onQuit = function() --[[ Line: 122 ]]
        -- upvalues: v5 (ref)
        v5:PromptClosePlace();
    end;
    v33.onSelectTopic = function(v44) --[[ Line: 125 ]]
        -- upvalues: v33 (copy)
        v33.tutorial:selectTopic(v44);
    end;
end;
v32.didMount = function(v45) --[[ Line: 130 ]] --[[ Name: didMount ]]
    if not v45.state.widget then
        local v46 = v45:createWidget();
        v45:setState({
            widget = v46
        });
        v45.tutorial:setWidget(v46);
    end;
    local l_Plugin_0 = v45.props.Plugin;
    v45.connection = l_Plugin_0:OnInvoke("GetPlayStep", function() --[[ Line: 139 ]]
        -- upvalues: l_Plugin_0 (copy), v45 (copy)
        l_Plugin_0:Invoke("SendPlayStep", v45.state.tutorialData);
    end);
end;
v32.createWidget = function(v48) --[[ Line: 144 ]] --[[ Name: createWidget ]]
    local l_QWidgetPluginGui_0 = v48.props.Plugin:CreateQWidgetPluginGui("TourWidget", {
        Callout = true, 
        MinSize = Vector2.new(275, 350), 
        Modal = false, 
        InitialEnabled = true, 
        Size = Vector2.new(275, 350), 
        Title = "TourWidget"
    });
    l_QWidgetPluginGui_0.Name = "TourWidget";
    return l_QWidgetPluginGui_0;
end;
v32.willUnmount = function(v50) --[[ Line: 157 ]] --[[ Name: willUnmount ]]
    if v50.connection then
        v50.connection:Disconnect();
    end;
end;
v32.loadTutorial = function(v51, v52) --[[ Line: 163 ]] --[[ Name: loadTutorial ]]
    -- upvalues: v1 (copy), l_collect_0 (copy), v17 (copy), v19 (copy), v18 (copy), v20 (copy), l_join_0 (copy), v21 (copy)
    local l_props_0 = v51.props;
    v52.onCompleted = function() --[[ Line: 167 ]]
        -- upvalues: v51 (copy)
        v51:setState({
            completed = true, 
            completedDialogEnabled = true
        });
    end;
    v52.onStepChanged = function(v54) --[[ Line: 175 ]]
        -- upvalues: v1 (ref), l_collect_0 (ref), v51 (copy), v17 (ref), v19 (ref), v18 (ref)
        local l_None_0 = v1.None;
        if v54.step.kind == "Focus" then
            l_None_0 = {
                {
                    key = "F", 
                    index = 1, 
                    pressed = false
                }
            };
        elseif v54.step.keys then
            l_None_0 = l_collect_0(v54.step.keys, function(v56, v57) --[[ Line: 187 ]]
                return v57.Name, {
                    key = v57.Name, 
                    index = v56, 
                    pressed = false
                };
            end);
        end;
        v51:setState({
            tutorialData = v54, 
            pressedKeys = l_None_0
        });
        if v54.step.kind == "Skipped" then
            v51.log(v17);
        elseif v54.step.kind == "Completed" then
            v51.log(v19);
        else
            v51.log(v18);
        end;
        v51.props.Plugin:Invoke("SendPlayStep", v54);
    end;
    v52.onKeyPressed = function(v58) --[[ Line: 213 ]]
        -- upvalues: v51 (copy), v20 (ref), l_join_0 (ref)
        v51.log(v20, {
            action = "KeyPress", 
            actionKeyCode = v58.Name
        });
        v51:setState(function(v59) --[[ Line: 218 ]]
            -- upvalues: l_join_0 (ref), v58 (copy)
            local v60 = v59.pressedKeys or {};
            return {
                pressedKeys = l_join_0(v60, {
                    [v58.Name] = if v60[v58.Name] then l_join_0(v60[v58.Name], {
                        pressed = true
                    }) else nil
                })
            };
        end);
    end;
    local l_FocusedDataModelSession_0 = l_props_0.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
    v51.connection = l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function() --[[ Line: 235 ]]
        -- upvalues: l_FocusedDataModelSession_0 (copy), v52 (copy), v51 (copy), v21 (ref)
        if l_FocusedDataModelSession_0.CurrentDataModelType == Enum.StudioDataModelType.PlayClient and v52.startPlaying then
            v52.startPlaying();
            v51.log(v21, {
                action = "StartPlaytest"
            });
            return;
        else
            if l_FocusedDataModelSession_0.CurrentDataModelType == Enum.StudioDataModelType.Edit and v52.stopPlaying then
                v52.stopPlaying();
                v51.log(v21, {
                    action = "StopPlaytest"
                });
            end;
            return;
        end;
    end);
    l_props_0.Plugin.Unloading:Connect(function() --[[ Line: 250 ]]
        -- upvalues: v52 (copy)
        for v62 in pairs(v52.callouts) do
            v62:Destroy();
        end;
    end);
    v52:start();
    v51.tutorial.dataModel:GetService("Workspace").ChildAdded:Connect(function(v63) --[[ Line: 260 ]]
        -- upvalues: v51 (copy), v21 (ref)
        v51.log(v21, {
            action = "InsertObject", 
            actionKeyCode = v63.ClassName
        });
        v63.Changed:Connect(function(v64) --[[ Line: 265 ]]
            -- upvalues: v51 (ref), v21 (ref)
            if v64 == "Color" or v64 == "Material" then
                v51.log(v21, {
                    action = "ChangeProperty", 
                    actionKeyCode = v64
                });
            end;
        end);
    end);
end;
v32.render = function(v65) --[[ Line: 276 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v31 (copy), l_ContextServices_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v27 (copy), l_Dialog_0 (copy), v23 (copy), v30 (copy), v5 (copy)
    local l_props_1 = v65.props;
    local l_state_0 = v65.state;
    local l_Plugin_1 = l_props_1.Plugin;
    local l_completed_0 = l_state_0.completed;
    local l_completedDialogEnabled_0 = l_state_0.completedDialogEnabled;
    local v71 = v65.localization:getText(v65.tutorial.data.id, "Title");
    local v72 = if l_state_0.widget then v1.createElement(v31, {
        OnBack = v65.onBack, 
        OnNext = v65.onNext, 
        OnQuit = v65.onQuit, 
        OnSelectTopic = v65.onSelectTopic, 
        Plugin = l_Plugin_1, 
        PressedKeys = l_state_0.pressedKeys, 
        StepData = l_state_0.tutorialData, 
        Widget = l_state_0.widget
    }) else nil;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(l_Plugin_1), 
        l_Store_0.new(v65.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v27(), 
        v65.localization, 
        v65.analytics
    }, {
        View = if l_completedDialogEnabled_0 then v1.createElement(l_Dialog_0, {
            Title = v65.localization:getText("Completed", "Title"):format(v71), 
            Enabled = l_completedDialogEnabled_0, 
            Modal = true, 
            Size = v23, 
            OnClose = function() --[[ Line: 312 ]] --[[ Name: OnClose ]]
                -- upvalues: v65 (copy)
                v65:setState({
                    completedDialogEnabled = false
                });
            end
        }, {
            Content = v1.createElement(v30, {
                Name = v71, 
                OnClose = function() --[[ Line: 320 ]] --[[ Name: OnClose ]]
                    -- upvalues: v65 (copy)
                    v65:setState({
                        completedDialogEnabled = false
                    });
                end, 
                OnReturn = function() --[[ Line: 325 ]] --[[ Name: OnReturn ]]
                    -- upvalues: v65 (copy), v5 (ref)
                    v65:setState({
                        completedDialogEnabled = false
                    });
                    v5:PromptClosePlace();
                end
            })
        }) else if l_completed_0 then nil else v72
    });
end;
return v32;