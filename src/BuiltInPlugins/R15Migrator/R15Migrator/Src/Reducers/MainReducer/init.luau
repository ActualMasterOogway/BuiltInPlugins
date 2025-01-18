local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(script.Parent.AnimationConversion);
local v3 = require(script.Parent.CharacterConversion);
local v4 = require(script.Parent.ScriptConversion);
local v5 = require(script.Parent.Adapter);
local v6 = require(script.Parent.PanelSelection);
local v7 = require(script.Parent.DataDisplay);
local v8 = require(script.Parent.ConversionProgress);
return (v1.combineReducers({
    AnimationConversion = v2, 
    CharacterConversion = v3, 
    ScriptConversion = v4, 
    Adapter = v5, 
    PanelSelection = v6, 
    DataDisplay = v7, 
    AvatarType = function(v9, v10) --[[ Line: 20 ]] --[[ Name: AvatarType ]]
        if v10.type == "SetAvatarType" then
            return v10.avatarType;
        else
            return v9;
        end;
    end, 
    ConversionProgress = v8
}));