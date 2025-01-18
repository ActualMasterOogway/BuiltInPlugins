local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_t_0 = v2.Util.Typecheck.t;
local v5 = require(script.Parent.BacktraceInterfaces);
local v6 = require(script.Parent.processErrorStack);
local v7 = {
    IAttributes = v5.IAttributes, 
    IAnnotations = v5.IAnnotations
};
v7.__index = v7;
local l_status_0, _ = pcall(function() --[[ Line: 32 ]]
    return game:GetService("ProcessService");
end);
v7.new = function() --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: l_HttpService_0 (copy), v7 (copy)
    local v10 = os.date("!*t");
    local v11 = {
        uuid = l_HttpService_0:GenerateGUID(false):lower(), 
        timestamp = os.time(v10), 
        lang = "lua", 
        langVersion = "Roblox" .. _VERSION, 
        agent = "backtrace-Lua", 
        agentVersion = "0.1.0", 
        threads = {}, 
        mainThread = "default"
    };
    setmetatable(v11, v7);
    return v11;
end;
v7.fromMessageAndStack = function(v12, v13) --[[ Line: 58 ]] --[[ Name: fromMessageAndStack ]]
    -- upvalues: l_t_0 (copy), v7 (copy), l_status_0 (copy), v6 (copy)
    assert(l_t_0.string(v12), "Expected errorMessage to be a string");
    assert(l_t_0.string(v13), "Expected errorStack to be a string");
    local v14 = v7.new();
    v14:addAttributes({
        ["error.message"] = v12, 
        PlayerId = not l_status_0 and game:GetService("StudioService"):GetUserId() or nil
    });
    local v15, v16 = v6(v13);
    v14:addStackToMainThread(v15);
    v14.sourceCode = v16;
    return v14;
end;
v7.validate = function(v17) --[[ Line: 76 ]] --[[ Name: validate ]]
    -- upvalues: v5 (copy)
    return v5.IBacktraceReport(v17);
end;
v7.addAttributes = function(v18, v19) --[[ Line: 80 ]] --[[ Name: addAttributes ]]
    -- upvalues: v3 (copy)
    assert(v18.IAttributes(v19), "Expected newAttributes to be a table");
    v18.attributes = v3.Dictionary.join(v18.attributes or {}, v19);
end;
v7.addAnnotations = function(v20, v21) --[[ Line: 85 ]] --[[ Name: addAnnotations ]]
    -- upvalues: v3 (copy)
    assert(v20.IAnnotations(v21), "Expected newAnnotations to be a table");
    v20.annotations = v3.Dictionary.join(v20.annotations or {}, v21);
end;
v7.addStackToThread = function(v22, v23, v24) --[[ Line: 90 ]] --[[ Name: addStackToThread ]]
    -- upvalues: l_t_0 (copy), v3 (copy)
    assert(l_t_0.table(v23), "Expected stack to be an array of tables");
    assert(l_t_0.string(v24), "Expected threadName to be a string");
    v22.threads = v3.Dictionary.join(v22.threads, {
        [v24] = {
            name = v24, 
            stack = v23
        }
    });
end;
v7.addStackToMainThread = function(v25, v26) --[[ Line: 101 ]] --[[ Name: addStackToMainThread ]]
    -- upvalues: l_t_0 (copy)
    assert(l_t_0.table(v26), "Expected stack to be an array of tables");
    v25:addStackToThread(v26, v25.mainThread);
end;
return v7;