local l_Workspace_0 = game.Workspace;
local _ = {};
local v2 = require(script.Parent.MeshWrapperObjectTestHelper);
local v3 = require(script.Parent.Parent.Parent.MeshEditingContexts.MeshEditingContextBase);
v2.createContextWithSingleWrapper = function() --[[ Line: 7 ]] --[[ Name: createContextWithSingleWrapper ]]
    -- upvalues: v2 (copy), v3 (copy), l_Workspace_0 (copy)
    local v4 = v2.getWrappers()[1];
    local v5 = v3.new();
    local l_Cube1_0 = l_Workspace_0:FindFirstChild("Cube1");
    l_Workspace_0:FindFirstChild("Cube2"):Destroy();
    v5:init({
        v4
    });
    return l_Cube1_0, v5;
end;
v2.createContextWithTwoWrappers = function() --[[ Line: 22 ]] --[[ Name: createContextWithTwoWrappers ]]
    -- upvalues: v2 (copy), v3 (copy), l_Workspace_0 (copy)
    local v7 = v2.getWrappers();
    local v8 = v7[1];
    local v9 = v7[2];
    local v10 = v3.new();
    local l_Cube1_1 = l_Workspace_0:FindFirstChild("Cube1");
    l_Cube1_1.Name = "Cube1";
    local l_WrapLayer_0 = Instance.new("WrapLayer");
    l_WrapLayer_0.Name = "Cube1";
    l_WrapLayer_0.Parent = l_Cube1_1;
    local l_Cube2_0 = l_Workspace_0:FindFirstChild("Cube2");
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.Part0 = l_Cube1_1;
    l_Motor6D_0.Part1 = l_Cube2_0;
    l_Cube2_0.Name = "Cube2";
    l_Motor6D_0.Parent = l_Cube2_0;
    v10:init({
        v8, 
        v9
    });
    return l_Cube1_1, l_Cube2_0, v10;
end;
return v2;