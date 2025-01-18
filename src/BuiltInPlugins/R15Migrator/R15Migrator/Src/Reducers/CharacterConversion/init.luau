local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.ResetConvertedCharacters);
local v5 = require(l_Actions_0.SetCharacterConverted);
local v6 = require(l_Actions_0.SetCharacterMetadata);
local v7 = require(l_Actions_0.SetCharacterSelection);
local v8 = require(l_Actions_0.SetWorldModels);
local v9 = require(l_Actions_0.ResetAllCharacterConversion);
local function v10() --[[ Line: 13 ]] --[[ Name: getInitialState ]]
    return {
        characterMetadataLoadedVersion = 0, 
        characters = {}, 
        convertedCharacters = {}, 
        worldModels = {}, 
        selection = {}
    };
end;
return (v1.createReducer(v10(), {
    [v5.name] = function(v11, v12) --[[ Line: 25 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v11, {
            characters = v2.Dictionary.join(v11.characters, {
                [v12.characterInfo.key] = if v12.isConverted then v2.None else v12.characterInfo
            }), 
            convertedCharacters = v2.Dictionary.join(v11.convertedCharacters, {
                [v12.characterInfo.key] = if v12.isConverted then v12.characterInfo else v2.None
            })
        });
    end, 
    [v4.name] = function(v13, _) --[[ Line: 37 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v13, {
            convertedCharacters = {}
        });
    end, 
    [v6.name] = function(v15, v16) --[[ Line: 43 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v15, {
            characterMetadataLoadedVersion = v15.characterMetadataLoadedVersion + 1, 
            characters = v16.characters, 
            convertedCharacters = v16.convertedCharacters, 
            worldModels = {}
        });
    end, 
    [v7.name] = function(v17, v18) --[[ Line: 52 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v17, {
            selection = v18.selection
        });
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 58 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v19, {
            worldModels = v2.Dictionary.join(v19.worldModels, v20.newWorldModelEntries)
        });
    end, 
    [v9.name] = function(v21, _) --[[ Line: 64 ]]
        -- upvalues: v2 (copy), v10 (copy)
        return v2.Dictionary.join(v21, (v10()));
    end
}));