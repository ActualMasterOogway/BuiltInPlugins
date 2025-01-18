local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.PreviewContext);
local v3 = {};
local function v8(v4) --[[ Line: 10 ]] --[[ Name: MockProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5, v6 = v1.useState(v4.selectedMaterial);
    local v7 = {
        selectedMaterial = v5, 
        setSelectedMaterial = v6, 
        applySelectedMaterial = function() --[[ Line: 19 ]] --[[ Name: applySelectedMaterial ]]

        end
    };
    return v1.createElement(v2.Provider, {
        value = v7
    }, v4.children);
end;
v3.BasicProvider = function(v9) --[[ Line: 27 ]] --[[ Name: BasicProvider ]]
    -- upvalues: v1 (copy), v8 (copy)
    return v1.createElement(v8, {
        selectedMaterial = v9.selectedMaterial
    }, v9.children);
end;
return v3;