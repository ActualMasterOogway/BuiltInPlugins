local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Components.AutoSetupContext);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return {
    Success = function(v4) --[[ Line: 18 ]] --[[ Name: MockSuccessProvider ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v8 = v2.useCallback(function(_, v6) --[[ Line: 20 ]]
            -- upvalues: v4 (copy)
            local v7 = v4.updateEtaSignal and v4.updateEtaSignal:Connect(v6);
            if v4.signal ~= nil then
                v4.signal:Wait();
            end;
            if v7 ~= nil then
                v7:Disconnect();
            end;
            return v4.result;
        end, {
            v4.signal, 
            v4.result, 
            v4.updateEtaSignal
        });
        local v12 = v2.useCallback(function(_, v10) --[[ Line: 37 ]]
            -- upvalues: v4 (copy)
            local v11 = v4.updateEtaSignal and v4.updateEtaSignal:Connect(v10);
            if v4.signal ~= nil then
                v4.signal:Wait();
            end;
            if v11 ~= nil then
                v11:Disconnect();
            end;
            return v4.result;
        end, {
            v4.signal, 
            v4.result, 
            v4.updateEtaSignal
        });
        local v14 = {
            uploadModelAsync = v2.useCallback(function(_) --[[ Line: 53 ]]
                return "rbxasset://mock";
            end), 
            startAutoSetupAsync = v8, 
            DEPRECATED_startAutoSetupAsync = v12, 
            autoSetupClickedSignal = v4.autoSetupClickedSignal
        };
        return v2.createElement(v1.Provider, {
            value = v14
        }, v4.children);
    end, 
    FailsOnce = function(v15) --[[ Line: 77 ]] --[[ Name: MockFailureOnceProvider ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v16 = v2.useRef(false);
        local v17 = v2.useCallback(function() --[[ Line: 80 ]]
            -- upvalues: v15 (copy), v16 (copy)
            v15.signal:Wait();
            if v16.current then
                return v15.result;
            else
                v16.current = true;
                return error("Mock error");
            end;
        end, {
            v15.signal
        });
        local v19 = {
            uploadModelAsync = v2.useCallback(function(_) --[[ Line: 91 ]]
                return "rbxasset://mock";
            end), 
            startAutoSetupAsync = v17, 
            DEPRECATED_startAutoSetupAsync = v17, 
            autoSetupClickedSignal = v15.autoSetupClickedSignal
        };
        return v2.createElement(v1.Provider, {
            value = v19
        }, v15.children);
    end
};