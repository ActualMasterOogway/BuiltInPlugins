local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local l_Util_0 = l_Parent_0.Util;
local v4 = require(l_Util_0.deepCopy);
local v5 = require(l_Util_0.LayoutOrderIterator);
local v6 = require(l_Util_0.StyleModifier);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v8 = require(l_Parent_0.UI.Components.Image);
local v9 = require(l_Parent_0.UI.Components.Pane);
local v10 = require(l_Parent_0.UI.Components.PropertyCell);
local v11 = require(l_Parent_0.UI.Components.TextLabel);
local v12 = require(l_Parent_0.UI.Components.Tooltip);
local function v13() --[[ Line: 22 ]] --[[ Name: validateAll ]]
    return Enum.PropertyStatus.Ok, "";
end;
local v14 = v2.PureComponent:extend("FormItem");
v14.init = function(v15) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy), v2 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    v15.OnChanged = function(v16) --[[ Line: 29 ]]
        -- upvalues: v15 (copy), v13 (ref), v2 (ref)
        local l_props_0 = v15.props;
        local v18, v19 = (l_props_0.OnValidate or v15.DefaultValidation[l_props_0.Schema.Type] or v13)(v16, l_props_0.Schema);
        if v18 == Enum.PropertyStatus.Error then
            v15:setState({
                Status = v18, 
                Error = v19, 
                Value = v16
            });
            return;
        else
            v15:setState({
                Status = v18, 
                Error = v19, 
                Value = v2.None
            });
            l_props_0.OnChanged(v16);
            return;
        end;
    end;
    v15.DefaultValidation = {
        Number = function(v20) --[[ Line: 53 ]] --[[ Name: Number ]]
            -- upvalues: v15 (copy), l_LOCALIZATION_PROJECT_NAME_0 (ref)
            if v20 and v20 == v20 and v20 ~= 1e999 and v20 ~= -1e999 then
                return Enum.PropertyStatus.Ok, "";
            else
                return Enum.PropertyStatus.Error, v15.props.Localization:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "FormItem", "NaN");
            end;
        end, 
        Slider = function(v21, v22) --[[ Line: 61 ]] --[[ Name: Slider ]]
            -- upvalues: v15 (copy), l_LOCALIZATION_PROJECT_NAME_0 (ref)
            local v23 = tonumber(v21);
            if not v23 then
                return Enum.PropertyStatus.Error, v15.props.Localization:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "FormItem", "NaN");
            elseif v22.Max < v23 or v23 < v22.Min then
                return Enum.PropertyStatus.Error, v15.props.Localization:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "FormItem", "OutOfRange");
            else
                return Enum.PropertyStatus.Ok;
            end;
        end
    };
    v15.DefaultMinWidths = {
        SingleSelectButton = 170, 
        Slider = 170
    };
    v15.state = {
        Compact = false, 
        Expanded = false, 
        Status = Enum.PropertyStatus.Ok, 
        Tooltip = ""
    };
end;
v14.updateRequiredWidth = function(v24) --[[ Line: 91 ]] --[[ Name: updateRequiredWidth ]]
    -- upvalues: l_TextService_0 (copy)
    local l_props_1 = v24.props;
    local l_OnValidate_0 = l_props_1.OnValidate;
    local l_Tooltip_0 = l_props_1.Tooltip;
    local l_Label_0 = l_props_1.Label;
    local l_ItemChildren_0 = l_props_1.ItemChildren;
    local l_Style_0 = l_props_1.Style;
    local v31 = if l_ItemChildren_0 ~= nil then l_Style_0.FormItem.Arrow.Size.X.Offset + l_Style_0.FormItem.Spacing else 0;
    local v32 = l_Style_0.FormItem.DepthPadding * (l_props_1.Depth or 0);
    local v33 = if not not l_OnValidate_0 or v24.DefaultValidation[l_props_1.Schema.Type] then l_Style_0.FormItem.StatusIconSize + l_Style_0.FormItem.Spacing else 0;
    local v34 = if l_Label_0 then l_TextService_0:GetTextSize(l_Label_0, l_Style_0.FormItem.FontSize, l_Style_0.FormItem.Font, Vector2.new(1e999, 1e999)) else 0;
    local v35 = if l_Tooltip_0 then l_Style_0.FormItem.HelpIconSize + l_Style_0.FormItem.Spacing else 0;
    local v36 = v31 + v32 + v33 + v34.X + v35 + if l_ItemChildren_0 == nil then l_Style_0.FormItem.Padding else l_Style_0.FormItem.WithChildrenPadding;
    l_props_1.OnLabelWidthChanged(v24.width, v36);
    v24.width = v36;
