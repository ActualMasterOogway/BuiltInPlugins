local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.Mouse);
local v2 = require(script.Parent.Internal.Text);
local v3 = require(script.Parent.Internal.ThemeChangeListener);
local v4 = require(script.Parent.Internal.Theme);
local v5 = nil;
local v6 = v0.PureComponent:extend("hyperlink");
v6.render = function(v7) --[[ Line: 26 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (ref), v0 (copy), v1 (copy), v3 (copy)
    local function v22() --[[ Line: 27 ]] --[[ Name: renderInternal ]]
        -- upvalues: v2 (ref), v7 (copy), v5 (ref), v0 (ref), v1 (ref)
        local function _(v8, v9, v10) --[[ Line: 28 ]] --[[ Name: calculateTextSize ]]
            -- upvalues: v2 (ref)
            local v11 = v2.calculateTextSize(v8, v9, v10);
            return UDim2.new(0, v11.X, 0, v11.Y);
        end;
        local v13 = v7.props.TextSize or 22;
        local v14 = v5(v7);
        local l_createElement_0 = v0.createElement;
        local v16 = "TextButton";
        local v17 = {
            BackgroundTransparency = 1, 
            Text = v7.props.Text, 
            TextSize = v13, 
            Font = Enum.Font.SourceSans, 
            TextColor3 = v14.HyperlinkColor
        };
        local l_Size_0 = v7.props.Size;
        if not l_Size_0 then
            local l_Text_0 = v7.props.Text;
            local l_SourceSans_0 = Enum.Font.SourceSans;
            local v21 = v2.calculateTextSize(l_Text_0, v13, l_SourceSans_0);
            l_Size_0 = UDim2.new(0, v21.X, 0, v21.Y);
        end;
        v17.Size = l_Size_0;
        v17.Position = v7.Position;
        v17.TextXAlignment = Enum.TextXAlignment.Left;
        v17.LayoutOrder = v7.props.LayoutOrder;
        v17[v0.Event.MouseEnter] = function() --[[ Line: 48 ]]
            -- upvalues: v7 (ref), v1 (ref)
            if v7.props.Enabled then
                v1.onEnter(v7.props.Mouse);
            end;
        end;
        v17[v0.Event.MouseLeave] = function() --[[ Line: 49 ]]
            -- upvalues: v7 (ref), v1 (ref)
            if v7.props.Enabled then
                v1.onLeave(v7.props.Mouse);
            end;
        end;
        v17[v0.Event.Activated] = function() --[[ Line: 51 ]]
            -- upvalues: v7 (ref)
            if v7.props.Enabled and v7.props.OnClick ~= nil then
                v7.props.OnClick();
            end;
        end;
        return l_createElement_0(v16, v17);
    end;
    return v0.createElement(v3, {
        render = v22
    });
end;
v5 = function(v23) --[[ Line: 64 ]]
    -- upvalues: v4 (copy)
    return {
        HyperlinkColor = v23.props.Style and v23.props.Style.HyperlinkColor or v4.getHyperlinkTextTextColor()
    };
end;
return v6;