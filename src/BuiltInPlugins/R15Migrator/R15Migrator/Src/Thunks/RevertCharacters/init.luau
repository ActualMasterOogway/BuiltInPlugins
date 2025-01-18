local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local _ = require(l_Actions_0.SetAdapted);
local v4 = require(l_Actions_0.SetCharacterConverted);
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v6 = require(l_Modules_0.NpcManager);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_CharacterTagging_0 = require(l_Util_0.PublishTagging).CharacterTagging;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
return function(v11) --[[ Line: 17 ]]
    -- upvalues: l_AdapterTagging_0 (copy), l_CharactersConvertedToR15Tagging_0 (copy), v6 (copy), l_CharacterTagging_0 (copy), v4 (copy), v1 (copy)
    return function(v12) --[[ Line: 18 ]]
        -- upvalues: l_AdapterTagging_0 (ref), l_CharactersConvertedToR15Tagging_0 (ref), v6 (ref), l_CharacterTagging_0 (ref), v4 (ref), v1 (ref), v11 (copy)
        local v13 = v12:getState();
        local l_selection_0 = v13.CharacterConversion.selection;
        local l_convertedCharacters_0 = v13.CharacterConversion.convertedCharacters;
        for _, v17 in l_selection_0 do
            local v18 = l_convertedCharacters_0[v17];
            if v18 and v18.model then
                l_AdapterTagging_0:removeTag(v18.model);
                l_CharactersConvertedToR15Tagging_0:removeTag(v18.model);
                local v19 = v18.model:Clone();
                v6.ReplaceModel(v17, v19, false);
                l_CharacterTagging_0:addTag(v19);
                v12:dispatch(v4(v18, false));
            end;
        end;
        local l_convertedCharacters_1 = v12:getState().CharacterConversion.convertedCharacters;
        if #v1.Dictionary.keys(l_convertedCharacters_1) == 0 then
            local l_AvatarUnification_0 = game:GetService("ReplicatedStorage"):FindFirstChild("AvatarUnification");
            if l_AvatarUnification_0 then
                l_AvatarUnification_0:Destroy();
            end;
            local l_StarterCharacterScripts_0 = game:GetService("StarterPlayer"):FindFirstChild("StarterCharacterScripts");
            if l_StarterCharacterScripts_0 then
                local l_LocalEffects_0 = l_StarterCharacterScripts_0:FindFirstChild("LocalEffects");
                if l_LocalEffects_0 then
                    l_LocalEffects_0:Destroy();
                end;
            end;
        end;
        v11:getHandler("onCharactersReverted")(l_convertedCharacters_0, l_selection_0);
    end;
end;