local _ = script.Parent.Parent.Parent;
local l_ToolboxEnableAudioGrantDialog_0 = game:GetFastFlag("ToolboxEnableAudioGrantDialog");
local v2 = {};
v2.__index = v2;
v2.INSERT_TO_WORKSPACE = 0;
v2.INSERT_TO_STARTER_PACK = 1;
v2.INSERT_CANCELLED = 2;
v2.new = function(v3, v4, v5) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v6 = {
        _onPromptCallback = v3, 
        _onScriptWarningCallback = v4, 
        _onPermissionsGrantCallback = v5, 
        _bindable = Instance.new("BindableEvent"), 
        _waiting = false
    };
    setmetatable(v6, v2);
    return v6;
end;
v2.isWaiting = function(v7) --[[ Line: 23 ]] --[[ Name: isWaiting ]]
    return v7._waiting;
end;
v2.destroy = function(v8) --[[ Line: 27 ]] --[[ Name: destroy ]]
    v8:cancel();
    v8._bindable:Destroy();
end;
v2.insertToWorkspace = function(v9) --[[ Line: 32 ]] --[[ Name: insertToWorkspace ]]
    -- upvalues: v2 (copy)
    v9._bindable:Fire(v2.INSERT_TO_WORKSPACE);
end;
v2.insertToStarterPack = function(v10) --[[ Line: 36 ]] --[[ Name: insertToStarterPack ]]
    -- upvalues: v2 (copy)
    v10._bindable:Fire(v2.INSERT_TO_STARTER_PACK);
end;
v2.cancel = function(v11) --[[ Line: 40 ]] --[[ Name: cancel ]]
    -- upvalues: v2 (copy)
    v11._bindable:Fire(v2.INSERT_CANCELLED);
end;
v2.dismissWarningPrompt = function(v12) --[[ Line: 44 ]] --[[ Name: dismissWarningPrompt ]]
    v12._bindable:Fire();
end;
v2.returnResult = function(v13, v14) --[[ Line: 48 ]] --[[ Name: returnResult ]]
    v13._bindable:Fire(v14);
end;
v2.promptPermissionsGrantAndWait = function(v15, v16) --[[ Line: 52 ]] --[[ Name: promptPermissionsGrantAndWait ]]
    -- upvalues: l_ToolboxEnableAudioGrantDialog_0 (copy)
    if not l_ToolboxEnableAudioGrantDialog_0 then
        return false;
    else
        v15._waiting = true;
        v15._onPermissionsGrantCallback(v16);
        local v17 = v15._bindable.Event:Wait();
        v15._waiting = false;
        return v17;
    end;
end;
v2.promptScriptWarningAndWait = function(v18, v19) --[[ Line: 63 ]] --[[ Name: promptScriptWarningAndWait ]]
    v18._waiting = true;
    if v18._onScriptWarningCallback(v19) then
        v18._bindable.Event:Wait();
    end;
    v18._waiting = false;
end;
v2.promptAndWait = function(v20) --[[ Line: 71 ]] --[[ Name: promptAndWait ]]
    -- upvalues: v2 (copy)
    if v20._waiting then
        return v2.INSERT_CANCELLED;
    else
        v20._waiting = true;
        v20._onPromptCallback();
        local v21 = v20._bindable.Event:Wait();
        v20._waiting = false;
        return v21;
    end;
end;
return v2;