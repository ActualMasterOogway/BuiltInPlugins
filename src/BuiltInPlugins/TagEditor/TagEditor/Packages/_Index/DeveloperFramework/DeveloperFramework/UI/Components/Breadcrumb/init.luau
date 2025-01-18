local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = game:DefineFastFlag("DevFrameworkUpdateBreadcrumbIcons", false);
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.Styling.joinTags);
local v8 = require(l_Parent_0.Styling.hasTag);
local v9 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v9.join;
local l_trim_0 = v9.trim;
local v12 = require(l_Parent_0.UI.Components.Image);
local v13 = require(l_Parent_0.UI.Components.Pane);
local v14 = require(l_Parent_0.UI.Components.TextInput);
local v15 = require(l_Parent_0.UI.Components.TextLabel);
local l_Util_0 = l_Parent_0.Util;
local v17 = require(l_Util_0.DoubleClickDetector);
local v18 = require(l_Util_0.LayoutOrderIterator);
local v19 = require(l_Util_0.Typecheck);
local v20 = v1.PureComponent:extend("Breadcrumb");
v19.wrap(v20, script);
v20.init = function(v21) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy)
    v21.state = {
        editText = v21.props.Text or ""
    };
    v21.onTextChanged = function(v22) --[[ Line: 60 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            editText = v22
        });
    end;
    v21.onEdited = function() --[[ Line: 65 ]]
        -- upvalues: v21 (copy)
        if v21.props.OnEdited then
            v21.props.OnEdited(v21.state.editText);
        end;
    end;
    v21.DoubleClickDetector = v17.new();
    v21.onPress = function() --[[ Line: 72 ]]
        -- upvalues: v21 (copy)
        if v21.props.OnDoubleClick and v21.DoubleClickDetector:isDoubleClick() then
            v21.props.OnDoubleClick();
            return;
        else
            if v21.props.OnPressed then
                v21.props.OnPressed();
            end;
            return;
        end;
    end;
end;
v20.didUpdate = function(v23, v24) --[[ Line: 81 ]] --[[ Name: didUpdate ]]
    if not v23.props.Editing or v24.Text ~= v23.props.Text then
        v23:setState({
            editText = v23.props.Text
        });
    end;
