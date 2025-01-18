local l_Parent_0 = script.Parent.Parent;
game:DefineFastFlag("DebugEnableRobloxAvatarItemConfigurer", false);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 5 ]]
    return game:GetService("StudioService"):HasInternalPermission();
end);
local v3 = l_status_0 and l_result_0;
if not game:GetFastFlag("DebugEnableRobloxAvatarItemConfigurer") or not v3 then
    return;
else
    require(l_Parent_0.Bin.defineLuaFlags);
    local v4 = require(l_Parent_0.src.Constants);
    local v5 = require(l_Parent_0.src.Globals);
    v5.plugin = plugin;
    v5.toolbar = v5.plugin:CreateToolbar(v4.TOOLBAR_NAME);
    local v6 = require(l_Parent_0.Packages.Roact);
    local v7 = require(l_Parent_0.Packages.Rodux);
    local v8 = require(l_Parent_0.Packages.RoactRodux);
    local v9 = require(l_Parent_0.src.components.AvatarImporter);
    local v10 = require(l_Parent_0.src.reducers);
    local v11 = require(l_Parent_0.src.actions.ClosePlugin);
    local v12 = require(l_Parent_0.src.actions.TogglePlugin);
    local v13 = v7.Store.new(v10, nil, {
        v7.thunkMiddleware
    });
    local l_QWidgetPluginGui_0 = v5.plugin:CreateQWidgetPluginGui(v4.NAME, {
        Enabled = false, 
        Title = v4.TITLE, 
        Name = v4.NAME, 
        Modal = true, 
        Size = Vector2.new(v4.BACKGROUND_WIDTH, v4.BACKGROUND_HEIGHT)
    });
    l_QWidgetPluginGui_0.Name = v4.NAME;
    l_QWidgetPluginGui_0:BindToClose(function() --[[ Line: 49 ]]
        -- upvalues: v13 (copy), v11 (copy)
        v13:dispatch(v11());
    end);
    local function v15() --[[ Line: 53 ]] --[[ Name: createHandle ]]
        -- upvalues: v6 (copy), v8 (copy), v13 (copy), v9 (copy), l_QWidgetPluginGui_0 (copy)
        return v6.createElement(v8.StoreProvider, {
            store = v13
        }, {
            AvatarImporter = v6.createElement(v9, {
                pluginGui = l_QWidgetPluginGui_0
            })
        });
    end;
    local v16 = v6.mount(v15(), l_QWidgetPluginGui_0);
    local l_Button_0 = v5.toolbar:CreateButton(v4.BUTTON_NAME, v4.BUTTON_TOOLTIP, "rbxlocaltheme://AvatarImporter");
    l_Button_0.Click:Connect(function() --[[ Line: 68 ]]
        -- upvalues: v13 (copy), v12 (copy)
        v13:dispatch(v12());
    end);
    v13.changed:connect(function(v18) --[[ Line: 72 ]]
        -- upvalues: l_Button_0 (copy), l_QWidgetPluginGui_0 (copy)
        local l_enabled_0 = v18.plugin.enabled;
        l_Button_0:SetActive(l_enabled_0);
        l_QWidgetPluginGui_0.Enabled = l_enabled_0;
    end);
    settings().Studio.ThemeChanged:Connect(function() --[[ Line: 78 ]]
        -- upvalues: v6 (copy), v16 (copy), v15 (copy)
        v6.update(v16, v15());
    end);
    return nil;
end;