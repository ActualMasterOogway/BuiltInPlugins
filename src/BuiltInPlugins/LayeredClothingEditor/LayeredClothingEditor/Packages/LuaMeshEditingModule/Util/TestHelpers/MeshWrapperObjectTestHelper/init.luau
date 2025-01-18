local l_Workspace_0 = game.Workspace;
local v1 = require(script.Parent.Parent.deepCopy);
local v2 = {
    positions = {
        Vector3.new(0, 0, 1, 0), 
        Vector3.new(0, 1, 1, 0), 
        Vector3.new(0, 0, 0, 0), 
        Vector3.new(0, 1, 0, 0), 
        Vector3.new(1, 0, 0, 0), 
        Vector3.new(1, 1, 0, 0), 
        Vector3.new(1, 0, 1, 0), 
        (Vector3.new(1, 1, 1, 0))
    }, 
    triangles = {
        {
            1, 
            2, 
            4
        }, 
        {
            1, 
            3, 
            4
        }, 
        {
            3, 
            4, 
            6
        }, 
        {
            3, 
            5, 
            6
        }, 
        {
            1, 
            3, 
            5
        }, 
        {
            1, 
            5, 
            7
        }, 
        {
            2, 
            4, 
            8
        }, 
        {
            4, 
            6, 
            8
        }, 
        {
            5, 
            6, 
            8
        }, 
        {
            5, 
            7, 
            8
        }, 
        {
            2, 
            7, 
            8
        }, 
        {
            1, 
            2, 
            7
        }
    }
};
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v5 = setmetatable({}, v3);
    v5.instance = v4;
    v5.getVertices = function(_) --[[ Line: 39 ]] --[[ Name: getVertices ]]
        -- upvalues: v1 (ref), v2 (ref)
        return v1(v2.positions);
    end;
    v5.getTriangleIndexData = function(_) --[[ Line: 42 ]] --[[ Name: getTriangleIndexData ]]
        -- upvalues: v1 (ref), v2 (ref)
        return v1(v2.triangles);
    end;
    v5.getMeshOrigin = function(_) --[[ Line: 45 ]] --[[ Name: getMeshOrigin ]]
        return CFrame.new(0, 0, 0);
    end;
    return v5;
end;
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), v1 (copy), v2 (copy)
    local v11 = setmetatable({}, v9);
    v11.instance = v10;
    v11.getVertices = function(_) --[[ Line: 58 ]] --[[ Name: getVertices ]]
        -- upvalues: v1 (ref), v2 (ref)
        return v1(v2.positions);
    end;
    v11.getTriangleIndexData = function(_) --[[ Line: 61 ]] --[[ Name: getTriangleIndexData ]]
        -- upvalues: v1 (ref), v2 (ref)
        return v1(v2.triangles);
    end;
    v11.getMeshOrigin = function(_) --[[ Line: 64 ]] --[[ Name: getMeshOrigin ]]
        return CFrame.new(0, 1, 0);
    end;
    return v11;
end;
v2.getWrappers = function() --[[ Line: 71 ]]
    -- upvalues: l_Workspace_0 (copy), v3 (copy), v9 (copy)
    local l_MeshPart_0 = Instance.new("MeshPart");
    l_MeshPart_0.Name = "Cube1";
    l_MeshPart_0.Parent = l_Workspace_0;
    local l_MeshPart_1 = Instance.new("MeshPart");
    l_MeshPart_1.Name = "Cube2";
    l_MeshPart_1.Parent = l_Workspace_0;
    return {
        v3.new(l_MeshPart_0), 
        v9.new(l_MeshPart_1)
    };
end;
return v2;