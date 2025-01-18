local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 4 ]]
    assert(type(v1) == "string", "sourceLanguage must be a string");
    assert(type(v2) == "table", "targetLanguages must be a table");
    return {
        sourceLanguage = v1, 
        targetLanguages = v2
    };
end);