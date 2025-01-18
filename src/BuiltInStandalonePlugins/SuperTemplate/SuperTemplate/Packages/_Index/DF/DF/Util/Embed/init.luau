local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_forEach_0 = v1.forEach;
local l_format_0 = v1.format;
local v4 = game:DefineFastFlag("StorybookFixEmbedPackages", false);
local v5 = require(l_Parent_0.Util.getDeepFolder);
local v6 = {};
v6.install = function(v7) --[[ Line: 23 ]] --[[ Name: install ]]
    -- upvalues: v5 (copy), l_Parent_0 (copy), v6 (copy)
    local v8 = v5({
        "Packages"
    }, v7);
    if v8:FindFirstChild("Framework") then
        return;
    else
        local v9 = l_Parent_0:Clone();
        v9.Parent = v8;
        v9.Name = "Framework";
        v6.stubScript(v9.Util.Typecheck.DocParser);
        v6.stubScript(v9.Util.Flags);
        v6.stubScript(v9.UI.ContextServices.Localization);
        v6.stubScript(v9.Style.Themes.StudioTheme);
        v6.rewriteStaticFlagsWithCurrentValues(v9);
        return;
    end;
end;
v6.installPeerDependencies = function(v10, v11) --[[ Line: 41 ]] --[[ Name: installPeerDependencies ]]
    -- upvalues: v6 (copy), v5 (copy), v4 (copy), l_forEach_0 (copy)
    v6.installPeerDependency(v10, v11, "Cryo");
    local v12 = v5({
        "Packages"
    }, v10);
    local l__Index_0 = v11:FindFirstChild("_Index");
    local l_ModuleScript_0 = Instance.new("ModuleScript");
    l_ModuleScript_0.Name = "Roact";
    l_ModuleScript_0.Source = "local Packages = script:FindFirstAncestor(\"Packages\")\nreturn require(Packages._Index[\"RoactCompat\"][\"RoactCompat\"])";
    l_ModuleScript_0.Parent = v12;
    local l_ModuleScript_1 = Instance.new("ModuleScript");
    l_ModuleScript_1.Name = "Roact17";
    l_ModuleScript_1.Source = "local Packages = script:FindFirstAncestor(\"Packages\")\nreturn require(Packages._Index[\"RoactCompat\"][\"RoactCompat\"])";
    l_ModuleScript_1.Parent = v12;
    local v16 = v5({
        "_Index"
    }, v12);
    l_forEach_0(if v4 then {
        "Boolean", 
        "Collections", 
        "Console", 
        "ES7Types", 
        "InstanceOf", 
        "Math", 
        "Number", 
        "String", 
        "Symbol", 
        "Timers", 
        "LuauPolyfill", 
        "Promise", 
        "React", 
        "ReactReconciler", 
        "ReactRoblox", 
        "RoactCompat", 
        "Scheduler", 
        "Shared"
    } else {
        "DomTestingLibrary", 
        "DeveloperFramework", 
        "LuauPolyfill", 
        "Promise", 
        "React", 
        "ReactReconciler", 
        "ReactRoblox", 
        "RoactCompat", 
        "Scheduler", 
        "Shared"
    }, function(v17) --[[ Line: 93 ]]
        -- upvalues: l__Index_0 (copy), v16 (copy)
        local l_l__Index_0_FirstChild_0 = l__Index_0:FindFirstChild(v17);
        print("Install React 17 package", v17);
        l_l__Index_0_FirstChild_0:Clone().Parent = v16;
    end);
    v6.installPeerDependency(v10, v11, "React");
    v6.installPeerDependency(v10, v11, "ReactIs");
    v6.installPeerDependency(v10, v11, "ReactRoblox");
    v6.installPeerDependency(v10, v11, "Roact");
    v6.installPeerDependency(v10, v11, "enumerate");
    v6.installPeerDependency(v10, v11, "Dash");
    v6.installPeerDependency(v10, v11, "RoactRodux");
    v6.installPeerDependency(v10, v11, "Rodux");
    v6.installPeerDependency(v10, v11, "TestLoader");
    v6.installPeerDependency(v10, v11, "MaterialFramework");
    v6.installPeerDependency(v10, v11, "ViewportToolingFramework");
