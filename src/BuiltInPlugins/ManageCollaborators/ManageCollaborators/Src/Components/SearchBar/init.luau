local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v7 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v7.Style.Stylizer;
local l_LayoutOrderIterator_0 = v7.Util.LayoutOrderIterator;
local l_COLLABORATORTYPE_USER_0 = v3.COLLABORATORTYPE_USER;
local v11 = require(l_Parent_0.Src.Util.PermissionsConstants);
local l_DropdownMenu_0 = v7.UI.DropdownMenu;
local v13 = require(l_Parent_0.Src.Util.CreateFitToContent);
local l_LoadingIndicator_0 = v7.UI.LoadingIndicator;
local l_TextService_0 = game:GetService("TextService");
local l_StudioManageCollabFixFocusError_0 = game:GetFastFlag("StudioManageCollabFixFocusError");
local v17 = v13("Frame", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Padding = UDim.new(0, 0)
});
local v18 = v13("Frame", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Padding = UDim.new(0, 0), 
    FillDirection = Enum.FillDirection.Horizontal
});
local v19 = v13("ImageLabel", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Padding = UDim.new(0, 0), 
    FillDirection = Enum.FillDirection.Horizontal
});
local v20 = v1.PureComponent:extend("SearchBar");
local function _(v21) --[[ Line: 88 ]] --[[ Name: stripSearchTerm ]]
    return v21 and v21:gsub("\n", " ") or "";
