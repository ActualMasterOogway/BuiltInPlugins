local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_forEach_0 = v1.forEach;
local l_format_0 = v1.format;
local v4 = game:DefineFastFlag("StorybookFixEmbedPackages", false);
local v5 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkStorybookEmbedStyles);
local v6 = require(l_Parent_0.Util.getDeepFolder);
local v7 = {};
v7.install = function(v8) --[[ Line: 24 ]] --[[ Name: install ]]
    -- upvalues: v6 (copy), l_Parent_0 (copy), v7 (copy)
    local v9 = v6({
        "Packages"
    }, v8);
    if v9:FindFirstChild("Framework") then
        return;
    else
        local v10 = l_Parent_0:Clone();
        v10.Parent = v9;
        v10.Name = "Framework";
        v7.stubScript(v10.Util.Typecheck.DocParser);
        v7.stubScript(v10.Util.Flags);
        v7.stubScript(v10.UI.ContextServices.Localization);
        v7.stubScript(v10.Style.Themes.StudioTheme);
        v7.rewriteStaticFlagsWithCurrentValues(v10);
        return;
    end;
end;
v7.installPeerDependencies = function(v11, v12) --[[ Line: 42 ]] --[[ Name: installPeerDependencies ]]
    -- upvalues: v7 (copy), v6 (copy), v4 (copy), l_forEach_0 (copy)
    v7.installPeerDependency(v11, v12, "Cryo");
    local v13 = v6({
        "Packages"
    }, v11);
    local l__Index_0 = v12:FindFirstChild("_Index");
    local l_ModuleScript_0 = Instance.new("ModuleScript");
    l_ModuleScript_0.Name = "Roact";
    l_ModuleScript_0.Source = "local Packages = script:FindFirstAncestor(\"Packages\")\nreturn require(Packages._Index[\"RoactCompat\"][\"RoactCompat\"])";
    l_ModuleScript_0.Parent = v13;
    local l_ModuleScript_1 = Instance.new("ModuleScript");
    l_ModuleScript_1.Name = "Roact17";
    l_ModuleScript_1.Source = "local Packages = script:FindFirstAncestor(\"Packages\")\nreturn require(Packages._Index[\"RoactCompat\"][\"RoactCompat\"])";
    l_ModuleScript_1.Parent = v13;
    local v17 = v6({
        "_Index"
    }, v13);
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
    }, function(v18) --[[ Line: 94 ]]
        -- upvalues: l__Index_0 (copy), v17 (copy)
        local l_l__Index_0_FirstChild_0 = l__Index_0:FindFirstChild(v18);
        print("Install React 17 package", v18);
        l_l__Index_0_FirstChild_0:Clone().Parent = v17;
    end);
    v7.installPeerDependency(v11, v12, "React");
    v7.installPeerDependency(v11, v12, "ReactIs");
    v7.installPeerDependency(v11, v12, "ReactRoblox");
    v7.installPeerDependency(v11, v12, "Roact");
    v7.installPeerDependency(v11, v12, "enumerate");
    v7.installPeerDependency(v11, v12, "Dash");
    v7.installPeerDependency(v11, v12, "RoactRodux");
    v7.installPeerDependency(v11, v12, "Rodux");
    v7.installPeerDependency(v11, v12, "TestLoader");
    v7.installPeerDependency(v11, v12, "MaterialFramework");
    v7.installPeerDependency(v11, v12, "ViewportToolingFramework");
end;
v7.installPeerDependency = function(v20, v21, v22) --[[ Line: 113 ]] --[[ Name: installPeerDependency ]]
    -- upvalues: v6 (copy)
    local v23 = v6({
        "Packages"
    }, v20);
    local l__Index_1 = v21:FindFirstChild("_Index");
    if v23:FindFirstChild(v22) then
        return;
    elseif not v21:FindFirstChild(v22) then
        warn("Skipping peer library", v22);
        return;
    else
        print("Locating", v22);
        local v25 = v21:FindFirstChild(v22):Clone();
        v25.Parent = v23;
        local v26 = v25.Source:match("PackageIndex%[%\"([^\"]+)%\"%]");
        print("Linking", v22, "to", v26);
        local l_l__Index_1_FirstChild_0 = l__Index_1:FindFirstChild(v26);
        local v28 = v6({
            "_Index"
        }, v23);
        l_l__Index_1_FirstChild_0:Clone().Parent = v28;
        return;
    end;
