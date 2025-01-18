local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v3 = require(l_script_FirstAncestor_0.Src.Util.enumToDisplayKeyCode);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_MAPPING_LABELS_TEXT_SCALE_0 = v4.MAPPING_LABELS_TEXT_SCALE;
local l_MAPPING_LABELS_TEXT_GAP_X_0 = v4.MAPPING_LABELS_TEXT_GAP_X;
local l_MAPPING_LABELS_TEXT_GAP_Y_0 = v4.MAPPING_LABELS_TEXT_GAP_Y;
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants);
return v1.memo(function(v9) --[[ Line: 25 ]] --[[ Name: MappingLabel ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), l_MAPPING_LABELS_TEXT_GAP_X_0 (copy), l_MAPPING_LABELS_TEXT_GAP_Y_0 (copy), l_MAPPING_LABELS_TEXT_SCALE_0 (copy)
    local v10 = v1.useContext(v2);
    local l_gamepadId_0 = v10.gamepadId;
    local v12 = (v10.mappings[l_gamepadId_0] or {})[v9.keyName] or {};
    local v13 = v3(v12);
    local v14 = v1.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v9 (copy)
        if v9.side == "Left" then
            return Vector2.new(1, 0.5);
        elseif v9.side == "Right" then
            return Vector2.new(0, 0.5);
        else
            return Vector2.new(0.5, 0.5);
        end;
    end, {
        v9.side
    });
    local v15 = v1.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v9 (copy), l_MAPPING_LABELS_TEXT_GAP_X_0 (ref), l_MAPPING_LABELS_TEXT_GAP_Y_0 (ref)
        if v9.side == "Left" then
            return UDim2.new(v9.Position.X.Scale - l_MAPPING_LABELS_TEXT_GAP_X_0, 0, v9.Position.Y.Scale - l_MAPPING_LABELS_TEXT_GAP_Y_0, 0);
        elseif v9.side == "Right" then
            return UDim2.new(v9.Position.X.Scale + l_MAPPING_LABELS_TEXT_GAP_X_0 / 2, 0, v9.Position.Y.Scale - l_MAPPING_LABELS_TEXT_GAP_Y_0, 0);
        else
            return UDim2.new(v9.Position.X.Scale - l_MAPPING_LABELS_TEXT_GAP_X_0, 0, v9.Position.Y.Scale - l_MAPPING_LABELS_TEXT_GAP_Y_0, 0);
        end;
    end, {
        v9.side, 
        v9.Position
    });
    return v1.createElement("Frame", {
        [v1.Tag] = "Mapping-Label Width-Scaling", 
        Position = v15, 
        AnchorPoint = v14
    }, {
        UpLabel = v1.createElement("TextLabel", {
            Text = v13, 
            Size = UDim2.new(1 * l_MAPPING_LABELS_TEXT_SCALE_0, 0, 1 * l_MAPPING_LABELS_TEXT_SCALE_0, 0)
        })
    });
end);