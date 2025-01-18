local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.PreferencesContext);
local v5 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v6 = {
    preferredTransparency = 1, 
    reducedMotion = false
};
return function(v7) --[[ Line: 26 ]] --[[ Name: PreferencesProvider ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v4 (copy)
    local v8 = v5({
        preferredTransparency = v7.preferredTransparency, 
        reducedMotion = v7.reducedMotion
    }, v6);
    return v3.createElement(v4.Provider, {
        value = v8
    }, v7.children);
end;