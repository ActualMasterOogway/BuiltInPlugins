local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_formatLocalDateTime_0 = v3.Util.formatLocalDateTime;
local v7 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local _ = v3.Util.StyleModifier;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.AssetConfigConstants);
local l_StyleModifier_1 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Button_0 = l_UI_0.Button;
local v19 = v2.PureComponent:extend("VersionsTableCell");
local v20 = {
    Version = 1, 
    Description = 2, 
    Restore = 3
};
v19.init = function(v21) --[[ Line: 80 ]] --[[ Name: init ]]
    v21.state = {
        inputText = if v21.props.ColumnIndex == 2 and v21.props.Value.versionDescription then v21.props.Value.versionDescription else ""
    };
    v21.hasError = false;
    v21.onCheck = function(v22, v23, v24) --[[ Line: 89 ]]
        -- upvalues: v21 (copy)
        local l_props_0 = v21.props;
        local l_OnClickItem_0 = l_props_0.CellProps.OnClickItem;
        if v23 then
            return;
        elseif v24 and l_OnClickItem_0 then
            l_OnClickItem_0(nil);
            return;
        else
            if l_props_0.CellProps.SelectVersion ~= v22 and l_OnClickItem_0 then
                l_OnClickItem_0(v22);
            end;
            return;
        end;
    end;
    v21.onClickDesc = function(v27) --[[ Line: 102 ]]
        -- upvalues: v21 (copy)
        local l_props_1 = v21.props;
        local l_OnClickDesc_0 = l_props_1.CellProps.OnClickDesc;
        v21:setState({
            inputText = if v21.props.ColumnIndex == 2 then v21.props.Value.versionDescription else ""
        });
        if l_props_1.CellProps.OpenInputKey ~= v27 and l_OnClickDesc_0 then
            l_OnClickDesc_0(v27, l_props_1.CellProps.PreviousInput);
        end;
        l_props_1.CellProps.SetPreviousInput(v21.state.inputText);
    end;
    v21.onClickOut = function() --[[ Line: 115 ]]
        -- upvalues: v21 (copy)
        local l_OnClickDesc_1 = v21.props.CellProps.OnClickDesc;
        if l_OnClickDesc_1 then
            l_OnClickDesc_1(-1, v21.props.CellProps.PreviousInput);
        end;
    end;
    v21.onTextChanged = function(v31) --[[ Line: 122 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            inputText = v31
        });
        v21.props.CellProps.SetPreviousInput(v31);
    end;
