local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local _ = require(l_Actions_0.SetAdapted);
local v3 = require(l_Actions_0.SetCharacterConverted);
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v5 = require(l_Modules_0.NpcManager);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharacterTagging_0 = require(l_Util_0.PublishTagging).CharacterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
return function(v10) --[[ Line: 16 ]]
    -- upvalues: v5 (copy), l_CharactersConvertedToR15Tagging_0 (copy), l_AdapterTagging_0 (copy), l_CharacterTagging_0 (copy), v3 (copy)
    return function(v11) --[[ Line: 17 ]]
        -- upvalues: v5 (ref), l_CharactersConvertedToR15Tagging_0 (ref), l_AdapterTagging_0 (ref), l_CharacterTagging_0 (ref), v3 (ref), v10 (copy)
        local v12 = v11:getState();
        local l_selection_0 = v12.CharacterConversion.selection;
        local l_characters_0 = v12.CharacterConversion.characters;
        for _, v16 in l_selection_0 do
            local v17 = l_characters_0[v16];
            if v17 and v17.model then
                local v18 = v17.model:Clone();
                v5.ReplaceModel(v16, v18, true, v12.Adapter.adapted);
                l_CharactersConvertedToR15Tagging_0:addTag(v18);
                l_AdapterTagging_0:addTag(v18);
                l_CharacterTagging_0:removeTag(v18);
                v11:dispatch(v3(v17, true));
            end;
        end;
        v10:getHandler("onCharactersConverted")(l_characters_0, l_selection_0);
    end;
end;