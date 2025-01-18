local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_PluginDebugService_0 = game:GetService("PluginDebugService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.Rodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_DockWidget_0 = v6.UI.DockWidget;
local l_ContextServices_0 = v6.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_CrossPluginCommunication_0 = v6.Util.CrossPluginCommunication;
local v13 = require(l_Parent_0.Src.Actions.SetScriptAnalyticsSent);
local v14 = require(l_Parent_0.Src.Components.MainView);
local v15 = require(l_Parent_0.Src.Components.LoadingScreen);
local v16 = require(l_Parent_0.Src.Components.InitialFlow);
local l_Contexts_0 = l_Parent_0.Src.Contexts;
local v18 = require(l_Contexts_0.ScriptConversionContext);
local v19 = require(l_Contexts_0.NetworkInterface);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v21 = require(l_Thunks_0.OnDiagnosticsUpdated);
local v22 = require(l_Thunks_0.UpdateDiagnosticsRanges);
local v23 = require(l_Thunks_0.ScanAllAnimations);
local v24 = require(l_Thunks_0.ResetAll);
local v25 = require(l_Thunks_0.CheckAvatarType);
local v26 = require(l_Parent_0.Src.Actions.SuccessfullyPublished);
local v27 = require(l_Parent_0.Src.Actions.SetExperienceData);
local v28 = require(l_Parent_0.Src.Actions.SetAllTabsData);
local v29 = require(l_Parent_0.Src.Actions.SetSelectedTab);
local v30 = require(l_Parent_0.Src.Util.ScriptAnalysis.ScriptScanner);
local v31 = require(l_Parent_0.Src.Util.ScriptAnalysis.Constants);
local v32 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v33 = require(l_Parent_0.Src.Util.PluginSettings);
local v34 = require(l_Parent_0.Src.Util.SaveInterface);
local v35 = require(l_Parent_0.Src.Util.TabsData);
local v36 = require(l_Parent_0.Src.Util.getExperienceData);
local v37 = require(l_Parent_0.Src.Util.getLocalDateTime);
local v38 = require(l_Parent_0.Src.Resources.Constants);
local v39 = require(l_Parent_0.Src.Reducers.MainReducer);
local v40 = require(l_Parent_0.Src.Resources.MakeTheme);
local v41 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v44 = v4.PureComponent:extend("MainPlugin");
v44.initToolbarAndButton = function(v45, v46) --[[ Line: 64 ]] --[[ Name: initToolbarAndButton ]]
    v45.toolbar = v46.PluginLoaderContext.toolbar;
    v45.mainButton = v46.PluginLoaderContext.mainButton;
    v45.mainButton:SetActive(v45.state.enabled);
    v46.PluginLoaderContext.mainButtonClickedSignal:Connect(v45.toggleEnabled);
end;
v44.init = function(v47, v48) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: l_ScriptEditorService_0 (copy), v23 (copy), v13 (copy), v24 (copy), v32 (copy), l_PluginDebugService_0 (copy), v34 (copy), v31 (copy), v22 (copy), v30 (copy), v21 (copy), v5 (copy), v39 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v41 (copy), v18 (copy), v19 (copy), l_CrossPluginCommunication_0 (copy), v38 (copy), v26 (copy), v35 (copy), v28 (copy), v29 (copy), v36 (copy), v37 (copy), v27 (copy), v33 (copy), v25 (copy)
    v47.state = {
        enabled = false, 
        scanComplete = false, 
        isRescan = false
    };
    v47.setScriptDocumentChangedEnabled = function(v49) --[[ Line: 80 ]]
        -- upvalues: v47 (copy), l_ScriptEditorService_0 (ref)
        if v49 and not v47.textDocumentDidChangeConnection then
            v47.textDocumentDidChangeConnection = l_ScriptEditorService_0.TextDocumentDidChange:Connect(v47.onScriptChangedCallback);
            return;
        else
            if not v49 and v47.textDocumentDidChangeConnection then
                v47.textDocumentDidChangeConnection:Disconnect();
                v47.textDocumentDidChangeConnection = nil;
            end;
            return;
        end;
    end;
    v47.setScriptAnalysisEnabled = function(v50) --[[ Line: 90 ]]
        -- upvalues: l_ScriptEditorService_0 (ref), v47 (copy)
        local v51 = true;
        local v52 = nil;
        if v50 then
            if not l_ScriptEditorService_0:IsScriptAnalysisCallbackRegistered("R15Migrator") then
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 95 ]]
                    -- upvalues: l_ScriptEditorService_0 (ref), v47 (ref)
                    l_ScriptEditorService_0:RegisterScriptAnalysisCallback("R15Migrator", 1, v47.onScriptAnalysisCallback);
                end);
                v51 = l_status_0;
                v52 = l_result_0;
            end;
        elseif l_ScriptEditorService_0:IsScriptAnalysisCallbackRegistered("R15Migrator") then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 101 ]]
                -- upvalues: l_ScriptEditorService_0 (ref)
                l_ScriptEditorService_0:DeregisterScriptAnalysisCallback("R15Migrator");
            end);
            v51 = l_status_1;
            v52 = l_result_1;
        end;
        if not v51 then
            warn(v52);
        end;
    end;
    v47.startScan = function() --[[ Line: 112 ]]
        -- upvalues: v47 (copy), v23 (ref), v13 (ref)
        v47.store:dispatch(v23(v47.analytics, v47.networkInterface, function() --[[ Line: 113 ]]
            -- upvalues: v47 (ref), v13 (ref)
            if v47.state.isRescan then
                v47.setScriptAnalysisEnabled(false);
            end;
            v47.setScriptAnalysisEnabled(true);
            v47:setState({
                scanComplete = true
            });
            v47.store:dispatch(v13(false));
            game:GetService("Workspace"):SetAvatarUnificationMode(Enum.AvatarUnificationMode.Enabled);
        end));
    end;
    v47.resetPlugin = function() --[[ Line: 127 ]]
        -- upvalues: v47 (copy), v24 (ref)
        v47:setState({
            isRescan = true, 
            scanComplete = false
        });
        v47.store:dispatch(v24());
    end;
    v47.toggleEnabled = function() --[[ Line: 135 ]]
        -- upvalues: v47 (copy), v32 (ref)
        v47:setState(function(v57) --[[ Line: 136 ]]
            return {
                enabled = not v57.enabled
            };
        end);
        if v47.state.enabled then
            v32.StartTime = os.time();
            v47.setScriptDocumentChangedEnabled(true);
        end;
        if v47.state.scanComplete or not v47.state.enabled then
            v47.setScriptAnalysisEnabled(v47.state.enabled);
        end;
    end;
    v47.onClose = function() --[[ Line: 152 ]]
        -- upvalues: v47 (copy)
        v47:setState({
            enabled = false
        });
        v47.setScriptAnalysisEnabled(false);
        v47.setScriptDocumentChangedEnabled(false);
        v47.analytics:getHandler("onPluginClosed")();
    end;
    v47.onRestore = function(v58) --[[ Line: 162 ]]
        -- upvalues: v47 (copy)
        v47:setState({
            enabled = v58
        });
        if v47.state.scanComplete or not v47.state.enabled then
            v47.setScriptAnalysisEnabled(v47.state.enabled);
        end;
    end;
    v47.includeScript = function(v59) --[[ Line: 172 ]]
        -- upvalues: l_PluginDebugService_0 (ref), v34 (ref), v31 (ref)
        return v59 and not v59:IsDescendantOf(l_PluginDebugService_0) and not v34.isDescendantOfSaveFolder(v59) and not v59:GetAttribute(v31.AttributeUnificationScriptName);
    end;
    v47.onScriptChangedCallback = function(v60, v61) --[[ Line: 181 ]]
        -- upvalues: v47 (copy), v22 (ref)
        local l_v60_Script_0 = v60:GetScript();
        if v47.includeScript(l_v60_Script_0) then
            v47.store:dispatch(v22(v47.scriptConversionContext, l_v60_Script_0, v61));
        end;
    end;
    v47.onScriptAnalysisCallback = function(v63) --[[ Line: 189 ]]
        -- upvalues: v47 (copy), v30 (ref), v21 (ref)
        if not v47.includeScript(v63.script) then
            return {
                diagnostics = {}
            };
        else
            local v64 = v30:ScanScript(v63.script, v47.localization);
            v47.store:dispatch(v21(v47.scriptConversionContext, v63.script, v64));
            if v64:GetSize() > 0 then
                return {
                    diagnostics = v64:GetDataForLinter()
                };
            else
                return {
                    diagnostics = {}
                };
            end;
        end;
    end;
    v47.onScriptDestroyingCallback = function(v65) --[[ Line: 209 ]]
        -- upvalues: v47 (copy), v21 (ref)
        v47.store:dispatch(v21(v47.scriptConversionContext, v65));
    end;
    v47.onWidgetEnabledChanged = function(v66) --[[ Line: 213 ]]
        -- upvalues: v47 (copy)
        v47:setState({
            enabled = v66.Enabled
        });
        if v47.state.scanComplete or not v47.state.enabled then
            v47.setScriptAnalysisEnabled(v47.state.enabled);
        end;
    end;
    v47.store = v5.Store.new(v39, nil, {
        v5.thunkMiddleware
    }, nil);
    v47.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "R15Migrator"
    });
    v47.analytics = l_ContextServices_0.Analytics.new(v41);
    v47.scriptConversionContext = v18.new(v47.onScriptDestroyingCallback);
    v47.networkInterface = v19.new();
    v47.api = l_ContextServices_0.API.new();
    v47.communication = l_CrossPluginCommunication_0.new(v38.CrossPluginCommunicationName);
    v47.communication:Connect(v38.CrossPluginCommunicationInstructions.Open, function() --[[ Line: 239 ]]
        -- upvalues: v47 (copy)
        if not v47.state.enabled then
            v47.toggleEnabled();
        end;
    end);
    local function v72() --[[ Line: 245 ]] --[[ Name: setConversionProgress ]]
        -- upvalues: v34 (ref), v47 (copy), v26 (ref), v35 (ref), v28 (ref), v29 (ref), v36 (ref), v37 (ref), v27 (ref)
        local v67 = v34.getPublishTime();
        local v68 = v67 ~= nil;
        assert(not v68 or v47.isR15ConvertedExperience);
        v47.store:dispatch(v26(v68));
        local v70 = v35.getAllTabsData(v47.localization, function(v69) --[[ Line: 252 ]]
            -- upvalues: v68 (copy), v35 (ref)
            if v68 then
                return v69 == v35.Summary;
            else
                return true;
            end;
        end);
        v47.store:dispatch(v28(v70));
        v47.store:dispatch(v29(v35.Summary));
        if not v68 then
            return;
        else
            v36(game.GameId, v47.api:get(), function(v71) --[[ Line: 261 ]]
                -- upvalues: v37 (ref), v67 (copy), v47 (ref), v27 (ref)
                if v71 then
                    v71.publishedDateTime = v37(v67);
                end;
                v47.store:dispatch(v27(v71));
            end);
            return;
        end;
    end;
    v47.isR15ConvertedExperience = v33.IsR15ConvertedExperience:getBooleanSetting(v48.Plugin, game.GameId);
    v72();
    v47.communication:Connect(v38.CrossPluginCommunicationInstructions.Published, function() --[[ Line: 273 ]]
        -- upvalues: v34 (ref), v72 (copy)
        v34.setPublishTime(DateTime.now());
        v72();
    end);
    v48.Plugin.Unloading:Connect(function() --[[ Line: 278 ]]
        -- upvalues: v47 (copy)
        if v47.state.enabled then
            v47.setScriptAnalysisEnabled(false);
            v47.setScriptDocumentChangedEnabled(false);
            v47.analytics:getHandler("onPluginClosed")();
        end;
        v47.communication:cleanup();
    end);
    v47:initToolbarAndButton(v48);
    v47.store:dispatch(v25(v47.networkInterface));
