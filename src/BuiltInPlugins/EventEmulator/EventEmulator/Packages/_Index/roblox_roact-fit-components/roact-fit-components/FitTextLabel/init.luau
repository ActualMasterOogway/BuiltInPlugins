local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Roact);
local l_TextService_0 = game:GetService("TextService");
local function _(v4, v5, v6, v7) --[[ Line: 9 ]] --[[ Name: getTextHeight ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(v4, v5, v6, Vector2.new(v7, 10000)).Y + 2;
end;
local function _(v9, v10, v11) --[[ Line: 13 ]] --[[ Name: getTextWidth ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(v9, v10, v11, Vector2.new(10000, 10000)).X + 2;
end;
local v13 = v2.PureComponent:extend("FitTextLabel");
v13.Width = {
    FitToText = {}
};
v13.defaultProps = {
    Font = Enum.Font.SourceSans, 
    Text = "Label", 
    TextSize = 12, 
    TextWrapped = true, 
    maximumWidth = 1e999
};
v13.init = function(v14) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v14.frameRef = v2.createRef();
    v14.onResize = function() --[[ Line: 33 ]]
        -- upvalues: v14 (copy)
        if not v14.frameRef.current then
            return;
        else
            v14.frameRef.current.Size = v14:__getSize(v14.frameRef.current);
            return;
        end;
    end;
end;
v13.render = function(v15) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    return v2.createElement("TextLabel", v15:__getFilteredProps());
end;
v13.didMount = function(v16) --[[ Line: 46 ]] --[[ Name: didMount ]]
    v16.onResize();
end;
v13.didUpdate = function(v17) --[[ Line: 50 ]] --[[ Name: didUpdate ]]
    v17.onResize();
end;
v13.__getFilteredProps = function(v18) --[[ Line: 54 ]] --[[ Name: __getFilteredProps ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v19 = {
        width = v1.None, 
        maximumWidth = v1.None, 
        Size = UDim2.new(v18.props.width, UDim.new(0, 0)), 
        [v2.Ref] = v18.frameRef
    };
    local l_Children_0 = v2.Children;
    local l_join_0 = v1.Dictionary.join;
    local v22 = v18.props[v2.Children] or {};
    local v23 = {};
    local v24 = false;
    if v18.props.maximumWidth < 1e999 then
        v24 = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v18.props.maximumWidth, 1e999)
        });
    end;
    v23.sizeConstraint = v24;
    v19[l_Children_0] = l_join_0(v22, v23);
    return v1.Dictionary.join(v18.props, v19);
end;
v13.__getSize = function(v25, v26) --[[ Line: 75 ]] --[[ Name: __getSize ]]
    -- upvalues: v13 (copy), l_TextService_0 (copy)
    local l_maximumWidth_0 = v25.props.maximumWidth;
    local l_width_0 = v25.props.width;
    if l_width_0 == v13.Width.FitToText then
        local l_Text_0 = v25.props.Text;
        local l_TextSize_0 = v25.props.TextSize;
        local l_Font_0 = v25.props.Font;
        local v32 = l_TextService_0:GetTextSize(l_Text_0, l_TextSize_0, l_Font_0, Vector2.new(10000, 10000)).X + 2;
        l_width_0 = UDim.new(0, (math.min(v32, l_maximumWidth_0)));
    end;
    local v33 = math.max(l_maximumWidth_0 < 1e999 and l_maximumWidth_0 or 0, v26.AbsoluteSize.X);
    local l_Text_1 = v25.props.Text;
    local l_TextSize_1 = v25.props.TextSize;
    local l_Font_1 = v25.props.Font;
    local v37 = l_TextService_0:GetTextSize(l_Text_1, l_TextSize_1, l_Font_1, Vector2.new(v33, 10000)).Y + 2;
    return UDim2.new(l_width_0, UDim.new(0, v37));
end;
return v13;