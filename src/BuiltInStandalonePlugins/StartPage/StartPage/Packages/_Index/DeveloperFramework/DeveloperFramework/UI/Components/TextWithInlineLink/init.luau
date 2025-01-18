local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.Parent.Cryo);
local v4 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v4.withContext;
local v6 = require(l_Parent_0.UI.Components.LinkText);
local v7 = require(l_Parent_0.UI.Components.Pane);
local v8 = require(l_Parent_0.UI.Components.TextLabel);
local v9 = require(l_Parent_0.Util.Typecheck.t);
local v10 = require(l_Parent_0.Util.LayoutOrderIterator);
local v11 = v2.PureComponent:extend("TextWithInlineLink");
v11.init = function(v12) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy)
    local l_props_0 = v12.props;
    assert(v9.interface({
        Text = v9.string, 
        OnLinkClicked = v9.callback, 
        LinkText = v9.string, 
        LinkPlaceholder = v9.string, 
        TextProps = v9.interface({
            TextSize = v9.integer, 
            Font = v9.enum(Enum.Font)
        })
    })(l_props_0));
end;
v11.render = function(v14) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: l_TextService_0 (copy), v10 (copy), v2 (copy), v8 (copy), v3 (copy), v6 (copy), v7 (copy)
    local l_props_1 = v14.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_TextProps_0 = l_props_1.TextProps;
    local l_Text_0 = l_props_1.Text;
    local l_LinkText_0 = l_props_1.LinkText;
    local l_MaxWidth_0 = l_props_1.MaxWidth;
    local l_TextSize_0 = l_TextProps_0.TextSize;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_HorizontalAlignment_0 = l_props_1.HorizontalAlignment;
    local v24 = {};
    local v25 = nil;
    local v26 = nil;
    local v27 = 0;
    local function v34(v28) --[[ Line: 59 ]] --[[ Name: measureAndBreakLineIfNeeded ]]
        -- upvalues: l_TextService_0 (ref), l_TextProps_0 (copy), l_MaxWidth_0 (copy), l_TextSize_0 (copy), v24 (copy), v26 (ref), v25 (ref), v10 (ref), v27 (ref)
        local v29 = l_TextService_0:GetTextSize(v28, l_TextProps_0.TextSize, l_TextProps_0.Font, Vector2.new(l_MaxWidth_0, 1e999)) + Vector2.new(1, 0);
        local v30 = v29.Y > l_TextSize_0;
        local v31 = 0;
        if #v24 > 0 then
            v31 = v24[#v24].width;
        end;
        local v32 = v31 + v29.X > l_MaxWidth_0;
        if v26 or #v24 == 0 or v30 or v32 then
            local v33 = v30 and v29.Y or l_TextSize_0;
            table.insert(v24, {
                width = v29.X, 
                height = v33, 
                items = {}
            });
            v25 = v10.new();
            v27 = v27 + v33;
        else
            v24[#v24].width = v31 + v29.X;
        end;
        v26 = v30;
        return v29;
    end;
    local function _(v35) --[[ Line: 95 ]] --[[ Name: appendToLine ]]
        -- upvalues: v24 (copy)
        table.insert(v24[#v24].items, v35);
    end;
    local function v40(v37) --[[ Line: 100 ]] --[[ Name: appendTextLabel ]]
        -- upvalues: v34 (copy), v2 (ref), v8 (ref), v3 (ref), v25 (ref), l_TextProps_0 (copy), v24 (copy)
        if #v37 == 0 then
            return;
        else
            local v38 = v34(v37);
            local v39 = v2.createElement(v8, v3.Dictionary.join({
                Text = v37, 
                Size = UDim2.new(0, v38.X, 0, v38.Y), 
                LayoutOrder = v25:getNextOrder(), 
                TextWrapped = true
            }, l_TextProps_0));
            table.insert(v24[#v24].items, v39);
            return;
        end;
    end;
    local function v43() --[[ Line: 118 ]] --[[ Name: appendLink ]]
        -- upvalues: v34 (copy), l_LinkText_0 (copy), v2 (ref), v6 (ref), l_TextSize_0 (copy), v25 (ref), l_props_1 (copy), l_Stylizer_0 (copy), l_TextProps_0 (copy), v24 (copy)
        local v41 = v34(l_LinkText_0);
        local v42 = v2.createElement(v6, {
            Size = UDim2.new(0, v41.X, 0, l_TextSize_0), 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            LayoutOrder = v25:getNextOrder(), 
            OnClick = l_props_1.OnLinkClicked, 
            Text = l_LinkText_0, 
            Style = {
                TextColor = l_Stylizer_0.TextColor, 
                TextSize = l_TextProps_0.TextSize, 
                Font = l_TextProps_0.Font
            }
        });
        table.insert(v24[#v24].items, v42);
    end;
    local v44 = 1;
    while true do
        local v45 = nil;
        local v46 = nil;
        local v47, v48 = string.find(l_Text_0, l_props_1.LinkPlaceholder, v44, true);
        v45 = v47;
        v46 = v48;
        if v45 ~= nil then
            v40((string.sub(l_Text_0, v44, v45 - 1)));
            v43();
            v44 = v46 + 1;
        else
            break;
        end;
    end;
    v40((string.sub(l_Text_0, v44, #l_Text_0)));
    local v49 = {};
    for v50, v51 in ipairs(v24) do
        v49["line_" .. v50] = v2.createElement(v7, {
            Layout = Enum.FillDirection.Horizontal, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = l_HorizontalAlignment_0
        }, v51.items);
    end;
    return v2.createElement(v7, {
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_LayoutOrder_0, 
        HorizontalAlignment = l_HorizontalAlignment_0
    }, v49);
end;
return (l_withContext_0({
    Stylizer = v4.Stylizer
})(v11));