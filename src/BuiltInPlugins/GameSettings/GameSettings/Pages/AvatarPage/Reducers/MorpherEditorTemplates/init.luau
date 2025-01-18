local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Packages.Rodux);
local v4 = require(l_Parent_0.Util.UtilityFunctionsTable);
local v5 = {
    templates = {}
};
return v3.createReducer(v5, {
    ResetStore = function(_, _) --[[ Line: 11 ]] --[[ Name: ResetStore ]]
        -- upvalues: v5 (copy)
        return v5;
    end, 
    TemplatesAdd = function(v8, v9) --[[ Line: 15 ]] --[[ Name: TemplatesAdd ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            templates = v9.templatesArrayToAdd
        });
    end, 
    TemplatesClobberTemplate = function(v10, v11) --[[ Line: 21 ]] --[[ Name: TemplatesClobberTemplate ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.Dictionary.join(v10, {
            templates = v4.immutableSetExistingDictionaryEntry(v10.templates, v11.templateToClobber, v11.newTemplateModel)
        });
    end
});