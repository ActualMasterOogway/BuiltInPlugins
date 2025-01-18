local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetShowParsingWidget);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportDialogButtonsAndStyling);
local v15 = v1.PureComponent:extend("ParseWidget");
v15.init = function(v16) --[[ Line: 25 ]] --[[ Name: init ]]
    v16.onClose = function() --[[ Line: 26 ]]
        -- upvalues: v16 (copy)
        v16.props.SetShowParsingWidget(false);
    end;
    v16.onButtonPressed = function(v17) --[[ Line: 30 ]]
        -- upvalues: v16 (copy)
        if v17 == "Close" then
            v16.onClose();
        end;
    end;
end;
v15.render = function(v18) --[[ Line: 37 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_StyledDialog_0 (copy), v14 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_LoadingIndicator_0 (copy)
    local l_props_0 = v18.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_ParseWidget_0 = l_props_0.Stylizer.ParseWidget;
    return v1.createElement(l_StyledDialog_0, {
        Enabled = l_props_0.ShowParsingWidget, 
        MinContentSize = Vector2.new(l_ParseWidget_0.Width, l_ParseWidget_0.Height), 
        Modal = false, 
        Resizable = true, 
        Title = l_props_0.Title, 
        Buttons = {}, 
        OnClose = v18.onClose, 
        OnButtonPressed = v18.onButtonPressed, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Style = v14() and "ImportDialog" or nil
    }, {
        Content = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = if v14() then Enum.VerticalAlignment.Center else nil, 
            HorizontalAlignment = if v14() then Enum.HorizontalAlignment.Center else nil, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            TextPane = v1.createElement(l_Pane_0, {
                AutomaticSize = if v14() then Enum.AutomaticSize.Y else nil, 
                LayoutOrder = 1, 
                Layout = Enum.FillDirection.Vertical
            }, {
                Header = v1.createElement(l_TextLabel_0, {
                    Text = l_Localization_1:getText("Parse", "Header"), 
                    TextSize = l_ParseWidget_0.TextSize, 
                    TextXAlignment = l_ParseWidget_0.TextAlignment, 
                    Size = l_ParseWidget_0.TextLabelSize, 
                    LayoutOrder = 1
                }), 
                SubtextSize = v1.createElement(l_TextLabel_0, {
                    Text = l_Localization_1:getText("Parse", "Subheader"), 
                    TextSize = l_ParseWidget_0.SubtextSize, 
                    TextXAlignment = l_ParseWidget_0.TextAlignment, 
                    TextColor = l_ParseWidget_0.SubtextColor, 
                    Size = l_ParseWidget_0.TextLabelSize, 
                    LayoutOrder = 2
                })
            }), 
            LoadingIndicatorPane = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(0.2, 0, 0.4, 0)
            }, {
                LoadingIndicator = v1.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    StartColor = l_ParseWidget_0.LoadingButtonColor
                })
            })
        })
    });
end;
v15 = l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v15);
return v2.connect(function(v22) --[[ Line: 117 ]] --[[ Name: mapStateToProps ]]
    return {
        ShowParsingWidget = v22.Dialogs.showParsingWidget
    };
end, function(v23) --[[ Line: 109 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy)
    return {
        SetShowParsingWidget = function(v24) --[[ Line: 111 ]] --[[ Name: SetShowParsingWidget ]]
            -- upvalues: v23 (copy), v13 (ref)
            v23(v13(v24));
        end
    };
end)(v15);