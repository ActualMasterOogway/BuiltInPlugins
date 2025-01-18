local v0 = require(script.Parent.PluginLoader);
local v1 = {};
local function _(v2, v3, v4, v5) --[[ Line: 51 ]] --[[ Name: createDockWidgetPluginGui ]]
    local l_v2_DockWidgetPluginGui_0 = v2:CreateDockWidgetPluginGui(v3.id, v3.dockWidgetPluginGuiInfo);
    l_v2_DockWidgetPluginGui_0.Title = v4;
    if v5 ~= nil then
        l_v2_DockWidgetPluginGui_0.Name = v5;
    end;
    l_v2_DockWidgetPluginGui_0.ZIndexBehavior = v3.zIndexBehavior or Enum.ZIndexBehavior.Sibling;
    return l_v2_DockWidgetPluginGui_0;
end;
v1.build = function(v8) --[[ Line: 67 ]] --[[ Name: build ]]
    -- upvalues: v0 (copy)
    local v9 = {
        plugin = v8.plugin, 
        pluginName = v8.pluginName, 
        translationResourceTable = v8.translationResourceTable, 
        fallbackResourceTable = v8.fallbackResourceTable, 
        overrideLocaleId = v8.overrideLocaleId, 
        localizationNamespace = v8.localizationNamespace, 
        shouldImmediatelyOpen = v8.shouldImmediatelyOpen
    };
    local v10 = v0.new(v9);
    local function v11(...) --[[ Line: 80 ]]
        -- upvalues: v10 (ref)
        return v10:getLocalizedText(...);
    end;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if v8.noToolbar ~= true then
        local v15 = v8.getToolbarName and v8.getToolbarName(v11, v10:getKeyNamespace(), v10:getPluginName());
        v12 = v8.plugin:CreateToolbar(v15);
        local l_buttonInfo_0 = v8.buttonInfo;
        v13 = v12:CreateButton(l_buttonInfo_0.getName(v11, v10:getKeyNamespace(), v10:getPluginName()), l_buttonInfo_0.getDescription(v11, v10:getKeyNamespace(), v10:getPluginName()), l_buttonInfo_0.icon, if type(l_buttonInfo_0.text) == "function" then l_buttonInfo_0.text(v11, v10:getKeyNamespace(), v10:getPluginName()) else l_buttonInfo_0.text);
        if l_buttonInfo_0.clickableWhenViewportHidden then
            v13.ClickableWhenViewportHidden = l_buttonInfo_0.clickableWhenViewportHidden;
        end;
        if l_buttonInfo_0.enabled ~= nil then
            v13.Enabled = l_buttonInfo_0.enabled;
        end;
        v13:SetActive(false);
        v14 = v10:registerButton(v13);
    end;
    local v17 = nil;
    local l_dockWidgetInfo_0 = v8.dockWidgetInfo;
    if l_dockWidgetInfo_0 then
        local v19 = l_dockWidgetInfo_0.getDockTitle(v11, v10:getKeyNamespace(), v10:getPluginName());
        if l_dockWidgetInfo_0.name then
            local v20 = if type(l_dockWidgetInfo_0.name) == "function" then l_dockWidgetInfo_0.name(v11, v10:getKeyNamespace(), v10:getPluginName()) else l_dockWidgetInfo_0.name;
            local l_DockWidgetPluginGui_0 = v8.plugin:CreateDockWidgetPluginGui(l_dockWidgetInfo_0.id, l_dockWidgetInfo_0.dockWidgetPluginGuiInfo);
            l_DockWidgetPluginGui_0.Title = v19;
            if v20 ~= nil then
                l_DockWidgetPluginGui_0.Name = v20;
            end;
            l_DockWidgetPluginGui_0.ZIndexBehavior = l_dockWidgetInfo_0.zIndexBehavior or Enum.ZIndexBehavior.Sibling;
            v17 = l_DockWidgetPluginGui_0;
        else
            local l_DockWidgetPluginGui_1 = v8.plugin:CreateDockWidgetPluginGui(l_dockWidgetInfo_0.id, l_dockWidgetInfo_0.dockWidgetPluginGuiInfo);
            l_DockWidgetPluginGui_1.Title = v19;
            l_DockWidgetPluginGui_1.ZIndexBehavior = l_dockWidgetInfo_0.zIndexBehavior or Enum.ZIndexBehavior.Sibling;
            v17 = l_DockWidgetPluginGui_1;
        end;
        v10:registerWidget(v17);
    end;
    local v23 = {};
    if v8.extraTriggers then
        for v24, v25 in pairs(v8.extraTriggers) do
            local v26 = v25();
            v23[v24] = v10:registerSignal(v26);
        end;
    end;
    local v27 = {
        pluginLoader = v10, 
        plugin = v8.plugin, 
        toolbar = v12, 
        mainButton = v13, 
        mainDockWidget = v17, 
        mainButtonClickedSignal = v14, 
        signals = v23
    };
    v8.plugin.Unloading:Connect(function() --[[ Line: 149 ]]
        -- upvalues: v10 (ref), v27 (copy)
        v10:Destroy();
        v10 = nil;
        v27.pluginLoader = nil;
        if v27.mainButtonClickedSignal then
            v27.mainButtonClickedSignal:Destroy();
        end;
        for _, v29 in pairs(v27.signals) do
            v29:Destroy();
        end;
    end);
    return v27;
end;
return v1;