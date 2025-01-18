local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(script.Parent.Arrow);
local v3 = require(script.Parent.MappingLabel);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants);
local l_MAPPING_LABELS_OFFSET_FROM_CENTER_0 = require(l_script_FirstAncestor_0.Src.Util.Constants).MAPPING_LABELS_OFFSET_FROM_CENTER;
return v1.memo(function(v6) --[[ Line: 24 ]] --[[ Name: CrossLayoutMappings ]]
    -- upvalues: v1 (copy), l_MAPPING_LABELS_OFFSET_FROM_CENTER_0 (copy), v3 (copy), v2 (copy)
    local v7 = v1.useMemo(function() --[[ Line: 25 ]]
        -- upvalues: v6 (copy), l_MAPPING_LABELS_OFFSET_FROM_CENTER_0 (ref)
        if v6.side == "Left" then
            return UDim2.new(-l_MAPPING_LABELS_OFFSET_FROM_CENTER_0, 0, 0, 0);
        elseif v6.side == "Right" then
            return UDim2.new(l_MAPPING_LABELS_OFFSET_FROM_CENTER_0, 0, 0, 0);
        else
            return UDim2.new(0, 0, 0, 0);
        end;
    end, {
        v6.side
    });
    return v1.createElement("Frame", {
        [v1.Tag] = "Mapping-Widget Width-Scaling data-testid=CrossLayoutMappings"
    }, {
        UpLabel = if v6.upKeyName ~= nil then v1.createElement(v3, {
            keyName = v6.upKeyName, 
            side = v6.side, 
            Position = v6.Position + UDim2.new(0, 0, -l_MAPPING_LABELS_OFFSET_FROM_CENTER_0, 0) + v7
        }) else nil, 
        RightLabel = if v6.rightKeyName ~= nil then v1.createElement(v3, {
            keyName = v6.rightKeyName, 
            side = v6.side, 
            Position = v6.Position + UDim2.new(l_MAPPING_LABELS_OFFSET_FROM_CENTER_0, 0, 0, 0) + v7
        }) else nil, 
        LeftLabel = if v6.leftKeyName ~= nil then v1.createElement(v3, {
            keyName = v6.leftKeyName, 
            side = v6.side, 
            Position = v6.Position + UDim2.new(-l_MAPPING_LABELS_OFFSET_FROM_CENTER_0, 0, 0, 0) + v7
        }) else nil, 
        DownLabel = if v6.downKeyName ~= nil then v1.createElement(v3, {
            keyName = v6.downKeyName, 
            side = v6.side, 
            Position = v6.Position + UDim2.new(0, 0, l_MAPPING_LABELS_OFFSET_FROM_CENTER_0, 0) + v7
        }) else nil, 
        CenterLabel = if v6.centerKeyName ~= nil then v1.createElement(v3, {
            keyName = v6.centerKeyName, 
            side = v6.side, 
            Position = v6.Position + UDim2.new(0, 0, 0, 0) + v7
        }) else nil, 
        UpArrow = v1.createElement(v2, {
            arrowStart = v6.Position, 
            arrowDestination = v6.arrowDestination, 
            arrowBendPoint = v6.arrowBendPoint
        })
    });
end);