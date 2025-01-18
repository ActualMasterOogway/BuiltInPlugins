local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.TextLabel);
local v4 = require(l_Parent_0.Styling.joinTags);
local v5 = require(script.Parent.styles);
local function _() --[[ Line: 10 ]] --[[ Name: counter ]]
    local v6 = -1;
    return function() --[[ Line: 12 ]]
        -- upvalues: v6 (ref)
        v6 = v6 + 1;
        return v6;
    end;
end;
return {
    story = function() --[[ Line: 19 ]] --[[ Name: story ]]
        -- upvalues: v1 (copy), v3 (copy), v5 (copy), v4 (copy), v2 (copy)
        local v8 = {
            Default = v1.createElement(v3, {
                LayoutOrder = 1, 
                Text = "Default", 
                [v1.Tag] = "X-Fit"
            })
        };
        local v9 = -1;
        local v10;
        do
            local l_v9_0 = v9;
            v10 = function() --[[ Line: 12 ]]
                -- upvalues: l_v9_0 (ref)
                l_v9_0 = l_v9_0 + 1;
                return l_v9_0;
            end;
        end;
        for v12, v13 in v5:GetChildren() do
            local v14 = v13.Selector:match("[A-Za-z0-9]+");
            v8[v12] = v1.createElement(v3, {
                LayoutOrder = v10(), 
                Text = v14, 
                [v1.Tag] = v4("X-Fit", v14)
            });
        end;
        v8["Using Font Face Prop"] = v1.createElement(v3, {
            FontFace = Font.fromId(8836875837), 
            LayoutOrder = v10(), 
            Text = "This TextLabel uses the FontFace prop", 
            [v1.Tag] = "X-Fit"
        });
        return v1.createElement(v2, {
            [v1.Tag] = "X-ColumnM X-FitY"
        }, v8);
    end
};