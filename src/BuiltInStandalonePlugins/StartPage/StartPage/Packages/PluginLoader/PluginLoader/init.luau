local l_StudioService_0 = game:GetService("StudioService");
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = {
        _signal = Instance.new("BindableEvent"), 
        _handlers = {}, 
        _eventsToFlush = {}, 
        _connections = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.Fire = function(v3, ...) --[[ Line: 30 ]] --[[ Name: Fire ]]
    if #v3._handlers > 0 then
        v3._signal:Fire(...);
        return;
    else
        table.insert(v3._eventsToFlush, {
            ...
        });
        return;
    end;
end;
v1.Connect = function(v4, v5) --[[ Line: 40 ]] --[[ Name: Connect ]]
    if #v4._handlers == 0 then
        for _, v7 in ipairs(v4._eventsToFlush) do
            task.spawn(function() --[[ Line: 44 ]]
                -- upvalues: v5 (copy), v7 (copy)
                v5(unpack(v7));
            end);
        end;
        v4._eventsToFlush = {};
    end;
    local v8 = v4._signal.Event:Connect(v5);
    table.insert(v4._handlers, v5);
    table.insert(v4._connections, v8);
    return v8;
end;
v1.Destroy = function(v9) --[[ Line: 57 ]] --[[ Name: Destroy ]]
    v9._handlers = {};
    v9._eventsToFlush = {};
    for _, v11 in ipairs(v9._connections) do
        v11:Disconnect();
    end;
    v9._signal:Destroy();
end;
local v12 = {};
v12.__index = v12;
local function _(v13) --[[ Line: 73 ]] --[[ Name: getLocale ]]
    -- upvalues: l_StudioService_0 (copy)
    if v13 ~= nil then
        return v13;
    else
        return l_StudioService_0.StudioLocaleId;
    end;
end;
v12.new = function(v15) --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), l_StudioService_0 (copy)
    local v16 = {
        _connectedSignals = {}, 
        _buttonConnections = {}, 
        _widgetConnections = {}, 
        _userHasInteracted = false, 
        _destroyed = false, 
        _userInteractionSignal = Instance.new("BindableEvent"), 
        _locale = nil, 
        _mainTranslator = nil, 
        _fallbackTranslator = nil, 
        _initArgs = v15
    };
    setmetatable(v16, v12);
    if v16._initArgs.localizationNamespace == nil then
        v16._initArgs.localizationNamespace = "Studio";
    end;
    local l_overrideLocaleId_0 = v15.overrideLocaleId;
    v16._locale = if l_overrideLocaleId_0 ~= nil then l_overrideLocaleId_0 else l_StudioService_0.StudioLocaleId;
    v16._mainTranslator = v15.translationResourceTable:GetTranslator(v16._locale);
    v16._fallbackTranslator = v15.fallbackResourceTable:GetTranslator("en-us");
    if v15.shouldImmediatelyOpen and v15.shouldImmediatelyOpen() then
        v16:_onUserInteracted();
    end;
    return v16;
end;
v12.Destroy = function(v18) --[[ Line: 112 ]] --[[ Name: Destroy ]]
    for _, v20 in pairs(v18._connectedSignals) do
        v20[1]:Disconnect();
    end;
    for _, v22 in pairs(v18._buttonConnections) do
        v22[1]:Disconnect();
    end;
    for _, v24 in pairs(v18._widgetConnections) do
        v24[1]:Disconnect();
    end;
    v18._destroyed = true;
    v18:_onUserInteracted();
    v18._userInteractionSignal:Destroy();
    v18._userInteractionSignal = nil;
end;
v12.getKeyNamespace = function(v25) --[[ Line: 130 ]] --[[ Name: getKeyNamespace ]]
    return v25._initArgs.localizationNamespace;
end;
v12.getPluginName = function(v26) --[[ Line: 134 ]] --[[ Name: getPluginName ]]
    return v26._initArgs.pluginName;
