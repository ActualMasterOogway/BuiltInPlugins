local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.StateModelTemplate);
local v3 = {
    getStateModelTemplate = function(v2) --[[ Line: 9 ]] --[[ Name: getStateModelTemplate ]]
        return v2.StateTemplates and v2.StateTemplates.templates and v2.template and v2.StateTemplates.templates[v2.template];
    end
};
v3.getStateModelTemplateCopy = function(v4) --[[ Line: 16 ]] --[[ Name: getStateModelTemplateCopy ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.makeCopy(v3.getStateModelTemplate(v4));
end;
return v3;