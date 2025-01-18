local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Image_0 = l_UI_0.Image;
local l_Alert_0 = l_UI_0.Alert;
local l_Util_0 = v1.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_ContextServices_0 = v1.ContextServices;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v16 = require(l_Components_0.AnimationList);
local v17 = require(l_Components_0.AnimationPreviewComponent);
local v18 = require(l_Components_0.AnimationConversionPaneFooter);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local l_AssetType_0 = require(l_AnimationConversion_0.constants).AssetType;
local v21 = require(l_script_FirstAncestor_0.Src.Util.AssetIdUtil);
local v22 = v2.PureComponent:extend("AnimationConversionPane");
v22.init = function(v23) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v2 (copy)
    v23.state = {
        expanded = {
            Preview = true, 
            List = true
        }, 
        paneSize = Vector2.new(), 
        alert = {
            show = false
        }
    };
    v23.onExpandedChanged = function(v24) --[[ Line: 44 ]]
        -- upvalues: v23 (copy), v4 (ref)
        return function() --[[ Line: 45 ]]
            -- upvalues: v23 (ref), v4 (ref), v24 (copy)
            v23:setState(function(v25) --[[ Line: 46 ]]
                -- upvalues: v4 (ref), v24 (ref)
                local v26 = v4.copy(v25.expanded);
                v26[v24] = not v26[v24];
                return {
                    expanded = v26
                };
            end);
        end;
    end;
    v23.ref = v2.createRef();
end;
v22.initRef = function(v27) --[[ Line: 59 ]] --[[ Name: initRef ]]
    local v28 = v27.ref:getValue();
    if not v28 then
        return;
    else
        v27:setState({
            paneSize = v28.AbsoluteSize
        });
        v27.onPaneSizeChanged = v28:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 69 ]]
            -- upvalues: v27 (copy), v28 (copy)
            v27:setState({
                paneSize = v28.AbsoluteSize
            });
        end);
        return;
    end;
end;
v22.didMount = function(v29) --[[ Line: 76 ]] --[[ Name: didMount ]]
    v29:initRef();
end;
v22.willUnmount = function(v30) --[[ Line: 80 ]] --[[ Name: willUnmount ]]
    if v30.onPaneSizeChanged then
        v30.onPaneSizeChanged:Disconnect();
    end;
end;
v22.didUpdate = function(v31) --[[ Line: 86 ]] --[[ Name: didUpdate ]]
    if v31.ref.current and not v31.onPaneSizeChanged then
        v31:initRef();
    end;
end;
v22.buildTags = function(v32) --[[ Line: 92 ]] --[[ Name: buildTags ]]
    -- upvalues: v21 (copy), l_AssetType_0 (copy)
    local l_animations_0 = v32.props.animations;
    local v34 = {};
    for v35, v36 in l_animations_0 do
        local l_animationAssetInfo_0 = v36.animationAssetInfo;
        local v38 = {
            id = ""
        };
        if v36.converted then
            local v39 = tonumber(v36.converted);
            v38.converted = if v21.isValidAssetId(v39) then tostring(v39) else "";
        end;
        if l_animationAssetInfo_0:IsA(l_AssetType_0.RobloxAsset) then
            v38.id = tostring(l_animationAssetInfo_0.id);
        end;
        v34[v35] = v38;
    end;
    return v34;
end;
v22.renderHeader = function(v40, v41, v42) --[[ Line: 111 ]] --[[ Name: renderHeader ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), v4 (copy), l_Image_0 (copy), l_StyleModifier_0 (copy), l_TextLabel_0 (copy)
    local l_Header_0 = v40.props.Stylizer.Header;
    local v44 = l_LayoutOrderIterator_0.new();
    local v45 = v40.state.expanded[v42];
    return v2.createElement(l_Pane_0, v4.join(l_Header_0.Container, {
        OnClick = v40.onExpandedChanged(v42)
    }), {
        Arrow = v2.createElement(l_Image_0, {
            Style = l_Header_0.Arrow, 
            StyleModifier = if v45 then l_StyleModifier_0.Selected else nil, 
            LayoutOrder = v44:getNextOrder()
        }), 
        Text = v2.createElement(l_TextLabel_0, {
            Text = v41, 
            LayoutOrder = v44:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 24, 0.5, 0), 
            Style = l_Header_0.Text
        })
    });
