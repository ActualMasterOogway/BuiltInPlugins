local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v2 = require(l_Util_0.Constants);
local v3 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v4 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local l_COLUMNS_0 = v2.AUDIO_ROW.COLUMNS;
local v6 = if v4() then v2.ITEM_ROW.LEFT_RIGHT_PADDING else v2.AUDIO_ROW.LEFT_RIGHT_PADDING;
local v7 = v2.AUDIO_ROW.ICON_SIZE + v6 * 2;
return function(v8, _) --[[ Line: 20 ]]
    -- upvalues: v3 (copy), l_COLUMNS_0 (copy), v7 (copy)
    local v10 = v8 == v3.SOUND_EFFECTS.name;
    if not (v8 == v3.MUSIC.name) then
        local _ = not v10;
    end;
    return {
        [l_COLUMNS_0.ICON] = UDim2.fromScale(0, 1) + UDim2.fromOffset(v7, 0), 
        [l_COLUMNS_0.TITLE] = UDim2.fromScale(0.5, 1) - UDim2.fromOffset(v7 + 50, 0), 
        [l_COLUMNS_0.CREATOR] = UDim2.fromScale(0.25, 1), 
        [l_COLUMNS_0.TAGS] = UDim2.fromScale(0.25, 1), 
        [l_COLUMNS_0.LENGTH] = UDim2.fromScale(0, 1) + UDim2.fromOffset(50, 0)
    };
end;