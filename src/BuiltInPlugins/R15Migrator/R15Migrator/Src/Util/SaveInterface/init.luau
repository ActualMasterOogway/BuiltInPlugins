local v0 = {};
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Attributes_0 = v5.Attributes;
local v7 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging);
local v8 = require(l_script_FirstAncestor_0.Src.Util.QuickAccessTagging);
local l_AnimationConversion_0 = l_script_FirstAncestor_0.Src.Util.AnimationConversion;
local v10 = require(l_AnimationConversion_0.AnimationConversionManager);
local v11 = v5.AttributePrefix .. "R15MigratorConversionId";
local v12 = v5.AttributePrefix .. "ScriptConversionRules";
local v13 = nil;
local v14 = nil;
local function _(v15) --[[ Line: 37 ]] --[[ Name: getRootFolder ]]
    -- upvalues: l_ServerStorage_0 (copy)
    local l_l_ServerStorage_0_FirstChild_0 = l_ServerStorage_0:FindFirstChild(v15);
    if l_l_ServerStorage_0_FirstChild_0 and l_l_ServerStorage_0_FirstChild_0:IsA("Folder") then
        return l_l_ServerStorage_0_FirstChild_0;
    else
        return nil;
    end;
end;
local function _(v18, v19) --[[ Line: 45 ]] --[[ Name: lazyCreateFolder ]]
    local l_v19_FirstChild_0 = v19:FindFirstChild(v18);
    if l_v19_FirstChild_0 and l_v19_FirstChild_0:IsA("Folder") then
        return l_v19_FirstChild_0;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v18;
        l_Folder_0.Parent = v19;
        return l_Folder_0;
    end;
