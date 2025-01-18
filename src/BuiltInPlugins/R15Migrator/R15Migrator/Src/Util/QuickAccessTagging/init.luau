local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_NonePublishTags_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).NonePublishTags;
local v3 = {
    _tag = nil
};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        _tag = v4
    }, v3));
end;
v3.addTag = function(v5, v6) --[[ Line: 25 ]] --[[ Name: addTag ]]
    -- upvalues: l_CollectionService_0 (copy)
    l_CollectionService_0:AddTag(v6, v5._tag);
end;
v3.removeTag = function(v7, v8) --[[ Line: 29 ]] --[[ Name: removeTag ]]
    -- upvalues: l_CollectionService_0 (copy)
    l_CollectionService_0:RemoveTag(v8, v7._tag);
end;
v3.getTagged = function(v9) --[[ Line: 33 ]] --[[ Name: getTagged ]]
    -- upvalues: l_CollectionService_0 (copy)
    return l_CollectionService_0:GetTagged(v9._tag);
end;
local v10 = {};
v10.clearTags = function(v11) --[[ Line: 40 ]] --[[ Name: clearTags ]]
    -- upvalues: v10 (copy)
    for _, v13 in {
        v10.CharactersConvertedToR15Tagging
    } do
        v13:removeTag(v11);
        for _, v15 in v11:GetDescendants() do
            v13:removeTag(v15);
        end;
    end;
end;
v10.CharactersConvertedToR15Tagging = v3.new(l_NonePublishTags_0.CharactersConvertedToR15Tag);
return v10;