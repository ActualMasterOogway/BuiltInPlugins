local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = {};
local v3 = {
    {
        Id = "Peak", 
        Value = Enum.AudioFilterType.Peak
    }, 
    {
        Id = "LowShelf", 
        Value = Enum.AudioFilterType.LowShelf
    }, 
    {
        Id = "HighShelf", 
        Value = Enum.AudioFilterType.HighShelf
    }, 
    {
        Id = "Lowpass12dB", 
        Value = Enum.AudioFilterType.Lowpass12dB
    }, 
    {
        Id = "Lowpass24dB", 
        Value = Enum.AudioFilterType.Lowpass24dB
    }, 
    {
        Id = "Lowpass48dB", 
        Value = Enum.AudioFilterType.Lowpass48dB
    }, 
    {
        Id = "Highpass12dB", 
        Value = Enum.AudioFilterType.Highpass12dB
    }, 
    {
        Id = "Highpass24dB", 
        Value = Enum.AudioFilterType.Highpass24dB
    }, 
    {
        Id = "Highpass48dB", 
        Value = Enum.AudioFilterType.Highpass48dB
    }, 
    {
        Id = "Bandpass", 
        Value = Enum.AudioFilterType.Bandpass
    }, 
    {
        Id = "Notch", 
        Value = Enum.AudioFilterType.Notch
    }
};
local v4 = table.clone(v3);
local v5 = table.clone(v3);
v2.filterTypeToId = function(v6) --[[ Line: 23 ]] --[[ Name: filterTypeToId ]]
    -- upvalues: v3 (copy)
    for _, v8 in v3 do
        if v8.Value == v6 then
            return v8.Id;
        end;
    end;
    assert(false);
    return "";
end;
v2.idToFilterType = function(v9) --[[ Line: 34 ]] --[[ Name: idToFilterType ]]
    -- upvalues: v3 (copy)
    for _, v11 in v3 do
        if v11.Id == v9 then
            return v11.Value;
        end;
    end;
    assert(false);
    return Enum.AudioFilterType.Peak;
end;
v2.hasGain = function(v12) --[[ Line: 45 ]] --[[ Name: hasGain ]]
    local v13 = true;
    if v12 ~= Enum.AudioFilterType.Peak then
        v13 = true;
        if v12 ~= Enum.AudioFilterType.LowShelf then
            v13 = v12 == Enum.AudioFilterType.HighShelf;
        end;
    end;
    return v13;
end;
v2.hasQ = function(v14) --[[ Line: 51 ]] --[[ Name: hasQ ]]
    local v15 = false;
    if v14 ~= Enum.AudioFilterType.LowShelf then
        v15 = v14 ~= Enum.AudioFilterType.HighShelf;
    end;
    return v15;
end;
v2.getDropdownItems = function(v16) --[[ Line: 55 ]] --[[ Name: getDropdownItems ]]
    -- upvalues: v4 (copy)
    for _, v18 in v4 do
        v18.Label = v16:getText("Label", "FilterType_" .. v18.Id);
    end;
    return v4;
end;
v2.getContextMenuItems = function(v19, v20) --[[ Line: 62 ]] --[[ Name: getContextMenuItems ]]
    -- upvalues: v5 (copy)
    for _, v22 in v5 do
        v22.Text = v19:getText("Label", "FilterType_" .. v22.Id);
        v22.OnItemClicked = function(v23) --[[ Line: 68 ]]
            -- upvalues: v20 (copy)
            v20(v23.Value);
        end;
    end;
    return v5;
end;
return v2;