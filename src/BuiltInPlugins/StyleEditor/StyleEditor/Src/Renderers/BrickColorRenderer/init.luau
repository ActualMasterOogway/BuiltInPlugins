local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local v5 = require(l_Parent_0.Packages.Framework);
local l_IconButton_0 = v5.UI.IconButton;
local l_Pane_0 = v5.UI.Pane;
local l_TextInput_0 = v5.UI.TextInput;
local l_TextLabel_0 = v5.UI.TextLabel;
local v10 = require(l_Parent_0.Packages.Dash);
local l_map_0 = v10.map;
local l_filter_0 = v10.filter;
local v13 = require(script.getAllBrickColors);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local v17 = l_map_0(v13(), function(v16) --[[ Line: 43 ]]
    return {
        Value = v16.Name, 
        BrickColor = v16, 
        NameLower = v16.Name:lower()
    };
end);
local function v21(v18) --[[ Line: 51 ]] --[[ Name: filterAutocompleteItems ]]
    -- upvalues: l_filter_0 (copy), v17 (copy)
    local v19 = v18:lower();
    return l_filter_0(v17, function(v20) --[[ Line: 54 ]]
        -- upvalues: v19 (copy)
        return v20.NameLower:match(v19);
    end);
end;
local function v25(v22) --[[ Line: 59 ]] --[[ Name: getValue ]]
    if typeof(v22) == "BrickColor" then
        return v22;
    elseif typeof(v22) == "Color3" then
        return BrickColor.new(v22);
    elseif typeof(v22) == "string" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 69 ]]
            -- upvalues: v22 (copy)
            return Color3.fromHex(v22);
        end);
        if l_status_0 then
            return BrickColor.new(l_result_0);
        else
            return BrickColor.new(v22);
        end;
    else
        return nil;
    end;
end;
return function(v26) --[[ Line: 86 ]] --[[ Name: BrickColorRenderer ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), v25 (copy), l_useEffect_0 (copy), v21 (copy), v1 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), l_IconButton_0 (copy), l_TextLabel_0 (copy)
    local v27 = l_useRef_0(nil);
    local v28, v29 = l_useState_0(nil);
    local function v30() --[[ Line: 90 ]]
        -- upvalues: v27 (copy)
        if v27.current then
            v27.current:CaptureFocus();
        end;
    end;
    local function v32(v31) --[[ Line: 96 ]]
        -- upvalues: v29 (copy)
        v29(v31);
    end;
    local function v33() --[[ Line: 100 ]]
        -- upvalues: v29 (copy)
        v29(nil);
    end;
    local function v37(v34, _) --[[ Line: 104 ]]
        -- upvalues: v28 (copy), v25 (ref), v26 (copy), v29 (copy)
        if v28 ~= nil then
            local v36 = v25(v34);
            if v36 and v36 ~= v26.Value then
                v26.OnChanged(v36);
            end;
        end;
        v29(nil);
    end;
    l_useEffect_0(function() --[[ Line: 116 ]]
        -- upvalues: v29 (copy)
        v29(nil);
    end, {
        v26.Schema, 
        v26.Value
    });
    local function v39(v38) --[[ Line: 120 ]] --[[ Name: getAutocompleteItems ]]
        -- upvalues: v21 (ref)
        return v21(v38);
    end;
    local v40 = nil;
    local v41 = nil;
    if v28 then
        local v42 = v25(v28);
        v40 = v42 and v42.Color or nil;
        v41 = v28;
    else
        local v43 = v25(v26.Value) or v26.Schema.GetDefaultValue();
        v40 = v43.Color;
        v41 = v43.Name;
    end;
    return v1.createElement(l_Pane_0, {}, {
        Input = v1.createElement(l_TextInput_0, {
            Disabled = v26.Disabled, 
            LeadingComponent = l_IconButton_0, 
            LeadingComponentProps = {
                BackgroundColor = v40, 
                Cursor = "PointingHand", 
                OnClick = v30, 
                [v1.Tag] = "Icon16"
            }, 
            ForwardRef = v27, 
            OnTextChanged = v32, 
            OnFocused = v33, 
            OnFocusLost = v37, 
            Size = if v26.AutomaticSize then UDim2.new(1, 0, 0, v26.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
            Text = v41, 
            GetAutocompleteItems = v39, 
            OnRenderAutocompleteItem = function(v44, v45, v46, _) --[[ Line: 153 ]] --[[ Name: OnRenderAutocompleteItem ]]
                -- upvalues: v1 (ref), l_Pane_0 (ref), l_TextLabel_0 (ref)
                return v1.createElement(l_Pane_0, {
                    key = v44.NameLower, 
                    LayoutOrder = v45, 
                    OnPress = v46, 
                    [v1.Tag] = "X-Pad X-RowM X-Middle DropdownItem"
                }, {
                    Preview = v1.createElement(l_Pane_0, {
                        BackgroundColor3 = v44.BrickColor.Color, 
                        LayoutOrder = 1, 
                        [v1.Tag] = "X-Corner Icon16"
                    }, {}), 
                    Text = v1.createElement(l_TextLabel_0, {
                        LayoutOrder = 2, 
                        Text = v44.BrickColor.Name, 
                        [v1.Tag] = "TextXAlignLeft"
                    }, {})
                });
            end
        })
    });
end;