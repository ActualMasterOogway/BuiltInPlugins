local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return l_createStyleRule_0(".Explorer-ExplorerNodeRow", {}, {
    l_createStyleRule_0(".Explorer-SelectionKind-Selected >> .Explorer-ExplorerNodeRow-Display >> TextLabel", {
        TextColor3 = "$RDLSemanticColorContentStandard"
    }), 
    l_createStyleRule_0(">> .Explorer-Expanded > .Explorer-ArrowImage", {
        Image = v2.standard("expanded")
    }), 
    l_createStyleRule_0(">> .Explorer-Collapsed > .Explorer-ArrowImage", {
        Image = v2.standard("collapsed")
    }), 
    l_createStyleRule_0(">> .Explorer-NoChildren", {
        Interactable = false
    }, {
        l_createStyleRule_0("> .Explorer-ArrowImage", {
            Image = ""
        })
    })
});