end;
v14.checkCompact = function(v37) --[[ Line: 124 ]] --[[ Name: checkCompact ]]
    local l_props_2 = v37.props;
    local v39 = l_props_2.MinWidth or v37.DefaultMinWidths[l_props_2.Schema.Type];
    if v39 then
        v37:setState({
            Compact = (l_props_2.FormWidth or 1e999) - l_props_2.LabelWidth.Offset < v39
        });
    end;
end;
v14.didMount = function(v40) --[[ Line: 135 ]] --[[ Name: didMount ]]
    v40:updateRequiredWidth();
    v40:checkCompact();
end;
v14.willUnmount = function(v41) --[[ Line: 140 ]] --[[ Name: willUnmount ]]
    v41.props.OnLabelWidthChanged(v41.width);
end;
v14.didUpdate = function(v42, v43) --[[ Line: 144 ]] --[[ Name: didUpdate ]]
    -- upvalues: v13 (copy), v2 (copy)
    local l_props_3 = v42.props;
    local l_Value_0 = l_props_3.Value;
    local l_OnValidate_1 = l_props_3.OnValidate;
    if v43.Value ~= l_Value_0 or v43.OnValidate ~= l_OnValidate_1 then
        local v47, v48 = (l_OnValidate_1 or v42.DefaultValidation[l_props_3.Schema.Type] or v13)(l_Value_0, l_props_3.Schema);
        if v47 == Enum.PropertyStatus.Error and not v42.state.Value then
            v42:setState({
                Status = v47, 
                Error = v48, 
                Value = l_Value_0
            });
            l_props_3.OnChanged(v43.Value);
        elseif v47 ~= v42.state.status or v48 ~= v42.state.Error or v42.state.Value then
            v42:setState({
                Status = v47, 
                Error = v48, 
                Value = v2.None
            });
        end;
    end;
    if v43.OnValidate ~= l_OnValidate_1 or v43.Tooltip ~= l_props_3.Tooltip or v43.Label ~= l_props_3.Label or v43.ItemChildren ~= l_props_3.ItemChildren or v43.FormWidth ~= l_props_3.FormWidth then
        v42:updateRequiredWidth();
        v42:checkCompact();
    end;
