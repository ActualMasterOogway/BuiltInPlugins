local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Styling.createStyleRule);
return v1(".Component-Markdown", {}, {
    v1(">> .Header ::UIPadding", {
        PaddingTop = UDim.new(0, 20)
    }), 
    v1(">> .Paragraph ::UIPadding", {
        PaddingTop = UDim.new(0, 10)
    }), 
    v1(">> .List ::UIPadding", {
        PaddingTop = UDim.new(0, 30)
    }, {
        v1(">> .ListItem ::UIPadding", {
            PaddingTop = UDim.new(0, 20)
        })
    }), 
    v1(">> .CodeBlock ::UIPadding", {
        PaddingTop = UDim.new(0, 10), 
        PaddingBottom = UDim.new(0, 10)
    })
});