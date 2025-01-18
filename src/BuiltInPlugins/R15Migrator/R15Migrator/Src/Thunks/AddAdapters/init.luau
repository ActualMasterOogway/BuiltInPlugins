local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local l_AdapterTagging_0 = require(l_Util_0.PublishTagging).AdapterTagging;
local l_CharactersConvertedToR15Tagging_0 = require(l_Util_0.QuickAccessTagging).CharactersConvertedToR15Tagging;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v5 = require(l_Actions_0.SetAdapted);
local l_Modules_0 = l_script_FirstAncestor_0.Src.Modules;
local v7 = require(l_Modules_0.NpcManager);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
return function(v9) --[[ Line: 14 ]]
    -- upvalues: l_CharactersConvertedToR15Tagging_0 (copy), v7 (copy), l_AdapterTagging_0 (copy), v8 (copy), v5 (copy)
    return function(v10) --[[ Line: 15 ]]
        -- upvalues: v9 (copy), l_CharactersConvertedToR15Tagging_0 (ref), v7 (ref), l_AdapterTagging_0 (ref), v8 (ref), v5 (ref)
        v9:getHandler("onAdapterToggle")(true);
        for _, v12 in pairs(l_CharactersConvertedToR15Tagging_0:getTagged()) do
            v7.SetupUnificationScripts(v12);
            l_AdapterTagging_0:addTag(v12);
        end;
        v8.SetAdapted(true);
        v10:dispatch(v5(true));
        game:GetService("Workspace"):SetAvatarUnificationMode(Enum.AvatarUnificationMode.Enabled);
    end;
end;