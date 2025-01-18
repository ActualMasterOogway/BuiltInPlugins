local l_Parent_0 = script.Parent.Parent.Parent;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_StudioService_0 = game:GetService("StudioService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_PermissionsService_0 = game:GetService("PermissionsService");
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.RoactRodux);
local v7 = require(l_Parent_0.Src.Components.PluginHolder);
local v8 = require(l_Parent_0.Src.Thunks.GetAllPluginPermissions);
local v9 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Components.MovedDialog);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Util_0 = require(l_Parent_0.Packages.Framework).Util;
local v15 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local v16 = require(l_Parent_0.Src.Thunks.UpdateAllPlugins);
local v17 = require(l_Parent_0.Src.Thunks.RefreshPlugins);
local l_Button_0 = l_UI_0.Button;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local v21 = require(l_Parent_0.SharedPluginConstants);
local v22 = v5.Component:extend("ManagementMainView");
v22.init = function(v23) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: l_StudioService_0 (copy), l_MemStorageService_0 (copy), v21 (copy)
    v23.tokens = {};
    v23.state = {
        updating = false, 
        showingMovedDialog = false
    };
    v23.anyUpdateNeeded = function() --[[ Line: 40 ]]
        -- upvalues: v23 (copy), l_StudioService_0 (ref)
        if v23.props.pluginList then
            for _, v25 in pairs(v23.props.pluginList) do
                if not l_StudioService_0:IsPluginUpToDate(v25.assetId, v25.latestVersion) then
                    return true;
                end;
            end;
        end;
        return false;
    end;
    v23.refreshPlugins = function() --[[ Line: 51 ]]
        -- upvalues: v23 (copy)
        local v26 = v23.props.API:get();
        v23.props.dispatchRefreshPlugins(v26);
        v23.getAllPluginPermissions();
    end;
    v23.getAllPluginPermissions = function() --[[ Line: 59 ]]
        -- upvalues: v23 (copy)
        local v27 = v23.props.API:get();
        v23.props.getAllPluginPermissions(v27);
    end;
    v23.updateAllPlugins = function() --[[ Line: 64 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            updating = true
        });
        local l_props_0 = v23.props;
        l_props_0.Analytics:report("TryUpdateAllPlugins");
        l_props_0.UpdateAllPlugins(l_props_0.Analytics);
        spawn(function() --[[ Line: 71 ]]
            -- upvalues: v23 (ref)
            if v23.mounted then
                v23.refreshPlugins();
                v23:setState({
                    updating = false
                });
            end;
        end);
    end;
    v23.findPlugins = function() --[[ Line: 81 ]]
        -- upvalues: v23 (copy), l_MemStorageService_0 (ref), v21 (ref)
        if v23:isPlaceOpen() then
            l_MemStorageService_0:Fire(v21.SHOW_TOOLBOX_PLUGINS_EVENT);
            return;
        else
            warn("findPlugins not supported when no place is open");
            return;
        end;
    end;
    v23.onCloseMoveDialog = function() --[[ Line: 90 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            showingMovedDialog = false
        });
    end;
    local v29 = l_StudioService_0.OnPluginInstalledFromToolbox:connect(v23.refreshPlugins);
    table.insert(v23.tokens, v29);
end;
v22.isPlaceOpen = function(v30) --[[ Line: 100 ]] --[[ Name: isPlaceOpen ]]
    return v30.props.Plugin:get().MultipleDocumentInterfaceInstance.FocusedDataModelSession;
end;
v22.didMount = function(v31) --[[ Line: 104 ]] --[[ Name: didMount ]]
    v31.mounted = true;
    v31.refreshPlugins();
end;
v22.willUnmount = function(v32) --[[ Line: 109 ]] --[[ Name: willUnmount ]]
    v32.mounted = false;
    for _, v34 in ipairs(v32.tokens) do
        v34:Disconnect();
    end;
    v32.tokens = {};
