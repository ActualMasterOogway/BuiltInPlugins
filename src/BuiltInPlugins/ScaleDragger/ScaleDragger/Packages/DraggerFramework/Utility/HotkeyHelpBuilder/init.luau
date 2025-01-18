local v0 = {};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DraggerFramework");
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagDraggerFinalShortcuts);
local v3 = {
    Hotkey = "H", 
    LabelLocEntry = "ToggleHelp"
};
v0.addHelp = function(v4) --[[ Line: 26 ]] --[[ Name: addHelp ]]
    -- upvalues: v3 (copy)
    table.insert(v4, v3);
end;
local v5 = table.freeze({
    [false] = {
        Hotkey = "\226\172\135" .. (v2() and "Shift" or "Alt"), 
        LabelLocEntry = "DisableSnap"
    }, 
    [true] = {
        Hotkey = "\226\172\134" .. (v2() and "Shift" or "Alt"), 
        LabelLocEntry = "EnableSnap"
    }
});
local v6 = {
    Hotkey = "Shift+X/C", 
    LabelLocEntry = "ToggleSnap"
};
local v7 = {
    Hotkey = "\226\172\135" .. "Tab", 
    LabelLocEntry = "SummonHandles"
};
v0.addGridSnap = function(v8, v9) --[[ Line: 51 ]] --[[ Name: addGridSnap ]]
    -- upvalues: v5 (copy), v2 (copy), v6 (copy)
    table.insert(v8, v5[if v2() then v9:isShiftKeyDown() else v9:isAltKeyDown()]);
    if v2() then
        table.insert(v8, v6);
    end;
end;
v0.addSummonHandles = function(v10, _) --[[ Line: 63 ]] --[[ Name: addSummonHandles ]]
    -- upvalues: v7 (copy)
    table.insert(v10, v7);
end;
return v0;