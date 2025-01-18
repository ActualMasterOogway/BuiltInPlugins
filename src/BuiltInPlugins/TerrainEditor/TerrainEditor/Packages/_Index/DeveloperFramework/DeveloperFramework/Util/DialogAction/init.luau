local l_Parent_0 = script:FindFirstAncestor("Util").Parent;
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local function v3(v2) --[[ Line: 55 ]] --[[ Name: createStandardAction ]]
    -- upvalues: l_LOCALIZATION_PROJECT_NAME_0 (copy)
    return table.freeze({
        Label = {
            Project = l_LOCALIZATION_PROJECT_NAME_0, 
            Scope = "DialogAction", 
            Key = v2
        }, 
        HidesDialog = true
    });
end;
return {
    YES = v3("Yes"), 
    NO = v3("No"), 
    OK = v3("OK"), 
    CANCEL = v3("Cancel"), 
    CLOSE = v3("Close"), 
    SAVE = v3("Save")
};