local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v3.Styling.joinTags;
local l_Pane_0 = v3.UI.Pane;
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
return v1.connect(function(v9) --[[ Line: 60 ]]
    return {
        Fonts = v9.Asset.Fonts
    };
end)(function(v10) --[[ Line: 24 ]] --[[ Name: FontStyleRenderer ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_joinTags_0 (copy)
    local l_Value_0 = v10.Value;
    local v12 = l_Value_0.Style == Enum.FontStyle.Italic;
    local l_Bold_0 = l_Value_0.Bold;
    return v2.createElement(l_Pane_0, {
        [v2.Tag] = "X-Middle X-PadS X-RowM"
    }, {
        Bold = v2.createElement(l_Pane_0, {
            [v2.Tag] = if l_Bold_0 then l_joinTags_0("FontStyle X-Corner X-Stroke", "Selected") else "FontStyle X-Corner X-Stroke"
        }, {
            BoldButton = v2.createElement("TextButton", {
                [v2.Event.Activated] = function(_) --[[ Line: 39 ]]
                    -- upvalues: l_Value_0 (copy), l_Bold_0 (copy), v10 (copy)
                    l_Value_0.Weight = if l_Bold_0 then Enum.FontWeight.Regular else Enum.FontWeight.Bold;
                    v10.OnChanged(l_Value_0);
                end, 
                [v2.Tag] = if l_Bold_0 then l_joinTags_0("FontStyle ItemTextSize X-Fill", "Selected") else "FontStyle ItemTextSize X-Fill"
            })
        }), 
        Italic = v2.createElement(l_Pane_0, {
            [v2.Tag] = if v12 then l_joinTags_0("FontStyle X-Corner X-Stroke", "Selected") else "FontStyle X-Corner X-Stroke"
        }, {
            ItalicButton = v2.createElement("TextButton", {
                [v2.Event.Activated] = function(_) --[[ Line: 50 ]]
                    -- upvalues: l_Value_0 (copy), v12 (copy), v10 (copy)
                    l_Value_0.Style = if v12 then Enum.FontStyle.Normal else Enum.FontStyle.Italic;
                    v10.OnChanged(l_Value_0);
                end, 
                [v2.Tag] = if v12 then l_joinTags_0("FontStyle ItemTextSize X-Fill", "Selected") else "FontStyle ItemTextSize X-Fill"
            })
        })
    });
end);