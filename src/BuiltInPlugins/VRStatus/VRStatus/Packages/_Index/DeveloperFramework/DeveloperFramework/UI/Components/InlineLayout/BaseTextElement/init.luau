local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v2.join;
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v7 = setmetatable({}, v4);
    v7.props = v6;
    v7.Element = v5;
    return v7;
end;
local l_TextService_0 = game:GetService("TextService");
v4.TextService = game:GetService("TextService");
v4._setTextService = function(v9, v10) --[[ Line: 50 ]] --[[ Name: _setTextService ]]
    v9.TextService = v10;
end;
v4.getWidth = function(v11) --[[ Line: 54 ]] --[[ Name: getWidth ]]
    return v11:_getWidth(v11.props.Text);
end;
local function _(v12, v13) --[[ Line: 58 ]] --[[ Name: getRichText ]]
    local l_v12_0 = v12;
    if v13.Bold then
        l_v12_0 = ("<b>%*</b>"):format(v12);
    end;
    if v13.Italic then
        l_v12_0 = ("<i>%*</i>"):format(v12);
    end;
    if v13.Strike then
        l_v12_0 = ("<s>%*</s>"):format(v12);
    end;
    return l_v12_0;
end;
v4._getWidth = function(v16, v17) --[[ Line: 72 ]] --[[ Name: _getWidth ]]
    -- upvalues: l_TextService_0 (copy)
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Font = Font.fromEnum(v16.props.Font);
    l_GetTextBoundsParams_0.Size = v16.props.TextSize;
    l_GetTextBoundsParams_0.Text = v17;
    if v16.props.TextStyle then
        local l_TextStyle_0 = v16.props.TextStyle;
        local l_v17_0 = v17;
        if l_TextStyle_0.Bold then
            l_v17_0 = ("<b>%*</b>"):format(v17);
        end;
        if l_TextStyle_0.Italic then
            l_v17_0 = ("<i>%*</i>"):format(v17);
        end;
        if l_TextStyle_0.Strike then
            l_v17_0 = ("<s>%*</s>"):format(v17);
        end;
        l_GetTextBoundsParams_0.Text = l_v17_0;
        l_GetTextBoundsParams_0.RichText = true;
    end;
    return l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0).X;
end;
codepointEnd = function(v21, v22) --[[ Line: 85 ]] --[[ Name: codepointEnd ]]
    local v23 = utf8.offset(v21, v22 + 1);
    if v23 then
        return v23 - 1;
    else
        return #v21;
    end;
end;
v4.split = function(v24, v25) --[[ Line: 93 ]] --[[ Name: split ]]
    -- upvalues: v4 (copy), l_join_0 (copy)
    local v26 = utf8.len(v24.props.Text);
    if v26 == nil then
        warn("Failed to get string length, it is probably malformed or non utf8");
        return v24;
    else
        local v27 = math.max(math.floor(v26 * v25 / v24:getWidth()), 1);
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        local v31 = nil;
        local v32 = 0;
        while v32 < 100 do
            v29 = codepointEnd(v24.props.Text, v27);
            v28 = string.sub(v24.props.Text, 1, v29);
            v31 = v25 < v24:_getWidth(v28) and -1 or 1;
            if v30 and v30 ~= v31 then
                if v31 < 0 then
                    v27 = v27 + v31;
                    v29 = codepointEnd(v24.props.Text, v27);
                    v28 = string.sub(v24.props.Text, 1, v29);
                    break;
                else
                    break;
                end;
            else
                v30 = v31;
                v27 = v27 + v30;
                v32 = v32 + 1;
            end;
        end;
        local v33 = string.sub(v24.props.Text, v29 + 1);
        return v4.new(v24.Element, l_join_0(v24.props, {
            Text = v28
        })), v4.new(v24.Element, l_join_0(v24.props, {
            Text = v33
        }));
    end;
end;
v4.render = function(v34, v35) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Text_0 = v34.props.Text;
    local v37 = false;
    if v34.props.TextStyle then
        v37 = true;
        local l_Text_1 = v34.props.Text;
        local l_TextStyle_1 = v34.props.TextStyle;
        local l_l_Text_1_0 = l_Text_1;
        if l_TextStyle_1.Bold then
            l_l_Text_1_0 = ("<b>%*</b>"):format(l_Text_1);
        end;
        if l_TextStyle_1.Italic then
            l_l_Text_1_0 = ("<i>%*</i>"):format(l_Text_1);
        end;
        if l_TextStyle_1.Strike then
            l_l_Text_1_0 = ("<s>%*</s>"):format(l_Text_1);
        end;
        l_Text_0 = l_l_Text_1_0;
    end;
    return v1.createElement(v34.Element, v2.join(v34.props, {
        id = v35, 
        Text = l_Text_0, 
        RichText = v37, 
        AutomaticSize = Enum.AutomaticSize.XY
    }));
end;
return v4;