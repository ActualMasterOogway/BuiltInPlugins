local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
local v2 = {
    RunningEval = false, 
    Globals = {
        game = game
    }
};
local l_LoadedCode_0 = game:FindFirstChild("LoadedCode");
if l_LoadedCode_0 then
    local l_lib_0 = l_LoadedCode_0:FindFirstChild("lib");
    if l_lib_0 and require(l_lib_0).thisIsEvalFramework then
        v2.RunningEval = true;
        local l_ObjectValue_0 = Instance.new("ObjectValue");
        l_ObjectValue_0.Name = "CliAdapter";
        l_ObjectValue_0.Value = script;
        l_ObjectValue_0.Parent = l_LoadedCode_0;
    end;
end;
if not v1.isCli() then
    v2.GetService = function(v6) --[[ Line: 33 ]]
        return game:GetService(v6);
    end;
    v2.GetPluginComponent = function(v7) --[[ Line: 36 ]]
        local l_script_FirstAncestorWhichIsA_0 = script:FindFirstAncestorWhichIsA("Plugin");
        if not l_script_FirstAncestorWhichIsA_0 then
            return;
        else
            return l_script_FirstAncestorWhichIsA_0:GetPluginComponent(v7);
        end;
    end;
    return v2;
else
    local v12 = {
        __call = function(v9, ...) --[[ Line: 47 ]] --[[ Name: __call ]]
            for _, v11 in v9.listeners do
                v11(...);
            end;
        end
    };
    v12.__index = v12;
    local function v13() --[[ Line: 54 ]]
        return {};
    end;
    v12.Connect = function(v14, v15) --[[ Line: 57 ]] --[[ Name: Connect ]]
        -- upvalues: v13 (copy)
        table.insert(v14.listeners, v15);
        local v16 = #v14.listeners;
        return {
            Disconnect = function() --[[ Line: 61 ]] --[[ Name: Disconnect ]]
                -- upvalues: v14 (copy), v16 (copy), v13 (ref)
                v14.listeners[v16] = v13;
            end
        };
    end;
    v12.new = function() --[[ Line: 66 ]] --[[ Name: new ]]
        -- upvalues: v12 (copy)
        return (setmetatable({
            listeners = {}
        }, v12));
    end;
    local v19 = {
        __index = function(_, _) --[[ Line: 71 ]] --[[ Name: __index ]]
            -- upvalues: v13 (copy)
            return v13;
        end
    };
    local v20 = require(l_script_FirstAncestor_0.Src.Mocks.MockStreamingService);
    local v21 = require(l_script_FirstAncestor_0.Src.Mocks.MockChatbotUIService);
    local v22 = require(l_script_FirstAncestor_0.Src.Mocks.MockMaterialGenerationService);
    local v23 = setmetatable({}, v19);
    local v24 = setmetatable({}, v19);
    local v25 = setmetatable({}, v19);
    local v26 = setmetatable({}, v19);
    local v27 = setmetatable({}, v19);
    local v28 = require(l_script_FirstAncestor_0.Src.Mocks.MockChangeHistoryService);
    v2.Globals.game = setmetatable({}, v19);
    local v32 = {
        UpdateSourceAsync = function(_, v30, v31) --[[ Line: 89 ]] --[[ Name: UpdateSourceAsync ]]
            v30.Source = v31();
        end
    };
    local v33 = {
        StreamingService = v20.new(), 
        ChatbotUIService = v21.new(), 
        MarketplaceService = v23, 
        ConversationalAIAcceptanceService = v25, 
        MaterialGenerationService = v22.new(), 
        MemStorageService = v24, 
        StudioAssetService = v26, 
        ScriptEditorService = v32, 
        PublishService = v27, 
        ChangeHistoryService = v28.new()
    };
    v2.GetService = function(v34) --[[ Line: 107 ]] --[[ Name: GetService ]]
        -- upvalues: v2 (copy), v33 (copy)
        if not v2.RunningEval and v33[v34] then
            return v33[v34];
        else
            local v35 = nil;
            pcall(function() --[[ Line: 115 ]]
                -- upvalues: v35 (ref), v34 (copy)
                v35 = game:GetService(v34);
            end);
            if not v35 then
                v35 = v33[v34];
                if v35 then
                    v35.Name = v34;
                else
                    print((("ERROR: Service %* is not available and not mocked"):format(v34)));
                end;
            end;
            return v35;
        end;
    end;
    local v36 = {
        MaterialGenerator = setmetatable({}, v19)
    };
    v2.GetPluginComponent = function(v37) --[[ Line: 135 ]] --[[ Name: GetPluginComponent ]]
        -- upvalues: v2 (copy), v36 (copy)
        if not v2.RunningEval and v36[v37] then
            return v36[v37];
        else
            local v38 = nil;
            pcall(function() --[[ Line: 143 ]]
                -- upvalues: v38 (ref), v37 (copy)
                local l_script_FirstAncestorWhichIsA_1 = script:FindFirstAncestorWhichIsA("Plugin");
                if l_script_FirstAncestorWhichIsA_1 then
                    v38 = l_script_FirstAncestorWhichIsA_1:GetPluginComponent(v37);
                end;
            end);
            if not v38 then
                v38 = v36[v37];
                if v38 then
                    v38.Name = v37;
                else
                    print((("ERROR: Component %* is not available and not mocked"):format(v37)));
                end;
            end;
            return v38;
        end;
    end;
    return v2;
end;