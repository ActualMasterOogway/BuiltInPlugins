if not plugin then
    return;
else
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
    local l_Common_0 = l_script_FirstAncestor_0.Bin.Common;
    require(l_Common_0.defineLuaFlags);
    if game:GetFastFlag("DebugAssetMgInAssetDm") then
        return;
    else
        local v2 = require(l_script_FirstAncestor_0.Packages.TestLoader);
        v2.launch("AssetManager", l_script_FirstAncestor_0.Src);
        if v2.isCli() then
            return;
        elseif not game:GetFastFlag("EnableAssetManager") then
            return;
        else
            local v3 = v2.getDebugFlags("AssetManager");
            local l_FocusedDataModelSession_0 = plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
            require(l_script_FirstAncestor_0.Src.Asset.setupAssetsDm)(plugin);
            local function v13() --[[ Line: 42 ]] --[[ Name: load ]]
                -- upvalues: v3 (copy), l_script_FirstAncestor_0 (copy), l_FocusedDataModelSession_0 (copy)
                if not plugin.HostDataModelTypeIsCurrent then
                    return;
                else
                    if v3.MountAssetReactTree then
                        local v5 = require(l_script_FirstAncestor_0.Packages.React);
                        local v6 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
                        local v7 = require(l_script_FirstAncestor_0.Src.MainPlugin);
                        local v8 = v5.createElement(v7, {
                            Plugin = plugin
                        });
                        local l_ScreenGui_0 = Instance.new("ScreenGui");
                        local v10 = v6.createRoot(l_ScreenGui_0);
                        assert(v10);
                        v10:render(v8);
                        l_ScreenGui_0.Parent = game:GetService("StarterGui");
                        do
                            local l_v10_0 = v10;
                            local function v12() --[[ Line: 76 ]] --[[ Name: unload ]]
                                -- upvalues: l_v10_0 (ref)
                                if l_v10_0 then
                                    l_v10_0:render(nil);
                                    l_v10_0 = nil;
                                end;
                            end;
                            plugin.Unloading:Connect(v12);
                            l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(v12);
                        end;
                    end;
                    return;
                end;
            end;
            l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(v13);
            v13();
            return;
        end;
    end;
end;