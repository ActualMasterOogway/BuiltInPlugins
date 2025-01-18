local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.Images);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextService_0 = game:GetService("TextService");
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_DropdownMenu_0 = v3.UI.DropdownMenu;
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v14 = require(l_Permissions_0.CollaboratorSearchItem);
local v15 = v2.PureComponent:extend("CollaboratorSearchBar");
local function _(v16) --[[ Line: 76 ]] --[[ Name: stripSearchTerm ]]
    return v16 and v16:gsub("\n", " ") or "";
end;
v15.init = function(v18) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_TextService_0 (copy)
    v18.state = {
        text = "", 
        isFocused = false, 
        isContainerHovered = false, 
        isClearButtonHovered = false, 
        showDropdown = false, 
        dropdownItem = nil, 
        lastDelay = {}, 
        lastResults = {}, 
        mergedItems = {}
    };
    v18.textBoxRef = v2.createRef();
    v18.requestSearch = function() --[[ Line: 99 ]]
        -- upvalues: v18 (copy)
        v18.props.onSearchRequested(v18.state.text);
    end;
    v18.onContainerHovered = function() --[[ Line: 103 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            isContainerHovered = true
        });
    end;
    v18.onContainerHoverEnded = function() --[[ Line: 109 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            isContainerHovered = false
        });
    end;
    v18.onTextChanged = function(v19) --[[ Line: 115 ]]
        -- upvalues: v18 (copy), l_TextService_0 (ref)
        local l_Text_0 = v19.Text;
        local v21 = l_Text_0 and l_Text_0:gsub("\n", " ") or "";
        l_Text_0 = v18.textBoxRef.current;
        if v18.state.text ~= v21 then
            v18:setState({
                text = v21
            });
            if v18.props.onTextChanged then
                v18.props.onTextChanged(v21);
            end;
            local v22 = {};
            v18.state.lastDelay = v22;
            delay(0.5, function() --[[ Line: 128 ]]
                -- upvalues: v22 (copy), v18 (ref), v21 (copy)
                if v22 == v18.state.lastDelay and v21 ~= "" then
                    v18.requestSearch();
                    if not v18.state.showDropdown and next(v18.state.mergedItems) ~= nil then
                        v18.showDropdown();
                    end;
                end;
            end);
            if l_TextService_0:GetTextSize(v21, l_Text_0.TextSize, l_Text_0.Font, Vector2.new(1e999, 1e999)).x > l_Text_0.AbsoluteSize.x then
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Right;
                return;
            else
                l_Text_0.TextXAlignment = Enum.TextXAlignment.Left;
            end;
        end;
    end;
    v18.onTextBoxFocused = function(_) --[[ Line: 147 ]]
        -- upvalues: v18 (copy)
        local l_current_0 = v18.textBoxRef.current;
        v18:setState({
            isFocused = true
        });
        if not v18.props.Enabled then
            l_current_0:ReleaseFocus();
        end;
        if next(v18.state.mergedItems) ~= nil then
            v18.showDropdown();
        end;
    end;
    v18.onTextBoxFocusLost = function(_, _, _) --[[ Line: 163 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            isFocused = false, 
            isContainerHovered = false
        });
    end;
    v18.onClearButtonHovered = function() --[[ Line: 170 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            isClearButtonHovered = true
        });
    end;
    v18.onClearButtonHoverEnded = function() --[[ Line: 176 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            isClearButtonHovered = false
        });
    end;
    v18.onClearButtonClicked = function() --[[ Line: 182 ]]
        -- upvalues: v18 (copy)
        local l_current_1 = v18.textBoxRef.current;
        v18:setState({
            isFocused = true
        });
        l_current_1.Text = "";
        l_current_1:CaptureFocus();
        l_current_1.TextXAlignment = Enum.TextXAlignment.Left;
        v18.onClearButtonHoverEnded();
    end;
    v18.onItemClicked = function(v29) --[[ Line: 198 ]]
        -- upvalues: v18 (copy)
        v18.props.OnItemClicked(v29.Key);
        v18.hideDropdown();
    end;
    v18.showDropdown = function() --[[ Line: 203 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            showDropdown = true
        });
    end;
    v18.hideDropdown = function() --[[ Line: 209 ]]
        -- upvalues: v18 (copy), v2 (ref)
        if not v18.state.isFocused then
            v18:setState({
                showDropdown = false, 
                dropdownItem = v2.None
            });
        end;
    end;
    if v18.props.onTextChanged then
        v18.props.onTextChanged("");
    end;
