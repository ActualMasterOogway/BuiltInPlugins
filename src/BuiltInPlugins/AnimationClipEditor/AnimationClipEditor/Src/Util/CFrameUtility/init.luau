return {
    CalculateTargetCFrame = function(v0) --[[ Line: 4 ]] --[[ Name: CalculateTargetCFrame ]]
        local v1 = nil;
        v1 = if math.abs(v0.LookVector.Y) > 0.9 then v0.UpVector else v0.LookVector;
        v1 = Vector3.new(v1.X, 0, v1.Z).Unit;
        return CFrame.lookAt(v0.Position, v0.Position + v1);
    end
};