end;
v6.installPeerDependency = function(v19, v20, v21) --[[ Line: 112 ]] --[[ Name: installPeerDependency ]]
    -- upvalues: v5 (copy)
    local v22 = v5({
        "Packages"
    }, v19);
    local l__Index_1 = v20:FindFirstChild("_Index");
    if v22:FindFirstChild(v21) then
        return;
    elseif not v20:FindFirstChild(v21) then
        warn("Skipping peer library", v21);
        return;
    else
        print("Locating", v21);
        local v24 = v20:FindFirstChild(v21):Clone();
        v24.Parent = v22;
        local v25 = v24.Source:match("PackageIndex%[%\"([^\"]+)%\"%]");
        print("Linking", v21, "to", v25);
        local l_l__Index_1_FirstChild_0 = l__Index_1:FindFirstChild(v25);
        local v27 = v5({
            "_Index"
        }, v22);
        l_l__Index_1_FirstChild_0:Clone().Parent = v27;
        return;
    end;
end;
v6.stubScript = function(v28) --[[ Line: 134 ]] --[[ Name: stubScript ]]
    local l_Parent_1 = v28.Parent;
    if l_Parent_1 then
        local l_l_Parent_1_FirstChild_0 = l_Parent_1:FindFirstChild(v28.Name .. ".stub");
        l_l_Parent_1_FirstChild_0.Parent = l_Parent_1;
        l_l_Parent_1_FirstChild_0.Name = v28.Name;
        v28.Name = v28.Name .. "_stubbed";
    end;
end;
v6.rewriteStaticFlagsWithCurrentValues = function(v31) --[[ Line: 144 ]] --[[ Name: rewriteStaticFlagsWithCurrentValues ]]
    -- upvalues: v6 (copy), l_forEach_0 (copy)
    v6.rewriteFlagsForScript(v31);
    v6.rewriteFlagsForScript((v31:FindFirstChild("Util")));
    v6.rewriteFlagsForScript((v31:FindFirstChild("UI")));
    l_forEach_0(v31:GetChildren(), function(v32) --[[ Line: 148 ]]
        -- upvalues: l_forEach_0 (ref), v6 (ref)
        l_forEach_0(v32:GetDescendants(), function(v33) --[[ Line: 149 ]]
            -- upvalues: v6 (ref)
            if v33:IsA("ModuleScript") then
                v6.rewriteFlagsForScript(v33);
            end;
        end);
    end);
end;
local function v36(v34, v35) --[[ Line: 163 ]] --[[ Name: rewriteMethodCall ]]
    -- upvalues: l_format_0 (copy)
    return l_format_0("select(2, \"{}\", {:?})", v34, v35);
end;
local function _(v37, v38) --[[ Line: 169 ]] --[[ Name: tryCall ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v37 (copy)
        return v37();
    end);
    if l_status_0 then
        return l_result_0;
    else
        return v38;
    end;
end;
local function _(v42) --[[ Line: 180 ]] --[[ Name: getFlag ]]
    local function v43() --[[ Line: 181 ]]
        -- upvalues: v42 (copy)
        return game:GetFastFlag(v42);
    end;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v43 (copy)
        return v43();
    end);
    if l_status_1 then
        return l_result_1;
    else
        return false;
    end;
end;
local function _(v47) --[[ Line: 186 ]] --[[ Name: getFeature ]]
    local function v48() --[[ Line: 187 ]]
        -- upvalues: v47 (copy)
        return game:GetEngineFeature(v47);
    end;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v48 (copy)
        return v48();
    end);
    if l_status_2 then
        return l_result_2;
    else
        return v47;
    end;
end;
local function _(v52) --[[ Line: 192 ]] --[[ Name: getString ]]
    local function v53() --[[ Line: 193 ]]
        -- upvalues: v52 (copy)
        return game:GetFastString(v52);
    end;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v53 (copy)
        return v53();
    end);
    if l_status_3 then
        return l_result_3;
    else
        return v52;
    end;
end;
local function _(v57) --[[ Line: 198 ]] --[[ Name: getInt ]]
    local function v58() --[[ Line: 199 ]]
        -- upvalues: v57 (copy)
        return game:GetFastInt(v57);
    end;
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v58 (copy)
        return v58();
    end);
    if l_status_4 then
        return l_result_4;
    else
        return v57;
    end;
end;
local function _(v62) --[[ Line: 204 ]] --[[ Name: getFVariable ]]
    local function v63() --[[ Line: 205 ]]
        -- upvalues: v62 (copy)
        return settings():GetFVariable(v62);
    end;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v63 (copy)
        return v63();
    end);
    if l_status_5 then
        return l_result_5;
    else
        return false;
    end;
