local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local _ = l_UI_0.TextLabel;
local l_Util_0 = v3.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v14 = require(l_Parent_0.Src.Components.AssetGridContainer);
local v15 = require(l_Parent_0.Src.Components.AssetPreviewWrapper);
local v16 = require(l_Parent_0.Src.Components.ExplorerOverlay);
local v17 = require(l_Parent_0.Src.Components.NavBar);
local v18 = require(l_Parent_0.Src.Components.RecentlyImportedView);
local v19 = require(l_Parent_0.Src.Components.TopBar);
local v20 = require(l_Parent_0.Src.Util.Screens);
local v21 = require(l_Parent_0.Src.Thunks.LoadAllAliases);
local v22 = require(l_Parent_0.Src.Thunks.GetUniverseConfiguration);
local v23 = require(l_Parent_0.Src.Thunks.OnScreenChange);
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v26 = v1.PureComponent:extend("MainView");
local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
local v28 = false;
local v29 = require(l_Parent_0.Src.Util.ModernIcons);
local function v37(v30, v31, v32, v33) --[[ Line: 51 ]] --[[ Name: createDefaultFileOverlayFolders ]]
    -- upvalues: v29 (copy)
    local v34 = v29.getIconForCurrentTheme(v29.IconEnums.BlankFolder);
    local l_Height_0 = v33.Height;
    local v36 = {
        text = v32:getText("Folders", v30.Path), 
        icon = {
            Image = v34, 
            Size = UDim2.new(0, l_Height_0, 0, l_Height_0), 
            ImageColor3 = v33.ColorIcon
        }, 
        Screen = v30.Path, 
        children = {}, 
        Parent = v31
    };
    if v31 then
        v31.children[v30.LayoutOrder] = v36;
    end;
end;
v26.init = function(v38) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v1 (copy), v15 (copy)
    v38.state = {
        currentScreen = "", 
        showAssetPreview = false, 
        showOverlay = false, 
        showConfirmRemovePlaceDialog = false, 
        fileExplorerData = {
            text = "Game 1", 
            Screen = v20.MAIN.Path, 
            children = {}
        }
    };
    v38.gamePublishedConnection = nil;
    v38.openConfirmRemovePlaceDialog = function() --[[ Line: 87 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showConfirmRemovePlaceDialog = true
        });
    end;
    v38.closeConfirmRemovePlaceDialog = function() --[[ Line: 93 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showConfirmRemovePlaceDialog = false
        });
    end;
    v38.openOverlay = function() --[[ Line: 99 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showOverlay = true
        });
    end;
    v38.closeOverlay = function() --[[ Line: 105 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showOverlay = false
        });
    end;
    v38.closeAssetPreview = function() --[[ Line: 111 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            showAssetPreview = false, 
            assetPreview = nil
        });
    end;
    v38.openAssetPreview = function(v39, v40) --[[ Line: 118 ]]
        -- upvalues: v1 (ref), v15 (ref), v38 (copy)
        if not v40 then
            return;
        elseif type(v40) == "table" then
            local v41 = v1.createElement(v15, {
                AssetPreviewData = v40, 
                OnAssetPreviewClose = v38.closeAssetPreview, 
                AssetData = v39
            });
            v38:setState({
                showAssetPreview = true, 
                assetPreview = v41
            });
            return;
        else
            local v42 = v38.props.Localization:getText("MainView", "AssetPreviewError");
            warn(v42);
            return;
        end;
    end;
end;
v26.didMount = function(v43) --[[ Line: 142 ]] --[[ Name: didMount ]]
    -- upvalues: l_StudioPublishService_0 (copy)
    if game.GameId ~= 0 then
        v43.props.dispatchGetUniverseConfiguration(v43.props.API:get());
    end;
    v43.gamePublishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function() --[[ Line: 147 ]]
        -- upvalues: v43 (copy)
        v43.props.dispatchGetUniverseConfiguration(v43.props.API:get());
    end);
end;
v26.willUnmount = function(v44) --[[ Line: 152 ]] --[[ Name: willUnmount ]]
    if v44.gamePublishedConnection then
        v44.gamePublishedConnection:disconnect();
    end;
