if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
    local l_Common_0 = l_script_FirstAncestor_0.Bin.Common;
    require(l_Common_0.defineLuaFlags);
    local v2 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v2.launch("Ribbon", l_script_FirstAncestor_0.Src);
    if v2.isCli() then
        return;
    elseif not game:GetFastFlag("EnableRibbonPlugin") then
        return;
    else
        local l_FocusedDataModelSession_0 = plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
        l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function(v4) --[[ Line: 23 ]]
            plugin:Invoke("DmChanged", v4);
        end);
        if l_FocusedDataModelSession_0.CurrentDataModelType == Enum.StudioDataModelType.Edit then
            require(l_script_FirstAncestor_0.Src.Util.SocialPresence.SocialPresenceDmBridge).initAssetDm(plugin);
        end;
        plugin:Invoke("DmChanged", l_FocusedDataModelSession_0.CurrentDataModelType);
        if not game:GetService("StudioService"):HasInternalPermission() then
            return;
        else
            local function v14() --[[ Line: 37 ]] --[[ Name: init ]]
                -- upvalues: l_script_FirstAncestor_0 (copy)
                local v5 = require(l_script_FirstAncestor_0.Packages.React);
                local v6 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
                local v7 = require(l_script_FirstAncestor_0.Src.MainPlugin);
                local l_FocusedDataModelSession_1 = plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
                local v9 = nil;
                local function v12() --[[ Line: 46 ]] --[[ Name: load ]]
                    -- upvalues: v5 (copy), v7 (copy), v9 (ref), v6 (copy)
                    if not plugin.HostDataModelTypeIsCurrent then
                        return;
                    else
                        local l_plugin_QWidgetPluginGui_0 = plugin:CreateQWidgetPluginGui("Ribbon", {
                            InitialEnabled = true, 
                            MinSize = Vector2.new(1600, 132), 
                            Modal = false, 
                            Size = Vector2.new(1600, 132), 
                            Title = "Ribbon"
                        });
                        l_plugin_QWidgetPluginGui_0.Name = "Ribbon";
                        local v11 = v5.createElement(v7, {
                            Plugin = plugin, 
                            Widget = l_plugin_QWidgetPluginGui_0, 
                            EditMode = true
                        });
                        v9 = v6.createRoot(l_plugin_QWidgetPluginGui_0);
                        assert(v9, "Luau does not refine the type of `root` to be non-nil here");
                        v9:render(v11);
                        return;
                    end;
                end;
                local function v13() --[[ Line: 71 ]] --[[ Name: unload ]]
                    -- upvalues: v9 (ref)
                    if v9 then
                        v9:unmount();
                        v9 = nil;
                    end;
                end;
                l_FocusedDataModelSession_1.CurrentDataModelTypeAboutToChange:Connect(v13);
                l_FocusedDataModelSession_1.CurrentDataModelTypeChanged:Connect(v12);
                v12();
            end;
            if game:GetFastFlag("DebugTestRibbonInAssetDM") then
                v14();
            end;
            return;
        end;
    end;
end;