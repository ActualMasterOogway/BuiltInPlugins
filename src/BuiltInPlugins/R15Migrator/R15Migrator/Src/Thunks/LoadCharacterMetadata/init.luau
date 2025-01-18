local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v2 = require(l_Modules_0.NpcManager);
local v3 = require(l_Modules_0.NpcIdManager);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.SaveInterface);
local l_CharacterTagging_0 = require(l_Util_0.PublishTagging).CharacterTagging;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
local v9 = require(l_script_FirstAncestor_0.Src.Actions.SetCharacterMetadata);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local _ = require(l_Actions_0.SetAdapted);
local function v21(v12) --[[ Line: 18 ]] --[[ Name: getCharacterMetaData ]]
    -- upvalues: v5 (copy), l_CharactersConvertedToR15Tagging_0 (copy), v2 (copy), l_AdapterTagging_0 (copy), v3 (copy)
    local v13 = nil;
    local v14 = {};
    for _, v16 in v12 do
        local v17 = nil;
        if v16:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
            v17 = v16:Clone();
        else
            v13 = v13 or v5.getR6Characters();
            local v18 = v13[v5.getConversionId(v16)];
            if not v18 then
                warn("Original R6 character is unavailable. Was the save folder edited?");
                continue;
            else
                l_CharactersConvertedToR15Tagging_0:addTag(v16);
                if v2.HasUnificationScripts(v16) then
                    l_AdapterTagging_0:addTag(v16);
                else
                    l_AdapterTagging_0:removeTag(v16);
                end;
                v17 = v18:Clone();
                v17.Name = v16.Name;
            end;
        end;
        local l_v16_FullName_0 = v16:GetFullName();
        local v20 = v5.getConversionId(v16);
        if v20 then
            v3.SetNpcWithId(v16, v20);
        else
            v20 = v3.AddNpc(v16);
        end;
        v14[v20] = {
            key = v20, 
            fullName = l_v16_FullName_0, 
            model = v17
        };
    end;
    return v14;
end;
local function v26(v22, v23) --[[ Line: 61 ]] --[[ Name: setupManullyConvertion ]]
    -- upvalues: l_CharacterTagging_0 (copy), v2 (copy), l_AdapterTagging_0 (copy), l_CharactersConvertedToR15Tagging_0 (copy)
    for _, v25 in pairs(v22) do
        if l_CharacterTagging_0:hasTagged(v25) then
            if v23 then
                v2.SetupUnificationScripts(v25);
                l_AdapterTagging_0:addTag(v25);
            end;
            l_CharactersConvertedToR15Tagging_0:addTag(v25);
            l_CharacterTagging_0:removeTag(v25);
        end;
    end;
end;
local function v39(v27, v28) --[[ Line: 81 ]] --[[ Name: loadCharacterMetadata ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), v21 (copy), v26 (copy), l_CharacterTagging_0 (copy), v9 (copy)
    local v29 = v27:getState();
    v3.Reset();
    local v30 = v2.GetR6Npcs();
    v5.addConvertibleCharacters(v30);
    local v31 = v21(v30);
    local v32 = v2.GetR15ConvertedNpcs();
    local l_adapted_0 = v29.Adapter.adapted;
    v26(v32, l_adapted_0);
    local v34 = v21(v32);
    for _, v36 in pairs(v30) do
        l_CharacterTagging_0:addTag(v36);
    end;
    for _, v38 in pairs(v32) do
        l_CharacterTagging_0:removeTag(v38);
    end;
    v27:dispatch(v9(v31, v34));
    v28:getHandler("onCharactersLoaded")(v31, v34);
    game:GetService("Workspace"):SetAvatarUnificationMode(l_adapted_0 and Enum.AvatarUnificationMode.Enabled or Enum.AvatarUnificationMode.Disabled);
end;
return function(v40) --[[ Line: 106 ]]
    -- upvalues: v39 (copy)
    return function(v41) --[[ Line: 107 ]]
        -- upvalues: v39 (ref), v40 (copy)
        coroutine.wrap(v39)(v41, v40);
    end;
end;