end;
v15.mergeResultsTable = function(v30, v31) --[[ Line: 227 ]] --[[ Name: mergeResultsTable ]]
    local v32 = {};
    if next(v31) == nil then
        if not v30.props.LoadingMore and v30.state.text ~= "" then
            table.insert(v32, "NoResults");
        end;
    else
        local v33 = {};
        for v34, _ in pairs(v31) do
            table.insert(v33, v34);
        end;
        table.sort(v33, function(v36, v37) --[[ Line: 238 ]]
            -- upvalues: v31 (copy)
            return v31[v36].LayoutOrder < v31[v37].LayoutOrder;
        end);
        for _, v39 in ipairs(v33) do
            table.insert(v32, v39);
            for _, v41 in ipairs(v31[v39]) do
                table.insert(v32, v41);
            end;
        end;
    end;
    if v30.props.LoadingMore then
        table.insert(v32, "LoadingIndicator");
    end;
    return v32;
end;
v15.onRenderItem = function(v42, v43, v44, v45, v46, _) --[[ Line: 257 ]] --[[ Name: onRenderItem ]]
    -- upvalues: v2 (copy), v5 (copy), l_LoadingIndicator_0 (copy), v14 (copy)
    local l_props_0 = v42.props;
    local l_HeaderHeight_0 = l_props_0.HeaderHeight;
    local l_NoResultsText_0 = l_props_0.NoResultsText;
    local v51 = l_props_0.TextPadding or 16;
    local l_searchBar_0 = v46.assetConfig.packagePermissions.searchBar;
    if typeof(v43) == "string" and v43 ~= "LoadingIndicator" and v43 ~= "NoResults" then
        return v2.createElement("TextLabel", {
            BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
            BorderSizePixel = 0, 
            LayoutOrder = v44, 
            Font = v5.FONT, 
            Size = UDim2.new(1, 0, 0, l_HeaderHeight_0), 
            Text = v43, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            TextSize = 16, 
            TextColor3 = l_searchBar_0.placeholderText
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v51)
            })
        });
    elseif v43 == "NoResults" then
        return v2.createElement("TextLabel", {
            BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
            BorderSizePixel = 0, 
            Font = v5.FONT, 
            LayoutOrder = v44, 
            Text = l_NoResultsText_0, 
            TextSize = v5.FONT_SIZE_TITLE, 
            TextColor3 = v46.assetConfig.textColor, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0, 50)
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v51)
            })
        });
    elseif v43 == "LoadingIndicator" then
        return v2.createElement("Frame", {
            BackgroundColor3 = l_searchBar_0.dropDown.backgroundColor, 
            BorderSizePixel = 0, 
            LayoutOrder = v44, 
            Size = UDim2.new(1, 0, 0, 50)
        }, {
            LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                ZIndex = 3
            })
        });
    else
        return v2.createElement(v14, {
            Icon = v43.Icon, 
            LayoutOrder = v44, 
            Name = v43.Name, 
            OnActivated = v45, 
            Size = UDim2.new(1, 0, 0, 50), 
            TextPadding = v51
        });
    end;