end;
v20.init = function(v23) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_TextService_0 (copy), l_StudioManageCollabFixFocusError_0 (copy), v2 (copy), l_COLLABORATORTYPE_USER_0 (copy), l_LoadingIndicator_0 (copy), v11 (copy), l_LayoutOrderIterator_0 (copy), v18 (copy)
    v23.state = {
        text = "", 
        isFocused = false, 
        isContainerHovered = false, 
        isClearButtonHovered = false, 
        isKeyHovered = false, 
        showDropdown = false, 
        dropdownItem = nil, 
        lastDelay = {}, 
        lastResults = {}, 
        mergedItems = {}
    };
    v23.textBoxRef = v1.createRef();
    v23.requestSearch = function() --[[ Line: 112 ]]
        -- upvalues: v23 (copy)
        v23.props.onSearchRequested(v23.state.text);
    end;
    v23.onContainerHovered = function() --[[ Line: 116 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            isContainerHovered = true
        });
    end;
    v23.onContainerHoverEnded = function() --[[ Line: 122 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            isContainerHovered = false
        });
    end;
    v23.onTextChanged = function(v24) --[[ Line: 128 ]]
        -- upvalues: v23 (copy), l_TextService_0 (ref)
        local l_Text_0 = v24.Text;
        local v26 = l_Text_0 and l_Text_0:gsub("\n", " ") or "";
        l_Text_0 = v23.textBoxRef.current;
        if l_Text_0 and v23.state.text ~= v26 then
            v23:setState({
                text = v26
            });
            if v23.props.onTextChanged then
                v23.props.onTextChanged(v26);
            end;
            local v27 = {};
            v23.state.lastDelay = v27;
            delay(0.5, function() --[[ Line: 141 ]]
                -- upvalues: v27 (copy), v23 (ref), v26 (copy)
                if v27 == v23.state.lastDelay and v26 ~= "" then
                    v23.requestSearch();
                    if not v23.state.showDropdown and next(v23.state.mergedItems) ~= nil then
                        v23.showDropdown();
                    end;
                end;
            end);
            if l_TextService_0:GetTextSize(v26, l_Text_0.TextSize, l_Text_0.Font, Vector2.new(0, 1e999)).x > l_Text_0.AbsoluteSize.x then
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Right;
                return;
            else
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Left;
            end;
        end;
    end;
    v23.onTextBoxFocused = function(v28, _) --[[ Line: 159 ]]
        -- upvalues: v23 (copy)
        local l_current_0 = v23.textBoxRef.current;
        v23:setState({
            isFocused = true
        });
        if not v28 then
            l_current_0:ReleaseFocus();
        end;
        if next(v23.state.mergedItems) ~= nil then
            v23.showDropdown();
        end;
    end;
    v23.onTextBoxFocusLost = function(_, _, _) --[[ Line: 175 ]]
        -- upvalues: l_StudioManageCollabFixFocusError_0 (ref), v23 (copy)
        if l_StudioManageCollabFixFocusError_0 and v23.isUnmounting then
            return;
        else
            v23:setState({
                isFocused = false, 
                isContainerHovered = false
            });
            if not v23.state.dropdownItem then
                v23.hideDropdown();
            end;
            return;
        end;
    end;
    v23.onClearButtonHovered = function() --[[ Line: 195 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            isClearButtonHovered = true
        });
    end;
    v23.onClearButtonHoverEnded = function() --[[ Line: 201 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            isClearButtonHovered = false
        });
    end;
    v23.onClearButtonClicked = function() --[[ Line: 207 ]]
        -- upvalues: v23 (copy)
        local l_current_1 = v23.textBoxRef.current;
        v23:setState({
            isFocused = true
        });
        l_current_1.Text = "";
        l_current_1:CaptureFocus();
        l_current_1.TextXAlignment = Enum.TextXAlignment.Left;
        v23.onClearButtonHoverEnded();
    end;
    v23.onItemClicked = function(v35) --[[ Line: 223 ]]
        -- upvalues: v23 (copy)
        v23.props.OnItemClicked(v35.Key);
        v23.hideDropdown();
    end;
    v23.showDropdown = function() --[[ Line: 228 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            showDropdown = true
        });
    end;
    v23.hideDropdown = function() --[[ Line: 234 ]]
        -- upvalues: v23 (copy), v1 (ref)
        if not v23.state.isFocused then
            v23:setState({
                showDropdown = false, 
                dropdownItem = v1.None, 
                isKeyHovered = false
            });
            if game:GetFastFlag("StudioManageCollabFixClearDoubleClick") and v23.state.isClearButtonHovered then
                v23.onClearButtonClicked();
            end;
        end;
    end;
    v23.onKeyMouseEnter = function(v36) --[[ Line: 250 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            dropdownItem = v36, 
            isKeyHovered = true
        });
    end;
    v23.onKeyMouseLeave = function(v37) --[[ Line: 257 ]]
        -- upvalues: v23 (copy), v1 (ref)
        if v23.state.dropdownItem == v37 then
            v23:setState({
                dropdownItem = v1.None, 
                isKeyHovered = false
            });
        end;
    end;
    v23.onRenderItem = function(v38, v39, v40) --[[ Line: 266 ]]
        -- upvalues: v23 (copy), v1 (ref), v2 (ref), l_COLLABORATORTYPE_USER_0 (ref), l_LoadingIndicator_0 (ref), v11 (ref), l_LayoutOrderIterator_0 (ref), v18 (ref)
        local l_props_0 = v23.props;
        local l_Stylizer_1 = l_props_0.Stylizer;
        local l_IsGroupGame_0 = l_props_0.IsGroupGame;
        local l_Localization_1 = l_props_0.Localization;
        local l_searchBar_0 = l_Stylizer_1.searchBar;
        local l_dropdownItem_0 = v23.state.dropdownItem;
        local l_NoResultsText_0 = l_props_0.NoResultsText;
        local l_HeaderHeight_0 = l_props_0.HeaderHeight;
        local l_ItemHeight_0 = l_props_0.ItemHeight;
        local l_textPadding_0 = l_searchBar_0.textPadding;
        local v51 = nil;
        local v52 = v23.textBoxRef and v23.textBoxRef.current;
        local l_Is17PlusGame_0 = l_props_0.Is17PlusGame;
        if v52 then
            v52 = v52.Parent;
            local l_AbsolutePosition_0 = v52.AbsolutePosition;
            local v55 = l_AbsolutePosition_0 + v52.AbsoluteSize;
            v51 = Rect.new(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y, v55.X, v55.Y);
        end;
        local v56 = v51.Width - l_searchBar_0.dropDown.item.offset;
        if typeof(v38) == "string" and v38 ~= "LoadingIndicator" and v38 ~= "NoResults" then
            return v1.createElement("Frame", {
                Size = UDim2.new(0, v56, 0, l_HeaderHeight_0), 
                BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
                LayoutOrder = v39, 
                BorderSizePixel = 0
            }, {
                CollabTypeText = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.searchBar.dropDown.collaboratorTypeText, {
                    Text = l_Localization_1:getText("CollaboratorTypes", v38), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Position = l_Stylizer_1.searchBar.collabTypeTextPosition, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                })), 
                FriendsEditAccessText = not (not not l_Is17PlusGame_0 or l_IsGroupGame_0) and v38 == l_COLLABORATORTYPE_USER_0 and v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.searchBar.dropDown.collaboratorTypeText, {
                    Text = l_Localization_1:getText("Description", "FriendsEditAccess"), 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    Position = l_searchBar_0.friendsAccessTextPosition, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                })) or nil
            });
        elseif v38 == "NoResults" then
            return v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Normal, {
                Size = UDim2.new(0, v56, 0, l_ItemHeight_0), 
                Text = l_NoResultsText_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
                BorderSizePixel = 0, 
                TextWrapped = true, 
                LayoutOrder = v39
            }), {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_textPadding_0)
                })
            });
        elseif v38 == "LoadingIndicator" then
            return v1.createElement("Frame", {
                Size = UDim2.new(0, v56, 0, l_ItemHeight_0), 
                BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
                BorderSizePixel = 0, 
                LayoutOrder = v39
            }, {
                LoadingIndicator = v1.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    ZIndex = 3
                })
            });
        else
            local l_Key_0 = v38.Key;
            local l_IsFriend_0 = v38.IsFriend;
            local v59 = l_Key_0.Type == v11.UserSubjectKey;
            local v60 = not l_Key_0.IsEligible;
            local v61 = nil;
            if v60 then
                v61 = l_Key_0.EligibilityText or l_Localization_1:getText("SearchBar", "UnknownError");
            end;
            local v62 = if l_IsFriend_0 then l_searchBar_0.nameHeight else l_ItemHeight_0;
            local v63 = false;
            if l_dropdownItem_0 == l_Key_0 then
                v63 = not v60;
            end;
            local v64 = l_LayoutOrderIterator_0.new();
            local v65 = v63 and l_searchBar_0.dropDown.hovered.backgroundColor or l_searchBar_0.dropDown.backgroundColor;
            return v1.createElement("ImageButton", {
                Size = UDim2.new(0, v56, 0, l_ItemHeight_0), 
                BackgroundColor3 = v65, 
                BorderSizePixel = 0, 
                LayoutOrder = v39, 
                AutoButtonColor = false, 
                Active = not v60, 
                [v1.Event.Activated] = v40, 
                [v1.Event.MouseEnter] = function() --[[ Line: 389 ]]
                    -- upvalues: v23 (ref), l_Key_0 (copy)
                    v23.onKeyMouseEnter(l_Key_0);
                end, 
                [v1.Event.MouseLeave] = function() --[[ Line: 392 ]]
                    -- upvalues: v23 (ref), l_Key_0 (copy)
                    v23.onKeyMouseLeave(l_Key_0);
                end
            }, {
                GrayOutBox = if v60 and l_props_0.Is17PlusGame then v1.createElement("Frame", {
                    AnchorPoint = Vector2.new(0, 0), 
                    Size = UDim2.new(0, v56, 0, l_ItemHeight_0), 
                    BackgroundTransparency = 0.75, 
                    LayoutOrder = v39
                }) else nil; 
                v1.createElement(v18, {
                    LayoutOrder = v39, 
                    BackgroundTransparency = 1
                }, {
                    IconFrame = v1.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = v64:getNextOrder(), 
                        Size = UDim2.new(0, l_ItemHeight_0, 0, l_ItemHeight_0)
                    }, {
                        SmallIcon = v1.createElement("Frame", {
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                            Size = UDim2.new(0, l_searchBar_0.thumbnailSize, 0, l_searchBar_0.thumbnailSize), 
                            BackgroundColor3 = v65, 
                            BorderSizePixel = 0
                        }, {
                            Icon = v38.Icon
                        }), 
                        Padding = v1.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, l_searchBar_0.thumbnailPaddingLeft)
                        })
                    }), 
                    NameAndFriendStatus = v1.createElement("Frame", {
                        LayoutOrder = v64:getNextOrder(), 
                        Size = UDim2.new(0, l_searchBar_0.nameLabelWidth, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        Layout = v1.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 0)
                        }), 
                        TextFrame = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Normal, {
                            Size = UDim2.new(0, l_searchBar_0.nameLabelWidth, 0, v62), 
                            Text = v38.Name, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            TextColor3 = v63 and l_searchBar_0.dropDown.hovered.displayText or l_searchBar_0.dropDown.displayText, 
                            BackgroundTransparency = 1, 
                            TextWrapped = true, 
                            ClipsDescendants = true, 
                            LayoutOrder = 1, 
                            BorderSizePixel = 0
                        }), {
                            Padding = v1.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, l_searchBar_0.renderItemTextPadding)
                            })
                        }), 
                        FriendFrame = if l_IsFriend_0 then v1.createElement(v18, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1
                        }, {
                            Padding = v1.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, l_searchBar_0.renderItemTextPadding), 
                                PaddingBottom = UDim.new(0, l_searchBar_0.renderItemTextPadding)
                            }), 
                            FriendImageLabel = v1.createElement("ImageLabel", {
                                Size = UDim2.new(0, l_searchBar_0.friendIcon.Width, 0, l_searchBar_0.friendIcon.Height), 
                                Image = l_searchBar_0.friendIcon.Image, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 1
                            }), 
                            FriendTextLabel = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Subtext, {
                                Size = UDim2.new(1, 0, 0, l_searchBar_0.friendIcon.LabelHeight), 
                                AutomaticSize = Enum.AutomaticSize.X, 
                                Text = l_Localization_1:getText("SearchBar", "FriendLabel"), 
                                TextXAlignment = Enum.TextXAlignment.Left, 
                                TextColor3 = v63 and l_searchBar_0.dropDown.hovered.displayText or l_searchBar_0.dropDown.displayText, 
                                BackgroundTransparency = 1, 
                                LayoutOrder = 2, 
                                BorderSizePixel = 0
                            }), {
                                Padding = v1.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0, l_searchBar_0.renderItemTextPadding / 2)
                                })
                            })
                        }) else nil
                    }), 
                    RestrictionLabel = if v60 and l_props_0.Is17PlusGame and v59 then v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_1.fontStyle.Normal, {
                        Size = UDim2.new(0, l_searchBar_0.dropDown.eligibilityLabelWidth, 0, l_ItemHeight_0), 
                        Text = v61, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor3 = v63 and l_searchBar_0.dropDown.hovered.displayText or l_searchBar_0.dropDown.displayText, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v64:getNextOrder(), 
                        BorderSizePixel = 0
                    })) else nil
                })
            });
        end;
    end;
    if v23.props.onTextChanged then
        v23.props.onTextChanged("");
    end;
