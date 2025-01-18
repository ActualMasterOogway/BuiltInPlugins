local l_EnableStudioServiceOpenBrowser_0 = game:GetFastFlag("EnableStudioServiceOpenBrowser");
local l_StudioService_0 = game:GetService("StudioService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_PluginPolicyService_0 = game:GetService("PluginPolicyService");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Packages.Roact);
local v9 = require(l_Parent_0.Packages.RoactRodux);
local v10 = require(l_Parent_0.Src.Util.Constants);
local v11 = require(l_Parent_0.Src.Util.UpdateStatus);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v14 = require(l_Parent_0.Src.ContextServices.PluginAPI2);
local v15 = require(l_Parent_0.Src.ContextServices.Navigation);
local v16 = require(l_Parent_0.Src.Thunks.SetPluginEnabledState);
local v17 = require(l_Parent_0.Src.Thunks.UpdatePlugin);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_FakeLoadingBar_0 = l_UI_0.FakeLoadingBar;
local v24 = require(l_Parent_0.Src.Actions.RemovePluginData);
local v25 = require(l_Parent_0.Src.Components.HttpRequestOverview);
local v26 = require(l_Parent_0.Src.Components.UpdateOverview);
local v27 = UDim2.new(0, 120, 0, 8);
local function _(v28, v29, v30, v31) --[[ Line: 39 ]] --[[ Name: getTextHeight ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(v28, v29, v30, Vector2.new(v31, 10000)).Y;
end;
local l_Y_0 = l_TextService_0:GetTextSize("a", 16, Enum.Font.SourceSans, Vector2.new(9999, 10000)).Y;
local v34 = v8.Component:extend("PluginEntry");
v34.init = function(v35) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: l_ContentProvider_0 (copy), l_PluginPolicyService_0 (copy), l_HttpService_0 (copy), l_EnableStudioServiceOpenBrowser_0 (copy), l_StudioService_0 (copy), l_GuiService_0 (copy), v10 (copy)
    v35.state = {
        showSuccessMessage = false, 
        showMore = false
    };
    v35.getMoreItems = function() --[[ Line: 53 ]]
        -- upvalues: v35 (copy)
        local l_Localization_0 = v35.props.Localization;
        return {
            {
                Key = "Details", 
                Text = l_Localization_0:getText("EntrySeeMore", "DetailsButton")
            }, 
            {
                Key = "Remove", 
                Text = l_Localization_0:getText("EntrySeeMore", "RemoveButton")
            }
        };
    end;
    v35.onPluginEnabled = function() --[[ Line: 62 ]]
        -- upvalues: v35 (copy)
        local l_props_0 = v35.props;
        l_props_0.onPluginSetEnabledState(l_props_0.data, true);
    end;
    v35.onPluginDisabled = function() --[[ Line: 67 ]]
        -- upvalues: v35 (copy)
        local l_props_1 = v35.props;
        v35.props.onPluginSetEnabledState(l_props_1.data, false);
    end;
    v35.showDetails = function() --[[ Line: 72 ]]
        -- upvalues: v35 (copy), l_ContentProvider_0 (ref), l_PluginPolicyService_0 (ref), l_HttpService_0 (ref), l_EnableStudioServiceOpenBrowser_0 (ref), l_StudioService_0 (ref), l_GuiService_0 (ref)
        local l_assetId_0 = v35.props.data.assetId;
        local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
        local l_CreatorMarketplaceWebUrl_0 = l_PluginPolicyService_0:getPluginPolicy("Toolbox").CreatorMarketplaceWebUrl;
        local v42 = if l_CreatorMarketplaceWebUrl_0 then string.format("%sasset/%s", l_CreatorMarketplaceWebUrl_0, l_HttpService_0:urlEncode(l_assetId_0)) else string.format("%s/library/%s/asset", l_BaseUrl_0, l_HttpService_0:urlEncode(l_assetId_0));
        if l_EnableStudioServiceOpenBrowser_0 then
            l_StudioService_0:OpenInBrowser_DONOTUSE(v42);
            return;
        else
            l_GuiService_0:OpenBrowserWindow(v42);
            return;
        end;
    end;
    v35.uninstallPlugin = function() --[[ Line: 88 ]]
        -- upvalues: v35 (copy), l_StudioService_0 (ref)
        v35.props.removePluginData(v35.props.data.assetId);
        l_StudioService_0:UninstallPlugin(v35.props.data.assetId);
        wait();
        v35.props.onPluginUninstalled();
    end;
    v35.onShowMoreActivated = function() --[[ Line: 95 ]]
        -- upvalues: v35 (copy)
        v35:setState({
            showMore = true
        });
    end;
    v35.hideShowMore = function() --[[ Line: 101 ]]
        -- upvalues: v35 (copy)
        v35:setState({
            showMore = false
        });
    end;
    v35.moreItemClicked = function(v43) --[[ Line: 107 ]]
        -- upvalues: v35 (copy)
        v35.hideShowMore();
        if v43.Key == "Details" then
            v35.showDetails();
            return;
        else
            if v43.Key == "Remove" then
                v35.uninstallPlugin();
            end;
            return;
        end;
    end;
    v35.updatePlugin = function() --[[ Line: 117 ]]
        -- upvalues: v35 (copy)
        local l_props_2 = v35.props;
        l_props_2.Analytics:report("TryUpdatePlugin", l_props_2.data.assetId);
        l_props_2.UpdatePlugin(l_props_2.data, l_props_2.Analytics);
    end;
    v35.openCreatorProfile = function() --[[ Line: 123 ]]
        -- upvalues: v35 (copy), l_ContentProvider_0 (ref), l_HttpService_0 (ref), l_EnableStudioServiceOpenBrowser_0 (ref), l_StudioService_0 (ref), l_GuiService_0 (ref)
        local l_data_0 = v35.props.data;
        local v46 = l_data_0.creator and l_data_0.creator.Id;
        local l_BaseUrl_1 = l_ContentProvider_0.BaseUrl;
        local v48 = string.format("%susers/%d/profile", l_BaseUrl_1, l_HttpService_0:urlEncode(v46));
        if l_EnableStudioServiceOpenBrowser_0 then
            l_StudioService_0:OpenInBrowser_DONOTUSE(v48);
            return;
        else
            l_GuiService_0:OpenBrowserWindow(v48);
            return;
        end;
    end;
    v35.openPluginDetails = function() --[[ Line: 135 ]]
        -- upvalues: v35 (copy), v10 (ref)
        v35.props.Navigation:get().navigation.navigate({
            routeName = v10.APP_PAGE.Detail, 
            params = {
                assetId = v35.props.data.assetId
            }
        });
    end;
    v35.onToggleClick = function() --[[ Line: 143 ]]
        -- upvalues: v35 (copy)
        local l_data_1 = v35.props.data;
        local l_isModerated_0 = l_data_1.isModerated;
        if not l_isModerated_0 and l_data_1.enabled then
            v35.onPluginDisabled();
            return;
        else
            if not l_isModerated_0 then
                v35.onPluginEnabled();
            end;
            return;
        end;
    end;
end;
v34.getDerivedStateFromProps = function(v51, _) --[[ Line: 156 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v11 (copy)
    if v51.data.status == v11.Success then
        return {
            showSuccessMessage = true
        };
    elseif not v51.isUpdated then
        return {
            showSuccessMessage = false
        };
    else
        return nil;
    end;
end;
v34.render = function(v53) --[[ Line: 172 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v10 (copy), v8 (copy), l_Y_0 (copy), v25 (copy), v26 (copy), l_Button_0 (copy), l_FakeLoadingBar_0 (copy), v27 (copy), l_ToggleButton_0 (copy), l_DropdownMenu_0 (copy), l_TextLabel_0 (copy)
    local l_props_3 = v53.props;
    local l_state_0 = v53.state;
    local l_data_2 = l_props_3.data;
    local l_allowedHttpCount_0 = l_props_3.allowedHttpCount;
    local l_deniedHttpCount_0 = l_props_3.deniedHttpCount;
    local l_allowedScriptInjection_0 = l_props_3.allowedScriptInjection;
    local l_showMore_0 = l_state_0.showMore;
    local l_plugin_0 = l_props_3.plugin;
    local l_Localization_1 = l_props_3.Localization;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local v64 = l_props_3.API:get();
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_isUpdated_0 = l_props_3.isUpdated;
    local l_isModerated_1 = l_data_2.isModerated;
    local l_status_0 = l_data_2.status;
    local l_assetId_1 = l_data_2.assetId;
    local v70 = not l_isModerated_1 and l_data_2.enabled;
    local v71 = l_data_2.name or "";
    local v72 = l_data_2.description or "";
    local v73 = l_data_2.creator and l_data_2.creator.Name or "";
    local v74 = v64.Images.AssetThumbnailUrl(l_assetId_1);
    local v75 = not l_isModerated_1 and not l_isUpdated_0 and l_status_0 ~= v11.Updating;
    local v76 = UDim2.new(1, v10.PLUGIN_HORIZONTAL_PADDING * -3 - v10.PLUGIN_ENABLE_WIDTH - v10.PLUGIN_CONTEXT_WIDTH, 0.5, 0);
    local v77 = true;
    if l_allowedHttpCount_0 <= 0 then
        v77 = l_deniedHttpCount_0 > 0;
    end;
    local v78 = l_allowedScriptInjection_0 ~= nil;
    local _ = v77 or v78;
    local l_createElement_0 = v8.createElement;
    local v81 = "Frame";
    local v82 = {
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, v10.SCROLLBAR_WIDTH_ADJUSTMENT, 0, v10.PLUGIN_ENTRY_HEIGHT)
    };
    local v83 = {
        Padding = v8.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v10.PLUGIN_ENTRY_PADDING), 
            PaddingBottom = UDim.new(0, v10.PLUGIN_ENTRY_PADDING)
        }), 
        Thumbnail = v8.createElement("ImageLabel", {
            Size = UDim2.new(0, v10.THUMBNAIL_SIZE, 0, v10.THUMBNAIL_SIZE), 
            Position = UDim2.new(0, v10.PLUGIN_HORIZONTAL_PADDING, 0, v10.PLUGIN_VERTICAL_PADDING), 
            Image = v74, 
            BackgroundTransparency = 1
        }), 
        Contents = v8.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v10.THUMBNAIL_SIZE + v10.PLUGIN_HORIZONTAL_PADDING * 2, 0, 0), 
            Size = UDim2.new(0.5, -v10.THUMBNAIL_SIZE - v10.PLUGIN_HORIZONTAL_PADDING, 1, 0)
        }, {
            Layout = v8.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 2)
            }), 
            Name = v8.createElement("TextLabel", {
                LayoutOrder = 0, 
                TextWrapped = true, 
                TextSize = 22, 
                Size = UDim2.new(1, 0, 0, 20), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v71, 
                TextColor3 = l_Stylizer_0.EmphasisTextColor, 
                Font = Enum.Font.SourceSans
            }), 
            Creator = v8.createElement("TextButton", {
                LayoutOrder = 1, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 16), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v73, 
                Font = Enum.Font.SourceSansLight, 
                TextColor3 = l_Stylizer_0.LinkColor, 
                TextSize = 16, 
                BorderSizePixel = 1, 
                [v8.Event.Activated] = v53.openCreatorProfile
            }), 
            Description = v8.createElement("TextLabel", {
                ClipsDescendants = true, 
                LayoutOrder = 2, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, l_Y_0 * 2), 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v72, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Font = Enum.Font.SourceSans, 
                TextSize = 16
            }), 
            HttpRequestOverview = v8.createElement(v25, {
                assetId = l_data_2.assetId, 
                LayoutOrder = 3
            }), 
            UpdateOverview = v8.createElement(v26, {
                data = l_data_2, 
                LayoutOrder = 4, 
                plugin = l_plugin_0, 
                updateAvailable = v75
            })
        }), 
        ModeratedWarning = l_isModerated_1 and v8.createElement("TextLabel", {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, v10.MODERATED_WARNING_WIDTH, 0, v10.HEADER_BUTTON_SIZE), 
            Position = v76, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = 14, 
            TextWrapped = true, 
            Font = Enum.Font.SourceSans, 
            TextColor3 = l_Stylizer_0.TextColor, 
            Text = l_Localization_1:getText("Entry", "ModeratedWarning")
        })
    };
    local l_v75_0 = v75;
    if l_v75_0 then
        l_v75_0 = v8.createElement;
        local l_l_Button_0_0 = l_Button_0;
        local v86 = {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, v10.HEADER_UPDATE_WIDTH, 0, v10.HEADER_BUTTON_SIZE), 
            Position = v76, 
            Style = "Round", 
            OnClick = v53.updatePlugin
        };
        local v87 = {
            Label = v8.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_Localization_1:getText("Entry", "UpdateButton"), 
                TextColor3 = l_Stylizer_0.TextColor, 
                Font = Enum.Font.SourceSans, 
                TextSize = 18, 
                BackgroundTransparency = 1
            })
        };
        local v88 = false;
        if l_status_0 ~= v11.Error then
            v88 = v8.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 14), 
                Position = UDim2.new(0, 0, 1, 3), 
                TextSize = 14, 
                Font = Enum.Font.SourceSans, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextTransparency = 0, 
                Text = l_Localization_1:getText("Entry", "LastUpdatedDate", {
                    date = l_data_2.updated
                })
            });
        end;
        v87.DateLabel = v88;
        v88 = false;
        if l_status_0 == v11.Error then
            v88 = v8.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 14), 
                Position = UDim2.new(0, 0, 1, 3), 
                TextSize = 14, 
                Font = Enum.Font.SourceSans, 
                TextColor3 = l_Stylizer_0.ErrorColor, 
                Text = l_Localization_1:getText("Entry", "UpdateError")
            });
        end;
        v87.ErrorLabel = v88;
        l_v75_0 = l_v75_0(l_l_Button_0_0, v86, v87);
    end;
    v83.UpdateButton = l_v75_0;
    v83.ProgressIndicator = not l_isUpdated_0 and l_status_0 == v11.Updating and v8.createElement(l_FakeLoadingBar_0, {
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = v76, 
        Size = v27, 
        LoadingTime = 0.5
    });
    v83.SuccessLabel = l_isUpdated_0 and l_state_0.showSuccessMessage and v8.createElement("TextLabel", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 14), 
        AnchorPoint = Vector2.new(1, 0.5), 
        Position = v76, 
        TextSize = 14, 
        Font = Enum.Font.SourceSans, 
        TextColor3 = l_Stylizer_0.Green, 
        TextXAlignment = Enum.TextXAlignment.Right, 
        Text = l_Localization_1:getText("Entry", "UpdateSuccess")
    });
    v83.ToggleButton = v8.createElement(l_ToggleButton_0, {
        Disabled = false, 
        Selected = v70, 
        OnClick = v53.onToggleClick, 
        Size = UDim2.new(0, v10.PLUGIN_ENABLE_WIDTH, 0, 24), 
        Position = UDim2.new(1, v10.PLUGIN_HORIZONTAL_PADDING * -2 - v10.PLUGIN_ENABLE_WIDTH - v10.PLUGIN_CONTEXT_WIDTH, 0.5, 0)
    });
    v83.ShowMoreButton = v8.createElement(l_Button_0, {
        AnchorPoint = Vector2.new(0, 0.5), 
        Size = UDim2.new(0, v10.HEADER_BUTTON_SIZE, 0, v10.HEADER_BUTTON_SIZE), 
        Position = UDim2.new(1, -1 * (v10.PLUGIN_HORIZONTAL_PADDING + v10.PLUGIN_CONTEXT_WIDTH), 0.5, 0), 
        Style = "Round", 
        OnClick = v53.onShowMoreActivated
    }, {
        Dots = v8.createElement("TextLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, -4), 
            Size = UDim2.new(0, 16, 0, 16), 
            Text = "...", 
            TextColor3 = l_Stylizer_0.TextColor, 
            Font = Enum.Font.SourceSansBold, 
            TextSize = 18, 
            BackgroundTransparency = 1
        }), 
        Dropdown = v8.createElement(l_DropdownMenu_0, {
            Hide = not l_showMore_0, 
            Size = UDim2.fromOffset(90, 40 * #v53.getMoreItems()), 
            Items = v53.getMoreItems(), 
            OnRenderItem = function(v89, v90, v91) --[[ Line: 416 ]] --[[ Name: OnRenderItem ]]
                -- upvalues: v8 (ref), l_Button_0 (ref), l_TextLabel_0 (ref)
                return v8.createElement(l_Button_0, {
                    Size = UDim2.new(1, 0, 0, 40), 
                    LayoutOrder = v90, 
                    OnClick = v91
                }, {
                    Label = v8.createElement(l_TextLabel_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        TextSize = 18, 
                        Text = v89.Text, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Padding = v8.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10)
                        })
                    })
                });
            end, 
            OnItemActivated = v53.moreItemClicked, 
            OnFocusLost = v53.hideShowMore
        })
    });
    return l_createElement_0(v81, v82, v83);