end;
v12.getLocalizedText = function(v27, v28, v29, v30, v31) --[[ Line: 138 ]] --[[ Name: getLocalizedText ]]
    local v32 = string.format("%s.%s.%s.%s", v28, v29, v30, v31);
    local function _(v33) --[[ Line: 141 ]] --[[ Name: getTranslation ]]
        -- upvalues: v32 (copy)
        if not v33 then
            return false, nil;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 146 ]]
                -- upvalues: v33 (copy), v32 (ref)
                return v33:FormatByKey(v32);
            end);
            return l_status_0, l_result_0;
        end;
    end;
    local v37 = nil;
    local v38 = nil;
    if v27.locale == "en-us" then
        local l__fallbackTranslator_0 = v27._fallbackTranslator;
        local v40, v41;
        if not l__fallbackTranslator_0 then
            v40 = false;
            v41 = nil;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 146 ]]
                -- upvalues: l__fallbackTranslator_0 (copy), v32 (copy)
                return l__fallbackTranslator_0:FormatByKey(v32);
            end);
            v40 = l_status_1;
            v41 = l_result_1;
        end;
        v37 = v40;
        v38 = v41;
        if v37 then
            return v38;
        end;
    else
        local l__mainTranslator_0 = v27._mainTranslator;
        local v45, v46;
        if not l__mainTranslator_0 then
            v45 = false;
            v46 = nil;
        else
            local l_l__mainTranslator_0_0 = l__mainTranslator_0 --[[ copy: 11 -> 14 ]];
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 146 ]]
                -- upvalues: l_l__mainTranslator_0_0 (copy), v32 (copy)
                return l_l__mainTranslator_0_0:FormatByKey(v32);
            end);
            v45 = l_status_2;
            v46 = l_result_2;
        end;
        v37 = v45;
        v38 = v46;
        if v37 then
            return v38;
        else
            l__mainTranslator_0 = v27._fallbackTranslator;
            if not l__mainTranslator_0 then
                v45 = false;
                v46 = nil;
            else
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 146 ]]
                    -- upvalues: l__mainTranslator_0 (copy), v32 (copy)
                    return l__mainTranslator_0:FormatByKey(v32);
                end);
                v45 = l_status_3;
                v46 = l_result_3;
            end;
            v37 = v45;
            v38 = v46;
            if v37 then
                return v38;
            end;
        end;
    end;
    if game:GetEngineFeature("RefactorTranslatorInstance") then
        if v37 and not string.find(v38, "Key .* not found for locale") then
            warn(v38, debug.traceback());
            return v32;
        end;
    elseif v37 and not string.find(v38, "LocalizationTable or parent tables do not contain a translation") then
        warn(v38, debug.traceback());
    end;
    return v32;
end;
v12._onUserInteracted = function(v52) --[[ Line: 190 ]] --[[ Name: _onUserInteracted ]]
    v52._userHasInteracted = true;
    v52._userInteractionSignal:Fire();
end;
v12.registerButton = function(v53, v54) --[[ Line: 195 ]] --[[ Name: registerButton ]]
    -- upvalues: v1 (copy)
    local v55 = v1.new();
    local v56 = v54.Click:Connect(function() --[[ Line: 197 ]]
        -- upvalues: v53 (copy), v55 (copy)
        v53:_onUserInteracted();
        v55:Fire();
    end);
    v53._buttonConnections[v54] = {
        v56, 
        v55
    };
    return v55;
end;
v12.registerWidget = function(v57, v58) --[[ Line: 205 ]] --[[ Name: registerWidget ]]
    -- upvalues: v1 (copy)
    local v59 = v1.new();
    local v60 = v58:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 207 ]]
        -- upvalues: v58 (copy), v57 (copy), v59 (copy)
        if v58.Enabled then
            v57:_onUserInteracted();
        end;
        v59:Fire();
    end);
    v57._widgetConnections[v58] = {
        v60, 
        v59
    };
    if v58.Enabled then
        v57:_onUserInteracted();
    end;
    return v59;
end;
v12.registerSignal = function(v61, v62) --[[ Line: 222 ]] --[[ Name: registerSignal ]]
    -- upvalues: v1 (copy)
    local v63 = v1.new();
    local v64 = v62:Connect(function(...) --[[ Line: 224 ]]
        -- upvalues: v61 (copy), v63 (copy)
        v61:_onUserInteracted();
        v63:Fire(...);
    end);
    v61._connectedSignals[v62] = {
        v64, 
        v63
    };
    return v63;
end;
v12.waitForUserInteraction = function(v65) --[[ Line: 232 ]] --[[ Name: waitForUserInteraction ]]
    if not v65._userHasInteracted then
        v65._userInteractionConnection = v65._userInteractionSignal.Event:Wait();
    end;
    return not v65._destroyed;
end;
return v12;