end;
local function _(v23) --[[ Line: 57 ]] --[[ Name: getOrCreateSaveFolder ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_0 = l_ServerStorage_0;
        local l_R15MigratorProgress_0 = l_l_ServerStorage_0_0:FindFirstChild("R15MigratorProgress");
        local v26;
        if l_R15MigratorProgress_0 and l_R15MigratorProgress_0:IsA("Folder") then
            v26 = l_R15MigratorProgress_0;
        else
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = "R15MigratorProgress";
            l_Folder_1.Parent = l_l_ServerStorage_0_0;
            v26 = l_Folder_1;
        end;
        v13 = v26;
    end;
    if v23 then
        local l_v13_0 = v13;
        local l_l_v13_0_FirstChild_0 = l_v13_0:FindFirstChild(v23);
        if l_l_v13_0_FirstChild_0 and l_l_v13_0_FirstChild_0:IsA("Folder") then
            return l_l_v13_0_FirstChild_0;
        else
            local l_Folder_2 = Instance.new("Folder");
            l_Folder_2.Name = v23;
            l_Folder_2.Parent = l_v13_0;
            return l_Folder_2;
        end;
    else
        return v13;
    end;
end;
local function _(v32) --[[ Line: 66 ]] --[[ Name: getOrCreatePostPublishFolder ]]
    -- upvalues: v14 (ref), l_ServerStorage_0 (copy)
    if not v14 then
        local l_l_ServerStorage_0_1 = l_ServerStorage_0;
        local l_R15MigratorPostPublish_0 = l_l_ServerStorage_0_1:FindFirstChild("R15MigratorPostPublish");
        local v35;
        if l_R15MigratorPostPublish_0 and l_R15MigratorPostPublish_0:IsA("Folder") then
            v35 = l_R15MigratorPostPublish_0;
        else
            local l_Folder_3 = Instance.new("Folder");
            l_Folder_3.Name = "R15MigratorPostPublish";
            l_Folder_3.Parent = l_l_ServerStorage_0_1;
            v35 = l_Folder_3;
        end;
        v14 = v35;
    end;
    if v32 then
        local l_v14_0 = v14;
        local l_l_v14_0_FirstChild_0 = l_v14_0:FindFirstChild(v32);
        if l_l_v14_0_FirstChild_0 and l_l_v14_0_FirstChild_0:IsA("Folder") then
            return l_l_v14_0_FirstChild_0;
        else
            local l_Folder_4 = Instance.new("Folder");
            l_Folder_4.Name = v32;
            l_Folder_4.Parent = l_v14_0;
            return l_Folder_4;
        end;
    else
        return v14;
    end;
end;
local function _(v41) --[[ Line: 75 ]] --[[ Name: getSaveFolder ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v13 then
        local l_R15MigratorProgress_1 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
        v13 = if l_R15MigratorProgress_1 and l_R15MigratorProgress_1:IsA("Folder") then l_R15MigratorProgress_1 else nil;
    end;
    if v13 and v41 then
        return (v13:FindFirstChild(v41));
    else
        return v13;
    end;
end;
local function _(v44) --[[ Line: 86 ]] --[[ Name: getPostPublishFolder ]]
    -- upvalues: v14 (ref), l_ServerStorage_0 (copy)
    if not v14 then
        local l_R15MigratorPostPublish_1 = l_ServerStorage_0:FindFirstChild("R15MigratorPostPublish");
        v14 = if l_R15MigratorPostPublish_1 and l_R15MigratorPostPublish_1:IsA("Folder") then l_R15MigratorPostPublish_1 else nil;
    end;
    if v14 and v44 then
        return (v14:FindFirstChild(v44));
    else
        return v14;
    end;
end;
local function _(v47) --[[ Line: 97 ]] --[[ Name: clearTags ]]
    -- upvalues: v7 (copy), v8 (copy)
    v7:clearPublishTags(v47);
    v8.clearTags(v47);
end;
v0.isRootSaveFolderChildOf = function(v49) --[[ Line: 102 ]] --[[ Name: isRootSaveFolderChildOf ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_2 = l_ServerStorage_0;
        local l_R15MigratorProgress_2 = l_l_ServerStorage_0_2:FindFirstChild("R15MigratorProgress");
        local v52;
        if l_R15MigratorProgress_2 and l_R15MigratorProgress_2:IsA("Folder") then
            v52 = l_R15MigratorProgress_2;
        else
            local l_Folder_5 = Instance.new("Folder");
            l_Folder_5.Name = "R15MigratorProgress";
            l_Folder_5.Parent = l_l_ServerStorage_0_2;
            v52 = l_Folder_5;
        end;
        v13 = v52;
    end;
    return v13.Parent == v49;
end;
v0.isRootSaveFolderDescendantOf = function(v54) --[[ Line: 106 ]] --[[ Name: isRootSaveFolderDescendantOf ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_3 = l_ServerStorage_0;
        local l_R15MigratorProgress_3 = l_l_ServerStorage_0_3:FindFirstChild("R15MigratorProgress");
        local v57;
        if l_R15MigratorProgress_3 and l_R15MigratorProgress_3:IsA("Folder") then
            v57 = l_R15MigratorProgress_3;
        else
            local l_Folder_6 = Instance.new("Folder");
            l_Folder_6.Name = "R15MigratorProgress";
            l_Folder_6.Parent = l_l_ServerStorage_0_3;
            v57 = l_Folder_6;
        end;
        v13 = v57;
    end;
    return v13:IsDescendantOf(v54);
end;
v0.isRootSaveFolder = function(v59) --[[ Line: 110 ]] --[[ Name: isRootSaveFolder ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_4 = l_ServerStorage_0;
        local l_R15MigratorProgress_4 = l_l_ServerStorage_0_4:FindFirstChild("R15MigratorProgress");
        local v62;
        if l_R15MigratorProgress_4 and l_R15MigratorProgress_4:IsA("Folder") then
            v62 = l_R15MigratorProgress_4;
        else
            local l_Folder_7 = Instance.new("Folder");
            l_Folder_7.Name = "R15MigratorProgress";
            l_Folder_7.Parent = l_l_ServerStorage_0_4;
            v62 = l_Folder_7;
        end;
        v13 = v62;
    end;
    return v13 == v59;
end;
v0.isDescendantOfSaveFolder = function(v64) --[[ Line: 114 ]] --[[ Name: isDescendantOfSaveFolder ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_5 = l_ServerStorage_0;
        local l_R15MigratorProgress_5 = l_l_ServerStorage_0_5:FindFirstChild("R15MigratorProgress");
        local v67;
        if l_R15MigratorProgress_5 and l_R15MigratorProgress_5:IsA("Folder") then
            v67 = l_R15MigratorProgress_5;
        else
            local l_Folder_8 = Instance.new("Folder");
            l_Folder_8.Name = "R15MigratorProgress";
            l_Folder_8.Parent = l_l_ServerStorage_0_5;
            v67 = l_Folder_8;
        end;
        v13 = v67;
    end;
    return v64:IsDescendantOf(v13);
end;
v0.doesSaveFolderExistInDM = function() --[[ Line: 120 ]] --[[ Name: doesSaveFolderExistInDM ]]
    -- upvalues: l_ServerStorage_0 (copy)
    return l_ServerStorage_0:FindFirstChild("R15MigratorProgress") ~= nil;
end;
v0.removeAllSavedData = function() --[[ Line: 127 ]] --[[ Name: removeAllSavedData ]]
    -- upvalues: l_ServerStorage_0 (copy)
    local l_R15MigratorProgress_6 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
    if l_R15MigratorProgress_6 ~= nil then
        l_R15MigratorProgress_6:Destroy();
    end;
end;
v0.conversionIdFilter = function() --[[ Line: 134 ]] --[[ Name: conversionIdFilter ]]
    -- upvalues: v11 (copy)
    return function(v70) --[[ Line: 135 ]]
        -- upvalues: v11 (ref)
        return v70:GetAttribute(v11) ~= nil;
    end;
end;
v0.removeConversionId = function(v71) --[[ Line: 140 ]] --[[ Name: removeConversionId ]]
    -- upvalues: v11 (copy)
    v71:SetAttribute(v11, nil);
end;
v0.SetAdapted = function(v72) --[[ Line: 144 ]] --[[ Name: SetAdapted ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), l_Attributes_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_6 = l_ServerStorage_0;
        local l_R15MigratorProgress_7 = l_l_ServerStorage_0_6:FindFirstChild("R15MigratorProgress");
        local v75;
        if l_R15MigratorProgress_7 and l_R15MigratorProgress_7:IsA("Folder") then
            v75 = l_R15MigratorProgress_7;
        else
            local l_Folder_9 = Instance.new("Folder");
            l_Folder_9.Name = "R15MigratorProgress";
            l_Folder_9.Parent = l_l_ServerStorage_0_6;
            v75 = l_Folder_9;
        end;
        v13 = v75;
    end;
    v13:SetAttribute(l_Attributes_0.Adapted, v72);
end;
v0.GetAdapted = function() --[[ Line: 149 ]] --[[ Name: GetAdapted ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), l_Attributes_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_7 = l_ServerStorage_0;
        local l_R15MigratorProgress_8 = l_l_ServerStorage_0_7:FindFirstChild("R15MigratorProgress");
        local v79;
        if l_R15MigratorProgress_8 and l_R15MigratorProgress_8:IsA("Folder") then
            v79 = l_R15MigratorProgress_8;
        else
            local l_Folder_10 = Instance.new("Folder");
            l_Folder_10.Name = "R15MigratorProgress";
            l_Folder_10.Parent = l_l_ServerStorage_0_7;
            v79 = l_Folder_10;
        end;
        v13 = v79;
    end;
    local l_v13_1 = v13;
    local l_l_v13_1_Attribute_0 = l_v13_1:GetAttribute(l_Attributes_0.Adapted);
    if l_l_v13_1_Attribute_0 == nil then
        l_v13_1:SetAttribute(l_Attributes_0.Adapted, true);
        return true;
    else
        return l_l_v13_1_Attribute_0 == true;
    end;
end;
v0.getConversionId = function(v83) --[[ Line: 160 ]] --[[ Name: getConversionId ]]
    -- upvalues: v11 (copy)
    return v83:GetAttribute(v11);
end;
v0.hasConvertedFrom = function(v84) --[[ Line: 164 ]] --[[ Name: hasConvertedFrom ]]
    -- upvalues: v0 (copy)
    return v0.getConversionId(v84) ~= nil;
end;
v0.addConvertibleCharacters = function(v85) --[[ Line: 168 ]] --[[ Name: addConvertibleCharacters ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), v11 (copy), l_HttpService_0 (copy), v7 (copy), v8 (copy)
    if not v13 then
        local l_l_ServerStorage_0_8 = l_ServerStorage_0;
        local l_R15MigratorProgress_9 = l_l_ServerStorage_0_8:FindFirstChild("R15MigratorProgress");
        local v88;
        if l_R15MigratorProgress_9 and l_R15MigratorProgress_9:IsA("Folder") then
            v88 = l_R15MigratorProgress_9;
        else
            local l_Folder_11 = Instance.new("Folder");
            l_Folder_11.Name = "R15MigratorProgress";
            l_Folder_11.Parent = l_l_ServerStorage_0_8;
            v88 = l_Folder_11;
        end;
        v13 = v88;
    end;
    local l_v13_2 = v13;
    local l_R6Characters_0 = l_v13_2:FindFirstChild("R6Characters");
    local v92;
    if l_R6Characters_0 and l_R6Characters_0:IsA("Folder") then
        v92 = l_R6Characters_0;
    else
        local l_Folder_12 = Instance.new("Folder");
        l_Folder_12.Name = "R6Characters";
        l_Folder_12.Parent = l_v13_2;
        v92 = l_Folder_12;
    end;
    for _, v95 in v85 do
        if not v95:GetAttribute(v11) then
            local v96 = l_HttpService_0:GenerateGUID();
            v95:SetAttribute(v11, v96);
            local v97 = v95:Clone();
            v97.Name = v96;
            v97.Parent = v92;
            v7:clearPublishTags(v97);
            v8.clearTags(v97);
        end;
    end;
end;
v0.getR6Characters = function() --[[ Line: 185 ]] --[[ Name: getR6Characters ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_9 = l_ServerStorage_0;
        local l_R15MigratorProgress_10 = l_l_ServerStorage_0_9:FindFirstChild("R15MigratorProgress");
        local v100;
        if l_R15MigratorProgress_10 and l_R15MigratorProgress_10:IsA("Folder") then
            v100 = l_R15MigratorProgress_10;
        else
            local l_Folder_13 = Instance.new("Folder");
            l_Folder_13.Name = "R15MigratorProgress";
            l_Folder_13.Parent = l_l_ServerStorage_0_9;
            v100 = l_Folder_13;
        end;
        v13 = v100;
    end;
    local l_v13_3 = v13;
    local l_R6Characters_1 = l_v13_3:FindFirstChild("R6Characters");
    local v104;
    if l_R6Characters_1 and l_R6Characters_1:IsA("Folder") then
        v104 = l_R6Characters_1;
    else
        local l_Folder_14 = Instance.new("Folder");
        l_Folder_14.Name = "R6Characters";
        l_Folder_14.Parent = l_v13_3;
        v104 = l_Folder_14;
    end;
    l_v13_3 = {};
    for _, v107 in v104:GetChildren() do
        l_v13_3[v107.Name] = v107;
    end;
    return l_v13_3;
end;
v0.addScriptConversionRules = function(v108) --[[ Line: 195 ]] --[[ Name: addScriptConversionRules ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), v12 (copy), l_HttpService_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_10 = l_ServerStorage_0;
        local l_R15MigratorProgress_11 = l_l_ServerStorage_0_10:FindFirstChild("R15MigratorProgress");
        local v111;
        if l_R15MigratorProgress_11 and l_R15MigratorProgress_11:IsA("Folder") then
            v111 = l_R15MigratorProgress_11;
        else
            local l_Folder_15 = Instance.new("Folder");
            l_Folder_15.Name = "R15MigratorProgress";
            l_Folder_15.Parent = l_l_ServerStorage_0_10;
            v111 = l_Folder_15;
        end;
        v13 = v111;
    end;
    v13:SetAttribute(v12, l_HttpService_0:JSONEncode(v108));
end;
v0.getScriptConversionRules = function() --[[ Line: 199 ]] --[[ Name: getScriptConversionRules ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), v12 (copy), l_HttpService_0 (copy)
    if not v13 then
        local l_R15MigratorProgress_12 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
        v13 = if l_R15MigratorProgress_12 and l_R15MigratorProgress_12:IsA("Folder") then l_R15MigratorProgress_12 else nil;
    end;
    if not v13 then
        return nil;
    else
        if not v13 then
            local l_R15MigratorProgress_13 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
            v13 = if l_R15MigratorProgress_13 and l_R15MigratorProgress_13:IsA("Folder") then l_R15MigratorProgress_13 else nil;
        end;
        local l_v13_Attribute_0 = v13:GetAttribute(v12);
        if l_v13_Attribute_0 then
            return (l_HttpService_0:JSONDecode(l_v13_Attribute_0));
        else
            return nil;
        end;
    end;
end;
v0.isConvertibleKeyframeSequence = function(v116) --[[ Line: 210 ]] --[[ Name: isConvertibleKeyframeSequence ]]
    -- upvalues: v11 (copy)
    return v116:IsA("KeyframeSequence") and v116:GetAttribute(v11) ~= nil;
end;
v0.addConvertibleKeyframeSequences = function(v117) --[[ Line: 216 ]] --[[ Name: addConvertibleKeyframeSequences ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), v11 (copy), l_HttpService_0 (copy), l_Attributes_0 (copy), v7 (copy), v8 (copy)
    if not v13 then
        local l_l_ServerStorage_0_11 = l_ServerStorage_0;
        local l_R15MigratorProgress_14 = l_l_ServerStorage_0_11:FindFirstChild("R15MigratorProgress");
        local v120;
        if l_R15MigratorProgress_14 and l_R15MigratorProgress_14:IsA("Folder") then
            v120 = l_R15MigratorProgress_14;
        else
            local l_Folder_16 = Instance.new("Folder");
            l_Folder_16.Name = "R15MigratorProgress";
            l_Folder_16.Parent = l_l_ServerStorage_0_11;
            v120 = l_Folder_16;
        end;
        v13 = v120;
    end;
    local l_v13_4 = v13;
    local l_R6KeyframeSequences_0 = l_v13_4:FindFirstChild("R6KeyframeSequences");
    local v124;
    if l_R6KeyframeSequences_0 and l_R6KeyframeSequences_0:IsA("Folder") then
        v124 = l_R6KeyframeSequences_0;
    else
        local l_Folder_17 = Instance.new("Folder");
        l_Folder_17.Name = "R6KeyframeSequences";
        l_Folder_17.Parent = l_v13_4;
        v124 = l_Folder_17;
    end;
    for _, v127 in v117 do
        if v127:IsA("KeyframeSequence") and not v127:GetAttribute(v11) then
            local v128 = l_HttpService_0:GenerateGUID();
            v127:SetAttribute(v11, v128);
            local v129 = v127:Clone();
            v129.Name = v128;
            v129:SetAttribute(l_Attributes_0.OriginalId, nil);
            v129.Parent = v124;
            v7:clearPublishTags(v129);
            v8.clearTags(v129);
        end;
    end;
end;
v0.getR6KeyframeSequence = function(v130, v131) --[[ Line: 239 ]] --[[ Name: getR6KeyframeSequence ]]
    -- upvalues: v11 (copy), v13 (ref), l_ServerStorage_0 (copy)
    local l_v130_Attribute_0 = v130:GetAttribute(v11);
    if not l_v130_Attribute_0 then
        local l_warn_0 = warn;
        local v134 = "Could not find matching R6 KeyframeSequence. Was the %* folder edited?";
        if not v13 then
            local l_l_ServerStorage_0_12 = l_ServerStorage_0;
            local l_R15MigratorProgress_15 = l_l_ServerStorage_0_12:FindFirstChild("R15MigratorProgress");
            local v137;
            if l_R15MigratorProgress_15 and l_R15MigratorProgress_15:IsA("Folder") then
                v137 = l_R15MigratorProgress_15;
            else
                local l_Folder_18 = Instance.new("Folder");
                l_Folder_18.Name = "R15MigratorProgress";
                l_Folder_18.Parent = l_l_ServerStorage_0_12;
                v137 = l_Folder_18;
            end;
            v13 = v137;
        end;
        l_warn_0((v134:format(v13)));
        return;
    else
        local v139 = nil;
        if v131 then
            v139 = v131[l_v130_Attribute_0];
        else
            if not v13 then
                local l_l_ServerStorage_0_13 = l_ServerStorage_0;
                local l_R15MigratorProgress_16 = l_l_ServerStorage_0_13:FindFirstChild("R15MigratorProgress");
                local v142;
                if l_R15MigratorProgress_16 and l_R15MigratorProgress_16:IsA("Folder") then
                    v142 = l_R15MigratorProgress_16;
                else
                    local l_Folder_19 = Instance.new("Folder");
                    l_Folder_19.Name = "R15MigratorProgress";
                    l_Folder_19.Parent = l_l_ServerStorage_0_13;
                    v142 = l_Folder_19;
                end;
                v13 = v142;
            end;
            local l_v13_5 = v13;
            local l_R6KeyframeSequences_1 = l_v13_5:FindFirstChild("R6KeyframeSequences");
            local v146;
            if l_R6KeyframeSequences_1 and l_R6KeyframeSequences_1:IsA("Folder") then
                v146 = l_R6KeyframeSequences_1;
            else
                local l_Folder_20 = Instance.new("Folder");
                l_Folder_20.Name = "R6KeyframeSequences";
                l_Folder_20.Parent = l_v13_5;
                v146 = l_Folder_20;
            end;
            v139 = v146:FindFirstChild(l_v130_Attribute_0);
        end;
        if not v139 then
            local l_warn_1 = warn;
            local v149 = "Original R6 KeyframeSequence is unavailable. Was the %* folder edited?";
            if not v13 then
                local l_l_ServerStorage_0_14 = l_ServerStorage_0;
                local l_R15MigratorProgress_17 = l_l_ServerStorage_0_14:FindFirstChild("R15MigratorProgress");
                local v152;
                if l_R15MigratorProgress_17 and l_R15MigratorProgress_17:IsA("Folder") then
                    v152 = l_R15MigratorProgress_17;
                else
                    local l_Folder_21 = Instance.new("Folder");
                    l_Folder_21.Name = "R15MigratorProgress";
                    l_Folder_21.Parent = l_l_ServerStorage_0_14;
                    v152 = l_Folder_21;
                end;
                v13 = v152;
            end;
            l_warn_1((v149:format(v13)));
            return;
        else
            return v139;
        end;
    end;
end;
v0.getOriginalR6KeyframeSequences = function(v154) --[[ Line: 264 ]] --[[ Name: getOriginalR6KeyframeSequences ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), v0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_15 = l_ServerStorage_0;
        local l_R15MigratorProgress_18 = l_l_ServerStorage_0_15:FindFirstChild("R15MigratorProgress");
        local v157;
        if l_R15MigratorProgress_18 and l_R15MigratorProgress_18:IsA("Folder") then
            v157 = l_R15MigratorProgress_18;
        else
            local l_Folder_22 = Instance.new("Folder");
            l_Folder_22.Name = "R15MigratorProgress";
            l_Folder_22.Parent = l_l_ServerStorage_0_15;
            v157 = l_Folder_22;
        end;
        v13 = v157;
    end;
    local l_v13_6 = v13;
    local l_R6KeyframeSequences_2 = l_v13_6:FindFirstChild("R6KeyframeSequences");
    local v161;
    if l_R6KeyframeSequences_2 and l_R6KeyframeSequences_2:IsA("Folder") then
        v161 = l_R6KeyframeSequences_2;
    else
        local l_Folder_23 = Instance.new("Folder");
        l_Folder_23.Name = "R6KeyframeSequences";
        l_Folder_23.Parent = l_v13_6;
        v161 = l_Folder_23;
    end;
    l_v13_6 = {};
    for _, v164 in v161:GetChildren() do
        l_v13_6[v164.Name] = v164;
    end;
    l_R6KeyframeSequences_2 = {};
    for _, v166 in v154 do
        l_R6KeyframeSequences_2[v166] = v0.getR6KeyframeSequence(v166, l_v13_6);
    end;
    return l_R6KeyframeSequences_2;
end;
v0.addConvertibleAssetIds = function(v167) --[[ Line: 283 ]] --[[ Name: addConvertibleAssetIds ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), v10 (copy), l_Attributes_0 (copy), v7 (copy), v8 (copy)
    if not v13 then
        local l_l_ServerStorage_0_16 = l_ServerStorage_0;
        local l_R15MigratorProgress_19 = l_l_ServerStorage_0_16:FindFirstChild("R15MigratorProgress");
        local v170;
        if l_R15MigratorProgress_19 and l_R15MigratorProgress_19:IsA("Folder") then
            v170 = l_R15MigratorProgress_19;
        else
            local l_Folder_24 = Instance.new("Folder");
            l_Folder_24.Name = "R15MigratorProgress";
            l_Folder_24.Parent = l_l_ServerStorage_0_16;
            v170 = l_Folder_24;
        end;
        v13 = v170;
    end;
    local l_v13_7 = v13;
    local l_R15KeyframeSequences_0 = l_v13_7:FindFirstChild("R15KeyframeSequences");
    local v174;
    if l_R15KeyframeSequences_0 and l_R15KeyframeSequences_0:IsA("Folder") then
        v174 = l_R15KeyframeSequences_0;
    else
        local l_Folder_25 = Instance.new("Folder");
        l_Folder_25.Name = "R15KeyframeSequences";
        l_Folder_25.Parent = l_v13_7;
        v174 = l_Folder_25;
    end;
    l_v13_7 = {};
    for _, v177 in v174:GetChildren() do
        l_v13_7[tonumber(v177.Name)] = true;
    end;
    for _, v179 in v167 do
        if not l_v13_7[v179] then
            local v180 = v10.getConvertedKeyframeSequence(v179);
            if v180 then
                l_v13_7[v179] = true;
                local v181 = v180.Parent:Clone();
                v181.Name = v179;
                v181:SetAttribute(l_Attributes_0.TempId, nil);
                v181.Parent = v174;
                v7:clearPublishTags(v181);
                v8.clearTags(v181);
            end;
        end;
    end;
end;
v0.setTargetAssetId = function(v182, v183) --[[ Line: 310 ]] --[[ Name: setTargetAssetId ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy)
    if not v182 or not v183 then
        return;
    else
        local v184 = tostring(v182);
        local v185 = tostring(v183);
        if not v13 then
            local l_l_ServerStorage_0_17 = l_ServerStorage_0;
            local l_R15MigratorProgress_20 = l_l_ServerStorage_0_17:FindFirstChild("R15MigratorProgress");
            local v188;
            if l_R15MigratorProgress_20 and l_R15MigratorProgress_20:IsA("Folder") then
                v188 = l_R15MigratorProgress_20;
            else
                local l_Folder_26 = Instance.new("Folder");
                l_Folder_26.Name = "R15MigratorProgress";
                l_Folder_26.Parent = l_l_ServerStorage_0_17;
                v188 = l_Folder_26;
            end;
            v13 = v188;
        end;
        local l_v13_8 = v13;
        local l_R15KeyframeSequences_1 = l_v13_8:FindFirstChild("R15KeyframeSequences");
        local v192;
        if l_R15KeyframeSequences_1 and l_R15KeyframeSequences_1:IsA("Folder") then
            v192 = l_R15KeyframeSequences_1;
        else
            local l_Folder_27 = Instance.new("Folder");
            l_Folder_27.Name = "R15KeyframeSequences";
            l_Folder_27.Parent = l_v13_8;
            v192 = l_Folder_27;
        end;
        l_v13_8 = v192:FindFirstChild(v184);
        if not l_v13_8 or not l_v13_8:IsA("StringValue") then
            return;
        else
            if #l_v13_8.Value > 0 then
                l_R15KeyframeSequences_1 = warn;
                local v194 = "%*.Value in folder %* should be empty. Was the %* folder edited?";
                local l_v184_0 = v184;
                local v196 = "R15KeyframeSequences";
                if not v13 then
                    local l_l_ServerStorage_0_18 = l_ServerStorage_0;
                    local l_R15MigratorProgress_21 = l_l_ServerStorage_0_18:FindFirstChild("R15MigratorProgress");
                    local v199;
                    if l_R15MigratorProgress_21 and l_R15MigratorProgress_21:IsA("Folder") then
                        v199 = l_R15MigratorProgress_21;
                    else
                        local l_Folder_28 = Instance.new("Folder");
                        l_Folder_28.Name = "R15MigratorProgress";
                        l_Folder_28.Parent = l_l_ServerStorage_0_18;
                        v199 = l_Folder_28;
                    end;
                    v13 = v199;
                end;
                l_R15KeyframeSequences_1((v194:format(l_v184_0, v196, v13)));
            end;
            l_v13_8.Value = v185;
            return;
        end;
    end;
end;
v0.addConvertibleAnimations = function(v201) --[[ Line: 334 ]] --[[ Name: addConvertibleAnimations ]]
    -- upvalues: v10 (copy), v0 (copy)
    local v202 = {};
    for _, v204 in v201 do
        if v204:IsA("Animation") then
            local v205 = v10.getNormalizedAssetId(v204);
            assert(v205 and typeof(v205) == "number");
            table.insert(v202, v205);
        end;
    end;
    v0.addConvertibleAssetIds(v202);
end;
v0.getAllSavedAnimationAssetIds = function() --[[ Line: 348 ]] --[[ Name: getAllSavedAnimationAssetIds ]]
    -- upvalues: v13 (ref), l_ServerStorage_0 (copy), l_Attributes_0 (copy)
    if not v13 then
        local l_l_ServerStorage_0_19 = l_ServerStorage_0;
        local l_R15MigratorProgress_22 = l_l_ServerStorage_0_19:FindFirstChild("R15MigratorProgress");
        local v208;
        if l_R15MigratorProgress_22 and l_R15MigratorProgress_22:IsA("Folder") then
            v208 = l_R15MigratorProgress_22;
        else
            local l_Folder_29 = Instance.new("Folder");
            l_Folder_29.Name = "R15MigratorProgress";
            l_Folder_29.Parent = l_l_ServerStorage_0_19;
            v208 = l_Folder_29;
        end;
        v13 = v208;
    end;
    local l_v13_9 = v13;
    local l_R15KeyframeSequences_2 = l_v13_9:FindFirstChild("R15KeyframeSequences");
    local v212;
    if l_R15KeyframeSequences_2 and l_R15KeyframeSequences_2:IsA("Folder") then
        v212 = l_R15KeyframeSequences_2;
    else
        local l_Folder_30 = Instance.new("Folder");
        l_Folder_30.Name = "R15KeyframeSequences";
        l_Folder_30.Parent = l_v13_9;
        v212 = l_Folder_30;
    end;
    l_v13_9 = {};
    for _, v215 in v212:GetChildren() do
        if v215:IsA("StringValue") then
            local v216 = tonumber(v215.Name);
            if v216 then
                local v217 = tonumber(v215.Value);
                if v217 then
                    l_v13_9[v216] = {
                        converted = v217, 
                        kfs = v215:FindFirstChildWhichIsA("KeyframeSequence"), 
                        name = v215:GetAttribute(l_Attributes_0.Name)
                    };
                end;
            end;
        end;
    end;
    return l_v13_9;
end;
v0.setPublishTime = function(v218) --[[ Line: 375 ]] --[[ Name: setPublishTime ]]
    -- upvalues: v14 (ref), l_ServerStorage_0 (copy)
    if not v14 then
        local l_l_ServerStorage_0_20 = l_ServerStorage_0;
        local l_R15MigratorPostPublish_2 = l_l_ServerStorage_0_20:FindFirstChild("R15MigratorPostPublish");
        local v221;
        if l_R15MigratorPostPublish_2 and l_R15MigratorPostPublish_2:IsA("Folder") then
            v221 = l_R15MigratorPostPublish_2;
        else
            local l_Folder_31 = Instance.new("Folder");
            l_Folder_31.Name = "R15MigratorPostPublish";
            l_Folder_31.Parent = l_l_ServerStorage_0_20;
            v221 = l_Folder_31;
        end;
        v14 = v221;
    end;
    local l_v14_1 = v14;
    local l_PublishInfo_0 = l_v14_1:FindFirstChild("PublishInfo");
    local v225;
    if l_PublishInfo_0 and l_PublishInfo_0:IsA("Folder") then
        v225 = l_PublishInfo_0;
    else
        local l_Folder_32 = Instance.new("Folder");
        l_Folder_32.Name = "PublishInfo";
        l_Folder_32.Parent = l_v14_1;
        v225 = l_Folder_32;
    end;
    v225:SetAttribute("publishTime", v218:ToIsoDate());
end;
v0.getPublishTime = function() --[[ Line: 380 ]] --[[ Name: getPublishTime ]]
    -- upvalues: v14 (ref), l_ServerStorage_0 (copy)
    if not v14 then
        local l_R15MigratorPostPublish_3 = l_ServerStorage_0:FindFirstChild("R15MigratorPostPublish");
        v14 = if l_R15MigratorPostPublish_3 and l_R15MigratorPostPublish_3:IsA("Folder") then l_R15MigratorPostPublish_3 else nil;
    end;
    local v228 = if v14 then v14:FindFirstChild("PublishInfo") else v14;
    if not v228 then
        return nil;
    else
        local l_v228_Attribute_0 = v228:GetAttribute("publishTime");
        if type(l_v228_Attribute_0) == "string" then
            return (DateTime.fromIsoDate(l_v228_Attribute_0));
        else
            return nil;
        end;
    end;
end;
return v0;