end;
v14.render = function(v49) --[[ Line: 182 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy), v9 (copy), v8 (copy), v6 (copy), v12 (copy), v11 (copy), v10 (copy), v14 (copy), v4 (copy)
    local l_props_4 = v49.props;
    local l_ItemChildren_1 = l_props_4.ItemChildren;
    local v52 = if l_props_4.Layout then l_props_4.Layout else if v49.state.Compact then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal;
    local l_Style_1 = l_props_4.Style;
    local v54 = v5.new();
    local l_Status_0 = v49.state.Status;
    local v56 = l_Style_1.FormItem.DepthPadding * (l_props_4.Depth or 0) + if l_ItemChildren_1 == nil then l_Style_1.FormItem.Padding else l_Style_1.FormItem.WithChildrenPadding;
    local v57 = if v52 == Enum.FillDirection.Vertical then UDim2.new(1, -v56, 0, l_props_4.Height or 0) else UDim2.new(UDim.new(1 - l_props_4.LabelWidth.Scale, -l_props_4.LabelWidth.Offset - l_Style_1.FormItem.Spacing), UDim.new(0, l_props_4.Height or l_props_4.LabelHeight or 0));
    local v58 = nil;
    if l_Status_0 == Enum.PropertyStatus.Error then
        v58 = l_Style_1.FormItem.StatusIconError;
    elseif l_Status_0 == Enum.PropertyStatus.Warning then
        v58 = l_Style_1.FormItem.StatusIconWarning;
    end;
    local v59 = nil;
    if l_props_4.Tooltip and l_props_4.Tooltip ~= "" then
        v59 = l_Style_1.FormItem.HelpIcon;
    end;
    local v60 = nil;
    if v58 and v59 then
        local v61 = l_Style_1.FormItem.StatusIconSize + l_Style_1.FormItem.HelpIconSize + 3 * l_Style_1.FormItem.Spacing;
        v60 = UDim2.new(1, -v61, 1, 0);
    else
        v60 = if v58 then UDim2.new(1, -l_Style_1.FormItem.HelpIconSize - 2 * l_Style_1.FormItem.Spacing, 1, 0) else if v59 then UDim2.new(1, -l_Style_1.FormItem.HelpIconSize - 2 * l_Style_1.FormItem.Spacing, 1, 0) else UDim2.fromScale(1, 1);
    end;
    local l_Label_1 = l_props_4.Label;
    local v64 = if l_props_4.Hidden then nil else v2.createElement(v9, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = v52 or Enum.FillDirection.Horizontal, 
        LayoutOrder = if l_ItemChildren_1 and v49.state.Expanded then v54:getNextOrder() else l_props_4.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Spacing = l_Style_1.FormItem.Spacing
    }, {
        Container = if l_Label_1 and l_Label_1 ~= "" then v2.createElement(v9, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1, 
            Size = if v52 == Enum.FillDirection.Vertical then UDim2.new(1, 0, 0, l_props_4.LabelHeight) else UDim2.new(l_props_4.LabelWidth, UDim.new(0, l_props_4.LabelHeight)), 
            Padding = {
                Left = v56
            }, 
            Spacing = l_Style_1.FormItem.Spacing
        }, {
            Arrow = if l_ItemChildren_1 ~= nil then v2.createElement(v9, {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v54:getNextOrder(), 
                OnClick = function() --[[ Line: 256 ]] --[[ Name: OnClick ]]
                    -- upvalues: v49 (copy)
                    v49:setState(function(v63) --[[ Line: 257 ]]
                        return {
                            Expanded = not v63.Expanded
                        };
                    end);
                end, 
                Size = l_Style_1.FormItem.Arrow.Size, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                Image = v2.createElement(v8, {
                    Style = l_Style_1.FormItem.Arrow, 
                    StyleModifier = v49.state.Expanded and v6.Selected or nil
                })
            }) else nil, 
            StatusIcon = if v58 then v2.createElement(v9, {
                LayoutOrder = v54:getNextOrder(), 
                Size = UDim2.fromOffset(l_Style_1.FormItem.StatusIconSize, l_Style_1.FormItem.StatusIconSize)
            }, {
                Image = v2.createElement(v8, {
                    Style = {
                        Image = v58
                    }
                }), 
                Tooltip = if v49.state.Error and v49.state.Error ~= "" then v2.createElement(v12, {
                    Text = v49.state.Error, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else nil
            }) else nil, 
            Label = v2.createElement(v9, {
                LayoutOrder = v54:getNextOrder(), 
                Size = v60
            }, {
                LabelText = v2.createElement(v11, {
                    Text = l_Label_1, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            HelpIcon = if v59 then v2.createElement(v9, {
                LayoutOrder = v54:getNextOrder(), 
                Size = UDim2.fromOffset(l_Style_1.FormItem.HelpIconSize, l_Style_1.FormItem.HelpIconSize)
            }, {
                Image = v2.createElement(v8, {
                    Style = {
                        Image = v59, 
                        Color = l_Style_1.FormItem.IconColor
                    }
                }), 
                Tooltip = v2.createElement(v12, {
                    Text = l_props_4.Tooltip, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }) else nil
        }) else nil, 
        Property = v2.createElement(v9, {
            AnchorPoint = Vector2.new(0, 0.5), 
            AutomaticSize = if l_props_4.Height then nil else Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LayoutOrder = 3, 
            Padding = if v52 == Enum.FillDirection.Vertical then {
                Left = v56
            } else nil, 
            Position = UDim2.fromScale(0, 0.5), 
            Size = if v52 == Enum.FillDirection.Vertical then UDim2.new(1, 0, 0, l_props_4.Height or l_props_4.LabelHeight or 0) else v57, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            PropertyCell = v2.createElement(v10, {
                AutomaticSize = if l_props_4.Height then nil else Enum.AutomaticSize.Y, 
                CustomValidation = true, 
                Disabled = l_props_4.Disabled, 
                HasError = l_Status_0 == Enum.PropertyStatus.Error, 
                OnChanged = v49.OnChanged, 
                Renderers = l_props_4.Renderers, 
                Size = UDim2.new(1, 0, 0, l_props_4.Height or l_props_4.LabelHeight or 0), 
                Schema = l_props_4.Schema, 
                Value = v49.state.Value or l_props_4.Value
            })
        })
    });
    if l_ItemChildren_1 then
        local v65 = if v64 == nil then {} else {
            v64
        };
        for v66, v67 in l_ItemChildren_1 do
            v65[v67.Label] = v2.createElement(v14, {
                Children = v67.Children, 
                ItemChildren = v67.Children, 
                Depth = not l_props_4.Depth and 1 or l_props_4.Depth + 1, 
                Disabled = v67.Disabled, 
                FormWidth = l_props_4.FormWidt, 
                Height = v67.Height, 
                Hidden = l_props_4.Hidden or not v49.state.Expanded, 
                Layout = v67.Layout, 
                LayoutOrder = v54:getNextOrder(), 
                Label = v67.Label, 
                LabelHeight = l_props_4.LabelHeight, 
                LabelWidth = l_props_4.LabelWidth, 
                Localization = l_props_4.Localization, 
                MinWidth = v67.MinWidth, 
                OnLabelWidthChanged = l_props_4.OnLabelWidthChanged, 
                OnChanged = function(v68) --[[ Line: 367 ]] --[[ Name: OnChanged ]]
                    -- upvalues: l_ItemChildren_1 (copy), v66 (copy), v4 (ref), l_props_4 (copy)
                    if v68 == l_ItemChildren_1[v66].Value then
                        return;
                    else
                        local v69 = v4(l_ItemChildren_1);
                        v69[v66].Value = v68;
                        l_props_4.OnChildrenChanged(v69);
                        return;
                    end;
                end, 
                OnChildrenChanged = function(v70) --[[ Line: 376 ]] --[[ Name: OnChildrenChanged ]]
                    -- upvalues: v4 (ref), l_ItemChildren_1 (copy), v66 (copy), l_props_4 (copy)
                    local v71 = v4(l_ItemChildren_1);
                    v71[v66].Children = v70;
                    if l_props_4.OnChildrenChanged then
                        l_props_4.OnChildrenChanged(v71);
                    end;
                end, 
                OnValidate = v67.Validate, 
                Renderers = l_props_4.Renderers, 
                Schema = v67.Schema, 
                Style = l_props_4.Style, 
                Tooltip = v67.Tooltip, 
                Value = v67.Value
            });
        end;
        return v2.createElement(v9, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_props_4.LayoutOrder, 
            Padding = if not l_props_4.Hidden and v49.state.Expanded then nil else 0, 
            Size = UDim2.fromScale(1, 0), 
            Spacing = if not l_props_4.Hidden and v49.state.Expanded then l_Style_1.FormItem.Spacing else 0, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, v65);
    else
        return v64;
    end;
end;
return v14;