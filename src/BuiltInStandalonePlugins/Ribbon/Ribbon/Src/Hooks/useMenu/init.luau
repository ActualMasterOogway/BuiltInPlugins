local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
if require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDevFrameworkRibbonHooks)() then
    return v3.UI.Hooks.useMenu;
else
    local _ = require(l_script_FirstAncestor_0.Src.Types);
    local v5 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
    local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
    local l_ContextServices_0 = v3.ContextServices;
    local l_Localization_0 = l_ContextServices_0.Localization;
    local l_Plugin_0 = l_ContextServices_0.Plugin;
    local v10 = require(l_script_FirstAncestor_0.Src.Util.DesignContext);
    local v11 = l_ContextServices_0.ContextItem:createSimple("Menu");
    local v12 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaRibbonSelectInput)();
    local v13 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagMaterialPickerRenameGrabsMouseProp);
    local v14 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioEnableInteractionTelemetry);
    local v15 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioRibbonDeferInteractionTelemetry);
    local v16 = {};
    local v17 = 0;
    local function v21(v18) --[[ Line: 53 ]] --[[ Name: closeMenus ]]
        -- upvalues: v16 (copy), v12 (copy)
        for v19, v20 in v16 do
            if v18 == nil or v19 > v18 then
                v20.open = false;
                v20.panel.Enabled = false;
                if v12 and v20.onClose then
                    v20.onClose();
                end;
                v20.root:render(nil);
                task.spawn(function() --[[ Line: 64 ]]
                    -- upvalues: v20 (copy)
                    v20.Panels:SetSizeAsync(v20.uri, Vector2.new(0, 0));
                end);
            end;
        end;
    end;
    local function v32(v22, v23, v24) --[[ Line: 71 ]] --[[ Name: getMenu ]]
        -- upvalues: v16 (copy), v12 (copy), v13 (copy), v2 (copy), l_join_0 (copy), v21 (copy)
        if v16[v23] then
            local v25 = v16[v23];
            if v12 then
                v25.onClose = v24;
            end;
            return v25;
        else
            local v26 = ("Menus/%*"):format(v23);
            local l_v22_QWidgetPluginGui_0 = v22:CreateQWidgetPluginGui(v26, {
                Id = v26, 
                InitialEnabled = false, 
                MinSize = Vector2.new(100, 100), 
                Modal = false, 
                Popup = if v13() then {
                    PassesThroughMouseEvents = true
                } else {
                    GrabsMouse = false
                }, 
                Resizable = true, 
                Size = Vector2.new(100, 100), 
                Title = v26
            });
            l_v22_QWidgetPluginGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            local v28 = v2.createRoot(l_v22_QWidgetPluginGui_0);
            local v29 = {
                depth = #v16 + 1, 
                uri = l_join_0(v22:GetUri(), {
                    Category = "Panels", 
                    ItemId = v26
                }), 
                panel = l_v22_QWidgetPluginGui_0, 
                root = v28, 
                open = false, 
                Panels = v22:GetPluginComponent("Panels")
            };
            if v12 then
                v29 = l_join_0(v29, {
                    onClose = v24
                });
            end;
            v16[v23] = v29;
            l_v22_QWidgetPluginGui_0:BindToClose(function() --[[ Line: 115 ]]
                -- upvalues: v16 (ref), v29 (ref), v21 (ref)
                local v30 = nil;
                for v31 = #v16, 1, -1 do
                    if v16[v31].open then
                        v30 = v16[v31];
                        break;
                    end;
                end;
                if v29 == v30 then
                    v21();
                end;
            end);
            return v29;
        end;
    end;
    return function(v33) --[[ Line: 143 ]] --[[ Name: useMenu ]]
        -- upvalues: l_Plugin_0 (copy), v10 (copy), v11 (copy), l_Localization_0 (copy), v12 (copy), v1 (copy), l_join_0 (copy), v17 (ref), v32 (copy), l_ContextServices_0 (copy), v5 (copy), v14 (copy), v15 (copy), v21 (copy)
        local v34 = l_Plugin_0.use();
        local v35 = v10.use();
        local v36 = v11.use();
        local v37 = l_Localization_0.use();
        local v38 = if v36.get then v36:get() else {
            depth = 0, 
            menuOnLeft = false
        };
        local v39 = nil;
        local v40 = nil;
        local v41 = nil;
        if v12 then
            local v42, v43 = v1.useState({
                isOpen = false
            });
            v40 = v42;
            v41 = v43;
            v39 = v1.useCallback(function() --[[ Line: 159 ]]
                -- upvalues: v41 (ref)
                v41({
                    isOpen = false
                });
            end, {});
            v38 = l_join_0(v38, v40);
        end;
        return function(v44, v45, v46, v47) --[[ Line: 165 ]] --[[ Name: openMenu ]]
            -- upvalues: v17 (ref), v38 (ref), v34 (copy), l_join_0 (ref), v32 (ref), v39 (ref), l_ContextServices_0 (ref), v35 (copy), v37 (copy), v11 (ref), v1 (ref), v33 (copy), v12 (ref), v41 (ref), v5 (ref), v14 (ref), v15 (ref)
            v17 = v17 + 1;
            local v48 = v38.depth + 1;
            local v49 = v34:get();
            local l_v49_Uri_0 = v49:GetUri();
            local v51 = ("Menus/%*"):format(v48);
            local v52 = l_join_0(l_v49_Uri_0, {
                Category = "Panels", 
                ItemId = v51
            });
            local v53 = v32(v49, v48, v39);
            local l_v49_PluginComponent_0 = v49:GetPluginComponent("Panels");
            v53.root:render(l_ContextServices_0.provide({
                v35, 
                v37, 
                v34, 
                v11.new({
                    depth = v48, 
                    menuOnLeft = v47 or v38.menuOnLeft
                })
            }, {
                Main = v1.createElement("Frame", {
                    [v1.Tag] = "Role-Surface100 X-Fill X-PadTabMenu"
                }, {
                    Menu = v1.createElement(v33, {
                        WidgetUri = v45, 
                        Plugin = v49, 
                        Controls = v44, 
                        OnResize = function(v55) --[[ Line: 195 ]] --[[ Name: OnResize ]]
                            -- upvalues: l_v49_PluginComponent_0 (copy), v52 (copy)
                            local v56 = math.ceil((math.min(3000, v55.AbsoluteSize.X + 16)));
                            local v57 = math.ceil((math.min(3000, v55.AbsoluteSize.Y + 16)));
                            l_v49_PluginComponent_0:SetSizeAsync(v52, Vector2.new(v56, v57));
                        end, 
                        [v1.Tag] = "X-RowSpace150 X-Top X-Fit"
                    }), 
                    StyleLink = v1.createElement("StyleLink", {
                        StyleSheet = v35:get()
                    })
                })
            }));
            l_v49_PluginComponent_0:SetAttachmentAsync(v52, (l_join_0({
                TargetWidgetUri = v45, 
                TargetAnchorPoint = Vector2.new(0, 1), 
                SubjectAnchorPoint = Vector2.new(0, 0), 
                Offset = Vector2.new(0, 0)
            }, v46)));
            v53.panel.Enabled = true;
            v53.open = true;
            if v12 then
                v41({
                    isOpen = true, 
                    widgetUriString = v5.toString(v45)
                });
            end;
            if v14() then
                if v15() then
                    task.defer(function() --[[ Line: 226 ]]
                        -- upvalues: v49 (copy), v5 (ref), v45 (copy)
                        pcall(function() --[[ Line: 227 ]]
                            -- upvalues: v49 (ref), v5 (ref), v45 (ref)
                            v49:GetPluginComponent("InteractionTelemetry"):ReportInteractionAsync({
                                functionType = "Navigation", 
                                sourceType = "Widget", 
                                sourceData = v5.toString(v45)
                            });
                        end);
                    end);
                    return;
                else
                    pcall(function() --[[ Line: 238 ]]
                        -- upvalues: v49 (copy), v5 (ref), v45 (copy)
                        v49:GetPluginComponent("InteractionTelemetry"):ReportInteractionAsync({
                            functionType = "Navigation", 
                            sourceType = "Widget", 
                            sourceData = v5.toString(v45)
                        });
                    end);
                end;
            end;
        end, v21, v38;
    end;
end;