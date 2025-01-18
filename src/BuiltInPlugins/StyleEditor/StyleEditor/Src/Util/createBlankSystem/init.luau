local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
return function() --[[ Line: 6 ]] --[[ Name: createBlankSystem ]]
    -- upvalues: l_createStyleSheet_0 (copy), l_createStyleRule_0 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "Design";
    l_createStyleSheet_0("Design", {
        l_createStyleRule_0("Frame"), 
        l_createStyleRule_0("ScrollingFrame"), 
        l_createStyleRule_0("TextLabel"), 
        l_createStyleRule_0("TextButton"), 
        l_createStyleRule_0("TextBox"), 
        l_createStyleRule_0("ImageButton"), 
        l_createStyleRule_0("ImageLabel")
    }, {
        StyleCategory = "Designs"
    }).Parent = l_Folder_0;
    return l_Folder_0;
end;