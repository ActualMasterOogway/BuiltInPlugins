local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Resources.Constants);
local v3 = {
    [Enum.NormalId.Top] = {
        axisX = "Z", 
        axisY = "X", 
        invertX = true, 
        invertY = false
    }, 
    [Enum.NormalId.Bottom] = {
        axisX = "Z", 
        axisY = "X", 
        invertX = true, 
        invertY = true
    }, 
    [Enum.NormalId.Left] = {
        axisX = "Z", 
        axisY = "Y", 
        invertX = false, 
        invertY = true
    }, 
    [Enum.NormalId.Right] = {
        axisX = "Z", 
        axisY = "Y", 
        invertX = true, 
        invertY = true
    }, 
    [Enum.NormalId.Front] = {
        axisX = "X", 
        axisY = "Y", 
        invertX = true, 
        invertY = true
    }, 
    [Enum.NormalId.Back] = {
        axisX = "X", 
        axisY = "Y", 
        invertX = false, 
        invertY = true
    }
};
return function(v4) --[[ Line: 16 ]]
    -- upvalues: l_Workspace_0 (copy), v2 (copy), v3 (copy)
    return function(v5) --[[ Line: 17 ]]
        -- upvalues: v4 (copy), l_Workspace_0 (ref), v2 (ref), v3 (ref)
        local l_PathReducer_0 = v5:getState().PathReducer;
        if l_PathReducer_0.SelectedObject == nil or l_PathReducer_0.SelectedObjectGui == nil then
            return nil;
        elseif not l_PathReducer_0.SelectedObjectGui:IsA("SurfaceGui") then
            return v4;
        else
            local v7 = if l_PathReducer_0.SelectedObjectGui.Adornee then l_PathReducer_0.SelectedObjectGui.Adornee else l_PathReducer_0.SelectedObjectGui.Parent;
            local v8 = l_Workspace_0.CurrentCamera:ScreenPointToRay(v4.X, v4.Y);
            local v9 = RaycastParams.new();
            v9.FilterType = Enum.RaycastFilterType.Whitelist;
            v9:AddToFilter(v7);
            local v10 = l_Workspace_0:Raycast(v8.Origin, v8.Direction * v2.SurfaceGuiDragRaycastDepth, v9);
            if not v10 then
                return nil;
            else
                local v11 = CFrame.new(v10.Position);
                local l_Position_0 = v7.CFrame:ToObjectSpace(v11).Position;
                local v13 = v3[l_PathReducer_0.SelectedObjectGui.Face];
                local v14 = l_Position_0[v13.axisX] / v7.Size[v13.axisX] + 0.5;
                local v15 = l_Position_0[v13.axisY] / v7.Size[v13.axisY] + 0.5;
                if v13.invertX then
                    v14 = 1 - v14;
                end;
                if v13.invertY then
                    v15 = 1 - v15;
                end;
                return Vector2.new(v14 * l_PathReducer_0.SelectedObjectGui.AbsoluteSize.X, v15 * l_PathReducer_0.SelectedObjectGui.AbsoluteSize.Y);
            end;
        end;
    end;
end;