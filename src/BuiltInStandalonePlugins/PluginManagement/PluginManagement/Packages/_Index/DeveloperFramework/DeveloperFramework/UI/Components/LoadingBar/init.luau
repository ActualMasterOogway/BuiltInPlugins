local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.UI.Components.Container);
local v5 = require(l_Parent_0.Util.Typecheck);
local v6 = v1.PureComponent:extend("LoadingBar");
v5.wrap(v6, script);
v6.init = function(_, v8) --[[ Line: 37 ]] --[[ Name: init ]]
    assert(type(v8.Progress) == "number", "LoadingBar expects a 'Progress' prop.");
end;
v6.render = function(v9) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v4 (copy)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v12 = math.clamp(l_props_0.Progress, 0, 1);
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Background_0 = l_Stylizer_0.Background;
    local l_BackgroundStyle_0 = l_Stylizer_0.BackgroundStyle;
    local l_Foreground_0 = l_Stylizer_0.Foreground;
    local l_ForegroundStyle_0 = l_Stylizer_0.ForegroundStyle;
    return v1.createElement(v4, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Background = l_Background_0, 
        BackgroundStyle = l_BackgroundStyle_0
    }, {
        LoadingBar = v1.createElement(v4, {
            Size = UDim2.new(v12, 0, 1, 0), 
            Background = l_Foreground_0, 
            BackgroundStyle = l_ForegroundStyle_0
        })
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v6));