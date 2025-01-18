local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local v2 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v1.doesSaveFolderExistInDM() then
        v2:checkPublishTags();
    end;
end;