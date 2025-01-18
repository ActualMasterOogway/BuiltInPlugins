local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-AddCollaboratorButton", {}, {
    l_createStyleRule_0(".TeamCreate", {}, {
        l_createStyleRule_0(">> #ButtonIcon", {
            Image = "$AddCollaboratorInverse"
        })
    }), 
    l_createStyleRule_0(".NonTeamCreate", {}, {
        l_createStyleRule_0(">> #ButtonIcon", {
            Image = "$AddCollaborator"
        })
    }), 
    l_createStyleRule_0("> #StateLayer", {}, {
        l_createStyleRule_0("> #ButtonIcon", {
            LayoutOrder = 1
        }), 
        l_createStyleRule_0("> #ButtonText", {
            LayoutOrder = 2
        })
    })
});