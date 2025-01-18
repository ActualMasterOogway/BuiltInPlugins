local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(script.Parent.ScrollingFrame);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Components.View);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v10 = require(l_script_FirstAncestor_0.Utility.useStyledDefaults);
local v11 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v12 = require(l_script_FirstAncestor_0.Enums.ScrollBarVisibility);
local v13 = require(l_script_FirstAncestor_0.Enums.ControlState);
local v14 = {
    layout = {
        SortOrder = Enum.SortOrder.LayoutOrder
    }, 
    scroll = {
        scrollBarVisibility = v12.Auto
    }, 
    AutoLocalize = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
return v3.memo(v3.forwardRef(function(v15, v16) --[[ Line: 55 ]] --[[ Name: ScrollView ]]
    -- upvalues: v2 (copy), v10 (copy), v14 (copy), v8 (copy), v9 (copy), v11 (copy), v3 (copy), v13 (copy), v4 (copy), v7 (copy), v5 (copy)
    local v17 = if v2.FoundationStylingPolyfill then v10("View", v15.tag, "gui-object-defaults", v14) else nil;
    local v18 = v8(v15, if v2.FoundationStylingPolyfill then v17 else v14);
    local v19 = v9(v18.tag, "gui-object-defaults");
    local v20 = v11(v19);
    local v21, v22 = v3.useState(v13.Initialize);
    local v24 = v4.Dictionary.union(v18, {
        onStateChanged = function(v23) --[[ Line: 69 ]] --[[ Name: onStateChanged ]]
            -- upvalues: v22 (copy), v18 (copy)
            v22(v23);
            if v18.onStateChanged ~= nil then
                v18.onStateChanged(v23);
            end;
        end, 
        stateLayer = if not not v18.onStateChanged or v18.onActivated then v18.stateLayer else {
            affordance = "None"
        }, 
        selection = {
            Selectable = false
        }, 
        ref = v16, 
        [v3.Tag] = v20
    });
    v24.scroll = nil;
    v24.layout = nil;
    return v3.createElement(v7, v24, {
        ScrollingFrame = v3.createElement(v5, {
            controlState = v21, 
            scrollBarVisibility = v18.scroll.scrollBarVisibility, 
            AutomaticCanvasSize = v18.scroll.AutomaticCanvasSize, 
            CanvasSize = v18.scroll.CanvasSize, 
            ScrollingDirection = v18.scroll.ScrollingDirection, 
            ref = v18.scrollingFrameRef
        }, if v18.children and v18.layout ~= nil and v18.layout.FillDirection ~= nil then v4.Dictionary.union({
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = v18.layout.FillDirection, 
                ItemLineAlignment = v18.layout.ItemLineAlignment, 
                HorizontalAlignment = v18.layout.HorizontalAlignment, 
                HorizontalFlex = v18.layout.HorizontalFlex, 
                VerticalAlignment = v18.layout.VerticalAlignment, 
                VerticalFlex = v18.layout.VerticalFlex, 
                Padding = v18.layout.Padding, 
                SortOrder = v18.layout.SortOrder, 
                Wraps = v18.layout.Wraps
            })
        }, v18.children) else v18.children)
    });
end));