end;
v7.stubScript = function(v29) --[[ Line: 135 ]] --[[ Name: stubScript ]]
    local l_Parent_1 = v29.Parent;
    if l_Parent_1 then
        local l_l_Parent_1_FirstChild_0 = l_Parent_1:FindFirstChild(v29.Name .. ".stub");
        l_l_Parent_1_FirstChild_0.Parent = l_Parent_1;
        l_l_Parent_1_FirstChild_0.Name = v29.Name;
        v29.Name = v29.Name .. "_stubbed";
    end;
end;
v7.rewriteStaticFlagsWithCurrentValues = function(v32) --[[ Line: 145 ]] --[[ Name: rewriteStaticFlagsWithCurrentValues ]]
    -- upvalues: v7 (copy), l_forEach_0 (copy)
    v7.rewriteFlagsForScript(v32);
    v7.rewriteFlagsForScript((v32:FindFirstChild("Util")));
    v7.rewriteFlagsForScript((v32:FindFirstChild("UI")));
    l_forEach_0(v32:GetChildren(), function(v33) --[[ Line: 149 ]]
        -- upvalues: l_forEach_0 (ref), v7 (ref)
        l_forEach_0(v33:GetDescendants(), function(v34) --[[ Line: 150 ]]
            -- upvalues: v7 (ref)
            if v34:IsA("ModuleScript") then
                v7.rewriteFlagsForScript(v34);
            end;
        end);
    end);
end;
local function v37(v35, v36) --[[ Line: 164 ]] --[[ Name: rewriteMethodCall ]]
    -- upvalues: l_format_0 (copy)
    return l_format_0("select(2, \"{}\", {:?})", v35, v36);
end;
local function _(v38, v39) --[[ Line: 170 ]] --[[ Name: tryCall ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v38 (copy)
        return v38();
    end);
    if l_status_0 then
        return l_result_0;
    else
        return v39;
    end;
end;
local function _(v43) --[[ Line: 181 ]] --[[ Name: getFlag ]]
    local function v44() --[[ Line: 182 ]]
        -- upvalues: v43 (copy)
        return game:GetFastFlag(v43);
    end;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v44 (copy)
        return v44();
    end);
    if l_status_1 then
        return l_result_1;
    else
        return false;
    end;
end;
local function _(v48) --[[ Line: 187 ]] --[[ Name: getFeature ]]
    local function v49() --[[ Line: 188 ]]
        -- upvalues: v48 (copy)
        return game:GetEngineFeature(v48);
    end;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v49 (copy)
        return v49();
    end);
    if l_status_2 then
        return l_result_2;
    else
        return v48;
    end;
end;
local function _(v53) --[[ Line: 193 ]] --[[ Name: getString ]]
    local function v54() --[[ Line: 194 ]]
        -- upvalues: v53 (copy)
        return game:GetFastString(v53);
    end;
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v54 (copy)
        return v54();
    end);
    if l_status_3 then
        return l_result_3;
    else
        return v53;
    end;
end;
local function _(v58) --[[ Line: 199 ]] --[[ Name: getInt ]]
    local function v59() --[[ Line: 200 ]]
        -- upvalues: v58 (copy)
        return game:GetFastInt(v58);
    end;
    local l_status_4, l_result_4 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v59 (copy)
        return v59();
    end);
    if l_status_4 then
        return l_result_4;
    else
        return v58;
    end;
end;
local function _(v63) --[[ Line: 205 ]] --[[ Name: getFVariable ]]
    local function v64() --[[ Line: 206 ]]
        -- upvalues: v63 (copy)
        return settings():GetFVariable(v63);
    end;
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v64 (copy)
        return v64();
    end);
    if l_status_5 then
        return l_result_5;
    else
        return false;
    end;
end;
local function v74(v68) --[[ Line: 211 ]] --[[ Name: rewriteFlag ]]
    -- upvalues: v37 (copy)
    local l_v37_0 = v37;
    local l_v68_0 = v68;
    local function v71() --[[ Line: 182 ]]
        -- upvalues: v68 (copy)
        return game:GetFastFlag(v68);
    end;
    local l_status_6, l_result_6 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v71 (copy)
        return v71();
    end);
    return l_v37_0(l_v68_0, if l_status_6 then l_result_6 else false);
