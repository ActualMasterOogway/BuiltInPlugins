local function _() --[[ Line: 9 ]] --[[ Name: getDefaultService ]]
    return game:GetService("StudioSdkService");
end;
local v1 = require(script.Parent.Typecheck.t);
local function v7(v2, v3, v4) --[[ Line: 16 ]] --[[ Name: findFirstChildOfNameAndType ]]
    for _, v6 in ipairs(v2:GetChildren()) do
        if v6:IsA(v4) and v6.Name == v3 then
            return v6;
        end;
    end;
    return nil;
end;
local v8 = {};
v8.__index = v8;
v8.BASE_FOLDER_NAME = "CrossPluginCommunication";
v8.new = function(v9, v10) --[[ Line: 30 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v8 (copy)
    assert(v1.string(v9), "pluginNamespace must be a string");
    assert(v1.optional(v1.instance(v9)), "hostService must be an instance if defined");
    return (setmetatable({
        hostService = v10 or game:GetService("StudioSdkService"), 
        pluginNamespace = v9
    }, v8));
end;
v8.cleanup = function(v11) --[[ Line: 42 ]] --[[ Name: cleanup ]]
    v11:getNamespaceFolder():Destroy();
end;
v8.ensureFolderExists = function(_, v13, v14) --[[ Line: 46 ]] --[[ Name: ensureFolderExists ]]
    -- upvalues: v7 (copy)
    local v15 = v7(v13, v14, "Folder");
    if not v15 then
        v15 = Instance.new("Folder");
        v15.Name = v14;
        v15.Parent = v13;
    end;
    return v15;
end;
v8.getNamespaceFolder = function(v16) --[[ Line: 58 ]] --[[ Name: getNamespaceFolder ]]
    return v16:ensureFolderExists(v16:ensureFolderExists(v16.hostService, v16.BASE_FOLDER_NAME), v16.pluginNamespace);
end;
v8.getFunction = function(v17, v18) --[[ Line: 64 ]] --[[ Name: getFunction ]]
    -- upvalues: v1 (copy), v7 (copy)
    assert(v1.string(v18), "name must be a string");
    local v19 = v17:getNamespaceFolder();
    local v20 = v7(v19, v18, "BindableFunction");
    if not v20 then
        error("No function named " .. v18 .. " exists");
    end;
    return v20;
end;
v8.ensureFunctionExists = function(v21, v22) --[[ Line: 78 ]] --[[ Name: ensureFunctionExists ]]
    -- upvalues: v1 (copy)
    assert(v1.string(v22), "name must be a string");
    local v23 = v21:getNamespaceFolder();
    local l_v23_FirstChild_0 = v23:FindFirstChild(v22);
    if l_v23_FirstChild_0 then
        assert(l_v23_FirstChild_0:IsA("BindableFunction"), ("CrossPluginCommunication expected %s to be a BindableFunction but it was a %s"):format(v22, l_v23_FirstChild_0.ClassName));
        return l_v23_FirstChild_0;
    else
        l_v23_FirstChild_0 = Instance.new("BindableFunction");
        l_v23_FirstChild_0.Name = v22;
        l_v23_FirstChild_0.Parent = v23;
        return l_v23_FirstChild_0;
    end;
end;
v8.ensureEventExists = function(v25, v26) --[[ Line: 103 ]] --[[ Name: ensureEventExists ]]
    -- upvalues: v1 (copy)
    assert(v1.string(v26), "name must be a string");
    local v27 = v25:getNamespaceFolder();
    local l_v27_FirstChild_0 = v27:FindFirstChild(v26);
    if l_v27_FirstChild_0 then
        assert(l_v27_FirstChild_0:IsA("BindableEvent"), ("CrossPluginCommunication expected %s to be a BindableEvent but it was a %s"):format(v26, l_v27_FirstChild_0.ClassName));
        return l_v27_FirstChild_0;
    else
        l_v27_FirstChild_0 = Instance.new("BindableEvent");
        l_v27_FirstChild_0.Name = v26;
        l_v27_FirstChild_0.Parent = v27;
        return l_v27_FirstChild_0;
    end;
end;
v8.Fire = function(v29, v30, ...) --[[ Line: 123 ]] --[[ Name: Fire ]]
    -- upvalues: v1 (copy)
    assert(v1.string(v30), "name must be a string");
    return v29:ensureEventExists(v30):Fire(...);
end;
v8.Connect = function(v31, v32, v33) --[[ Line: 130 ]] --[[ Name: Connect ]]
    -- upvalues: v1 (copy)
    assert(v1.string(v32), "name must be a string");
    assert(v1.callback(v33), "callback must be a function");
    return v31:ensureEventExists(v32).Event:Connect(v33);
end;
v8.Invoke = function(v34, v35, ...) --[[ Line: 138 ]] --[[ Name: Invoke ]]
    -- upvalues: v1 (copy)
    assert(v1.string(v35), "name must be a string");
    return v34:getFunction(v35):Invoke(...);
end;
v8.OnInvoke = function(v36, v37, v38) --[[ Line: 146 ]] --[[ Name: OnInvoke ]]
    -- upvalues: v1 (copy)
    assert(v1.string(v37), "name must be a string");
    assert(v1.callback(v38), "callback must be a function");
    v36:ensureFunctionExists(v37).OnInvoke = v38;
end;
return v8;