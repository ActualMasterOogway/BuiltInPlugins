local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Orientation);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Util.mockContext);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_RunService_0 = game:GetService("RunService");
local v27 = {
    withTestComponent = function(v6, v7, v8) --[[ Line: 15 ]] --[[ Name: withTestComponent ]]
        -- upvalues: v3 (copy), v2 (copy), v4 (copy)
        local l_9SliceEditorMockGui_0 = game.CoreGui:FindFirstChild("9SliceEditorMockGui");
        if l_9SliceEditorMockGui_0 then
            l_9SliceEditorMockGui_0:Destroy();
        end;
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "9SliceEditorMockGui";
        l_ScreenGui_0.Parent = game.CoreGui;
        local v11 = v3(v2.createElement(v6, v7));
        local v12 = v2.mount(v11, l_ScreenGui_0);
        v8(l_ScreenGui_0, function(v13) --[[ Line: 26 ]]
            -- upvalues: v2 (ref), v12 (copy), v3 (ref), v6 (copy), v4 (ref), v7 (copy)
            v2.update(v12, v3(v2.createElement(v6, v4.Dictionary.join(v7, v13))));
        end);
        v2.unmount(v12);
        l_ScreenGui_0.Parent = nil;
        l_ScreenGui_0:Destroy();
    end, 
    numericalArrayFuzzyEquality = function(v14, v15, v16) --[[ Line: 36 ]] --[[ Name: numericalArrayFuzzyEquality ]]
        if #v14 ~= #v15 then
            return false;
        else
            v16 = v16 or 1.0E-4;
            for v17 = 1, #v14 do
                if type(v14[v17]) ~= "number" or type(v15[v17]) ~= "number" then
                    return false;
                elseif v16 < math.abs(v14[v17] - v15[v17]) then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    waitForHeartbeat = function(v18) --[[ Line: 57 ]] --[[ Name: waitForHeartbeat ]]
        -- upvalues: l_RunService_0 (copy)
        v18 = v18 or 10;
        local v19 = 0;
        local v20 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 61 ]]
            -- upvalues: v19 (ref)
            v19 = v19 + 1;
        end);
        local v21 = tick();
        while tick() < v21 + v18 and v19 < 10 do
            wait();
        end;
        v20:Disconnect();
    end, 
    findFirstDescendantWhichIsA = function(v22, v23) --[[ Line: 73 ]] --[[ Name: findFirstDescendantWhichIsA ]]
        local l_v22_Descendants_0 = v22:GetDescendants();
        for _, v26 in ipairs(l_v22_Descendants_0) do
            if v26.ClassName == v23 then
                return v26;
            end;
        end;
        return nil;
    end
};
local v28 = v1.Left.rawValue();
local v29 = v1.Right.rawValue();
local v30 = v1.Top.rawValue();
local v31 = v1.Bottom.rawValue();
v27.getOffsetsFromSliceRect = function(v32, v33) --[[ Line: 88 ]] --[[ Name: getOffsetsFromSliceRect ]]
    -- upvalues: v28 (copy), v29 (copy), v30 (copy), v31 (copy)
    return {
        v32[v28], 
        v33.x - v32[v29], 
        v32[v30], 
        v33.y - v32[v31]
    };
end;
v27.getSliceRectFromOffsets = function(v34, v35) --[[ Line: 97 ]] --[[ Name: getSliceRectFromOffsets ]]
    -- upvalues: v28 (copy), v29 (copy), v30 (copy), v31 (copy)
    return {
        v34[v28], 
        v35.x - v34[v29], 
        v34[v30], 
        v35.y - v34[v31]
    };
end;
v27.getSliceRectFromSliceCenterRect = function(v36) --[[ Line: 101 ]] --[[ Name: getSliceRectFromSliceCenterRect ]]
    return {
        v36.Min.X, 
        v36.Max.X, 
        v36.Min.Y, 
        v36.Max.Y
    };
end;
v27.getSliceCenterRectFromSliceRect = function(v37) --[[ Line: 105 ]] --[[ Name: getSliceCenterRectFromSliceRect ]]
    -- upvalues: v28 (copy), v30 (copy), v29 (copy), v31 (copy)
    return Rect.new(v37[v28], v37[v30], v37[v29], v37[v31]);
end;
return v27;