end;
local function v81(v75) --[[ Line: 215 ]] --[[ Name: rewriteEngineFeature ]]
    -- upvalues: v37 (copy)
    local l_v37_1 = v37;
    local l_v75_0 = v75;
    local function v78() --[[ Line: 188 ]]
        -- upvalues: v75 (copy)
        return game:GetEngineFeature(v75);
    end;
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v78 (copy)
        return v78();
    end);
    return l_v37_1(l_v75_0, if l_status_7 then l_result_7 else v75);
end;
local function v88(v82) --[[ Line: 218 ]] --[[ Name: rewriteString ]]
    -- upvalues: v37 (copy)
    local l_v37_2 = v37;
    local l_v82_0 = v82;
    local function v85() --[[ Line: 194 ]]
        -- upvalues: v82 (copy)
        return game:GetFastString(v82);
    end;
    local l_status_8, l_result_8 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v85 (copy)
        return v85();
    end);
    return l_v37_2(l_v82_0, if l_status_8 then l_result_8 else v82);
end;
local function v95(v89) --[[ Line: 221 ]] --[[ Name: rewriteInt ]]
    -- upvalues: v37 (copy)
    local l_v37_3 = v37;
    local l_v89_0 = v89;
    local function v92() --[[ Line: 200 ]]
        -- upvalues: v89 (copy)
        return game:GetFastInt(v89);
    end;
    local l_status_9, l_result_9 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v92 (copy)
        return v92();
    end);
    return l_v37_3(l_v89_0, if l_status_9 then l_result_9 else v89);
end;
local function v102(v96) --[[ Line: 224 ]] --[[ Name: rewriteSetting ]]
    -- upvalues: v37 (copy)
    local l_v37_4 = v37;
    local l_v96_0 = v96;
    local function v99() --[[ Line: 206 ]]
        -- upvalues: v96 (copy)
        return settings():GetFVariable(v96);
    end;
    local l_status_10, l_result_10 = pcall(function() --[[ Line: 171 ]]
        -- upvalues: v99 (copy)
        return v99();
    end);
    return l_v37_4(l_v96_0, if l_status_10 then l_result_10 else false);
end;
v7.rewriteFlagsForScript = function(v103) --[[ Line: 228 ]] --[[ Name: rewriteFlagsForScript ]]
    -- upvalues: v74 (copy), v88 (copy), v81 (copy), v95 (copy), v102 (copy), v5 (copy)
    v103.Source = v103.Source:gsub("game:DefineFastFlag%(%s*\"([^\"]+)\"[^)]*%)", v74):gsub("game:DefineFastString%(%s*\"([^\"]+)\"[^)]*%)", v88):gsub("game:GetEngineFeature%(%s*\"([^\"]+)\"[^)]*%)", v81):gsub("game:GetFastFlag%(%s*\"([^\"]+)\"[^)]*%)", v74):gsub("game:GetFastString%(%s*\"([^\"]+)\"[^)]*%)", v88):gsub("game:GetFastInt%(%s*\"([^\"]+)\"[^)]*%)", v95):gsub("settings%(%):GetFFlag%(%s*\"([^\"]+)\"%)", v74):gsub("settings%(%):GetFVariable%(%s*\"([^\"]+)\"%)", v102):gsub("settings%(%):GetFVariable%(%s*\"([^\"]+)\"%)", v102):gsub("game:GetService%(\"StudioService\"%)", "({StudioLocaleId = \"en-us\", GetPropertyChangedSignal = function() return {Connect = function() return {Disconnect = function() end} end} end, HasInternalPermission = function() return true end})"):gsub("game:GetService%(\"StudioSdkService\"%)", "({GetSdk = function() return nil end})");
    if not v5 then
        v103.Source = v103.Source:gsub("settings%(%)%.Studio", "({Theme = {Name = \"Light\", GetColor = function(_, color) return color == Enum.StudioStyleGuideColor.MainBackground and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0) end}, ThemeChanged = {Connect = function() return {Disconnect = function() end} end}})");
    end;
end;
return v7;