end;
v44.renderMain = function(v73) --[[ Line: 292 ]] --[[ Name: renderMain ]]
    -- upvalues: v4 (copy), v14 (copy), v15 (copy), v16 (copy)
    local l_scanComplete_0 = v73.state.scanComplete;
    if v73.isR15ConvertedExperience then
        return {
            MainView = if l_scanComplete_0 then v4.createElement(v14, {
                OnResetPlugin = v73.resetPlugin
            }) else nil, 
            LoadingScreen = if not l_scanComplete_0 then v4.createElement(v15, {
                StartScan = v73.startScan
            }) else nil
        };
    else
        return {
            InitialFlow = v4.createElement(v16, {})
        };
    end;
end;
v44.render = function(v75) --[[ Line: 316 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v40 (copy), v4 (copy), l_DockWidget_0 (copy)
    local l_props_0 = v75.props;
    local l_state_0 = v75.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v75.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v40(), 
        v75.localization, 
        v75.analytics, 
        v75.scriptConversionContext, 
        v75.networkInterface, 
        v75.api
    }, {
        MainWidget = v4.createElement(l_DockWidget_0, {
            Id = "R15Migrator", 
            Enabled = l_enabled_0, 
            Title = v75.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            OnClose = v75.onClose, 
            ShouldRestore = true, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetRestored = v75.onRestore, 
            Size = Vector2.new(508, 640), 
            InitialDockState = Enum.InitialDockState.Left, 
            MinSize = Vector2.new(508, 640), 
            [v4.Change.Enabled] = v75.onWidgetEnabledChanged
        }, v75:renderMain())
    });
end;
v44.didUpdate = function(v80) --[[ Line: 350 ]] --[[ Name: didUpdate ]]
    v80.mainButton:SetActive(v80.state.enabled);
end;
return v44;