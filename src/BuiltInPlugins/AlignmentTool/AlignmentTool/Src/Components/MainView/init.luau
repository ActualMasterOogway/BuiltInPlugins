local l_Parent_0 = script.Parent.Parent.Parent;
local l_DraggerSchemaCore_0 = l_Parent_0.Packages.DraggerSchemaCore;
local v2 = require(l_DraggerSchemaCore_0.BoundsChangedTracker);
local v3 = require(l_DraggerSchemaCore_0.Selection);
local l_FitFrameVertical_0 = require(l_Parent_0.Packages.FitFrame).FitFrameVertical;
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.RoactRodux);
local v7 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v7.UI;
local l_Button_0 = l_UI_0.Button;
local l_Container_0 = l_UI_0.Container;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Box_0 = l_UI_0.Box;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v7.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v19 = require(l_Parent_0.Src.Actions.SetAlignableObjects);
local v20 = require(l_Parent_0.Src.Components.AlignmentSettings);
local v21 = require(l_Parent_0.Src.Components.AlignObjectsPreview);
local v22 = require(l_Parent_0.Src.Thunks.UpdateAlignEnabled);
local v23 = require(l_Parent_0.Src.Thunks.UpdateAlignment);
local v24 = require(script.Parent.TeachingCallout);
local v25 = require(l_Parent_0.Src.Utility.AlignToolError);
local v26 = require(l_Parent_0.Src.Utility.getAlignableObjects);
local v27 = v3.new();
local v28 = v5.PureComponent:extend("MainView");
v28.init = function(v29) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v29._boundsChangedTracker = v2.new(nil, function() --[[ Line: 50 ]]
        -- upvalues: v29 (copy)
        v29.props.updateAlignEnabled();
    end);
    v29:_updateSelectionInfo();
end;
v28.render = function(v30) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v25 (copy), v5 (copy), l_Container_0 (copy), l_Box_0 (copy), l_ScrollingFrame_0 (copy), v20 (copy), l_TextLabel_0 (copy), l_FitFrameVertical_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), v24 (copy), v21 (copy)
    local l_props_0 = v30.props;
    local l_alignEnabled_0 = l_props_0.alignEnabled;
    local l_updateAlignment_0 = l_props_0.updateAlignment;
    local l_Analytics_0 = l_props_0.Analytics;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v37 = l_LayoutOrderIterator_0.new();
    local v38 = nil;
    if not l_props_0.alignEnabled and l_props_0.disabledReason ~= nil then
        local l_errorCode_0 = l_props_0.disabledReason.errorCode;
        if l_errorCode_0 then
            local l_formatParameters_0 = l_props_0.disabledReason.formatParameters;
            v38 = v25.getErrorText(l_Localization_0, l_errorCode_0, l_formatParameters_0);
        end;
    end;
    local v41 = l_props_0.previewVisible and l_props_0.alignEnabled;
    local v42 = UDim.new(0, l_Stylizer_0.MainView.Padding);
    return v5.createElement(l_Container_0, {
        Background = l_Box_0
    }, {
        Scroller = v5.createElement(l_ScrollingFrame_0, {
            AutoSizeCanvas = true, 
            AutoSizeLayoutOptions = {
                Padding = l_Stylizer_0.MainView.ListItemPadding
            }
        }, {
            Padding = v5.createElement("UIPadding", {
                PaddingLeft = v42, 
                PaddingTop = v42, 
                PaddingBottom = v42
            }), 
            AlignmentSettings = v5.createElement(v20, {
                LayoutOrder = v37:getNextOrder()
            }), 
            InfoLabel = v5.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v37:getNextOrder(), 
                Text = v38 or "", 
                Size = UDim2.fromScale(1, 0), 
                Style = "Error"
            }), 
            ButtonContainer = v5.createElement(l_FitFrameVertical_0, {
                margin = {
                    left = 0, 
                    top = l_Stylizer_0.MainView.Padding, 
                    right = 0, 
                    bottom = 0
                }, 
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = v37:getNextOrder()
            }, {
                Button = v5.createElement(l_Button_0, {
                    Size = l_Stylizer_0.MainView.PrimaryButtonSize, 
                    Style = "RoundPrimary", 
                    StyleModifier = not l_alignEnabled_0 and l_StyleModifier_0.Disabled, 
                    Text = l_Localization_0:getText("MainView", "AlignButton"), 
                    OnClick = function() --[[ Line: 131 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_alignEnabled_0 (copy), l_updateAlignment_0 (copy), l_Analytics_0 (copy)
                        if l_alignEnabled_0 then
                            l_updateAlignment_0(l_Analytics_0);
                        end;
                    end
                }, {
                    TeachingCallout = v5.createElement(v24, {
                        Offset = Vector2.new(0, 6), 
                        DefinitionId = "AlignToolCallout", 
                        LocationId = "AlignButton"
                    })
                })
            })
        }), 
        AlignObjectsPreview = v41 and v5.createElement(v21) or nil
    });
end;
v28._updateSelectionInfo = function(v43) --[[ Line: 150 ]] --[[ Name: _updateSelectionInfo ]]
    -- upvalues: v27 (copy), v26 (copy)
    local v44 = v27:Get();
    local v45, v46 = v26(v44);
    v43.props.setAlignableObjects(v45);
    v43._boundsChangedTracker:setParts(v46);
end;
v28.didMount = function(v47) --[[ Line: 159 ]] --[[ Name: didMount ]]
    -- upvalues: v27 (copy)
    v47._boundsChangedTracker:install();
    v47._selectionChangedConnection = v27.SelectionChanged:Connect(function() --[[ Line: 162 ]]
        -- upvalues: v47 (copy)
        v47:_updateSelectionInfo();
    end);
end;
v28.willUnmount = function(v48) --[[ Line: 167 ]] --[[ Name: willUnmount ]]
    v48._selectionChangedConnection:Disconnect();
    v48._selectionChangedConnection = nil;
    v48._boundsChangedTracker:uninstall();
end;
v28 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics
})(v28);
return v6.connect(function(v49, _) --[[ Line: 181 ]] --[[ Name: mapStateToProps ]]
    return {
        previewVisible = v49.previewVisible, 
        alignEnabled = v49.alignEnabled, 
        disabledReason = v49.disabledReason, 
        alignableObjects = v49.alignableObjects, 
        alignmentMode = v49.alignmentMode, 
        alignmentSpace = v49.alignmentSpace, 
        enabledAxes = v49.enabledAxes
    };
end, function(v51) --[[ Line: 193 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v22 (copy), v23 (copy), v19 (copy)
    return {
        updateAlignEnabled = function() --[[ Line: 195 ]] --[[ Name: updateAlignEnabled ]]
            -- upvalues: v51 (copy), v22 (ref)
            v51(v22());
        end, 
        updateAlignment = function(v52) --[[ Line: 199 ]] --[[ Name: updateAlignment ]]
            -- upvalues: v51 (copy), v23 (ref)
            v51(v23(v52));
        end, 
        setAlignableObjects = function(v53) --[[ Line: 203 ]] --[[ Name: setAlignableObjects ]]
            -- upvalues: v51 (copy), v19 (ref), v22 (ref)
            v51(v19(v53));
            v51(v22());
        end
    };
end)(v28);