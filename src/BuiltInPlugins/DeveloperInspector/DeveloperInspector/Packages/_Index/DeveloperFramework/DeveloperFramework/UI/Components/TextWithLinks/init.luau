local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.Parent.Cryo);
local v4 = require(l_Parent_0.Parent.Dash);
local v5 = require(l_Parent_0.Wrappers.withAbsoluteSize);
local _ = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v7.withContext;
local v9 = require(l_Parent_0.UI.Components.LinkText);
local v10 = require(l_Parent_0.UI.Components.Pane);
local v11 = require(l_Parent_0.UI.Components.TextLabel);
local v12 = require(l_Parent_0.Util.LayoutOrderIterator);
local v13 = v2.PureComponent:extend("TextWithLinks");
v13.init = function(v14) --[[ Line: 70 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy)
    local l_props_0 = v14.props;
    v14.lines = {};
    v14.maxWidth = if l_props_0.AbsoluteSize then l_props_0.AbsoluteSize.X else 0;
    v14.currentColumnIndex = 1;
    v14.lineOrder = v12.new();
    v14.frameHeight = 0;
    v14.previousLineWrapped = nil;
end;
v13.measureAndBreakLineIfNeeded = function(v16, v17) --[[ Line: 82 ]] --[[ Name: measureAndBreakLineIfNeeded ]]
    -- upvalues: l_TextService_0 (copy), v12 (copy)
    local l_TextProps_0 = v16.props.TextProps;
    local l_maxWidth_0 = v16.maxWidth;
    local l_lines_0 = v16.lines;
    local l_previousLineWrapped_0 = v16.previousLineWrapped;
    local v22 = l_TextService_0:GetTextSize(v17, l_TextProps_0.TextSize, l_TextProps_0.Font, Vector2.new(l_maxWidth_0, 1e999)) + Vector2.new(1, 0);
    local v23 = v22.Y > l_TextProps_0.TextSize;
    local v24 = 0;
    if #l_lines_0 > 0 then
        v24 = l_lines_0[#l_lines_0].width;
    end;
    local v25 = l_maxWidth_0 < v24 + v22.X;
    if l_previousLineWrapped_0 or #l_lines_0 == 0 or v23 or v25 then
        local v26 = v23 and v22.Y or l_TextProps_0.TextSize;
        table.insert(l_lines_0, {
            width = v22.X, 
            height = v26, 
            items = {}
        });
        local l_frameHeight_0 = v16.frameHeight;
        v16.lineOrder = v12.new();
        v16.frameHeight = l_frameHeight_0 + 1;
        v16.currentColumnIndex = 1;
    else
        l_lines_0[#l_lines_0].width = v24 + v22.X;
    end;
    l_previousLineWrapped_0 = v23;
    return v22;
end;
v13.appendToLine = function(v28, v29) --[[ Line: 125 ]] --[[ Name: appendToLine ]]
    local l_lines_1 = v28.lines;
    local v31 = l_lines_1[#l_lines_1];
    local v32 = tostring(v28.currentColumnIndex);
    v31.items[v32] = v29;
    v28.currentColumnIndex = v28.currentColumnIndex + 1;
end;
v13.appendTextLabel = function(v33, v34) --[[ Line: 136 ]] --[[ Name: appendTextLabel ]]
    -- upvalues: v2 (copy), v11 (copy), v3 (copy)
    if #v34 == 0 then
        return;
    else
        local v35 = v33:measureAndBreakLineIfNeeded(v34);
        local l_TextProps_1 = v33.props.TextProps;
        v33:appendToLine(v2.createElement(v11, v3.Dictionary.join({
            Text = v34, 
            Size = UDim2.new(0, v35.X, 0, v35.Y), 
            LayoutOrder = v33.lineOrder:getNextOrder(), 
            TextWrapped = true
        }, l_TextProps_1)));
        return;
    end;
end;
v13.appendLink = function(v37, v38, v39) --[[ Line: 156 ]] --[[ Name: appendLink ]]
    -- upvalues: v2 (copy), v9 (copy)
    local v40 = v37:measureAndBreakLineIfNeeded(v38);
    local l_TextProps_2 = v37.props.TextProps;
    local l_Stylizer_0 = v37.props.Stylizer;
    v37:appendToLine(v2.createElement(v9, {
        Size = UDim2.new(0, v40.X, 0, l_TextProps_2.TextSize), 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        LayoutOrder = v37.lineOrder:getNextOrder(), 
        OnClick = v39, 
        Text = v38, 
        Style = {
            TextColor = l_Stylizer_0.TextColor, 
            TextSize = l_TextProps_2.TextSize, 
            Font = l_TextProps_2.Font
        }
    }));
end;
v13.render = function(v43) --[[ Line: 176 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v2 (copy), v10 (copy), v4 (copy)
    local l_props_1 = v43.props;
    local l_Text_0 = l_props_1.Text;
    local l_LinkMap_0 = l_props_1.LinkMap;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_HorizontalAlignment_0 = l_props_1.HorizontalAlignment;
    local l_WrapperProps_0 = l_props_1.WrapperProps;
    v43.lines = {};
    v43.maxWidth = if l_props_1.AbsoluteSize then l_props_1.AbsoluteSize.X else 0;
    v43.currentColumnIndex = 1;
    v43.lineOrder = v12.new();
    v43.frameHeight = 0;
    v43.previousLineWrapped = nil;
    local v50 = 1;
    while true do
        local v51 = nil;
        local v52 = nil;
        local v53 = nil;
        local v54 = nil;
        for v55, v56 in pairs(l_LinkMap_0) do
            local l_LinkText_0 = v56.LinkText;
            local l_LinkCallback_0 = v56.LinkCallback;
            local v59 = nil;
            local v60 = nil;
            local v61, v62 = string.find(l_Text_0, v55, v50, true);
            v59 = v61;
            v60 = v62;
            if v51 == nil then
                v51 = v59;
                v52 = v60;
                v53 = l_LinkText_0;
                v54 = l_LinkCallback_0;
            elseif v59 and v59 < v51 then
                v51 = v59;
                v52 = v60;
                v53 = l_LinkText_0;
                v54 = l_LinkCallback_0;
            end;
        end;
        if v51 ~= nil then
            v43:appendTextLabel((string.sub(l_Text_0, v50, v51 - 1)));
            v43:appendLink(v53, v54);
            v50 = v52 + 1;
        else
            break;
        end;
    end;
    v43:appendTextLabel((string.sub(l_Text_0, v50, #l_Text_0)));
    local v63 = {};
    local v64 = v12.new();
    for v65, v66 in ipairs(v43.lines) do
        v63[tostring(v65)] = v2.createElement(v10, {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v64:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = l_HorizontalAlignment_0
        }, v66.items);
    end;
    return v2.createElement(v10, v4.join({
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_LayoutOrder_0, 
        HorizontalAlignment = l_HorizontalAlignment_0, 
        Size = l_props_1.Size
    }, l_WrapperProps_0), v63);
end;
return v5((l_withContext_0({
    Stylizer = v7.Stylizer
})(v13)));