local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Fields.FieldTypes);
local v2 = require(l_script_FirstAncestor_0.Fields.createPropertyWatcher);
return {
    key = "runContext", 
    icon = "", 
    watch = v2("BaseScript", "RunContext"), 
    validateArgs = function() --[[ Line: 12 ]] --[[ Name: validateArgs ]]
        return true;
    end, 
    permanent = true
};