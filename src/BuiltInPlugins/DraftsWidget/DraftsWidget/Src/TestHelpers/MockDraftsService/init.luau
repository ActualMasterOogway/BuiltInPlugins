game:DefineFastInt("DebugStudioDraftsWidgetWaitTime", 0);
local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Signal);
local v2 = {
    DEFAULT = 1, 
    EMPTY_TEST = 2, 
    SERVICE_DISABLED = 3
};
local function _(v3) --[[ Line: 36 ]] --[[ Name: checkScriptType ]]
    assert(typeof(v3) == "Instance");
    assert(v3:IsA("LuaSourceContainer"));
end;
local _ = function(v5) --[[ Line: 41 ]] --[[ Name: checkScriptsType ]]
    assert(type(v5) == "table");
    for _, v7 in pairs(v5) do
        assert(typeof(v7) == "Instance");
        assert(v7:IsA("LuaSourceContainer"));
    end;
end;
local _ = function(v9) --[[ Line: 51 ]] --[[ Name: validateTestCase ]]
    -- upvalues: v2 (copy)
    assert((typeof(v9 == "number")));
    for _, v11 in pairs(v2) do
        if v11 == v9 then
            return;
        end;
    end;
    assert(false, "Test case " .. v9 .. " is not valid");
end;
local function _(v13) --[[ Line: 66 ]] --[[ Name: createScript ]]
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = "Script" .. v13;
    return l_Script_0;
end;
local function v20(v16) --[[ Line: 75 ]] --[[ Name: createScripts ]]
    assert(typeof(v16) == "number");
    local v17 = {};
    for v18 = 1, v16 do
        local l_Script_1 = Instance.new("Script");
        l_Script_1.Name = "Script" .. v18;
        v17[v18] = l_Script_1;
    end;
    return v17;
end;
local function v21() --[[ Line: 84 ]] --[[ Name: getWaitTime ]]
    return game:GetFastInt("DebugStudioDraftsWidgetWaitTime");
end;
local v22 = {};
v22.__index = v22;
v22.TestCases = v2;
v22.new = function(v23) --[[ Line: 92 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy), v20 (copy), v22 (copy)
    local v24 = false;
    local v25 = {
        DraftAdded = v1.new(), 
        DraftRemoved = v1.new(), 
        DraftStatusChanged = v1.new(), 
        EditorsListChanged = v1.new(), 
        UpdateStatusChanged = v1.new(), 
        CommitStatusChanged = v1.new(), 
        __testCase = v23 or v2.DEFAULT, 
        __drafts = {}
    };
    local l___testCase_0 = v25.__testCase;
    assert((typeof(l___testCase_0 == "number")));
    for _, v28 in pairs(v2) do
        v24 = v28 == l___testCase_0;
        if v24 then
            break;
        end;
    end;
    if not v24 then
        assert(false, "Test case " .. l___testCase_0 .. " is not valid");
    end;
    v24 = false;
    if v25.__testCase ~= v2.EMPTY_TEST then
        v25.__drafts = v20(10);
    end;
    return (setmetatable(v25, v22));
end;
v22.GetDrafts = function(v29) --[[ Line: 114 ]] --[[ Name: GetDrafts ]]
    -- upvalues: v21 (copy), v2 (copy)
    wait(v21());
    if v29.__testCase == v2.SERVICE_DISABLED then
        error("DraftsService is not available");
    end;
    return v29.__drafts;
end;
v22.GetDraftStatus = function(_, v31) --[[ Line: 127 ]] --[[ Name: GetDraftStatus ]]
    assert(typeof(v31) == "Instance");
    assert(v31:IsA("LuaSourceContainer"));
    return Enum.DraftStatusCode.OK;
end;
v22.GetEditors = function(_, v33) --[[ Line: 132 ]] --[[ Name: GetEditors ]]
    assert(typeof(v33) == "Instance");
    assert(v33:IsA("LuaSourceContainer"));
    return {};
end;
v22.ShowDiffsAgainstBase = function(_, v35) --[[ Line: 137 ]] --[[ Name: ShowDiffsAgainstBase ]]
    assert(type(v35) == "table");
    for _, v37 in pairs(v35) do
        assert(typeof(v37) == "Instance");
        assert(v37:IsA("LuaSourceContainer"));
    end;
end;
v22.ShowDiffsAgainstServer = function(_, v39) --[[ Line: 141 ]] --[[ Name: ShowDiffsAgainstServer ]]
    assert(type(v39) == "table");
    for _, v41 in pairs(v39) do
        assert(typeof(v41) == "Instance");
        assert(v41:IsA("LuaSourceContainer"));
    end;
end;
v22.DiscardEdits = function(v42, v43) --[[ Line: 145 ]] --[[ Name: DiscardEdits ]]
    assert(type(v43) == "table");
    for _, v45 in pairs(v43) do
        assert(typeof(v45) == "Instance");
        assert(v45:IsA("LuaSourceContainer"));
    end;
    for _, v47 in ipairs(v43) do
        v42.DraftRemoved:fire(v47);
    end;
end;
v22.UpdateToLatestVersion = function(v48, v49) --[[ Line: 153 ]] --[[ Name: UpdateToLatestVersion ]]
    -- upvalues: v21 (copy)
    assert(type(v49) == "table");
    for _, v51 in pairs(v49) do
        assert(typeof(v51) == "Instance");
        assert(v51:IsA("LuaSourceContainer"));
    end;
    wait(v21());
    for _, v53 in ipairs(v49) do
        v48.UpdateStatusChanged:fire(v53, Enum.DraftStatusCode.OK);
    end;
end;
v22.CommitEdits = function(v54, v55) --[[ Line: 162 ]] --[[ Name: CommitEdits ]]
    -- upvalues: v21 (copy)
    assert(type(v55) == "table");
    for _, v57 in pairs(v55) do
        assert(typeof(v57) == "Instance");
        assert(v57:IsA("LuaSourceContainer"));
    end;
    wait(v21());
    for _, v59 in ipairs(v55) do
        v59.Parent = game.ServerScriptService;
        v54.CommitStatusChanged:fire(v59, Enum.DraftStatusCode.OK);
        delay(game:GetFastInt("DebugStudioDraftsWidgetWaitTime"), function() --[[ Line: 169 ]]
            -- upvalues: v54 (copy), v59 (copy)
            v54.DraftRemoved:fire(v59);
        end);
    end;
end;
return v22;