end;
v20.render = function(v25) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v6 (copy), v5 (copy), v8 (copy), v1 (copy), v14 (copy), v12 (copy), l_join_0 (copy), l_trim_0 (copy), v15 (copy), v7 (copy), v13 (copy)
    local l_props_0 = v25.props;
    local l_state_0 = v25.state;
    local v28 = v18.new();
    local v29 = nil;
    local v30 = if v6 then l_props_0[v5.Tag] else nil;
    local v31 = if v6 then v8(v30, "PropertyCellError") else l_props_0.Style == "PropertyCellError";
    local v32 = if v6 then nil else l_props_0.Stylizer;
    local v33 = {};
    if l_props_0.Editing then
        v33.Text = v1.createElement(v14, {
            GetAutocompleteItems = l_props_0.GetAutocompleteItems, 
            LayoutOrder = v28:getNextOrder(), 
            OnTextChanged = v25.onTextChanged, 
            OnFocusLost = v25.onEdited, 
            Size = UDim2.fromScale(1, 1), 
            ShouldFocus = true, 
            Text = l_state_0.editText
        });
    elseif l_props_0.Delimiters then
        if v31 then
            v29 = v28:getNextOrder();
            v33[v29 .. " Icon"] = v1.createElement(v12, if v6 then {
                LayoutOrder = v29, 
                [v5.Tag] = "ErrorIcon"
            } else l_join_0(v32.ErrorImage, {
                LayoutOrder = v29
            }));
        end;
        local l_Text_0 = l_props_0.Text;
        while #l_Text_0 > 0 do
            local v35 = nil;
            local v36 = nil;
            for _, v38 in ipairs(l_props_0.Delimiters) do
                local v39, v40 = l_Text_0:find(v38);
                if v39 and (not v35 or v39 < v35) then
                    v35 = v39;
                    v36 = v40;
                end;
            end;
            local l_l_Text_0_0 = l_Text_0;
            local v42 = nil;
            if v35 then
                l_l_Text_0_0 = l_trim_0(l_Text_0:sub(1, v35 - 1));
                v42 = l_Text_0:sub(v35, v36);
                l_Text_0 = l_Text_0:sub(v36 + 1);
            else
                l_Text_0 = "";
            end;
            if l_props_0.GetImageProps then
                local v43 = l_props_0.GetImageProps(l_l_Text_0_0);
                if v43 then
                    v29 = v28:getNextOrder();
                    v33[v29 .. " Icon"] = v1.createElement(v12, l_join_0(v43, {
                        LayoutOrder = v29
                    }));
                end;
            end;
            if #l_l_Text_0_0 > 0 then
                v29 = v28:getNextOrder();
                v33[v29 .. " Text"] = v1.createElement(v15, if v6 then {
                    LayoutOrder = v29, 
                    Text = l_l_Text_0_0, 
                    [v5.Tag] = v7("X-Fit Left", v31 and "Error" or nil)
                } else {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v29, 
                    Text = l_l_Text_0_0, 
                    TextColor = v32.TextColor, 
                    TextXAlignment = Enum.TextXAlignment.Left
                });
            end;
            if v35 then
                if l_props_0.GetImageProps then
                    local v44 = l_props_0.GetImageProps(v42);
                    if v44 then
                        v29 = v28:getNextOrder();
                        v33[v29 .. " Icon"] = v1.createElement(v12, l_join_0(v44, {
                            LayoutOrder = v29
                        }));
                    end;
                end;
                v29 = v28:getNextOrder();
                v33[v29 .. " Delimiter"] = v1.createElement(v15, if v6 then {
                    LayoutOrder = v29, 
                    Text = v42, 
                    [v5.Tag] = v7("X-Fit Left", v31 and "Error" or nil)
                } else {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v29, 
                    Text = v42, 
                    TextColor = v32.TextColor, 
                    TextXAlignment = Enum.TextXAlignment.Left
                });
            end;
        end;
    else
        if l_props_0.GetImageProps then
            local v45 = l_props_0.GetImageProps(l_props_0.Text);
            if v45 then
                v29 = v28:getNextOrder();
                v33[v29 .. " Icon"] = v1.createElement(v12, l_join_0(v45, {
                    LayoutOrder = v29
                }));
            end;
        end;
        v29 = v28:getNextOrder();
        v33.Text = v1.createElement(v15, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v29, 
            Text = l_props_0.Text, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end;
    return v1.createElement(v13, if v6 then {
        AnchorPoint = l_props_0.AnchorPoint, 
        OnPress = if l_props_0.Editing then nil else v25.onPress, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        [v5.Tag] = v7("Component-Breadcrumb", v30, "X-RowS X-Left X-Middle")
    } else {
        AnchorPoint = l_props_0.AnchorPoint, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        OnPress = if l_props_0.Editing then nil else v25.onPress, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        Spacing = v32.Spacing, 
        Style = l_props_0.PaneStyle
    }, v33);
end;
local v46 = {
    Image = "rbxasset://textures/ClassImages.png", 
    ImageRectOffset = Vector2.new(0, 0), 
    ImageRectSize = Vector2.new(16, 16), 
    Size = UDim2.fromOffset(16, 16)
};
local v47 = pcall(function() --[[ Line: 270 ]]
    return game:GetService("StudioService"):GetClassIcon("Folder");
end);
v20.GetSelectorIcon = function(v48) --[[ Line: 275 ]]
    -- upvalues: v47 (copy), v46 (copy), v4 (copy), l_join_0 (copy)
    if not v48 then
        return nil;
    elseif not v47 then
        return v46;
    else
        local _, _, v51 = v48:find("^%s*([A-Za-z]+)");
        local v52 = nil;
        if v51 then
            if v48 == "ManualWeld" or v48 == "ManualGlue" then
                v48 = "JointInstance";
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 289 ]]
                -- upvalues: v51 (copy)
                return game:GetService("StudioService"):GetClassIcon(v51);
            end);
            if l_status_0 then
                v52 = l_result_0;
            else
                return nil;
            end;
        elseif v4 then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 300 ]]
                return settings().Studio.Theme.Name;
            end);
            if not l_status_1 then
                l_result_1 = "Dark";
            end;
            if v48:find("^%s*%.") then
                v52 = {
                    Image = ("rbxasset://studio_svg_textures/Lua/TagEditor/%*/Standard/Tag.png"):format(l_result_1)
                };
            else
                return nil;
            end;
        elseif v48:find("^%s*%.") then
            v52 = {
                Image = "rbxasset://textures/StyleEditor/style-tag.png"
            };
        elseif v48:find("^%s*:hover") then
            v52 = {
                Image = "rbxasset://textures/StyleEditor/style-hover.png"
            };
        else
            return nil;
        end;
        return l_join_0(v52, {
            Size = if v52.ImageRectSize then UDim2.fromOffset(v52.ImageRectSize.X, v52.ImageRectSize.Y) else UDim2.fromOffset(16, 16)
        });
    end;
end;
if not v6 then
    v20 = l_withContext_0({
        Stylizer = v2.Stylizer
    })(v20);
end;
return v20;