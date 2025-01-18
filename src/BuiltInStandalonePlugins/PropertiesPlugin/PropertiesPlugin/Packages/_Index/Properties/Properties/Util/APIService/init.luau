local v0 = {};
local l_Players_0 = game:GetService("Players");
local function v4(v2, v3) --[[ Line: 109 ]]
    return string.lower(v2.Name) < string.lower(v3.Name);
end;
local l_References_0 = require(script:WaitForChild("References"));
local l_API_0 = require(script:WaitForChild("API"));
v0.RobloxAPI = l_API_0.Raw;
v0.ClassAPI = l_API_0.Classes;
v0.DeveloperVersion = "1.0.6a";
v0.DumpVersion = v0.RobloxAPI.Version;
v0.LuaVersion = "Luau";
v0.CreatorId = 16554100;
v0.PrintCredits = function(_) --[[ Line: 140 ]] --[[ Name: PrintCredits ]]
    -- upvalues: l_Players_0 (copy), v0 (copy)
    print("\nAPI Service Credits:\nCreator: " .. l_Players_0:GetNameFromUserIdAsync(v0.CreatorId) .. "\nAPI Dump Tool: Github User \"MaximumADHD\"\n");
end;
v0.PrintVersion = function(_) --[[ Line: 147 ]] --[[ Name: PrintVersion ]]
    -- upvalues: v0 (copy)
    print("\nAPI Service Version: " .. v0.DeveloperVersion .. "\nAPI Dump Version: " .. v0.DumpVersion .. "\n");
end;
v0.Test = function(_) --[[ Line: 156 ]] --[[ Name: Test ]]
    -- upvalues: v0 (copy)
    if v0.RobloxAPI then
        return true;
    else
        return false;
    end;
end;
v0.GetRawClassData = function(_, v11) --[[ Line: 162 ]] --[[ Name: GetRawClassData ]]
    -- upvalues: v0 (copy)
    local v12 = v0.ClassAPI[v11];
    if v12 then
        return v12;
    else
        warn("Invalid Class: " .. v11);
        return nil;
    end;
end;
v0.GetRawSuperclassMembers = function(_, v14, v15) --[[ Line: 170 ]] --[[ Name: GetRawSuperclassMembers ]]
    -- upvalues: v0 (copy), v4 (copy)
    v14 = v15 or v14;
    local l_v0_RawClassData_0 = v0:GetRawClassData(v14);
    local l_Members_0 = assert(l_v0_RawClassData_0, "Class not found").Members;
    if l_v0_RawClassData_0.Superclass ~= "<<<ROOT>>>" then
        for _, v19 in pairs(v0:GetRawSuperclassMembers(l_v0_RawClassData_0.Superclass)) do
            table.insert(l_Members_0, v19);
        end;
    end;
    table.sort(l_Members_0, v4);
    return l_Members_0;
end;
v0.GetRawSuperclassProperties = function(_, v21) --[[ Line: 182 ]] --[[ Name: GetRawSuperclassProperties ]]
    -- upvalues: v0 (copy)
    local v22 = {};
    local v23 = tick();
    for _, v25 in pairs(v0:GetRawSuperclassMembers(v21)) do
        if v25.MemberType == "Property" then
            table.insert(v22, v25);
        end;
    end;
    print("GetRawSuperclassProperties", tick() - v23);
    return v22;
end;
v0.JSONEncodeValue = function(_, v27) --[[ Line: 193 ]] --[[ Name: JSONEncodeValue ]]
    -- upvalues: l_References_0 (copy)
    return l_References_0:JSONEncodeValue(v27);
end;
v0.Constructors = l_References_0.Constructors;
v0.JSONDecodeValue = function(_, v29) --[[ Line: 197 ]] --[[ Name: JSONDecodeValue ]]
    -- upvalues: l_References_0 (copy)
    return l_References_0:JSONDecodeValue(v29);
