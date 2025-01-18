local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.DEPRECATED_modules.Http.Url);
local v2 = require(l_Parent_0.Src.Util.wrapStrictTable);
local v3 = {};
local v4 = v1.BASE_URL .. "headshot-thumbnail/image?";
local _ = v1.DEVELOP_URL .. "/v1/groups/%s";
local v6 = v1.DATA_URL .. "Data/Upload.ashx?";
local v7 = v1.DEVELOP_URL .. "v1/user/groups/canmanage";
v3.constructUserThumbnailUrl = function(v8, v9) --[[ Line: 17 ]] --[[ Name: constructUserThumbnailUrl ]]
    -- upvalues: v4 (copy), v1 (copy)
    v9 = v9 or 100;
    return v4 .. v1.makeQueryString({
        userId = v8, 
        width = v9, 
        height = v9, 
        format = "png"
    });
end;
v3.constructPostUploadAssetUrl = function(v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 30 ]] --[[ Name: constructPostUploadAssetUrl ]]
    -- upvalues: v6 (copy), v1 (copy)
    return v6 .. v1.makeQueryString({
        assetid = v10, 
        type = tostring(v11), 
        name = tostring(v12), 
        description = tostring(v13), 
        genreTypeId = v14, 
        ispublic = v15 and "True" or "False", 
        allowComments = v16 and "True" or "False", 
        groupId = v17 or "", 
        isPackage = true
    });
end;
v3.constructGetMyGroupUrl = function() --[[ Line: 54 ]] --[[ Name: constructGetMyGroupUrl ]]
    -- upvalues: v7 (copy)
    return v7;
end;
return v2(v3);