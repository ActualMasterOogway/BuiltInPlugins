local v0 = game:DefineFastFlag("LocalizationToolsFixCloudLabel", false);
local l_LocalizationToolsUpdateTextScraperUI_0 = game:GetFastFlag("LocalizationToolsUpdateTextScraperUI");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v13 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v14 = require(l_Parent_0.Src.Components.LabeledTextButton);
local v15 = require(l_Parent_0.Src.Components.Collapsible);
local v16 = require(l_Parent_0.Src.Util.isEmpty);
local v17 = require(l_Parent_0.Src.Util.ShowDialog);
local v18 = require(l_Parent_0.Src.Thunks.DownloadCloudTable);
local v19 = require(l_Parent_0.Src.Thunks.UploadCloudTable);
local v20 = v4.PureComponent:extend("CloudTableSection");
v20.init = function(v21) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), l_GuiService_0 (copy)
    v21.downloadCloudTable = function() --[[ Line: 34 ]]
        -- upvalues: v21 (copy)
        local l_props_0 = v21.props;
        local v23 = l_props_0.API:get();
        local l_Localization_0 = l_props_0.Localization;
        local v25 = l_props_0.Analytics:get();
        local l_CloudTableId_0 = l_props_0.CloudTableId;
        l_props_0.DownloadAndSaveCloudTable(v23, l_Localization_0, v25, l_CloudTableId_0);
    end;
    v21.updateCloudTable = function(v27) --[[ Line: 44 ]]
        -- upvalues: v21 (copy), v17 (ref)
        local l_props_1 = v21.props;
        local v29 = l_props_1.Plugin:get();
        local v30 = l_props_1.API:get();
        local l_Localization_1 = l_props_1.Localization;
        local v32 = l_props_1.Analytics:get();
        local l_Mouse_0 = l_props_1.Mouse;
        local l_Stylizer_0 = l_props_1.Stylizer;
        local v35 = v17(v29, l_Localization_1, l_Stylizer_0, l_Mouse_0);
        l_props_1.UpdateCloudTable(v30, l_Localization_1, v32, v35, v27);
    end;
    v21.openLocalizationSettings = function() --[[ Line: 58 ]]
        -- upvalues: v21 (copy), l_GuiService_0 (ref)
        local l_props_2 = v21.props;
        if l_props_2.IsBusy then
            return;
        else
            local v37 = l_props_2.API:get().WWW.Localization.games(game.GameId):getUrl();
            l_GuiService_0:OpenBrowserWindow(v37);
            return;
        end;
    end;
