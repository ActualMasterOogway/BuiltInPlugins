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
local v11 = require(l_Parent_0.Src.Components.TextScraperToggle);
local v12 = require(l_Parent_0.Src.Util.EmbeddedTableUtil);
local v13 = v2.PureComponent:extend("TextScraperSection");
v13.init = function(v14) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy)
    v14.toggleTextScraperEnabled = function() --[[ Line: 25 ]]
        -- upvalues: v14 (copy), v12 (ref)
        local v15 = v14.props.Analytics:get();
        v12.toggleTextScraperEnabled(v15);
        v14:setState({});
    end;
end;
v13.render = function(v16) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_LocalizationService_0 (copy), v2 (copy), v11 (copy), l_TextLabel_0 (copy), l_Pane_0 (copy)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v21 = not l_props_0.IsBusy;
    local l_IsTextScraperRunning_0 = l_LocalizationService_0.IsTextScraperRunning;
    local v23 = l_IsTextScraperRunning_0 and l_Stylizer_0.TextCaptureButtonImage.On or l_Stylizer_0.TextCaptureButtonImage.Off;
    local v24 = {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop), 
            PaddingLeft = UDim.new(0, l_Stylizer_0.LeftIndent)
        }), 
        TextCapture = v2.createElement(v11, {
            Active = v21, 
            Enabled = l_IsTextScraperRunning_0, 
            ButtonText = "", 
            ButtonImage = v23, 
            LabelText = l_Localization_0:getText("TextScraperSection", "SectionDescription"), 
            LinkText = l_Localization_0:getText("TextScraperSection", "LearnMore"), 
            LayoutOrder = 1, 
            OnButtonClick = v16.toggleTextScraperEnabled, 
            Link = "https://create.roblox.com/docs/production/localization/automatic-translations"
        })
    };
    local v25 = {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_0.PaddingTop * 2)
        }), 
        SectionLabel = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Text = l_Localization_0:getText("TextScraperSection", "AutomaticTextCapture"), 
            Style = "Subtitle"
        }), 
        Container = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        }, v24)
    };
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0
    }, v25);
end;
local function v28(v26, _) --[[ Line: 89 ]] --[[ Name: mapStateToProps ]]
    return {
        IsBusy = v26.CloudTable.IsBusy
    };
end;
v13 = l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Analytics = v10
})(v13);
return v3.connect(v28)(v13);