end;
v22.renderAnimationList = function(v46) --[[ Line: 141 ]] --[[ Name: renderAnimationList ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_ExpandablePane_0 (copy), v17 (copy), v16 (copy), v18 (copy)
    local l_props_0 = v46.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_animations_1 = l_props_0.animations;
    local v51 = v46:buildTags();
    local l_state_0 = v46.state;
    local l_Preview_0 = l_state_0.expanded.Preview;
    local v54 = if l_Preview_0 then l_Stylizer_0.ExpandedOffset else l_Stylizer_0.CollapsedOffset;
    local v55 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Content = v2.createElement(l_Pane_0, {
            LayoutOrder = v55:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.FooterHeight), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [v2.Ref] = v46.ref
        }, {
            PreviewContainer = v2.createElement(l_ExpandablePane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v55:getNextOrder(), 
                Expanded = l_Preview_0, 
                HeaderOverride = v46:renderHeader(l_Localization_0:getText("AnimationConversion", "Preview"), "Preview"), 
                OnExpandedChanged = function() --[[ Line: 172 ]] --[[ Name: OnExpandedChanged ]]

                end
            }, {
                Preview = v2.createElement(v17)
            }), 
            ListContainer = v2.createElement(l_ExpandablePane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v55:getNextOrder(), 
                Expanded = l_state_0.expanded.List, 
                ContentPadding = 0, 
                HeaderOverride = v46:renderHeader(l_Localization_0:getText("AnimationConversion", "Animations"), "List"), 
                OnExpandedChanged = function() --[[ Line: 182 ]] --[[ Name: OnExpandedChanged ]]

                end
            }, {
                List = v2.createElement(v16, {
                    Size = UDim2.new(1, 0, 0, l_state_0.paneSize.Y - l_Stylizer_0.HeaderHeight - v54), 
                    Items = l_animations_1, 
                    Tags = v51, 
                    LayoutOrder = v55:getNextOrder(), 
                    OnResetPlugin = l_props_0.OnResetPlugin
                })
            })
        }), 
        Footer = v2.createElement(v18, {
            LayoutOrder = v55:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.FooterHeight)
        })
    });
end;
v22.renderNoAnimationsScreen = function(v56) --[[ Line: 200 ]] --[[ Name: renderNoAnimationsScreen ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    return v2.createElement(l_Pane_0, {}, {
        Label = v2.createElement(l_TextLabel_0, {
            Text = v56.props.Localization:getText("AnimationConversion", "NoAnimations")
        })
    });
end;
v22.hasAnimations = function(v57) --[[ Line: 208 ]] --[[ Name: hasAnimations ]]
    return next(v57.props.animations) ~= nil;
end;
v22.render = function(v58) --[[ Line: 212 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_Alert_0 (copy)
    return v2.createElement(l_Pane_0, {}, {
        Content = if v58:hasAnimations() then v58:renderAnimationList() else v58:renderNoAnimationsScreen(), 
        Alert = v58.state.alert.show and v2.createElement(l_Alert_0, {
            Style = "Success", 
            Title = "Success", 
            Description = "5 R6 IDs were successfully replaced", 
            ZIndex = 999, 
            PrimaryAction = {
                Text = "Action", 
                OnClick = function() --[[ Line: 223 ]] --[[ Name: OnClick ]]
                    print("Clicked primary action");
                end
            }, 
            OnClose = function() --[[ Line: 228 ]] --[[ Name: OnClose ]]
                -- upvalues: v58 (copy)
                v58:setState({
                    alert = {
                        show = false
                    }
                });
            end
        })
    });
end;
local function v61(v59, _) --[[ Line: 239 ]] --[[ Name: mapStateToProps ]]
    return {
        diagnostics = v59.ScriptConversion.diagnostics, 
        animations = v59.AnimationConversion.animations
    };
end;
v22 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v22);
return v3.connect(v61)(v22);