end;
v20.render = function(v38) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v4 (copy), l_LocalizationToolsUpdateTextScraperUI_0 (copy), v14 (copy), v15 (copy), l_LinkText_0 (copy), l_Pane_0 (copy), v0 (copy), l_TextLabel_0 (copy)
    local l_props_3 = v38.props;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local l_Localization_2 = l_props_3.Localization;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local v43 = not l_props_3.IsBusy;
    local v44 = not v16(l_props_3.AllLanguages) and not v16(l_props_3.LocalesToLanguages) and l_props_3.CanManageTranslation and l_props_3.CloudTableId ~= "";
    local v45 = nil;
    if v44 then
        local v46 = {
            Padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, if l_LocalizationToolsUpdateTextScraperUI_0 then l_Stylizer_1.SectionPadding else l_Stylizer_1.PaddingTop), 
                PaddingLeft = UDim.new(0, if l_LocalizationToolsUpdateTextScraperUI_0 then l_Stylizer_1.SectionPadding else l_Stylizer_1.LeftIndent)
            }), 
            Download = v4.createElement(v14, {
                Active = v43, 
                ButtonText = l_Localization_2:getText("CloudTableSection", "DownloadButton"), 
                LabelText = l_Localization_2:getText("CloudTableSection", "DownloadTableLabel"), 
                LayoutOrder = 1, 
                OnButtonClick = v38.downloadCloudTable
            }), 
            Update = v4.createElement(v14, {
                Active = v43, 
                ButtonText = l_Localization_2:getText("CloudTableSection", "UpdateButton"), 
                LabelText = l_Localization_2:getText("CloudTableSection", "UpdateTableLabel"), 
                LayoutOrder = 2, 
                OnButtonClick = function() --[[ Line: 107 ]] --[[ Name: OnButtonClick ]]
                    -- upvalues: v38 (copy)
                    v38.updateCloudTable(false);
                end
            }), 
            Collapsible = v4.createElement(v15, {
                Active = v43, 
                LayoutOrder = 3, 
                RenderContent = function() --[[ Line: 114 ]] --[[ Name: RenderContent ]]
                    -- upvalues: v4 (ref), v14 (ref), v43 (copy), l_Localization_2 (copy), v38 (copy)
                    return v4.createElement(v14, {
                        Active = v43, 
                        ButtonText = l_Localization_2:getText("CloudTableSection", "ReplaceButton"), 
                        LabelText = l_Localization_2:getText("CloudTableSection", "ReplaceTableLabel"), 
                        LayoutOrder = 2, 
                        OnButtonClick = function() --[[ Line: 120 ]] --[[ Name: OnButtonClick ]]
                            -- upvalues: v38 (ref)
                            v38.updateCloudTable(true);
                        end
                    });
                end, 
                Title = l_Localization_2:getText("CloudTableSection", "AdvancedButton")
            }), 
            LinkTextFrame = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 4, 
                Size = UDim2.new(1, 0, 0, l_Stylizer_1.LinkTextHeight)
            }, {
                LinkText = v4.createElement(l_LinkText_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    OnClick = v38.openLocalizationSettings, 
                    Text = l_Localization_2:getText("CloudTableSection", "CloudTablePageLinkText")
                })
            })
        };
        v45 = v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        }, v46);
    else
        v45 = v4.createElement(if v0 then l_Pane_0 else "Frame", {
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.PublishMessageHeight), 
            BackgroundColor3 = l_Stylizer_1.MessageFrameBackground, 
            BackgroundTransparency = 0, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Stylizer_1.MessageFrameBorder, 
            LayoutOrder = 2, 
            Layout = if v0 then Enum.FillDirection.Vertical else nil
        }, {
            PublishPlaceMessage = v4.createElement(l_TextLabel_0, {
                AnchorPoint = if v0 then nil else Vector2.new(0.5, 0.5), 
                AutomaticSize = if v0 then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY, 
                Position = if v0 then nil else UDim2.new(0.5, 0, 0.5, 0), 
                Size = if v0 then UDim2.fromScale(1, 0) else nil, 
                Text = l_Localization_2:getText("CloudTableSection", "PublishPlaceMessage"), 
                TextWrapped = v0 and true or nil
            })
        });
    end;
    local v47 = {
        Padding = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_1.PaddingTop)
        }), 
        SectionLabel = v4.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Style = "Subtitle", 
            Text = l_Localization_2:getText("CloudTableSection", "SectionLabel")
        }), 
        Content = v45
    };
    return v4.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0
    }, v47);
end;
v20 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API, 
    Mouse = l_ContextServices_0.Mouse, 
    Analytics = v13
})(v20);
return v5.connect(function(v48, _) --[[ Line: 200 ]] --[[ Name: mapStateToProps ]]
    return {
        AllLanguages = v48.PluginMetadata.AllLanguages, 
        LocalesToLanguages = v48.PluginMetadata.LocalesToLanguages, 
        CanManageTranslation = v48.PluginMetadata.CanManageTranslation, 
        CloudTableId = v48.PluginMetadata.CloudTableId, 
        IsBusy = v48.CloudTable.IsBusy
    };
end, function(v50) --[[ Line: 210 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v19 (copy)
    return {
        DownloadAndSaveCloudTable = function(v51, v52, v53, v54) --[[ Line: 212 ]] --[[ Name: DownloadAndSaveCloudTable ]]
            -- upvalues: v50 (copy), v18 (ref)
            v50(v18.DownloadAndSave(v51, v52, v53, v54));
        end, 
        UpdateCloudTable = function(v55, v56, v57, v58, v59) --[[ Line: 215 ]] --[[ Name: UpdateCloudTable ]]
            -- upvalues: v50 (copy), v19 (ref)
            v50(v19(v55, v56, v57, v58, v59));
        end
    };
end)(v20);