end;
v0.GetProperties = function(_, v31, v32) --[[ Line: 200 ]] --[[ Name: GetProperties ]]
    -- upvalues: v0 (copy)
    local v33 = typeof(v31);
    if v33 ~= "Instance" and v33 ~= "string" then
        warn("\"" .. tostring(v31) .. "\" is not an \"Instance\" or \"string\"");
        return;
    else
        local v34 = tostring(v31);
        if v33 == "Instance" then
            v34 = v31.ClassName;
        end;
        local v35 = {};
        if not v32 then
            for _, v37 in pairs(v0:GetRawSuperclassProperties(v34)) do
                if v33 == "Instance" then
                    pcall(function() --[[ Line: 214 ]]
                        -- upvalues: v35 (copy), v37 (copy), v31 (copy)
                        v35[v37.Name] = v31[v37.Name];
                    end);
                elseif not table.find(v35, v37.Name) and v37.Security.Read == "None" and (not v37.Tags or v37.Tags and not table.find(v37.Tags, "NotScriptable") and not table.find(v37.Tags, "Hidden")) then
                    table.insert(v35, v37.Name);
                end;
            end;
            return v35;
        else
            for _, v39 in pairs(v0:GetRawSuperclassProperties(v34)) do
                if v33 == "Instance" and v39.Security.Write == "None" and v39.Security.Read == "None" and (not v39.Tags or v39.Tags and not table.find(v39.Tags, "NotScriptable") and not table.find(v39.Tags, "Hidden")) then
                    pcall(function() --[[ Line: 247 ]]
                        -- upvalues: v35 (copy), v39 (copy), v31 (copy)
                        v35[v39.Name] = v31[v39.Name];
                    end);
                elseif not table.find(v35, v39.Name) and v39.Security.Write == "None" and v39.Security.Read == "None" and (not v39.Tags or v39.Tags and not table.find(v39.Tags, "NotScriptable") and not table.find(v39.Tags, "Hidden")) then
                    table.insert(v35, v39.Name);
                end;
            end;
            return v35;
        end;
    end;
end;
v0.GetFunctions = function(_, v41) --[[ Line: 269 ]] --[[ Name: GetFunctions ]]
    -- upvalues: v0 (copy)
    local v42 = typeof(v41);
    if v42 ~= "Instance" and v42 ~= "string" then
        warn("\"" .. tostring(v41) .. "\" is not an \"Instance\" or \"string\"");
        return;
    else
        local v43 = tostring(v41);
        if v42 == "Instance" then
            v43 = v41.ClassName;
        end;
        local v44 = {};
        for _, v46 in pairs(v0:GetRawSuperclassMembers(v43)) do
            if v46.MemberType == "Function" then
                if v42 == "Instance" then
                    pcall(function() --[[ Line: 283 ]]
                        -- upvalues: v44 (copy), v46 (copy), v41 (copy)
                        v44[v46.Name] = v41[v46.Name];
                    end);
                elseif not table.find(v44, v46.Name) then
                    table.insert(v44, v46.Name);
                end;
            end;
        end;
        return v44;
    end;
end;
v0.GetEvents = function(_, v48) --[[ Line: 293 ]] --[[ Name: GetEvents ]]
    -- upvalues: v0 (copy)
    local v49 = typeof(v48);
    if v49 ~= "Instance" and v49 ~= "string" then
        warn("\"" .. tostring(v48) .. "\" is not an \"Instance\" or \"string\"");
        return;
    else
        local v50 = tostring(v48);
        if v49 == "Instance" then
            v50 = v48.ClassName;
        end;
        local v51 = {};
        for _, v53 in pairs(v0:GetRawSuperclassMembers(v50)) do
            if v53.MemberType == "Event" then
                if v49 == "Instance" then
                    pcall(function() --[[ Line: 307 ]]
                        -- upvalues: v51 (copy), v53 (copy), v48 (copy)
                        v51[v53.Name] = v48[v53.Name];
                    end);
                elseif not table.find(v51, v53.Name) then
                    table.insert(v51, v53.Name);
                end;
            end;
        end;
        return v51;
    end;
end;
v0.GetClassIcon = function(_, v55) --[[ Line: 317 ]] --[[ Name: GetClassIcon ]]
    -- upvalues: v0 (copy)
    local v56 = typeof(v55);
    if v56 ~= "Instance" and v56 ~= "string" then
        warn("\"" .. tostring(v55) .. "\" is not an \"Instance\" or \"string\"");
        return;
    else
        local v57 = tostring(v55);
        if v56 == "Instance" then
            v57 = v55.ClassName;
        end;
        local l_v0_RawClassData_1 = v0:GetRawClassData(v57);
        if l_v0_RawClassData_1 and l_v0_RawClassData_1.Icon then
            return l_v0_RawClassData_1.Icon;
        else
            return nil;
        end;
    end;
end;
v0.GetClassIconV2 = function(_, v60, v61, v62) --[[ Line: 334 ]] --[[ Name: GetClassIconV2 ]]
    v61 = v61 or "Dark";
    v62 = math.clamp(v62 or 1, 1, 3);
    local v63 = typeof(v60);
    if v63 ~= "Instance" and v63 ~= "string" then
        warn("\"" .. tostring(v60) .. "\" is not an \"Instance\" or \"string\"");
        return;
    else
        local v64 = tostring(v60);
        if v63 == "Instance" then
            v64 = v60.ClassName;
        end;
        local v65 = ("rbxasset://studio_svg_textures/Shared/InsertableObjects/%*/Standard/"):format(v61);
        local _ = nil;
        return v65 .. if v62 > 1 then ("%*@%*x.png"):format(v64, v62) else ("%*.png"):format(v64);
    end;
end;
return v0;