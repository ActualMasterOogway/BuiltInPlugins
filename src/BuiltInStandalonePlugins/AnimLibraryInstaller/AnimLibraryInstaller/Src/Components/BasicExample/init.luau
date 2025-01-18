local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimLibraryInstaller");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
return function(v3) --[[ Line: 24 ]] --[[ Name: BasicExample ]]
    -- upvalues: l_Localization_0 (copy), v1 (copy)
    local v4 = l_Localization_0:use();
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-BasicExample X-Fit"
    }, {
        OptionalContent = if v3.showContent then v1.createElement("TextLabel", {
            Text = v4:getText("BasicExample", "Text")
        }) else nil
    });
end;