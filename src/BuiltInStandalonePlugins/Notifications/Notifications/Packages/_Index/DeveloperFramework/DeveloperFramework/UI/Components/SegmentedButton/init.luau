local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = require(l_Parent_0.UI.Components.Separator);
local v7 = require(l_Parent_0.Util.LayoutOrderIterator);
local v8 = require(script.style);
local l_TextService_0 = game:GetService("TextService");
local v10 = v1.PureComponent:extend("SegmentedButton");
v10.init = function(v11) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_TextService_0 (copy), v1 (copy)
    v11.evaluateMinimums = function(v12) --[[ Line: 38 ]]
        -- upvalues: v11 (copy), v8 (ref), l_TextService_0 (ref)
        local v13 = v11.props.Stylizer or v8;
        local v14 = v12.AbsoluteSize.X - #v11.props.Items + 1;
        local v15 = #v11.props.Items;
        v11.iconSize = v12.AbsoluteSize.Y;
        local l_TextPadding_0 = v13.TextPadding;
        local v17 = v14 / v15;
        local v18 = table.clone(v11.props.Items);
        local v19 = table.clone(v11.state.sizes);
        repeat
            local v20 = {};
            for v21, v22 in v18 do
                local l_current_0 = v11.refs[v21].current;
                if l_current_0 then
                    local v24 = 0;
                    if l_current_0:FindFirstChild("Container") and l_current_0.Container:FindFirstChild("Layout") and l_current_0.Container:FindFirstChild("ImageContainer") and l_current_0.Container.ImageContainer:FindFirstChild("Image") then
                        v24 = l_current_0.Container.Layout.Padding.Offset + l_current_0.Container.ImageContainer.Image.AbsoluteSize.X;
                    end;
                    local v25 = (if v22.Label then l_TextService_0:GetTextSize(v22.Label, l_current_0.TextSize, l_current_0.Font, Vector2.new(1e999, 1e999)).X + 2 * l_TextPadding_0 else 0) + v24;
                    if v17 < v25 then
                        v19[v21] = UDim2.new(0, v25, 1, 0);
                        v14 = v14 - v25;
                        v15 = v15 - 1;
                        v17 = v14 / v15;
                        table.insert(v20, v21);
                    else
                        v19[v21] = UDim2.new(0, v17, 1, 0);
                    end;
                else
                    break;
                end;
            end;
            for _, v27 in v20 do
                v18[v27] = nil;
            end;
        until #v20 == 0;
        v11:setState({
            sizes = v19
        });
    end;
    v11.refs = {};
    v11.ref = v1.createRef();
    v11.state = {
        sizes = {}
    };
end;
v10.didMount = function(v28) --[[ Line: 116 ]] --[[ Name: didMount ]]
    v28.evaluateMinimums(v28.ref.current);
end;
v10.didUpdate = function(v29, v30) --[[ Line: 120 ]] --[[ Name: didUpdate ]]
    if v29.props.Items ~= v30.Items then
        v29.evaluateMinimums(v29.ref.current);
    end;
end;
v10.render = function(v31) --[[ Line: 126 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v1 (copy), v4 (copy), v6 (copy), v5 (copy)
    local l_props_0 = v31.props;
    local l_Items_0 = l_props_0.Items;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_SelectedIndex_0 = l_props_0.SelectedIndex;
    if l_props_0.SelectedId ~= nil then
        for v36, v37 in l_Items_0 do
            if typeof(v37) == "table" and v37.Id == l_props_0.SelectedId then
                l_SelectedIndex_0 = v36;
                break;
            end;
        end;
    end;
    local l_Size_0 = l_props_0.Size;
    local l_StyleModifier_0 = l_props_0.StyleModifier;
    local v40 = v7.new();
    local v41 = {};
    assert(#l_Items_0 > 1, "Segmented Button should contain more than one item");
    for v42, v43 in l_props_0.Items do
        local v44 = typeof(v43) == "table";
        local v45 = if v44 then v43.Id else v43;
        local v46 = if v44 then v43.Label else v43;
        local v47 = if v44 then v43.Icon else nil;
        if not v31.refs[v42] then
            v31.refs[v42] = v1.createRef();
        end;
        if v42 == 1 then
            v41[v45] = v1.createElement(v4, {
                [v1.Ref] = v31.refs[v42], 
                Icon = v47, 
                LayoutOrder = v40:getNextOrder(), 
                OnClick = function() --[[ Line: 164 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_0 (copy), v44 (copy), v43 (copy), v42 (copy)
                    l_props_0.OnItemActivated(if v44 then v43 else v42);
                end, 
                Size = v31.state.sizes[v42] or UDim2.new(1 / #l_Items_0, -1, 1, 0), 
                Style = l_SelectedIndex_0 == v42 and "RoundLeftActive" or "RoundLeft", 
                StyleModifier = l_StyleModifier_0, 
                Text = v46
            });
            v41[v45 .. "Separator"] = v1.createElement(v6, {
                DominantAxis = Enum.DominantAxis.Height, 
                LayoutOrder = v40:getNextOrder()
            });
        elseif v42 == #l_Items_0 then
            v41[v45] = v1.createElement(v4, {
                [v1.Ref] = v31.refs[v42], 
                Icon = v47, 
                LayoutOrder = v40:getNextOrder(), 
                OnClick = function() --[[ Line: 181 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_0 (copy), v44 (copy), v43 (copy), v42 (copy)
                    l_props_0.OnItemActivated(if v44 then v43 else v42);
                end, 
                Size = v31.state.sizes[v42] or UDim2.new(1 / #l_Items_0, -1, 1, 0), 
                Style = l_SelectedIndex_0 == v42 and "RoundRightActive" or "RoundRight", 
                StyleModifier = l_StyleModifier_0, 
                Text = v46
            });
        else
            v41[v45] = v1.createElement(v4, {
                [v1.Ref] = v31.refs[v42], 
                Icon = v47, 
                LayoutOrder = v40:getNextOrder(), 
                OnClick = function() --[[ Line: 194 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_0 (copy), v44 (copy), v43 (copy), v42 (copy)
                    l_props_0.OnItemActivated(if v44 then v43 else v42);
                end, 
                Size = v31.state.sizes[v42] or UDim2.new(1 / #l_Items_0, -1, 1, 0), 
                Style = l_SelectedIndex_0 == v42 and "RoundCenterActive" or "RoundCenter", 
                StyleModifier = l_StyleModifier_0, 
                Text = v46
            });
            v41[v45 .. "Separator"] = v1.createElement(v6, {
                DominantAxis = Enum.DominantAxis.Height, 
                LayoutOrder = v40:getNextOrder()
            });
        end;
    end;
    return v1.createElement(v5, {
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        [v1.Ref] = v31.ref, 
        [v1.Change.AbsoluteSize] = v31.evaluateMinimums
    }, v41);
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v10));