end;
v34 = l_withContext_0({
    Navigation = v15, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    API = v14, 
    Analytics = l_ContextServices_0.Analytics
})(v34);
return v9.connect(function(v92, v93) --[[ Line: 449 ]]
    local v94 = v92.PluginPermissions[v93.data.assetId];
    return {
        allowedHttpCount = v94 and v94.allowedHttpCount or 0, 
        deniedHttpCount = v94 and v94.deniedHttpCount or 0, 
        allowedScriptInjection = v94 and v94.allowedScriptInjection or nil
    };
end, function(v95) --[[ Line: 458 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v24 (copy), v16 (copy), v17 (copy)
    return {
        removePluginData = function(v96) --[[ Line: 460 ]] --[[ Name: removePluginData ]]
            -- upvalues: v95 (copy), v24 (ref)
            v95(v24(v96));
        end, 
        onPluginSetEnabledState = function(v97, v98) --[[ Line: 464 ]] --[[ Name: onPluginSetEnabledState ]]
            -- upvalues: v95 (copy), v16 (ref)
            v95(v16(v97, v98));
        end, 
        UpdatePlugin = function(v99, v100) --[[ Line: 468 ]] --[[ Name: UpdatePlugin ]]
            -- upvalues: v95 (copy), v17 (ref)
            v95(v17(v99, v100));
        end
    };
end)(v34);