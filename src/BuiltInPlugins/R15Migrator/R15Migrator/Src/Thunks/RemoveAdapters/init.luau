local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetAdapted);
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v6 = require(l_Modules_0.NpcManager);
local v7 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
return function(v8) --[[ Line: 13 ]]
    -- upvalues: v6 (copy), l_AdapterTagging_0 (copy), v7 (copy), v4 (copy)
    return function(v9) --[[ Line: 14 ]]
        -- upvalues: v8 (copy), v6 (ref), l_AdapterTagging_0 (ref), v7 (ref), v4 (ref)
        local v10 = v9:getState();
        local l_diagnostics_0 = v10.ScriptConversion.diagnostics;
        local v12 = 0;
        for _, v14 in l_diagnostics_0 do
            v12 = v12 + #v14._list;
        end;
        local l_animations_0 = v10.AnimationConversion.animations;
        local v16 = 0;
        for _, v18 in l_animations_0 do
            if v18.status ~= nil then
                if v18.status ~= "Done" and v18.status ~= "Published" then
                    v16 = v16 + 1;
                end;
            else
                v16 = v16 + 1;
            end;
        end;
        local l_characters_0 = v10.CharacterConversion.characters;
        local v20 = 0;
        for _, _ in l_characters_0 do
            v20 = v20 + 1;
        end;
        v8:getHandler("onAdapterToggle")(false, v12, v16, v20);
        v6.ClearAdapterSetup();
        l_AdapterTagging_0:removeAllTags();
        game:GetService("Workspace"):SetAvatarUnificationMode(Enum.AvatarUnificationMode.Disabled);
        v7.SetAdapted(false);
        v9:dispatch(v4(false));
    end;
end;