end;
v26.didUpdate = function(v45) --[[ Line: 158 ]] --[[ Name: didUpdate ]]
    -- upvalues: v20 (copy), v37 (copy)
    local l_props_0 = v45.props;
    local l_Localization_0 = l_props_0.Localization;
    for _, v49 in pairs(v20) do
        if v49.Path ~= v20.MAIN.Path then
            v37(v49, v45.state.fileExplorerData, l_Localization_0, l_props_0.Stylizer.TreeViewItem);
        end;
    end;
    local v50 = l_props_0.API:get();
    local l_CurrentScreen_0 = l_props_0.CurrentScreen;
    if l_CurrentScreen_0 ~= v45.state.currentScreen then
        l_props_0.dispatchOnScreenChange(v50, l_CurrentScreen_0);
        v45:setState({
            currentScreen = l_CurrentScreen_0
        });
    end;
end;
v26.render = function(v52) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v28 (ref), l_GetTextSize_0 (copy), v1 (copy), l_Button_0 (copy), l_StudioPublishService_0 (copy), l_HoverArea_0 (copy), v16 (copy), v19 (copy), v17 (copy), l_StudioAssetManagerAddRecentlyImportedView_0 (copy), v14 (copy), v18 (copy), l_StyledDialog_0 (copy), l_MemStorageService_0 (copy)
    local l_props_1 = v52.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Localization_1 = l_props_1.Localization;
    local l_UniverseName_0 = l_props_1.UniverseName;
    local v57 = l_LayoutOrderIterator_0.new();
    v52.state.fileExplorerData.text = l_UniverseName_0;
    if l_UniverseName_0 ~= "" and not v28 then
        v28 = true;
    end;
    local v58 = game.GameId ~= 0;
    local v59 = l_Localization_1:getText("MainView", "SaveText");
    local v60 = l_GetTextSize_0(v59, l_Stylizer_0.FontSizeLarge, l_Stylizer_0.Font, Vector2.new(l_Stylizer_0.MainView.PublishText.Width, 1e999));
    local v61 = l_Localization_1:getText("MainView", "ButtonText");
    v61 = l_Localization_1:getText("MainView", "SaveToRobloxButtonText");
    local v62 = l_GetTextSize_0(v61, l_Stylizer_0.FontSizeLarge, l_Stylizer_0.Font);
    local l_RecentViewToggled_0 = l_props_1.RecentViewToggled;
    local l_RecentAssets_0 = l_props_1.RecentAssets;
    local v65 = next(l_RecentAssets_0) ~= nil;
    local v66 = l_Stylizer_0.TopBar.Height + l_Stylizer_0.NavBar.Height + (v65 and l_Stylizer_0.RecentView.Bar.Height or 0);
    local v67 = l_Stylizer_0.TopBar.Height + l_Stylizer_0.NavBar.Height;
    local v68 = not v52.state.showOverlay and not v52.state.showAssetPreview;
    local v69 = l_Localization_1:getText("MainView", "ConfirmText");
    local v70 = l_Localization_1:getText("MainView", "CancelText");
    local v71 = l_Localization_1:getText("MainView", "ConfirmRemovePlaceText");
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor
    }, {
        UseText = not v58 and v1.createElement("TextLabel", {
            Size = UDim2.new(0, v60.X, 0, v60.Y), 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.MainView.PublishText.Offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v57:getNextOrder(), 
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            Text = v59, 
            TextColor3 = l_Stylizer_0.TextColor, 
            TextSize = l_Stylizer_0.FontSizeLarge, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = true
        }), 
        PublishButton = not v58 and v1.createElement(l_Button_0, {
            Style = "RoundPrimary", 
            Text = v61, 
            Size = UDim2.new(0, v62.X + l_Stylizer_0.MainView.PublishButton.PaddingX, 0, v62.Y + l_Stylizer_0.MainView.PublishButton.PaddingY), 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.MainView.PublishButton.Offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v57:getNextOrder(), 
            OnClick = function() --[[ Line: 263 ]] --[[ Name: OnClick ]]
                -- upvalues: l_StudioPublishService_0 (ref)
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
            end
        }, {
            v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        MainViewLayout = v58 and v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        ExplorerOverlay = v58 and v52.state.showOverlay and v1.createElement(v16, {
            FileExplorerData = {
                v52.state.fileExplorerData
            }, 
            CloseOverlay = v52.closeOverlay
        }), 
        AssetPreview = v58 and v52.state.showAssetPreview and v52.state.assetPreview, 
        TopBar = v58 and v1.createElement(v19, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.TopBar.Button.Size), 
            LayoutOrder = v57:getNextOrder(), 
            OnOverlayActivated = v52.openOverlay, 
            Enabled = not v52.state.showOverlay
        }), 
        NavBar = v58 and v1.createElement(v17, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.NavBar.Height), 
            LayoutOrder = v57:getNextOrder()
        }), 
        AssetGridView = not l_StudioAssetManagerAddRecentlyImportedView_0 and v58 and v1.createElement(v14, {
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.TopBar.Button.Size - l_Stylizer_0.NavBar.Height), 
            LayoutOrder = v57:getNextOrder(), 
            OnOpenAssetPreview = v52.openAssetPreview, 
            OnAssetPreviewClose = v52.closeAssetPreview, 
            Enabled = v68
        }), 
        RecentsAssetGridView = l_StudioAssetManagerAddRecentlyImportedView_0 and v58 and not l_RecentViewToggled_0 and v1.createElement(v14, {
            Size = UDim2.new(1, 0, 1, -v66), 
            LayoutOrder = v57:getNextOrder(), 
            OnOpenAssetPreview = v52.openAssetPreview, 
            OnAssetPreviewClose = v52.closeAssetPreview, 
            OnOpenConfirmRemovePlaceDialog = v52.openConfirmRemovePlaceDialog, 
            Enabled = v68
        }), 
        RecentlyImportedView = l_StudioAssetManagerAddRecentlyImportedView_0 and v65 and v1.createElement(v18, {
            Size = UDim2.new(1, 0, l_RecentViewToggled_0 and 1 or 0, l_RecentViewToggled_0 and -v67 or l_Stylizer_0.RecentView.Bar.Height), 
            LayoutOrder = v57:getNextOrder(), 
            Enabled = not v52.state.showOverlay
        }), 
        ConfirmRemovePlaceDialog = v1.createElement(l_StyledDialog_0, {
            Style = "Alert", 
            Enabled = v52.state.showConfirmRemovePlaceDialog, 
            Title = "", 
            MinContentSize = l_Stylizer_0.MainView.ConfirmRemovePlaceDialogSize, 
            Buttons = {
                {
                    Key = "Confirm", 
                    Text = v69
                }, 
                {
                    Key = "Cancel", 
                    Text = v70
                }
            }, 
            OnButtonPressed = function(v72) --[[ Line: 342 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: l_MemStorageService_0 (ref), v52 (copy)
                if v72 == "Confirm" then
                    l_MemStorageService_0:Fire("RemovePlaceConfirmed");
                end;
                v52.closeConfirmRemovePlaceDialog();
            end, 
            OnClose = function() --[[ Line: 348 ]] --[[ Name: OnClose ]]
                -- upvalues: v52 (copy)
                v52.closeConfirmRemovePlaceDialog();
            end
        }, {
            Contents = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(0, 0), 
                Size = UDim2.fromScale(1, 1), 
                Font = l_Stylizer_0.Font, 
                Text = v71, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextSize = l_Stylizer_0.FontSizeLarge, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextWrapped = true
            })
        })
    });