end;
v15.render = function(v53) --[[ Line: 326 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), v6 (copy), v5 (copy), l_DropdownMenu_0 (copy)
    local l_props_1 = v53.props;
    local l_state_0 = v53.state;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v57 = l_LayoutOrderIterator_0.new();
    local v58 = l_props_1.LayoutOrder or 0;
    local l_text_0 = l_state_0.text;
    local v60 = l_state_0.isFocused and l_props_1.Enabled;
    local v61 = l_state_0.isContainerHovered and l_props_1.Enabled;
    local l_isClearButtonHovered_0 = l_state_0.isClearButtonHovered;
    local l_searchBar_1 = l_Stylizer_0.assetConfig.packagePermissions.searchBar;
    local v64 = nil;
    v64 = if v60 then l_searchBar_1.borderSelected else if v61 then l_searchBar_1.borderHover else l_searchBar_1.border;
    local l_DefaultText_0 = l_props_1.DefaultText;
    local l_ErrorText_0 = l_props_1.ErrorText;
    local _ = l_props_1.NoResultsText;
    local l_showDropdown_0 = l_state_0.showDropdown;
    local v69 = v53.textBoxRef and v53.textBoxRef.current;
    if v69 then
        v69 = v69.Parent;
    end;
    local v70 = nil;
    if v69 then
        local l_AbsolutePosition_0 = v69.AbsolutePosition;
        local v72 = l_AbsolutePosition_0 + v69.AbsoluteSize;
        v70 = Rect.new(l_AbsolutePosition_0.X, l_AbsolutePosition_0.Y, v72.X, v72.Y);
    end;
    local v73 = l_props_1.Results or {};
    local _ = l_props_1.HeaderHeight;
    local l_ItemHeight_0 = l_props_1.ItemHeight;
    local l_MaxItems_0 = l_props_1.MaxItems;
    local _ = l_props_1.ShowRibbon;
    local v78 = l_props_1.TextPadding or 16;
    local _ = l_props_1.ScrollBarPadding;
    local _ = l_props_1.ScrollBarThickness;
    if not l_MaxItems_0 or not (l_MaxItems_0 * l_ItemHeight_0) then
        local _ = nil;
    end;
    local _ = l_state_0.dropdownItem;
    if l_state_0.lastResults ~= v73 then
        l_state_0.mergedItems = v53:mergeResultsTable(v73);
        l_state_0.lastResults = v73;
    end;
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v58, 
        BackgroundColor3 = l_Stylizer_0.inputFields.backgroundColor, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Background = v2.createElement("ImageLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Image = v6.ROUNDED_BORDER_IMAGE, 
            ImageColor3 = v64, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v5.ROUNDED_FRAME_SLICE, 
            [v2.Event.MouseEnter] = v53.onContainerHovered, 
            [v2.Event.MouseMoved] = v53.onContainerHovered, 
            [v2.Event.MouseLeave] = v53.onContainerHoverEnded
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            TextBox = v2.createElement("TextBox", {
                Font = v5.FONT, 
                TextSize = v5.FONT_SIZE_TITLE, 
                TextColor3 = l_Stylizer_0.assetConfig.textColor, 
                LayoutOrder = v57:getNextOrder(), 
                Size = UDim2.new(1, -80, 0, 40), 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = l_props_1.Enabled and l_text_0 or "", 
                TextEditable = l_props_1.Enabled, 
                PlaceholderText = l_ErrorText_0 or l_DefaultText_0, 
                PlaceholderColor3 = l_ErrorText_0 and l_Stylizer_0.warningColor or l_searchBar_1.placeholderText, 
                [v2.Ref] = v53.textBoxRef, 
                [v2.Change.Text] = v53.onTextChanged, 
                [v2.Event.Focused] = v53.onTextBoxFocused, 
                [v2.Event.FocusLost] = v53.onTextBoxFocusLost
            }, {
                TextPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v78)
                }), 
                Dropdown = v2.createElement(l_DropdownMenu_0, {
                    Hide = not (l_showDropdown_0 and v69), 
                    Items = v53.state.mergedItems, 
                    OnFocusLost = v53.hideDropdown, 
                    OnItemActivated = v53.onItemClicked, 
                    OnRenderItem = function(v83, v84, v85) --[[ Line: 464 ]] --[[ Name: OnRenderItem ]]
                        -- upvalues: v53 (copy), l_Stylizer_0 (copy), v70 (ref)
                        return v53:onRenderItem(v83, v84, v85, l_Stylizer_0, v70);
                    end, 
                    Width = v70 and v70.Width or nil
                })
            }), 
            ClearButtonFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v57:getNextOrder(), 
                Size = UDim2.new(0, 40, 0, 40)
            }, {
                ClearButton = v2.createElement("ImageButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 24, 0, 24), 
                    BackgroundTransparency = 1, 
                    Visible = l_text_0 ~= "", 
                    Image = l_isClearButtonHovered_0 and v6.CLEAR_ICON_HOVER or v6.CLEAR_ICON, 
                    ImageColor3 = l_searchBar_1.clearButton.image, 
                    [v2.Event.MouseEnter] = v53.onClearButtonHovered, 
                    [v2.Event.MouseMoved] = v53.onClearButtonHovered, 
                    [v2.Event.MouseLeave] = v53.onClearButtonHoverEnded, 
                    [v2.Event.MouseButton1Down] = v53.onClearButtonClicked
                })
            }), 
            ImageFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = v57:getNextOrder(), 
                Size = UDim2.new(0, 40, 0, 40)
            }, {
                Image = v2.createElement("ImageLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 20, 0, 20), 
                    BackgroundTransparency = 1, 
                    Image = v6.SEARCH_ICON, 
                    ImageColor3 = l_Stylizer_0.assetConfig.packagePermissions.searchBar.searchIcon
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));