end;
v19.createDescriptionComponent = function(v32) --[[ Line: 130 ]] --[[ Name: createDescriptionComponent ]]
    -- upvalues: v7 (copy), v11 (copy), v2 (copy), l_TextInput_0 (copy), l_StyleModifier_1 (copy), l_Button_0 (copy), v10 (copy), l_LinkText_0 (copy)
    local l_props_2 = v32.props;
    local l_state_0 = v32.state;
    local v35 = l_props_2.Value.versionDescription and string.find(l_props_2.Value.versionDescription, "\n");
    local v36 = nil;
    local _ = v7.new();
    local v38 = l_state_0.inputText or "";
    if l_props_2.CellProps.ErrorCallback then
        if #v38 > v11.PACKAGE_NOTE_CHARACTER_LIMIT then
            if not v32.hasError then
                v32.hasError = true;
                l_props_2.CellProps.ErrorCallback(v32.hasError);
                l_props_2.CellProps.SetVersionError(l_props_2.Value.assetVersionNumber, v32.hasError);
            end;
        elseif v32.hasError then
            v32.hasError = false;
            l_props_2.CellProps.ErrorCallback(v32.hasError);
            l_props_2.CellProps.SetVersionError(l_props_2.Value.assetVersionNumber, v32.hasError);
        end;
    end;
    local v39 = #v38 > v11.PACKAGE_NOTE_CHARACTER_LIMIT;
    if v35 then
        v36 = string.format("%s...", (string.sub(l_props_2.Value.versionDescription, 0, v35 - 1)));
    end;
    if l_props_2.CellProps.OpenInputKey == l_props_2.Value.assetVersionNumber then
        return (v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(1, 0, 0.9, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            InputBox = v2.createElement(l_TextInput_0, {
                Text = l_state_0.inputText or "", 
                OnTextChanged = v32.onTextChanged, 
                PlaceholderText = l_props_2.Localization:getText("AssetConfigVersions", "DescribeChanges"), 
                MultiLine = true, 
                Size = UDim2.fromScale(0.995, 0.85), 
                Style = "BorderBox", 
                StyleModifier = if v39 then l_StyleModifier_1.Error else nil, 
                MaxLength = v11.PACKAGE_NOTE_CHARACTER_LIMIT
            }), 
            CounterText = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0.995, 0, 1, 0)
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 5)
                }), 
                DiscardButton = v2.createElement(l_Button_0, {
                    BorderSizePixel = 0, 
                    Text = l_props_2.Localization:getText("General", "Discard"), 
                    Size = UDim2.fromScale(0.125, 0.125), 
                    TextSize = v10.FONT_SIZE_LARGE, 
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Style = "Round", 
                    OnClick = function() --[[ Line: 195 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_props_2 (copy)
                        l_props_2.CellProps.CloseInput(true);
                    end
                }), 
                SubmitButton = v2.createElement(l_Button_0, {
                    BorderSizePixel = 0, 
                    Text = l_props_2.Localization:getText("Common", "Submit"), 
                    Size = UDim2.fromScale(0.125, 0.125), 
                    TextSize = v10.FONT_SIZE_LARGE, 
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Style = "RoundPrimary", 
                    StyleModifier = v39 and l_StyleModifier_1.Disabled or nil, 
                    OnClick = function() --[[ Line: 209 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_props_2 (copy)
                        l_props_2.CellProps.CloseInput(false);
                    end
                })
            })
        }));
    elseif l_props_2.Value.versionDescription == "" or not l_props_2.Value.versionDescription then
        return (v2.createElement(l_LinkText_0, {
            Style = {
                Font = v10.FONT, 
                TextSize = v10.FONT_SIZE_LARGE, 
                ForceUnderline = true, 
                ShowUnderline = true, 
                TextColor = l_props_2.CellProps.Theme.textColor
            }, 
            Text = l_props_2.Localization:getText("AssetConfigVersions", "AddNote"), 
            Position = UDim2.new(0, 2, 0, 5), 
            OnClick = function() --[[ Line: 227 ]] --[[ Name: OnClick ]]
                -- upvalues: v32 (copy), l_props_2 (copy)
                v32.onClickDesc(l_props_2.Value.assetVersionNumber);
            end
        }));
    else
        return (v2.createElement(l_LinkText_0, {
            Style = {
                Font = v10.FONT, 
                TextSize = v10.FONT_SIZE_LARGE, 
                TextColor = if v39 then l_props_2.CellProps.Theme.errorColor else l_props_2.CellProps.Theme.textColor
            }, 
            Text = if v35 then v36 else l_props_2.Value.versionDescription, 
            TextWrapped = not v35 or nil, 
            Position = UDim2.new(0, 2, 0, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            OnClick = function() --[[ Line: 245 ]] --[[ Name: OnClick ]]
                -- upvalues: v32 (copy), l_props_2 (copy)
                v32.onClickDesc(l_props_2.Value.assetVersionNumber);
            end
        }));
    end;
end;
v19.render = function(v40) --[[ Line: 251 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v20 (copy), v2 (copy), l_Pane_0 (copy), v10 (copy), l_formatLocalDateTime_0 (copy), l_Checkbox_0 (copy)
    local l_props_3 = v40.props;
    local l_Value_0 = l_props_3.Value;
    local l_Style_0 = l_props_3.Style;
    local v44 = l_props_3.Width or UDim.new(1 / #l_props_3.Columns, 0);
    local l_Theme_0 = l_props_3.CellProps.Theme;
    local l_CurrentVersion_0 = l_props_3.CellProps.CurrentVersion;
    local l_SelectVersion_0 = l_props_3.CellProps.SelectVersion;
    local l_OpenInputKey_0 = l_props_3.CellProps.OpenInputKey;
    local l_BackgroundOdd_0 = l_Style_0.BackgroundOdd;
    local l_IdsToUsernames_0 = l_props_3.CellProps.IdsToUsernames;
    local v51 = v7.new();
    local v52 = nil;
    v52 = if typeof(l_Value_0) == "number" and math.floor(l_Value_0) ~= l_Value_0 then ("%.3f"):format(l_Value_0) else tostring(l_Value_0);
    if l_props_3.ColumnIndex == v20.Version then
        local v53 = l_Value_0 == l_CurrentVersion_0;
        if l_OpenInputKey_0 ~= -1 then
            return v2.createElement(l_Pane_0, {
                LayoutOrder = l_props_3.ColumnIndex, 
                Padding = 5, 
                Style = "Box", 
                BackgroundColor3 = l_BackgroundOdd_0, 
                BorderSizePixel = 1, 
                BorderColor3 = l_Style_0.Border, 
                Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
                ClipsDescendants = true
            }, {
                Container = v2.createElement("ImageButton", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    [v2.Event.Activated] = v40.onClickOut
                }, {
                    TextFrame = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = v51:getNextOrder()
                    }, {
                        Text = v2.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Text = if v53 then string.format("%s (%s)", v52, l_props_3.Localization:getText("AssetConfigVersions", "CurrentLabel")) else v52, 
                            TextColor3 = l_Theme_0.textColor, 
                            Font = v10.FONT, 
                            TextSize = v10.FONT_SIZE_LARGE, 
                            Position = UDim2.new(0, 2, 0, 2), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top
                        })
                    })
                })
            });
        else
            return v2.createElement(l_Pane_0, {
                LayoutOrder = l_props_3.ColumnIndex, 
                Padding = 5, 
                Style = "Box", 
                BackgroundColor3 = l_BackgroundOdd_0, 
                BorderSizePixel = 1, 
                BorderColor3 = l_Style_0.Border, 
                Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
                ClipsDescendants = true
            }, {
                TextFrame = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = v51:getNextOrder()
                }, {
                    Text = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = if v53 then string.format("%s (%s)", v52, l_props_3.Localization:getText("AssetConfigVersions", "CurrentLabel")) else v52, 
                        TextColor3 = l_Theme_0.textColor, 
                        Font = v10.FONT, 
                        TextSize = v10.FONT_SIZE_LARGE, 
                        Position = UDim2.new(0, 2, 0, 2), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    })
                })
            });
        end;
    elseif l_props_3.ColumnIndex == v20.Description then
        local v54 = l_formatLocalDateTime_0(l_Value_0.created, "L LTS", l_props_3.Localization:getLocale());
        local v55 = l_IdsToUsernames_0[l_Value_0.creatorId];
        local v56 = nil;
        v56 = if v55 then string.format("%s   \226\128\162   %s", v54, v55) else if Enum.CreatorType[l_Value_0.creatorType] == Enum.CreatorType.User then string.format("%s   \226\128\162   <i>%s</i>", v54, l_props_3.Localization:getText("AssetConfigVersions", "RevokedUser")) else v54;
        return v2.createElement(l_Pane_0, {
            LayoutOrder = l_props_3.ColumnIndex, 
            Padding = 5, 
            Style = "Box", 
            BackgroundColor3 = l_BackgroundOdd_0, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Style_0.Border, 
            Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
            ClipsDescendants = true
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            CreatedFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v51:getNextOrder(), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                Created = v2.createElement("TextLabel", {
                    BorderSizePixel = 0, 
                    RichText = true, 
                    Text = v56, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextColor3 = l_Theme_0.dimmedTextColor, 
                    Font = v10.FONT, 
                    TextSize = v10.FONT_SIZE_LARGE, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Position = UDim2.new(0, 2, 0, 2)
                })
            }), 
            DescriptionFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v51:getNextOrder(), 
                Size = UDim2.new(1, 0, 0.9, 0)
            }, {
                Container = if l_OpenInputKey_0 ~= -1 then v2.createElement("ImageButton", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    [v2.Event.Activated] = v40.onClickOut
                }, {
                    DescriptionComponent = v40:createDescriptionComponent()
                }) else v40:createDescriptionComponent()
            })
        });
    elseif l_props_3.ColumnIndex == v20.Restore then
        local v57 = l_SelectVersion_0 == l_Value_0;
        local v58 = l_Value_0 == l_CurrentVersion_0;
        return v2.createElement(l_Pane_0, {
            LayoutOrder = l_props_3.ColumnIndex, 
            Padding = 5, 
            Style = "Box", 
            BackgroundColor3 = l_BackgroundOdd_0, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Style_0.Border, 
            Size = UDim2.new(v44.Scale, v44.Offset, 1, 0), 
            ClipsDescendants = true, 
            Layout = Enum.FillDirection.Vertical
        }, {
            CheckboxContainer = if l_OpenInputKey_0 ~= -1 then v2.createElement("ImageButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                [v2.Event.Activated] = v40.onClickOut
            }, {
                Pane = v2.createElement(l_Pane_0, {
                    LayoutOrder = l_props_3.ColumnIndex, 
                    Size = UDim2.fromScale(1, 1), 
                    ClipsDescendants = true, 
                    Layout = Enum.FillDirection.Vertical
                }, {
                    Checkbox = v2.createElement(l_Checkbox_0, {
                        Key = v52, 
                        Disabled = v58, 
                        OnClick = function() --[[ Line: 458 ]] --[[ Name: OnClick ]]
                            -- upvalues: v40 (copy), l_Value_0 (copy), v58 (copy), v57 (copy)
                            v40.onCheck(l_Value_0, v58, v57);
                        end, 
                        Checked = v57
                    })
                })
            }) else v2.createElement(l_Checkbox_0, {
                Key = v52, 
                Disabled = v58, 
                OnClick = function() --[[ Line: 469 ]] --[[ Name: OnClick ]]
                    -- upvalues: v40 (copy), l_Value_0 (copy), v58 (copy), v57 (copy)
                    v40.onCheck(l_Value_0, v58, v57);
                end, 
                Checked = v57
            })
        });
    else
        return;
    end;
end;
v19 = l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v19);
return {
    Enum = v20, 
    Component = v19
};