end;
v26 = l_withContext_0({
    API = l_ContextServices_0.API, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v26);
return v2.connect(function(v73, _) --[[ Line: 374 ]] --[[ Name: mapStateToProps ]]
    local l_AssetManagerReducer_0 = v73.AssetManagerReducer;
    return {
        AssetsTable = l_AssetManagerReducer_0.assetsTable, 
        CurrentScreen = v73.Screen.currentScreen, 
        UniverseName = l_AssetManagerReducer_0.universeName, 
        RecentAssets = l_AssetManagerReducer_0.recentAssets, 
        RecentViewToggled = l_AssetManagerReducer_0.recentViewToggled
    };
end, function(v76) --[[ Line: 385 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v22 (copy), v23 (copy)
    return {
        dispatchLoadAllAliases = function(v77, v78) --[[ Line: 387 ]] --[[ Name: dispatchLoadAllAliases ]]
            -- upvalues: v76 (copy), v21 (ref)
            v76(v21(v77, v78));
        end, 
        dispatchGetUniverseConfiguration = function(v79) --[[ Line: 390 ]] --[[ Name: dispatchGetUniverseConfiguration ]]
            -- upvalues: v76 (copy), v22 (ref)
            v76(v22(v79));
        end, 
        dispatchOnScreenChange = function(v80, v81) --[[ Line: 393 ]] --[[ Name: dispatchOnScreenChange ]]
            -- upvalues: v76 (copy), v23 (ref)
            v76(v23(v80, v81));
        end
    };
end)(v26);