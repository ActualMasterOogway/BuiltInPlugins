local l_script_FirstAncestor_0 = script:FindFirstAncestor("SuperTemplate");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Foundation);
local l_Localization_0 = v2.ContextServices.Localization;
return function(v5) --[[ Line: 25 ]] --[[ Name: BasicExample ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy), v3 (copy)
    local v6 = l_Localization_0:use();
    return v1.createElement(v3.View, {
        tag = "row align-y-center padding-small bg-emphasis"
    }, {
        OptionalContent = if v5.showContent then v1.createElement(v3.Text, {
            Text = v6:getText("BasicExample", "Text"), 
            tag = "padding-small grow size-2800 bg-alert"
        }) else nil
    });
end;