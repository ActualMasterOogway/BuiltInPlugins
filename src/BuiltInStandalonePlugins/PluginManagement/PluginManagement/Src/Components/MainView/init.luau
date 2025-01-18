local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Constants.PluginInstalledStatus);
local v6 = v1.Component:extend("MainView");
v6.renderContentNotReady = function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: renderContentNotReady ]]
    -- upvalues: v1 (copy)
    local v10 = {
        v7.props.pluginId
    };
    return {
        SimpleLabel = v1.createElement("TextLabel", {
            Text = v9:getText("Main", "InstallingPlugin", v10), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = v8.TextColor, 
            TextSize = 18, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    };
end;
v6.renderInstallSuccess = function(v11, v12, v13) --[[ Line: 29 ]] --[[ Name: renderInstallSuccess ]]
    -- upvalues: v1 (copy)
    local v14 = {
        "\"" .. (v11.props.info.name or "") .. "\""
    };
    return {
        ListLayout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Title = v1.createElement("TextLabel", {
            Text = v13:getText("Progress", "Completed"), 
            TextColor3 = v12.TextColor, 
            TextSize = 16, 
            Font = Enum.Font.SourceSansSemibold, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 18), 
            LayoutOrder = 1
        }), 
        Padding = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 24), 
            LayoutOrder = 2
        }), 
        Message = v1.createElement("TextLabel", {
            Text = v13:getText("Progress", "CompletedMessage", v14), 
            TextColor3 = v12.TextColor, 
            TextSize = 16, 
            Font = Enum.Font.SourceSans, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        })
    };
end;
v6.renderInstallProgress = function(v15, v16, v17) --[[ Line: 69 ]] --[[ Name: renderInstallProgress ]]
    -- upvalues: v5 (copy), v1 (copy)
    local l_pluginId_0 = v15.props.pluginId;
    local l_info_0 = v15.props.info;
    local l_installStatus_0 = l_info_0.installStatus;
    local l_installationMsg_0 = l_info_0.installationMsg;
    local v22 = nil;
    if l_installStatus_0 == v5.UNKNOWN then
        v22 = v17:getText("Main", "InstallingPlugin", {
            l_pluginId_0
        });
    elseif l_installStatus_0 == v5.HTTP_ERROR then
        v22 = v17:getText("Progress", "HttpError", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_NOT_OWNED then
        v22 = v17:getText("Progress", "NotOwned", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_DETAILS_UNAVAILABLE then
        v22 = v17:getText("Progress", "Unavailable", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_NOT_INSTALLED then
        v22 = v17:getText("Progress", "NotInstalled", {
            l_installationMsg_0
        });
    elseif l_installStatus_0 == v5.PLUGIN_AlREADY_INSTALLED then
        v22 = v17:getText("Progress", "AlreadyInstalled", {
            l_installationMsg_0
        });
    end;
    return {
        SimpleLabel = v1.createElement("TextLabel", {
            Text = v22, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            TextColor3 = v16.TextColor, 
            TextSize = 18, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    };
end;
v6.render = function(v23) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v1 (copy)
    local l_info_1 = v23.props.info;
    local l_Stylizer_0 = v23.props.Stylizer;
    local l_Localization_0 = v23.props.Localization;
    local v27 = nil;
    v27 = if not l_info_1 then v23:renderContentNotReady(l_Stylizer_0, l_Localization_0) else if l_info_1.installStatus == v5.PLUGIN_INSTALLED_SUCCESSFULLY then v23:renderInstallSuccess(l_Stylizer_0, l_Localization_0) else v23:renderInstallProgress(l_Stylizer_0, l_Localization_0);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1
    }, v27);
end;
v6 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v6);
return v2.connect(function(v28, v29) --[[ Line: 133 ]]
    local l_pluginId_1 = v29.pluginId;
    return {
        info = v28.PluginInfo.plugins[l_pluginId_1]
    };
end)(v6);