end;
v20.mergeResultsTable = function(v66, v67) --[[ Line: 537 ]] --[[ Name: mergeResultsTable ]]
    local v68 = {};
    if next(v67) == nil then
        if not v66.props.LoadingMore and v66.state.text ~= "" then
            table.insert(v68, "NoResults");
        end;
    else
        local v69 = {};
        for v70, _ in pairs(v67) do
            table.insert(v69, v70);
        end;
        table.sort(v69, function(v72, v73) --[[ Line: 548 ]]
            -- upvalues: v67 (copy)
            return v67[v72].LayoutOrder < v67[v73].LayoutOrder;
        end);
        for _, v75 in ipairs(v69) do
            table.insert(v68, v75);
            for _, v77 in ipairs(v67[v75]) do
                table.insert(v68, v77);
            end;
        end;
    end;
    if v66.props.LoadingMore then
        table.insert(v68, "LoadingIndicator");
    end;
    return v68;
end;
v20.render = function(v78) --[[ Line: 567 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v17 (copy), v19 (copy), v3 (copy), v2 (copy), l_DropdownMenu_0 (copy)
    local l_props_1 = v78.props;
    local l_Stylizer_2 = l_props_1.Stylizer;
    local l_Mouse_0 = l_props_1.Mouse;
    local l_state_0 = v78.state;
    local v83 = l_props_1.LayoutOrder or 0;
    local l_text_0 = l_state_0.text;
    local v85 = l_state_0.isFocused and l_props_1.Enabled;
    local v86 = l_state_0.isContainerHovered and l_props_1.Enabled;
    local v87 = (not not v78.state.isClearButtonHovered or v78.state.isKeyHovered) and l_props_1.Enabled;
    local v88 = v78.state.isContainerHovered and l_props_1.Enabled;
    if v87 then
        l_Mouse_0:__pushCursor("PointingHand");
    elseif v88 then
        l_Mouse_0:__pushCursor("IBeam");
    else
        l_Mouse_0:__resetCursor();
    end;
    local l_searchBar_1 = l_Stylizer_2.searchBar;
    local v90 = nil;
    v90 = if v85 then l_searchBar_1.borderSelected else if v86 then l_searchBar_1.borderHover else l_searchBar_1.border;
    local l_DefaultText_0 = l_props_1.DefaultText;
    local l_ErrorText_0 = l_props_1.ErrorText;
    local v93 = l_state_0.showDropdown and v78.state.text ~= "";
    local v94 = v78.textBoxRef and v78.textBoxRef.current;
    if v94 then
        v94 = v94.Parent;
    end;
    local v95 = nil;
    if v94 then
        local l_AbsolutePosition_1 = v94.AbsolutePosition;
        local v97 = l_AbsolutePosition_1 + v94.AbsoluteSize;
        v95 = Rect.new(l_AbsolutePosition_1.X, l_AbsolutePosition_1.Y, v97.X, v97.Y);
    end;
    local v98 = l_props_1.Results or {};
    if l_state_0.lastResults ~= v98 then
        l_state_0.mergedItems = v78:mergeResultsTable(v98);
        l_state_0.lastResults = v98;
    end;
    return v1.createElement(v17, {
        BackgroundTransparency = 1, 
        LayoutOrder = v83
    }, {
        Background = v1.createElement(v19, {
            BackgroundTransparency = 1, 
            Image = v3.ROUNDED_BORDER_IMAGE, 
            ImageColor3 = v90, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v3.ROUNDED_FRAME_SLICE, 
            [v1.Event.MouseEnter] = v78.onContainerHovered, 
            [v1.Event.MouseMoved] = v78.onContainerHovered, 
            [v1.Event.MouseLeave] = v78.onContainerHoverEnded
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12)
            }), 
            TextBox = v1.createElement("TextBox", v2.Dictionary.join(l_Stylizer_2.fontStyle.Normal, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, -l_searchBar_1.searchBarHeight, 0, l_searchBar_1.searchBarHeight), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                ClearTextOnFocus = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_props_1.Enabled and l_text_0 or "", 
                TextEditable = l_props_1.Enabled, 
                PlaceholderText = l_ErrorText_0 or l_DefaultText_0, 
                PlaceholderColor3 = l_ErrorText_0 and l_Stylizer_2.warningColor or l_searchBar_1.placeholderText, 
                [v1.Ref] = v78.textBoxRef, 
                [v1.Change.Text] = v78.onTextChanged, 
                [v1.Event.Focused] = function(...) --[[ Line: 679 ]]
                    -- upvalues: v78 (copy), l_props_1 (copy)
                    v78.onTextBoxFocused(l_props_1.Enabled, ...);
                end, 
                [v1.Event.FocusLost] = v78.onTextBoxFocusLost
            }), {
                Dropdown = v94 and v1.createElement(l_DropdownMenu_0, {
                    Hide = not v93, 
                    Items = v78.state.mergedItems, 
                    OnFocusLost = v78.hideDropdown, 
                    OnItemActivated = v78.onItemClicked, 
                    OnRenderItem = v78.onRenderItem, 
                    Style = "Search", 
                    Width = v95.Width, 
                    MaxHeight = l_searchBar_1.dropDown.maxHeight
                })
            }), 
            ClearButtonFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(0, l_searchBar_1.searchBarHeight, 0, l_searchBar_1.searchBarHeight)
            }, {
                ClearButton = v1.createElement("ImageButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, l_searchBar_1.clearButtonIconSize, 0, l_searchBar_1.clearButtonIconSize), 
                    BackgroundTransparency = 1, 
                    Visible = l_text_0 ~= "", 
                    Image = l_Stylizer_2.deleteIcon, 
                    [v1.Event.MouseEnter] = v78.onClearButtonHovered, 
                    [v1.Event.MouseMoved] = v78.onClearButtonHovered, 
                    [v1.Event.MouseLeave] = v78.onClearButtonHoverEnded, 
                    [v1.Event.MouseButton1Down] = v78.onClearButtonClicked
                })
            })
        })
    });
end;
v20.didMount = function(v99) --[[ Line: 721 ]] --[[ Name: didMount ]]
    -- upvalues: l_StudioManageCollabFixFocusError_0 (copy)
    if l_StudioManageCollabFixFocusError_0 then
        v99.isUnmounting = false;
    end;
end;
v20.willUnmount = function(v100) --[[ Line: 727 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_StudioManageCollabFixFocusError_0 (copy)
    if l_StudioManageCollabFixFocusError_0 then
        v100.isUnmounting = true;
    end;
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0, 
    Mouse = l_ContextServices_0.Mouse
})(v20));