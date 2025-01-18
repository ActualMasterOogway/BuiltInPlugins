return function(v0) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        require(script.Parent.defineLuaFlags);
        local l_Parent_0 = script.Parent.Parent;
        local l_FVariable_0 = settings():GetFVariable("StudioForceLocale");
        local v3 = require(l_Parent_0.Src.TestHelpers.MockDraftsService);
        local l_DraftsService_0 = game:GetService("DraftsService");
        local l_RunService_0 = game:GetService("RunService");
        local l_StudioService_0 = game:GetService("StudioService");
        local v7 = require(l_Parent_0.Packages.Roact);
        local v8 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local v10 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local v11 = require(l_Parent_0.Src.Components.MainView);
        local v12 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v13 = require(l_Parent_0.Src.Actions.DraftsServiceLoaded);
        local v14 = require(l_Parent_0.Src.Actions.DraftsLoadedAction);
        local v15 = require(l_Parent_0.Src.Actions.DraftAddedAction);
        local v16 = require(l_Parent_0.Src.Actions.DraftRemovedAction);
        local v17 = require(l_Parent_0.Src.Actions.DraftStateChangedAction);
        local v18 = require(l_Parent_0.Src.Symbols.CommitState);
        local v19 = require(l_Parent_0.Src.Symbols.DraftState);
        local v20 = require(l_Parent_0.Src.Resources.MakeTheme);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local function v23() --[[ Line: 44 ]] --[[ Name: overrideLocale ]]
            -- upvalues: l_FVariable_0 (copy), l_StudioService_0 (copy)
            if #l_FVariable_0 > 0 then
                return l_FVariable_0;
            else
                return l_StudioService_0.StudioLocaleId;
            end;
        end;
        local v24 = v8.Store.new(v12);
        local v25 = v20();
        local v26 = l_ContextServices_0.Localization.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            overrideLocaleChangedSignal = l_StudioService_0:GetPropertyChangedSignal("StudioLocaleId"), 
            overrideGetLocale = v23, 
            pluginName = "Drafts"
        });
        local l_game_FastInt_0 = game:GetFastInt("DebugStudioDraftsWidgetTestCase");
        local v28 = l_game_FastInt_0 == 0 and l_DraftsService_0 or v3.new(l_game_FastInt_0);
        local v29 = nil;
        local v30 = nil;
        local function v32() --[[ Line: 73 ]] --[[ Name: openPluginWindow ]]
            -- upvalues: v29 (ref), v7 (copy), v10 (copy), v28 (copy), v30 (ref), v26 (copy), v0 (copy), v24 (copy), v25 (copy), v11 (copy)
            if v29 then
                warn("Plugin handle already exists");
                return;
            else
                local v31 = v7.createElement(v10, {
                    draftsService = v28, 
                    focusGui = v30, 
                    localization = v26, 
                    plugin = v0, 
                    store = v24, 
                    theme = v25
                }, {
                    mainView = v7.createElement(v11, {})
                });
                v29 = v7.mount(v31, v30);
                return;
            end;
        end;
        local function _() --[[ Line: 95 ]] --[[ Name: closePluginWindow ]]
            -- upvalues: v29 (ref), v7 (copy)
            if v29 then
                v7.unmount(v29);
                v29 = nil;
            end;
        end;
        v0.Unloading:Connect(function() --[[ Line: 102 ]]
            -- upvalues: v29 (ref), v7 (copy)
            if v29 then
                v7.unmount(v29);
                v29 = nil;
            end;
        end);
        local function v34() --[[ Line: 106 ]] --[[ Name: toggleWidget ]]
            -- upvalues: v30 (ref)
            v30.Enabled = not v30.Enabled;
        end;
        local function _(v35) --[[ Line: 110 ]] --[[ Name: createToolTip ]]
            -- upvalues: v0 (copy), v26 (copy), v34 (copy)
            local l_Button_0 = v0:CreateToolbar("draftsToolbar"):CreateButton("draftsButton", v26:getText("Meta", "PluginButtonTooltip"), "");
            if v35 then
                l_Button_0.ClickableWhenViewportHidden = true;
                l_Button_0.Click:connect(v34);
            end;
            l_Button_0.Enabled = v35;
            return l_Button_0;
        end;
        if not game:GetService("RunService"):IsEdit() then
            v0:CreateToolbar("draftsToolbar"):CreateButton("draftsButton", v26:getText("Meta", "PluginButtonTooltip"), "").Enabled = false;
            return;
        else
            local function _(v38) --[[ Line: 133 ]] --[[ Name: setWidgetInitialState ]]
                -- upvalues: l_RunService_0 (copy), v30 (ref), v28 (copy)
                if not l_RunService_0:IsEdit() then
                    return;
                elseif #v38 > 0 then
                    v30.Enabled = true;
                    return;
                else
                    local v39 = nil;
                    v39 = v28.DraftAdded:connect(function() --[[ Line: 148 ]]
                        -- upvalues: v39 (ref), v30 (ref)
                        v39:disconnect();
                        v30.Enabled = true;
                    end);
                    return;
                end;
            end;
            local function v67() --[[ Line: 155 ]] --[[ Name: connectToDraftsService ]]
                -- upvalues: v24 (copy), v17 (copy), v19 (copy), v28 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v18 (copy), l_RunService_0 (copy), v30 (ref)
                local v41 = {};
                local function v45(v42, v43) --[[ Line: 158 ]] --[[ Name: handleStatus ]]
                    -- upvalues: v24 (ref), v17 (ref), v19 (ref)
                    if v43 == Enum.DraftStatusCode.DraftOutdated then
                        v24:dispatch(v17(v42, v19.Outdated, true));
                        return;
                    elseif v43 == Enum.DraftStatusCode.OK then
                        v24:dispatch(v17(v42, v19.Outdated, false));
                        return;
                    elseif v43 == Enum.DraftStatusCode.DraftCommitted then
                        local v44 = v24:getState();
                        assert(v44.Drafts[v42][v19.Outdated] == false, "Draft '" .. v42:GetFullName() .. "' was committed with dirty Outdated state");
                        assert(v44.Drafts[v42][v19.Deleted] == false, "Draft '" .. v42:GetFullName() .. "' was committed with dirty Deleted state");
                        return;
                    else
                        if v43 == Enum.DraftStatusCode.ScriptRemoved then

                        end;
                        return;
                    end;
                end;
                local function v50(v46) --[[ Line: 178 ]] --[[ Name: draftInit ]]
                    -- upvalues: v41 (copy), v28 (ref), v45 (copy), v24 (ref), v17 (ref), v19 (ref)
                    assert(v41[v46] == nil);
                    local l_v28_DraftStatus_0 = v28:GetDraftStatus(v46);
                    v45(v46, l_v28_DraftStatus_0);
                    v41[v46] = v46.AncestryChanged:Connect(function(_, v49) --[[ Line: 184 ]]
                        -- upvalues: v24 (ref), v17 (ref), v46 (copy), v19 (ref)
                        v24:dispatch(v17(v46, v19.Deleted, v49 == nil));
                    end);
                end;
                local function _(v51) --[[ Line: 189 ]] --[[ Name: draftCleanup ]]
                    -- upvalues: v41 (copy)
                    assert(v41[v51] ~= nil);
                    v41[v51]:Disconnect();
                    v41[v51] = nil;
                end;
                spawn(function() --[[ Line: 195 ]]
                    -- upvalues: v28 (ref), v24 (ref), v13 (ref), v14 (ref), v50 (copy), v15 (ref), v16 (ref), v41 (copy), v45 (copy), v18 (ref), v17 (ref), v19 (ref), l_RunService_0 (ref), v30 (ref)
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 196 ]]
                        -- upvalues: v28 (ref)
                        return v28:GetDrafts();
                    end);
                    v24:dispatch(v13(l_status_0, l_result_0));
                    if not l_status_0 then
                        return;
                    else
                        v24:dispatch(v14(l_result_0));
                        for _, v56 in pairs(l_result_0) do
                            v50(v56);
                        end;
                        v28.DraftAdded:connect(function(v57) --[[ Line: 211 ]]
                            -- upvalues: v24 (ref), v15 (ref), v50 (ref)
                            v24:dispatch(v15(v57));
                            v50(v57);
                        end);
                        v28.DraftRemoved:connect(function(v58) --[[ Line: 216 ]]
                            -- upvalues: v24 (ref), v16 (ref), v41 (ref)
                            v24:dispatch(v16(v58));
                            assert(v41[v58] ~= nil);
                            v41[v58]:Disconnect();
                            v41[v58] = nil;
                        end);
                        v28.DraftStatusChanged:connect(function(v59) --[[ Line: 221 ]]
                            -- upvalues: v28 (ref), v45 (ref)
                            local l_v28_DraftStatus_1 = v28:GetDraftStatus(v59);
                            v45(v59, l_v28_DraftStatus_1);
                        end);
                        v28.UpdateStatusChanged:connect(function(v61, v62) --[[ Line: 226 ]]
                            -- upvalues: v45 (ref)
                            v45(v61, v62);
                        end);
                        v28.CommitStatusChanged:connect(function(v63, v64) --[[ Line: 229 ]]
                            -- upvalues: v18 (ref), v24 (ref), v17 (ref), v19 (ref), v45 (ref)
                            local v65 = v64 == Enum.DraftStatusCode.DraftCommitted and v18.Committed or v18.Uncommitted;
                            v24:dispatch(v17(v63, v19.Committed, v65));
                            v45(v63, v64);
                        end);
                        if not l_RunService_0:IsEdit() then
                            return;
                        elseif #l_result_0 > 0 then
                            v30.Enabled = true;
                            return;
                        else
                            local v66 = nil;
                            v66 = v28.DraftAdded:connect(function() --[[ Line: 148 ]]
                                -- upvalues: v66 (ref), v30 (ref)
                                v66:disconnect();
                                v30.Enabled = true;
                            end);
                            return;
                        end;
                    end;
                end);
            end;
            (function() --[[ Line: 241 ]] --[[ Name: main ]]
                -- upvalues: v26 (copy), v0 (copy), v34 (copy), v30 (ref), v32 (copy), v29 (ref), v7 (copy), v67 (copy)
                local v68 = v26:getText("Meta", "PluginName");
                v0.Name = v68;
                local l_Button_1 = v0:CreateToolbar("draftsToolbar"):CreateButton("draftsButton", v26:getText("Meta", "PluginButtonTooltip"), "");
                l_Button_1.ClickableWhenViewportHidden = true;
                l_Button_1.Click:connect(v34);
                l_Button_1.Enabled = true;
                local l_l_Button_1_0 = l_Button_1;
                local function v71() --[[ Line: 247 ]] --[[ Name: showIfEnabled ]]
                    -- upvalues: v30 (ref), v32 (ref), v29 (ref), v7 (ref), l_l_Button_1_0 (copy)
                    if v30.Enabled then
                        v32();
                    elseif v29 then
                        v7.unmount(v29);
                        v29 = nil;
                    end;
                    l_l_Button_1_0:SetActive(v30.Enabled);
                end;
                l_Button_1 = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, true, 300, 600, 150, 150);
                v30 = v0:CreateDockWidgetPluginGui("Drafts", l_Button_1);
                v30.Name = v68;
                v30.Title = v68;
                v30.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                v30:GetPropertyChangedSignal("Enabled"):connect(v71);
                if v30.Enabled then
                    v32();
                elseif v29 then
                    v7.unmount(v29);
                    v29 = nil;
                end;
                l_l_Button_1_0:SetActive(v30.Enabled);
                v67();
            end)();
            return;
        end;
    end;
end;