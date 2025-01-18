require(script.Parent.defineLuaFlags);
if not game:GetFastFlag("EnableConstraintToolLuaPlugin2") then
    return;
else
    local l_StudioService_0 = game:GetService("StudioService");
    local l_UserInputService_0 = game:GetService("UserInputService");
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConstraintTool");
    local v3 = require(l_script_FirstAncestor_0.Src.Resources.ConstraintData);
    local v4 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    plugin.Name = l_script_FirstAncestor_0.Name;
    local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
    local v7 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
    v4.launch("ConstraintTool", l_script_FirstAncestor_0.Src);
    if v4.isCli() then
        return;
    else
        local v8 = nil;
        local v9 = {};
        local v10 = false;
        local v11 = nil;
        local function _(v12, v13) --[[ Line: 40 ]] --[[ Name: closeConstraintPlugin ]]
            -- upvalues: v9 (copy), v8 (ref), v11 (ref)
            local v14 = v9[v12];
            if v14.enabled then
                v14.enabled = false;
                v14.close();
                v8 = nil;
                if not v13 then
                    plugin:Deactivate();
                    plugin:SelectRibbonTool(v11, UDim2.new());
                    v11 = nil;
                end;
            end;
        end;
        local function _(v16) --[[ Line: 57 ]] --[[ Name: openConstraintPlugin ]]
            -- upvalues: v8 (ref), v9 (copy), v11 (ref), v10 (ref)
            if v8 then
                local v17 = v9[v8];
                if v17.enabled then
                    v17.enabled = false;
                    v17.close();
                    v8 = nil;
                end;
            else
                v11 = plugin:GetSelectedRibbonTool();
                plugin:Activate(false);
            end;
            local v18 = v9[v16];
            v8 = v16;
            v10 = true;
            v18.enabled = true;
            v18.open();
        end;
        local function _() --[[ Line: 73 ]] --[[ Name: closePlugin ]]
            -- upvalues: v10 (ref), v8 (ref), v9 (copy), v11 (ref)
            if v10 then
                v10 = false;
                if v8 then
                    local v20 = v9[v8];
                    if v20.enabled then
                        v20.enabled = false;
                        v20.close();
                        v8 = nil;
                        plugin:Deactivate();
                        plugin:SelectRibbonTool(v11, UDim2.new());
                        v11 = nil;
                    end;
                end;
            end;
        end;
        l_UserInputService_0.InputEnded:Connect(function(v22) --[[ Line: 83 ]]
            -- upvalues: v10 (ref), v8 (ref), v9 (copy), v11 (ref)
            if v22.KeyCode == Enum.KeyCode.Escape and v10 then
                v10 = false;
                if v8 then
                    local v23 = v9[v8];
                    if v23.enabled then
                        v23.enabled = false;
                        v23.close();
                        v8 = nil;
                        plugin:Deactivate();
                        plugin:SelectRibbonTool(v11, UDim2.new());
                        v11 = nil;
                    end;
                end;
            end;
        end);
        for v24, _ in v3 do
            local v26 = l_StudioService_0:GetClassIcon(v24).Image:gsub("Standard", "Large");
            local v33 = {
                getName = function(_, _, _) --[[ Line: 95 ]] --[[ Name: getName ]]
                    return "Place";
                end, 
                getDescription = function(v30, v31, v32) --[[ Line: 99 ]] --[[ Name: getDescription ]]
                    return v30(v31, v32, "Plugin", "Description");
                end, 
                icon = v26, 
                enabled = false
            };
            local v37 = {
                plugin = plugin, 
                pluginName = "ConstraintTool", 
                translationResourceTable = l_LocalizedStrings_0, 
                fallbackResourceTable = l_SourceStrings_0, 
                getToolbarName = function(_, _, _) --[[ Line: 111 ]] --[[ Name: getToolbarName ]]
                    -- upvalues: v24 (copy)
                    return v24;
                end, 
                buttonInfo = v33
            };
            v33.enabled = true;
            local v38 = v7.build(v37);
            local function v40() --[[ Line: 121 ]] --[[ Name: close ]]
                -- upvalues: v24 (copy), v9 (copy), v8 (ref), v11 (ref)
                local v39 = v9[v24];
                if v39.enabled then
                    v39.enabled = false;
                    v39.close();
                    v8 = nil;
                    plugin:Deactivate();
                    plugin:SelectRibbonTool(v11, UDim2.new());
                    v11 = nil;
                end;
            end;
            v9[v24] = {
                pluginLoaderContext = v38, 
                enabled = false, 
                closeCallback = v40
            };
            local v41 = require(script.Parent.main);
            local v42 = v9[v24];
            v38.mainButtonClickedSignal:Connect(function() --[[ Line: 134 ]]
                -- upvalues: v42 (copy), v24 (copy), v9 (copy), v8 (ref), v11 (ref), v10 (ref)
                if v42.enabled then
                    local v43 = v9[v24];
                    if v43.enabled then
                        v43.enabled = false;
                        v43.close();
                        v8 = nil;
                        plugin:Deactivate();
                        plugin:SelectRibbonTool(v11, UDim2.new());
                        v11 = nil;
                        return;
                    end;
                else
                    local l_v24_0 = v24;
                    if v8 then
                        local v45 = v9[v8];
                        if v45.enabled then
                            v45.enabled = false;
                            v45.close();
                            v8 = nil;
                        end;
                    else
                        v11 = plugin:GetSelectedRibbonTool();
                        plugin:Activate(false);
                    end;
                    local v46 = v9[l_v24_0];
                    v8 = l_v24_0;
                    v10 = true;
                    v46.enabled = true;
                    v46.open();
                end;
            end);
            task.spawn(function() --[[ Line: 142 ]]
                -- upvalues: v38 (copy), v41 (copy), v42 (copy), v24 (copy)
                v38.pluginLoader:waitForUserInteraction();
                local v47 = v41(plugin, v42.pluginLoaderContext, v42, v24);
                v42.open = v47.open;
                v42.close = v47.close;
            end);
        end;
        return;
    end;
end;