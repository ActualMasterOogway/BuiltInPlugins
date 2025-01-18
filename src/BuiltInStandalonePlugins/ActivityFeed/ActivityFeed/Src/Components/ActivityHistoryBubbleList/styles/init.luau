local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local v4 = v2.smallPadding - 1;
local v5 = v2.smallPadding - 2;
return l_createStyleRule_0(".Component-ActivityHistoryBubbleList", {}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingTop = UDim.new(0, v4), 
        PaddingBottom = UDim.new(0, v4)
    }), 
    l_createStyleRule_0(">> .Component-BubbleFrame", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 1), 
            PaddingTop = UDim.new(0, 1), 
            PaddingBottom = UDim.new(0, 1)
        })
    }), 
    l_createStyleRule_0("> ScrollingFrame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        l_createStyleRule_0("> Frame", {
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0("::UIListLayout", {
                Padding = UDim.new(0, v5)
            })
        })
    })
});