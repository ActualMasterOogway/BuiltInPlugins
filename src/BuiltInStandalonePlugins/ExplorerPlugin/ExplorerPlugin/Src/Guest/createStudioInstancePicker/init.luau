local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v2 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ExplorerGuiUri);
local function v7(v4) --[[ Line: 9 ]] --[[ Name: getAvailableInstancePickerComponent ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
        -- upvalues: v4 (copy)
        v4:GetPluginComponent("InstancePicker"):AddWidgetConsumerAsync();
    end);
    if l_status_0 then
        warn("The pcall expected to figure out what version of InstancePicker is available succeeded, but it's NEVER supposed to.");
        return nil;
    elseif not l_result_0:match("Incorrect number of parameters passed to AddWidgetConsumerAsync") then
        return nil;
    else
        return (v4:GetPluginComponent("InstancePicker"));
    end;
end;
return function(v8) --[[ Line: 33 ]] --[[ Name: createStudioInstancePicker ]]
    -- upvalues: v7 (copy), v3 (copy), l_StudioService_0 (copy), v2 (copy)
    local v9 = v7(v8);
    if v9 == nil then
        return nil, function() --[[ Line: 47 ]]

        end;
    else
        task.spawn(function() --[[ Line: 50 ]]
            -- upvalues: v9 (copy), v3 (ref), l_StudioService_0 (ref)
            v9:AddWidgetConsumerAsync(v3, function() --[[ Line: 51 ]]
                -- upvalues: l_StudioService_0 (ref)
                return l_StudioService_0.HoverInstance;
            end);
        end);
        local v10 = v2.Signal.new();
        local v11 = v9.Activated:Connect(function() --[[ Line: 57 ]]
            -- upvalues: v10 (copy)
            v10:Fire();
        end);
        local v12 = v2.Signal.new();
        local v13 = v9.Deactivated:Connect(function() --[[ Line: 62 ]]
            -- upvalues: v12 (copy)
            v12:Fire();
        end);
        return {
            activatedSignal = v10, 
            deactivatedSignal = v12, 
            submitPickedInstance = function(v14) --[[ Line: 66 ]] --[[ Name: submitPickedInstance ]]
                -- upvalues: v9 (copy)
                task.spawn(function() --[[ Line: 67 ]]
                    -- upvalues: v9 (ref), v14 (copy)
                    v9:SubmitPickedInstanceAsync(v14);
                end);
            end
        }, function() --[[ Line: 73 ]] --[[ Name: destroy ]]
            -- upvalues: v11 (copy), v13 (copy)
            v11:Disconnect();
            v13:Disconnect();
        end;
    end;
end;