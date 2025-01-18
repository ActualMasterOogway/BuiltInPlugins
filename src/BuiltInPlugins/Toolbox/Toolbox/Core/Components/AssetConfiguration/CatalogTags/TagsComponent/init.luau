local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixNullRbxCrashes);
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Cryo);
local v6 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.AssetConfigConstants);
local v10 = require(l_Util_0.trimString);
local v11 = require(l_Util_0.TagsUtil);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v14 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_StyleModifier_0 = v6.Util.StyleModifier;
local l_GetTextSize_0 = v6.Util.GetTextSize;
local l_RoundBox_0 = v6.UI.RoundBox;
local l_withForwardRef_0 = v6.Wrappers.withForwardRef;
local l_Components_0 = l_Parent_0.Core.Components;
local v20 = require(l_Components_0.DropdownItemsList);
local v21 = require(l_Components_0.AssetConfiguration.CatalogTags.CatalogTag);
local v22 = require(l_Parent_0.Core.Networking.Requests.GetTagSuggestionsRequest);
local v23 = require(l_Parent_0.Core.Actions.SetTagSuggestions);
local v24 = 5 + v8.FONT_SIZE_MEDIUM + 5;
local v25 = v3.PureComponent:extend("TagsComponent");
v25.init = function(v26) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v10 (copy), v1 (copy)
    v26.state = {
        active = false, 
        textFieldPosition = Vector2.new(), 
        textFieldSize = Vector2.new()
    };
    v26.textBoxRef = v3.createRef();
    v26.textFieldRef = v3.createRef();
    v26.lastText = " ";
    v26.onTextFieldAbsoluteSizeChanged = function(v27) --[[ Line: 83 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            textFieldSize = v27.AbsoluteSize
        });
    end;
    v26.onTextFieldAbsolutePositionChanged = function(v28) --[[ Line: 87 ]]
        -- upvalues: v26 (copy)
        v26:setState({
            textFieldPosition = v28.AbsolutePosition
        });
    end;
    v26.onTextBoxFocused = function() --[[ Line: 91 ]]
        -- upvalues: v26 (copy)
        if not v26.state.active and v26.textBoxRef and v26.textBoxRef.current then
            v26.textBoxRef.current.CursorPosition = 9999;
            v26:setState({
                active = true
            });
        end;
    end;
    v26.onTextBoxFocusLost = function(v29, v30) --[[ Line: 98 ]]
        -- upvalues: v10 (ref), v26 (copy), v1 (ref)
        if v30 then
            if #v10(v29.Text) > 0 and #v26.props.suggestions > 0 then
                v26:addTag(v26.props.suggestions[1]);
                v26.props.clearSuggestions();
                v29.Text = " ";
            end;
            if v1() then
                if v29 then
                    v29:CaptureFocus();
                    return;
                end;
            else
                v29:CaptureFocus();
                return;
            end;
        elseif not v26.state.active or #v26.props.suggestions == 0 then
            v26:setState({
                active = false
            });
            return;
        elseif v1() then
            if v29 then
                v29:CaptureFocus();
                return;
            end;
        else
            v29:CaptureFocus();
        end;
    end;
    v26.onTextBoxTextChanged = function(v31) --[[ Line: 128 ]]
        -- upvalues: v26 (copy), v1 (ref), v10 (ref)
        local l_networkInterface_0 = v26.props.Network.networkInterface;
        local l_Text_0 = v31.Text;
        if l_Text_0 ~= v26.lastText then
            local v34 = false;
            if string.sub(l_Text_0, 1, 1) ~= " " then
                l_Text_0 = " " .. l_Text_0;
                local l_tags_0 = v26.props.tags;
                if #v26.lastText == 1 and #l_tags_0 > 0 then
                    v26:removeTag(l_tags_0[#l_tags_0].tagId);
                end;
                v34 = true;
            end;
            if string.sub(l_Text_0, #l_Text_0, #l_Text_0) == "\r" then
                l_Text_0 = string.sub(l_Text_0, 1, #l_Text_0 - 1);
                v34 = true;
            end;
            if not v26:canAddTags() then
                l_Text_0 = " ";
                v34 = true;
            end;
            if v34 then
                if v1() then
                    if v31 then
                        v31.Text = l_Text_0;
                        v31:ReleaseFocus();
                        v31:CaptureFocus();
                    end;
                else
                    v31.Text = l_Text_0;
                    v31:ReleaseFocus();
                    v31:CaptureFocus();
                end;
            end;
            v26.lastText = l_Text_0;
        end;
        local v36 = v10(l_Text_0);
        if #v36 > 0 then
            v26.props.getSuggestions(l_networkInterface_0, v26.props.tags, v36);
            return;
        else
            v26.props.clearSuggestions();
            return;
        end;
    end;
    v26.onTextBoxCursorPositionChanged = function(v37) --[[ Line: 180 ]]
        if v37.CursorPosition < 2 then
            v37.CursorPosition = 2;
        end;
    end;
end;
v25.canAddTags = function(v38) --[[ Line: 187 ]] --[[ Name: canAddTags ]]
    return #v38.props.tags < v38.props.maximumItemTagsPerItem;
end;
v25.addTag = function(v39, v40) --[[ Line: 191 ]] --[[ Name: addTag ]]
    -- upvalues: v11 (copy), v5 (copy)
    if v39:canAddTags() and not v11.hasTag(v39.props.tags, v40.tagId) then
        v39.props.onTagsChange(v5.List.join(v39.props.tags, {
            v40
        }));
    end;
end;
v25.removeTag = function(v41, v42) --[[ Line: 197 ]] --[[ Name: removeTag ]]
    local v43 = {};
    for v44 = 1, #v41.props.tags do
        local v45 = v41.props.tags[v44];
        if v45.tagId ~= v42 then
            table.insert(v43, v45);
        end;
    end;
    v41.props.onTagsChange(v43);
end;
v25.getDropdownItems = function(v46) --[[ Line: 208 ]] --[[ Name: getDropdownItems ]]
    local v47 = {};
    for _, v49 in pairs(v46.props.suggestions) do
        table.insert(v47, {
            name = v49.localizedDisplayName, 
            selectable = true
        });
    end;
    return v47;
end;
v25.clearSuggestions = function(v50) --[[ Line: 219 ]] --[[ Name: clearSuggestions ]]
    v50.props.clearSuggestions();
end;
v25.didMount = function(v51) --[[ Line: 223 ]] --[[ Name: didMount ]]
    if v51.textFieldRef.current then
        v51:setState({
            textFieldPosition = v51.textFieldRef.current.AbsolutePosition, 
            textFieldSize = v51.textFieldRef.current.AbsoluteSize
        });
    end;
end;
v25.render = function(v52) --[[ Line: 232 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_GetTextSize_0 (copy), v3 (copy), v21 (copy), v10 (copy), v24 (copy), v9 (copy), l_RoundBox_0 (copy), l_StyleModifier_0 (copy), v20 (copy)
    local l_props_0 = v52.props;
    local l_state_0 = v52.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local v59 = {};
    local v60 = 3 + v8.FONT_SIZE_TITLE + 3;
    local v61 = 0;
    local v62 = 10;
    local function _(v63) --[[ Line: 249 ]] --[[ Name: getNextPosition ]]
        -- upvalues: v62 (ref), l_state_0 (copy), v61 (ref), v60 (copy)
        local l_v62_0 = v62;
        if v62 + v63 > l_state_0.textFieldSize.X - 10 then
            v61 = v61 + 1;
            v62 = 10;
            l_v62_0 = v62;
        end;
        v62 = v62 + v63 + 3;
        return l_v62_0, 10 + v61 * (10 + v60);
    end;
    for v66 = 1, #l_props_0.tags do
        local v67 = l_props_0.tags[v66];
        local v68 = l_GetTextSize_0(v67.localizedDisplayName, v8.FONT_SIZE_TITLE, v8.FONT, Vector2.new(0, 0));
        local v69 = 3 + v68.X + 3 + 16 + 3;
        local v70 = 3 + v68.Y + 3;
        local l_v62_1 = v62;
        if v62 + v69 > l_state_0.textFieldSize.X - 10 then
            v61 = v61 + 1;
            v62 = 10;
            l_v62_1 = v62;
        end;
        v62 = v62 + v69 + 3;
        local l_l_v62_1_0 = l_v62_1;
        local v73 = 10;
        local v74 = 10 + v60;
        local v75 = v73 + v61 * v74;
        v59["Tag" .. v66] = v3.createElement(v21, {
            Text = v67.localizedDisplayName, 
            Position = UDim2.new(0, l_l_v62_1_0, 0, v75), 
            Size = UDim2.new(0, v69, 0, v70), 
            textSize = v68, 
            onClose = function() --[[ Line: 275 ]] --[[ Name: onClose ]]
                -- upvalues: v52 (copy), v67 (copy)
                v52:removeTag(v67.tagId);
            end
        });
    end;
    local l_v62_2 = v62;
    if v62 + 100 > l_state_0.textFieldSize.X - 10 then
        v61 = v61 + 1;
        v62 = 10;
        l_v62_2 = v62;
    end;
    v62 = v62 + 100 + 3;
    local l_l_v62_2_0 = l_v62_2;
    local v78 = 10;
    local v79 = 10 + v60;
    local v80 = v78 + v61 * v79;
    v59.TextBox = v3.createElement("TextBox", {
        BackgroundTransparency = 1, 
        ClearTextOnFocus = false, 
        ClipsDescendants = true, 
        Font = v8.FONT, 
        Position = UDim2.new(0, l_l_v62_2_0, 0, v80), 
        Size = UDim2.new(0, l_state_0.textFieldSize.X - l_l_v62_2_0, 0, v60), 
        TextColor3 = l_Stylizer_0.tags.textColor, 
        TextSize = v8.FONT_SIZE_TITLE, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Text = v52.lastText, 
        [v3.Event.Focused] = v52.onTextBoxFocused, 
        [v3.Event.FocusLost] = v52.onTextBoxFocusLost, 
        [v3.Change.Text] = v52.onTextBoxTextChanged, 
        [v3.Change.CursorPosition] = v52.onTextBoxCursorPositionChanged, 
        [v3.Ref] = v52.textBoxRef
    });
    l_v62_2 = v10(v52.lastText);
    v78 = false;
    if #l_v62_2 > 0 then
        v78 = false;
        if #l_props_0.suggestions == 0 then
            v78 = l_v62_2 == l_props_0.latestTagSearchQuery;
        end;
    end;
    local v81 = nil;
    v79 = nil;
    if v78 then
        v81 = l_Stylizer_0.inputFields.error;
        v79 = l_props_0.Localization:getText("Tags", "NoTagFound");
    else
        v81 = l_Stylizer_0.inputFields.toolTip;
        v79 = l_props_0.Localization:getText("Tags", "MaxTagsDescription", {
            max = l_props_0.maximumItemTagsPerItem
        });
    end;
    local v82 = 10 + v60;
    local v83 = 10 + v60;
    local v84 = v82 + v61 * v83 + 10 + v24;
    return v3.createElement("Frame", {
        Active = true, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, v84 + 10), 
        [v3.Ref] = l_props_0.ForwardRef
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, 0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Title = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v8.FONT, 
            Size = UDim2.new(0, v9.TITLE_GUTTER_WIDTH, 1, 0), 
            Text = l_Title_0, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            TextSize = v8.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            LayoutOrder = 1
        }), 
        Content = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -v9.TITLE_GUTTER_WIDTH, 0, v84)
        }, {
            Textfield = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, -v24), 
                [v3.Change.AbsoluteSize] = v52.onTextFieldAbsoluteSizeChanged, 
                [v3.Change.AbsolutePosition] = v52.onTextFieldAbsolutePositionChanged, 
                [v3.Ref] = v52.textFieldRef
            }, {
                Textfield = v3.createElement(l_RoundBox_0, {
                    Style = v78 and "TagsComponentError" or "TagsComponent", 
                    StyleModifier = not v52:canAddTags() and l_StyleModifier_0.Disabled or l_state_0.active and l_StyleModifier_0.Selected or nil
                }, v59)
            }), 
            Description = v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v24), 
                Position = UDim2.new(0, 0, 1, -v24), 
                LayoutOrder = 2, 
                Text = v79, 
                TextColor3 = v81, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        Suggestions = l_state_0.active and v52:canAddTags() and #l_props_0.suggestions > 0 and v3.createElement(v20, {
            items = v52:getDropdownItems(), 
            onItemClicked = function(v85) --[[ Line: 388 ]] --[[ Name: onItemClicked ]]
                -- upvalues: v52 (copy), l_props_0 (copy)
                v52.lastText = " ";
                v52:addTag(l_props_0.suggestions[v85]);
                v52.props.clearSuggestions();
                if v52.textBoxRef and v52.textBoxRef.current then
                    v52.textBoxRef.current:CaptureFocus();
                end;
            end, 
            closeDropdown = function() --[[ Line: 397 ]] --[[ Name: closeDropdown ]]
                -- upvalues: v52 (copy)
                v52:setState({
                    active = false
                });
                if v52.textBoxRef and v52.textBoxRef.current then
                    v52.textBoxRef.current:ReleaseFocus();
                end;
            end, 
            dropDownWidth = l_state_0.textFieldSize.X, 
            top = l_state_0.textFieldPosition.Y + l_state_0.textFieldSize.Y, 
            left = l_state_0.textFieldPosition.X, 
            windowPosition = l_state_0.textFieldPosition, 
            windowSize = l_state_0.textFieldSize, 
            setDropdownHeight = l_props_0.setDropdownHeight
        })
    });
end;
local function v88(v86, _) --[[ Line: 417 ]] --[[ Name: mapStateToProps ]]
    v86 = v86 or {};
    return {
        suggestions = v86.tagSuggestions or {}, 
        latestTagSuggestionTime = v86.latestTagSuggestionTime or 0, 
        latestTagSearchQuery = v86.latestTagSearchQuery
    };
end;
local function v93(v89) --[[ Line: 426 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v22 (copy), v23 (copy)
    return {
        getSuggestions = function(v90, v91, v92) --[[ Line: 428 ]] --[[ Name: getSuggestions ]]
            -- upvalues: v89 (copy), v22 (ref)
            v89(v22(v90, v91, v92));
        end, 
        clearSuggestions = function() --[[ Line: 432 ]] --[[ Name: clearSuggestions ]]
            -- upvalues: v89 (copy), v23 (ref)
            v89(v23({}, tick(), ""));
        end
    };
end;
v25 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v14
})(v25);
return l_withForwardRef_0((v4.connect(v88, v93)(v25)));