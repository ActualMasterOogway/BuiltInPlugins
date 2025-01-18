local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.ConvertCharacters);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.RevertCharacters);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v13 = v2.PureComponent:extend("CharacterConversionPaneFooter");
v13.init = function(v14) --[[ Line: 22 ]] --[[ Name: init ]]
    v14.convertCharacters = function() --[[ Line: 23 ]]
        -- upvalues: v14 (copy)
        v14.props.ConvertCharacters(v14.props.Analytics);
    end;
    v14.revertCharacters = function() --[[ Line: 27 ]]
        -- upvalues: v14 (copy)
        v14.props.RevertCharacters(v14.props.Analytics);
    end;
end;
v13.render = function(v15) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_Separator_0 (copy), l_TextLabel_0 (copy), l_Button_0 (copy)
    local l_props_0 = v15.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_processResultMessage_0 = l_props_0.processResultMessage;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local v22 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Stylizer_0.Spacing
    }, {
        ResultContainer = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            BorderSizePixel = 0, 
            Padding = l_Stylizer_0.ResultContainerPadding, 
            Size = l_Stylizer_0.ResultContainerSize, 
            Spacing = l_Stylizer_0.ResultContainerSpacing
        }, {
            Separator = v2.createElement(l_Separator_0, {
                DominantAxis = Enum.DominantAxis.Width, 
                LayoutOrder = v22:getNextOrder(), 
                Style = l_Stylizer_0.SeparatorStyle
            }), 
            ProcessResult = v2.createElement(l_TextLabel_0, {
                Size = l_Stylizer_0.ResultSize, 
                LayoutOrder = v22:getNextOrder(), 
                Text = l_processResultMessage_0 or "", 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        FooterButtons = v2.createElement(l_Pane_0, {
            LayoutOrder = v22:getNextOrder(), 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Spacing = l_Stylizer_0.ButtonSpacing, 
            Padding = l_Stylizer_0.ButtonPadding
        }, {
            RevertButton = v2.createElement(l_Button_0, {
                Size = l_Stylizer_0.RevertButtonSize, 
                Text = l_Localization_0:getText("CharacterConversion", "Revert"), 
                OnClick = v15.revertCharacters, 
                LayoutOrder = v22:getNextOrder()
            }), 
            ConvertButton = v2.createElement(l_Button_0, {
                Style = "RoundPrimary", 
                Size = l_Stylizer_0.ReplaceButtonSize, 
                Text = l_Localization_0:getText("CharacterConversion", "Replace"), 
                OnClick = v15.convertCharacters, 
                LayoutOrder = v22:getNextOrder()
            })
        })
    });
end;
v13 = l_ContextServices_0.withContext({
    Analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13);
return v3.connect(function(v23, _) --[[ Line: 109 ]] --[[ Name: mapStateToProps ]]
    return {
        selection = v23.CharacterConversion.selection
    };
end, function(v25) --[[ Line: 115 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v4 (copy), v5 (copy)
    return {
        ConvertCharacters = function(v26) --[[ Line: 117 ]] --[[ Name: ConvertCharacters ]]
            -- upvalues: v25 (copy), v4 (ref)
            v25(v4(v26));
        end, 
        RevertCharacters = function(v27) --[[ Line: 121 ]] --[[ Name: RevertCharacters ]]
            -- upvalues: v25 (copy), v5 (ref)
            v25(v5(v27));
        end
    };
end)(v13);