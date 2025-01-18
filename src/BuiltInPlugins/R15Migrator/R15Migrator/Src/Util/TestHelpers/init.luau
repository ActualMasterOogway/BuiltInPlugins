local l_InsertService_0 = game:GetService("InsertService");
return {
    CreateScriptWithSource = function(_, v2) --[[ Line: 7 ]] --[[ Name: CreateScriptWithSource ]]
        local l_Script_0 = Instance.new("Script");
        l_Script_0.Source = v2;
        return l_Script_0;
    end, 
    GetSourceFromLocalFileContents = function(_, v5) --[[ Line: 13 ]] --[[ Name: GetSourceFromLocalFileContents ]]
        -- upvalues: l_InsertService_0 (copy)
        return l_InsertService_0:GetLocalFileContents("rbxasset://avatar/unification/testScripts/" .. v5 .. ".lua");
    end, 
    InsertTestScript = function(v6, v7) --[[ Line: 17 ]] --[[ Name: InsertTestScript ]]
        return v6:CreateScriptWithSource((v6:GetSourceFromLocalFileContents(v7)));
    end
};