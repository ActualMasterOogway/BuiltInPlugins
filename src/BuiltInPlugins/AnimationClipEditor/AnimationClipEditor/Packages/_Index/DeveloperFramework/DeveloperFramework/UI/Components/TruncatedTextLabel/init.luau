local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.UI.Components.TextLabel);
local v3 = require(l_Parent_0.Parent.Dash);
local v4 = require(l_Parent_0.Parent.Roact);
local l_ellipsizeMiddle_0 = require(l_Parent_0.Util).ellipsizeMiddle;
local v6 = require(l_Parent_0.Util.Typecheck);
local l_join_0 = v3.join;
local l_omit_0 = v3.omit;
local v9 = v4.PureComponent:extend("TruncatedTextLabel");
v6.wrap(v9, script);
v9.init = function(v10) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_TextService_0 (copy), l_ellipsizeMiddle_0 (copy)
    v10.textRef = v4.createRef();
    v10.lastText = "";
    v10.lastTextWidth = 0;
    v10.getTextWidth = function(v11) --[[ Line: 61 ]]
        -- upvalues: v10 (copy), l_TextService_0 (ref)
        local l_current_0 = v10.textRef.current;
        if not l_current_0 then
            return 0;
        else
            return l_TextService_0:GetTextSize(v11, l_current_0.TextSize, l_current_0.Font, Vector2.new(1e999, 1e999)).x;
        end;
    end;
    v10.updateText = function() --[[ Line: 71 ]]
        -- upvalues: v10 (copy), l_ellipsizeMiddle_0 (ref)
        local l_props_0 = v10.props;
        local v14 = l_props_0.Text or "";
        local v15 = l_props_0.SuffixLength or 0;
        if string.len(v14) < v15 then
            v15 = string.len(v14);
        end;
        local l_current_1 = v10.textRef.current;
        if not l_current_1 then
            return;
        else
            local l_X_0 = l_current_1.AbsoluteSize.X;
            if v14 ~= v10.lastText or l_X_0 ~= v10.lastTextWidth then
                l_current_1.Text = l_ellipsizeMiddle_0(v14, l_X_0, v10.getTextWidth, v15);
                v10.lastText = v14;
                v10.lastTextWidth = l_X_0;
            end;
            return;
        end;
    end;
    v10.onAbsoluteSizeChange = function() --[[ Line: 96 ]]
        -- upvalues: v10 (copy), v4 (ref)
        if v10.props[v4.Change.AbsoluteSize] then
            v10.props[v4.Change.AbsoluteSize]();
        end;
        v10.updateText();
    end;
end;
v9.didMount = function(v18) --[[ Line: 104 ]] --[[ Name: didMount ]]
    v18.updateText();
end;
v9.didUpdate = function(v19) --[[ Line: 108 ]] --[[ Name: didUpdate ]]
    v19.updateText();
end;
v9.render = function(v20) --[[ Line: 112 ]] --[[ Name: render ]]
    -- upvalues: l_omit_0 (copy), v4 (copy), v2 (copy), l_join_0 (copy)
    local v21 = l_omit_0(v20.props, {
        "SuffixLength"
    });
    local v22 = {
        [v4.Ref] = v20.textRef, 
        [v4.Change.AbsoluteSize] = v20.onAbsoluteSizeChange
    };
    return v4.createElement(v2, l_join_0(v21, v22));
end;
return v9;