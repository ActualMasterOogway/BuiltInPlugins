local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_DraggerSchemaCore_0 = l_Parent_0.Packages.DraggerSchemaCore;
local v3 = require(l_DraggerSchemaCore_0.DraggerSchema);
local v4 = require(l_Parent_0.Src.Reducers.MainReducer);
local v5 = require(l_Parent_0.Src.Utility.MockDraggerContext_Pivot);
local function _() --[[ Line: 15 ]] --[[ Name: findTempInstancesFolder ]]
    return workspace:FindFirstChild("TempInstancesFolder");
end;
local function _() --[[ Line: 19 ]] --[[ Name: findTempScreenGui ]]
    return game.CoreGui:FindFirstChild("TempScreenGui");
end;
local v12 = {
    cleanTempInstances = function() --[[ Line: 25 ]] --[[ Name: cleanTempInstances ]]
        local l_TempInstancesFolder_0 = workspace:FindFirstChild("TempInstancesFolder");
        if l_TempInstancesFolder_0 then
            l_TempInstancesFolder_0:Destroy();
        end;
        local l_TempScreenGui_0 = game.CoreGui:FindFirstChild("TempScreenGui");
        if l_TempScreenGui_0 then
            l_TempScreenGui_0:Destroy();
        end;
    end, 
    getTempInstancesFolder = function() --[[ Line: 37 ]] --[[ Name: getTempInstancesFolder ]]
        local l_TempInstancesFolder_1 = workspace:FindFirstChild("TempInstancesFolder");
        if l_TempInstancesFolder_1 then
            return l_TempInstancesFolder_1;
        else
            l_TempInstancesFolder_1 = Instance.new("Folder");
            l_TempInstancesFolder_1.Name = "TempInstancesFolder";
            l_TempInstancesFolder_1.Parent = workspace;
            return l_TempInstancesFolder_1;
        end;
    end, 
    getTempScreenGui = function() --[[ Line: 48 ]] --[[ Name: getTempScreenGui ]]
        local l_TempScreenGui_1 = game.CoreGui:FindFirstChild("TempScreenGui");
        if l_TempScreenGui_1 then
            return l_TempScreenGui_1;
        else
            l_TempScreenGui_1 = Instance.new("ScreenGui", game.CoreGui);
            l_TempScreenGui_1.Name = "TempScreenGui";
            l_TempScreenGui_1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            return l_TempScreenGui_1;
        end;
    end
};
v12.createInstance = function(v13) --[[ Line: 59 ]] --[[ Name: createInstance ]]
    -- upvalues: v12 (copy)
    local v14 = v12.getTempInstancesFolder();
    local v15 = Instance.new(v13);
    v15.Parent = v14;
    return v15;
end;
v12.createTestDraggerContext = function(v16) --[[ Line: 66 ]] --[[ Name: createTestDraggerContext ]]
    -- upvalues: v12 (copy), v5 (copy), v3 (copy)
    local v17 = v16 or v12.getTempScreenGui();
    return v5.new(v17, v3.Selection.new(), true);
end;
v12.createTestStore = function() --[[ Line: 71 ]] --[[ Name: createTestStore ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v18 = {
        v1.thunkMiddleware
    };
    return v1.Store.new(v4, nil, v18);
end;
return v12;