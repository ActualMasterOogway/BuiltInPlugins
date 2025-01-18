local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TextLabel_0 = v2.UI.TextLabel;
local l_join_0 = v2.Dash.join;
local l_TextService_0 = game:GetService("TextService");
local v6 = utf8.char(8230);
local v7 = v1.PureComponent:extend("FooLabel");
v7.init = function(v8) --[[ Line: 19 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_TextService_0 (copy), v6 (copy)
    v8.textRef = v1.createRef();
    v8.getTextWidth = function(v9) --[[ Line: 22 ]]
        -- upvalues: v8 (copy), l_TextService_0 (ref)
        local l_current_0 = v8.textRef.current;
        if not l_current_0 then
            return 0;
        else
            return l_TextService_0:GetTextSize(v9, l_current_0.TextSize, l_current_0.Font, Vector2.new(1e999, 1e999)).x;
        end;
    end;
    v8.updateText = function() --[[ Line: 31 ]]
        -- upvalues: v8 (copy), v6 (ref)
        local l_Text_0 = v8.props.Text;
        local l_current_1 = v8.textRef.current;
        if not l_current_1 then
            return;
        else
            local l_X_0 = l_current_1.AbsoluteSize.X;
            if v8.getTextWidth(l_Text_0) <= l_X_0 then
                l_current_1.Text = l_Text_0;
                l_current_1.TextXAlignment = Enum.TextXAlignment.Left;
                return;
            else
                l_current_1.TextXAlignment = Enum.TextXAlignment.Right;
                local v14 = 0;
                for v15 = -1, -#l_Text_0, -1 do
                    if l_X_0 >= v8.getTextWidth(l_Text_0:sub(v15)) then
                        v14 = v15;
                    else
                        break;
                    end;
                end;
                if v14 >= -2 then
                    l_current_1.Text = v6;
                    return;
                else
                    l_current_1.Text = v6 .. l_Text_0:sub(v14 + 2);
                    return;
                end;
            end;
        end;
    end;
    v8.onAbsoluteSizeChange = function() --[[ Line: 73 ]]
        -- upvalues: v8 (copy), v1 (ref)
        if v8.props[v1.Change.AbsoluteSize] then
            v8.props[v1.Change.AbsoluteSize]();
        end;
        v8.updateText();
    end;
end;
v7.didMount = function(v16) --[[ Line: 81 ]] --[[ Name: didMount ]]
    v16.updateText();
end;
v7.didUpdate = function(v17, v18, _) --[[ Line: 85 ]] --[[ Name: didUpdate ]]
    if v18.Text ~= v17.props.Text then
        v17.updateText();
    end;
end;
v7.render = function(v20) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy), l_join_0 (copy)
    local l_props_0 = v20.props;
    local v22 = {
        [v1.Ref] = v20.textRef, 
        [v1.Change.AbsoluteSize] = v20.onAbsoluteSizeChange
    };
    return v1.createElement(l_TextLabel_0, l_join_0(l_props_0, v22));
end;
return v7;