end;
v22.render = function(v35) --[[ Line: 117 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v9 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), v7 (copy), l_LoadingIndicator_0 (copy)
    local l_props_1 = v35.props;
    local l_state_0 = v35.state;
    local v38 = l_props_1.Plugin:get();
    local l_pluginList_0 = l_props_1.pluginList;
    local l_updating_0 = l_state_0.updating;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = v35.props.Stylizer;
    local v43 = v35.anyUpdateNeeded();
    local v44 = not v43 or l_updating_0;
    local v45 = l_pluginList_0 == nil;
    local v46 = not v45 and next(l_pluginList_0) ~= nil;
    local v47 = not v46 and not v45;
    local v48 = nil;
    local v49 = v35:isPlaceOpen();
    v48 = if v49 then l_Localization_0:getText("Main", "FindPluginsWithButtonMessage") else l_Localization_0:getText("Main", "FindPluginsMessage");
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor
    }, {
        PluginLabel = v5.createElement("TextLabel", {
            Size = UDim2.new(0, v9.HEADER_TITLE_WIDTH, 0, v9.HEADER_BUTTON_SIZE), 
            Position = UDim2.new(0, v9.HEADER_LEFT_PADDING, 0, v9.HEADER_TOP_PADDING), 
            Text = l_Localization_0:getText("Main", "Title"), 
            TextSize = 24, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSansSemibold, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left.Value
        }), 
        UpdateAllButton = v43 and v5.createElement(l_Button_0, {
            Size = UDim2.new(0, v9.HEADER_UPDATE_WIDTH, 0, v9.HEADER_BUTTON_SIZE), 
            Position = UDim2.new(1, v9.HEADER_RIGHT_PADDING * 2 - v9.HEADER_UPDATE_WIDTH - v9.HEADER_BUTTON_SIZE, 0, v9.HEADER_TOP_PADDING), 
            Style = "Round", 
            StyleModifier = v44 and l_StyleModifier_0.Disabled or nil, 
            OnClick = not v44 and v35.updateAllPlugins or function() --[[ Line: 169 ]]

            end
        }, {
            Label = v5.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_Localization_0:getText("Main", "UpdateAllButton"), 
                TextColor3 = v44 and l_Stylizer_0.DisabledColor or l_Stylizer_0.TextColor, 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundTransparency = 1
            })
        }), 
        FindPluginsButton = v49 and v5.createElement(l_Button_0, {
            Size = UDim2.new(0, v9.HEADER_BUTTON_SIZE, 0, v9.HEADER_BUTTON_SIZE), 
            Position = UDim2.new(1, v9.HEADER_RIGHT_PADDING, 0, v9.HEADER_TOP_PADDING), 
            AnchorPoint = Vector2.new(1, 0), 
            Style = "RoundPrimary", 
            BackgroundTransparency = 1, 
            OnClick = v35.findPlugins
        }, {
            Dots = v5.createElement("TextLabel", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "+", 
                TextColor3 = l_Stylizer_0.White, 
                Font = Enum.Font.SourceSansBold, 
                TextSize = 24, 
                BackgroundTransparency = 1
            })
        }) or nil, 
        NoPluginsMessage = v47 and v5.createElement("TextLabel", {
            Position = UDim2.new(0, v9.HEADER_LEFT_PADDING, 0, v9.HEADER_HEIGHT), 
            Size = UDim2.new(1, -v9.HEADER_LEFT_PADDING, 0, v9.HEADER_MESSAGE_LINE_HEIGHT), 
            Text = l_Localization_0:getText("Main", "NoPluginsMessage"), 
            TextSize = 17, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSans, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left.Value, 
            TextYAlignment = Enum.TextYAlignment.Top.Value
        }), 
        FindPluginsMessage = v47 and v5.createElement("TextLabel", {
            Position = UDim2.new(0, v9.HEADER_LEFT_PADDING, 0, v9.HEADER_HEIGHT + v9.HEADER_MESSAGE_LINE_HEIGHT), 
            Size = UDim2.new(1, -v9.HEADER_LEFT_PADDING, 0, v9.HEADER_MESSAGE_LINE_HEIGHT), 
            Text = v48, 
            TextSize = 17, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSans, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left.Value, 
            TextYAlignment = Enum.TextYAlignment.Top.Value
        }), 
        ScrollablePluginList = v46 and v5.createElement(v7, {
            position = UDim2.new(0, 0, 1, 0), 
            size = UDim2.new(1, 0, 1, -1 * v9.HEADER_HEIGHT), 
            anchorPoint = Vector2.new(0, 1), 
            plugin = v38, 
            pluginList = l_pluginList_0, 
            onPluginUninstalled = v35.refreshPlugins
        }), 
        Indicator = v45 and v5.createElement(l_LoadingIndicator_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.new(0, 92, 0, 24)
        })
    });
end;
v22 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    API = v15, 
    Analytics = l_ContextServices_0.Analytics
})(v22);
return v6.connect(function(v50, _) --[[ Line: 258 ]] --[[ Name: mapStateToProps ]]
    return {
        pluginList = v50.Management.plugins
    };
end, function(v52) --[[ Line: 264 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy), v17 (copy), l_MarketplaceService_0 (copy), v8 (copy), l_PermissionsService_0 (copy)
    return {
        UpdateAllPlugins = function(v53) --[[ Line: 266 ]] --[[ Name: UpdateAllPlugins ]]
            -- upvalues: v52 (copy), v16 (ref)
            v52(v16(v53));
        end, 
        dispatchRefreshPlugins = function(v54) --[[ Line: 270 ]] --[[ Name: dispatchRefreshPlugins ]]
            -- upvalues: v52 (copy), v17 (ref), l_MarketplaceService_0 (ref)
            v52(v17(v54, l_MarketplaceService_0));
        end, 
        getAllPluginPermissions = function(v55) --[[ Line: 274 ]] --[[ Name: getAllPluginPermissions ]]
            -- upvalues: v52 (copy), v8 (ref), l_PermissionsService_0 (ref)
            v52(v8(l_PermissionsService_0, v55));
        end
    };
end)(v22);