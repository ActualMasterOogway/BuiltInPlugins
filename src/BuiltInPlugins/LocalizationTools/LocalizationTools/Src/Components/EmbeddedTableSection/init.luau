local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v10 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v11 = require(l_Parent_0.Src.Components.LabeledImageButton);
local v12 = require(l_Parent_0.Src.Util.EmbeddedTableUtil);
local v13 = require(l_Parent_0.Src.Components.LabeledTextButton);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLocalizedLocalizationToolsErrorsApi");
local l_LocalizationToolsUpdateTextScraperUI_0 = game:GetFastFlag("LocalizationToolsUpdateTextScraperUI");
local v16 = v2.PureComponent:extend("EmbeddedTableSection");
v16.init = function(v17) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy)
    v17.toggleTextScraperEnabled = function() --[[ Line: 29 ]]
        -- upvalues: v17 (copy), v12 (ref)
        local v18 = v17.props.Analytics:get();
        v12.toggleTextScraperEnabled(v18);
        v17:setState({});
    end;
end;
v16.render = function(v19) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: l_LocalizationService_0 (copy), v2 (copy), l_LocalizationToolsUpdateTextScraperUI_0 (copy), v11 (copy), v13 (copy), v12 (copy), l_game_EngineFeature_0 (copy), l_TextLabel_0 (copy), l_Pane_0 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v23 = l_props_0.Analytics:get();
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v25 = not l_props_0.IsBusy;
    local l_IsTextScraperRunning_0 = l_LocalizationService_0.IsTextScraperRunning;
    local v27 = l_IsTextScraperRunning_0 and l_Stylizer_0.TextCaptureButtonImage.On or l_Stylizer_0.TextCaptureButtonImage.Off;
    local v28 = l_IsTextScraperRunning_0 and l_Localization_0:getText("EmbeddedTableSection", "TextCaptureStopText") or l_Localization_0:getText("EmbeddedTableSection", "TextCaptureStartText");
    local v29 = {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop), 
            PaddingLeft = UDim.new(0, l_Stylizer_0.LeftIndent)
        }), 
        TextCapture = if l_LocalizationToolsUpdateTextScraperUI_0 then nil else v2.createElement(v11, {
            Active = v25, 
            ButtonText = l_Localization_0:getText("EmbeddedTableSection", "TextCaptureButton"), 
            ButtonImage = v27, 
            LabelText = v28, 
            LayoutOrder = 1, 
            OnButtonClick = v19.toggleTextScraperEnabled
        }), 
        Export = if l_LocalizationToolsUpdateTextScraperUI_0 then v2.createElement(v13, {
            Active = v25, 
            ButtonText = l_Localization_0:getText("EmbeddedTableSection", "ExportButton"), 
            LabelText = l_Localization_0:getText("EmbeddedTableSection", "ExportTextLabel"), 
            LayoutOrder = 2, 
            OnButtonClick = function() --[[ Line: 74 ]] --[[ Name: OnButtonClick ]]
                -- upvalues: v12 (ref), v23 (copy)
                v12.promptExportToCSVs(v23);
            end
        }) else v2.createElement(v11, {
            Active = v25, 
            ButtonText = l_Localization_0:getText("EmbeddedTableSection", "ExportButton"), 
            ButtonImage = l_Stylizer_0.ExportButtonImage, 
            LabelText = l_Localization_0:getText("EmbeddedTableSection", "ExportTextLabel"), 
            LayoutOrder = 2, 
            OnButtonClick = function() --[[ Line: 84 ]] --[[ Name: OnButtonClick ]]
                -- upvalues: v12 (ref), v23 (copy)
                v12.promptExportToCSVs(v23);
            end
        }), 
        Import = if l_LocalizationToolsUpdateTextScraperUI_0 then v2.createElement(v13, {
            Active = v25, 
            ButtonText = l_Localization_0:getText("EmbeddedTableSection", "ImportButton"), 
            LabelText = l_Localization_0:getText("EmbeddedTableSection", "ImportTextLabel"), 
            LayoutOrder = 3, 
            OnButtonClick = function() --[[ Line: 94 ]] --[[ Name: OnButtonClick ]]
                -- upvalues: l_game_EngineFeature_0 (ref), v12 (ref), v23 (copy), l_Localization_0 (copy)
                if l_game_EngineFeature_0 then
                    v12.promptImportFromCSVs(v23, l_Localization_0);
                    return;
                else
                    v12.promptImportFromCSVs_deprecated(v23);
                    return;
                end;
            end
        }) else v2.createElement(v11, {
            Active = v25, 
            ButtonText = l_Localization_0:getText("EmbeddedTableSection", "ImportButton"), 
            ButtonImage = l_Stylizer_0.ImportButtonImage, 
            LabelText = l_Localization_0:getText("EmbeddedTableSection", "ImportTextLabel"), 
            LayoutOrder = 3, 
            OnButtonClick = function() --[[ Line: 108 ]] --[[ Name: OnButtonClick ]]
                -- upvalues: l_game_EngineFeature_0 (ref), v12 (ref), v23 (copy), l_Localization_0 (copy)
                if l_game_EngineFeature_0 then
                    v12.promptImportFromCSVs(v23, l_Localization_0);
                    return;
                else
                    v12.promptImportFromCSVs_deprecated(v23);
                    return;
                end;
            end
        })
    };
    local v30 = {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop * 2)
        }), 
        SectionLabel = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = l_Localization_0:getText("EmbeddedTableSection", "SectionLabel"), 
            Style = "Subtitle"
        }), 
        Container = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        }, v29)
    };
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0
    }, v30);
end;
local function v33(v31, _) --[[ Line: 144 ]] --[[ Name: mapStateToProps ]]
    return {
        IsBusy = v31.CloudTable.IsBusy
    };
end;
v16 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = v10
})(v16);
return v3.connect(v33)(v16);