local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local function _(v2) --[[ Line: 8 ]] --[[ Name: createKey ]]
    local v3 = newproxy(true);
    getmetatable(v3).__tostring = function() --[[ Line: 11 ]]
        -- upvalues: v2 (copy)
        return "Symbol(" .. v2 .. ")";
    end;
    return v3;
end;
local v5 = {};
local v6 = newproxy(true);
local v7 = getmetatable(v6);
local v8 = "NoAccessPermission";
local l_v8_0 = v8 --[[ copy: 8 -> 9 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_0 (copy)
    return "Symbol(" .. l_v8_0 .. ")";
end;
v5.NoAccessKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "PlayPermission";
local l_v8_1 = v8 --[[ copy: 8 -> 10 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_1 (copy)
    return "Symbol(" .. l_v8_1 .. ")";
end;
v5.PlayKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "EditPermission";
local l_v8_2 = v8 --[[ copy: 8 -> 11 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_2 (copy)
    return "Symbol(" .. l_v8_2 .. ")";
end;
v5.EditKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "NoEditMustBeFriendPermission";
local l_v8_3 = v8 --[[ copy: 8 -> 12 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_3 (copy)
    return "Symbol(" .. l_v8_3 .. ")";
end;
v5.NoEditMustBeFriendKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "NoUserEditGroupGamePermission";
local l_v8_4 = v8 --[[ copy: 8 -> 13 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_4 (copy)
    return "Symbol(" .. l_v8_4 .. ")";
end;
v5.NoUserEditGroupGameKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "AdminPermission";
local l_v8_5 = v8 --[[ copy: 8 -> 14 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_5 (copy)
    return "Symbol(" .. l_v8_5 .. ")";
end;
v5.AdminKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "OwnerPermission";
local l_v8_6 = v8 --[[ copy: 8 -> 15 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_6 (copy)
    return "Symbol(" .. l_v8_6 .. ")";
end;
v5.OwnerKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "MultiplePermission";
local l_v8_7 = v8 --[[ copy: 8 -> 16 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_7 (copy)
    return "Symbol(" .. l_v8_7 .. ")";
end;
v5.MultipleKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "UserSubjectType";
local l_v8_8 = v8 --[[ copy: 8 -> 17 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_8 (copy)
    return "Symbol(" .. l_v8_8 .. ")";
end;
v5.UserSubjectKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "GroupSubjectType";
local l_v8_9 = v8 --[[ copy: 8 -> 18 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_9 (copy)
    return "Symbol(" .. l_v8_9 .. ")";
end;
v5.GroupSubjectKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "RoleSubjectType";
local l_v8_10 = v8 --[[ copy: 8 -> 19 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_10 (copy)
    return "Symbol(" .. l_v8_10 .. ")";
end;
v5.RoleSubjectKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "Action";
local l_v8_11 = v8 --[[ copy: 8 -> 20 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_11 (copy)
    return "Symbol(" .. l_v8_11 .. ")";
end;
v5.ActionKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "SubjectId";
local l_v8_12 = v8 --[[ copy: 8 -> 21 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_12 (copy)
    return "Symbol(" .. l_v8_12 .. ")";
end;
v5.SubjectIdKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "SubjectName";
local l_v8_13 = v8 --[[ copy: 8 -> 22 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_13 (copy)
    return "Symbol(" .. l_v8_13 .. ")";
end;
v5.SubjectNameKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "SubjectType";
local l_v8_14 = v8 --[[ copy: 8 -> 23 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_14 (copy)
    return "Symbol(" .. l_v8_14 .. ")";
end;
v5.SubjectTypeKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "SubjectRank";
local l_v8_15 = v8 --[[ copy: 8 -> 24 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_15 (copy)
    return "Symbol(" .. l_v8_15 .. ")";
end;
v5.SubjectRankKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "GroupId";
local l_v8_16 = v8 --[[ copy: 8 -> 25 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_16 (copy)
    return "Symbol(" .. l_v8_16 .. ")";
end;
v5.GroupIdKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "GroupName";
local l_v8_17 = v8 --[[ copy: 8 -> 26 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_17 (copy)
    return "Symbol(" .. l_v8_17 .. ")";
end;
v5.GroupNameKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "GroupMemberCountKey";
local l_v8_18 = v8 --[[ copy: 8 -> 27 ]];
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: l_v8_18 (copy)
    return "Symbol(" .. l_v8_18 .. ")";
end;
v5.GroupMemberCountKey = v6;
v6 = newproxy(true);
v7 = getmetatable(v6);
v8 = "IsFriend";
v7.__tostring = function() --[[ Line: 11 ]]
    -- upvalues: v8 (copy)
    return "Symbol(" .. v8 .. ")";
end;
v5.IsFriendKey = v6;
local v28 = {
    DEPRECATED_MaxSearchResultsPerSubjectType = 3, 
    MaxSearchResultsPerSubjectTypeUsers = 3, 
    MaxSearchResultsPerSubjectTypeGroups = 2
};
return v1.Dictionary.join(v5, v28);