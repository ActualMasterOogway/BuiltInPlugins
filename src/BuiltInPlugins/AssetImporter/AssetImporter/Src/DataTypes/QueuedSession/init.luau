local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_joinDeep_0 = v1.joinDeep;
local l_None_0 = v1.None;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = utf8.char(8230);
local v6 = table.freeze({
    assetName = "", 
    creatorId = -1, 
    currentPreset = v5, 
    enabled = false, 
    errors = 0, 
    uploadErrorsExpanded = {}, 
    filepath = "", 
    importDataError = false, 
    settingsChanged = false, 
    progressValue = 0, 
    session = nil, 
    timestamp = DateTime.now(), 
    uploaded = false, 
    uploadResults = l_None_0, 
    validSession = false, 
    warnings = 0
});
return {
    new = function(v7) --[[ Line: 80 ]] --[[ Name: new ]]
        -- upvalues: v6 (copy), l_joinDeep_0 (copy)
        v7 = v7 or {};
        local v8 = table.clone(v6);
        return table.freeze(l_joinDeep_0(v8, v7));
    end, 
    update = function(v9, v10) --[[ Line: 86 ]] --[[ Name: update ]]
        -- upvalues: l_joinDeep_0 (copy)
        return table.freeze(l_joinDeep_0(v9, v10));
    end, 
    compare = function(v11, v12) --[[ Line: 90 ]] --[[ Name: compare ]]
        return v11.timestamp.UnixTimestampMillis > v12.timestamp.UnixTimestampMillis;
    end
};