end;
local function v73(v67) --[[ Line: 210 ]] --[[ Name: rewriteFlag ]]
    -- upvalues: v36 (copy)
    local l_v36_0 = v36;
    local l_v67_0 = v67;
    local function v70() --[[ Line: 181 ]]
        -- upvalues: v67 (copy)
        return game:GetFastFlag(v67);
    end;
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v70 (copy)
        return v70();
    end);
    return l_v36_0(l_v67_0, if l_status_6 then l_result_6 else false);
end;
local function v80(v74) --[[ Line: 214 ]] --[[ Name: rewriteEngineFeature ]]
    -- upvalues: v36 (copy)
    local l_v36_1 = v36;
    local l_v74_0 = v74;
    local function v77() --[[ Line: 187 ]]
        -- upvalues: v74 (copy)
        return game:GetEngineFeature(v74);
    end;
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v77 (copy)
        return v77();
    end);
    return l_v36_1(l_v74_0, if l_status_7 then l_result_7 else v74);
end;
local function v87(v81) --[[ Line: 217 ]] --[[ Name: rewriteString ]]
    -- upvalues: v36 (copy)
    local l_v36_2 = v36;
    local l_v81_0 = v81;
    local function v84() --[[ Line: 193 ]]
        -- upvalues: v81 (copy)
        return game:GetFastString(v81);
    end;
    local l_status_8, l_result_8 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v84 (copy)
        return v84();
    end);
    return l_v36_2(l_v81_0, if l_status_8 then l_result_8 else v81);
end;
local function v94(v88) --[[ Line: 220 ]] --[[ Name: rewriteInt ]]
    -- upvalues: v36 (copy)
    local l_v36_3 = v36;
    local l_v88_0 = v88;
    local function v91() --[[ Line: 199 ]]
        -- upvalues: v88 (copy)
        return game:GetFastInt(v88);
    end;
    local l_status_9, l_result_9 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v91 (copy)
        return v91();
    end);
    return l_v36_3(l_v88_0, if l_status_9 then l_result_9 else v88);
end;
local function v101(v95) --[[ Line: 223 ]] --[[ Name: rewriteSetting ]]
    -- upvalues: v36 (copy)
    local l_v36_4 = v36;
    local l_v95_0 = v95;
    local function v98() --[[ Line: 205 ]]
        -- upvalues: v95 (copy)
        return settings():GetFVariable(v95);
    end;
    local l_status_10, l_result_10 = pcall(function() --[[ Line: 170 ]]
        -- upvalues: v98 (copy)
        return v98();
    end);
    return l_v36_4(l_v95_0, if l_status_10 then l_result_10 else false);
end;
v6.rewriteFlagsForScript = function(v102) --[[ Line: 227 ]] --[[ Name: rewriteFlagsForScript ]]
    -- upvalues: v73 (copy), v87 (copy), v80 (copy), v94 (copy), v101 (copy)
    v102.Source = v102.Source:gsub("game:DefineFastFlag%(%s*\"([^\"]+)\"[^)]*%)", v73):gsub("game:DefineFastString%(%s*\"([^\"]+)\"[^)]*%)", v87):gsub("game:GetEngineFeature%(%s*\"([^\"]+)\"[^)]*%)", v80):gsub("game:GetFastFlag%(%s*\"([^\"]+)\"[^)]*%)", v73):gsub("game:GetFastString%(%s*\"([^\"]+)\"[^)]*%)", v87):gsub("game:GetFastInt%(%s*\"([^\"]+)\"[^)]*%)", v94):gsub("settings%(%):GetFFlag%(%s*\"([^\"]+)\"%)", v73):gsub("settings%(%):GetFVariable%(%s*\"([^\"]+)\"%)", v101):gsub("settings%(%):GetFVariable%(%s*\"([^\"]+)\"%)", v101):gsub("game:GetService%(\"StudioService\"%)", "({StudioLocaleId = \"en-us\", GetPropertyChangedSignal = function() return {Connect = function() return {Disconnect = function() end} end} end, HasInternalPermission = function() return true end})"):gsub("game:GetService%(\"StudioSdkService\"%)", "({GetSdk = function() return nil end})"):gsub("settings%(%)%.Studio", "({Theme = {Name = \"Light\", GetColor = function(_, color) return color == Enum.StudioStyleGuideColor.MainBackground and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0) end}, ThemeChanged = {Connect = function() return {Disconnect = function() end} end}})");
end;
return v6;