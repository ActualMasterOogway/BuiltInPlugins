local _ = game:GetService("RunService");
local _ = game:GetService("Workspace");
local _ = game:GetService("ServerStorage");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = v6.Util.Math;
local _ = require(l_script_FirstAncestor_0.Src.Util.buildHierarchy);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.Adorn);
local _ = require(l_script_FirstAncestor_0.Src.Util.Templates);
local v15 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v16 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v17 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v18 = {};
local function v24(v19, v20) --[[ Line: 61 ]] --[[ Name: findMatchingAttachments ]]
    if v19 and v20 then
        for _, v22 in ipairs(v19:GetChildren()) do
            if v22:IsA("Attachment") then
                local l_v20_FirstChild_0 = v20:FindFirstChild(v22.Name);
                if l_v20_FirstChild_0 then
                    return v22, l_v20_FirstChild_0;
                end;
            end;
        end;
    end;
    return nil, nil;
end;
v18.buildR15Constraints = function(v25) --[[ Line: 75 ]] --[[ Name: buildR15Constraints ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy), v24 (copy)
    local v26 = v15.getRigInfo(v25);
    local l_PartNameToMotor_0 = v26.PartNameToMotor;
    local l_PartNameToAnimConstraint_0 = v26.PartNameToAnimConstraint;
    local v29 = {};
    for v30, v31 in pairs(v16.PartToConstraintConfigMap) do
        local v32 = {};
        if not v17() or l_PartNameToMotor_0[v30] then
            local v33, v34 = v24(l_PartNameToMotor_0[v30].Part0, l_PartNameToMotor_0[v30].Part1);
            v32.Attachment0 = v33;
            v32.Attachment1 = v34;
        end;
        if v17() and l_PartNameToAnimConstraint_0 and l_PartNameToAnimConstraint_0[v30] then
            local v35, v36 = v24(v15.getPart0(l_PartNameToAnimConstraint_0[v30]), v15.getPart1(l_PartNameToAnimConstraint_0[v30]));
            v32.Attachment0 = v35;
            v32.Attachment1 = v36;
        end;
        if v32.Attachment0 then
            assert(v32.Attachment0);
            local v37 = string.gsub(v32.Attachment0.Name, "Attachment", "");
            if v31.LowerAngle ~= nil then
                v32.LowerAngle = v31.LowerAngle;
            end;
            if v31.TwistLimitsEnabled ~= nil then
                v32.TwistLimitsEnabled = v31.TwistLimitsEnabled;
                v32.TwistUpperAngle = v31.TwistUpperAngle;
                v32.TwistLowerAngle = v31.TwistLowerAngle;
            end;
            v32.Restitution = v31.Restitution;
            v32.LimitsEnabled = v31.LimitsEnabled;
            v32.UpperAngle = v31.UpperAngle;
            v32.Enabled = false;
            v29[v37] = {
                Type = v31.Type, 
                Props = v32
            };
        end;
    end;
    return v29;
end;
v18.canUseIK = function(v38) --[[ Line: 124 ]] --[[ Name: canUseIK ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy), v24 (copy)
    if not v38 then
        return false, false;
    else
        assert(v38 ~= nil);
        local v39 = v15.getRigInfo(v38);
        local l_PartNameToMotor_1 = v39.PartNameToMotor;
        local l_PartNameToConstraint_0 = v39.PartNameToConstraint;
        local l_PartNameToAnimConstraint_1 = v39.PartNameToAnimConstraint;
        if next(l_PartNameToConstraint_0) ~= nil then
            return true, v15.usingTemporaryConstraints();
        else
            for v43, v44 in pairs(v16.R15links) do
                local v45 = l_PartNameToMotor_1[v43];
                local v46 = if v17() and l_PartNameToAnimConstraint_1 then l_PartNameToAnimConstraint_1[v43] else nil;
                if v45 or v17() and v46 then
                    local v47, v48 = v24(v38:FindFirstChild(v43), v38:FindFirstChild(v44));
                    local v49 = if v17() then v15.getPart0(v46) else nil;
                    if v47 == nil or v48 == nil or v45 and v45.Part0.Name ~= v44 or v17() and v49 and v49.Name ~= v44 then
                        return false, false;
                    end;
                else
                    return false, false;
                end;
            end;
            return true, true;
        end;
    end;
end;
local function v59(v50, v51) --[[ Line: 165 ]] --[[ Name: getRigPose ]]
    -- upvalues: v17 (copy), v15 (copy)
    local v52 = {};
    for _, v54 in pairs(v50) do
        v52[v54.Part0] = v54.Part0.CFrame;
        v52[v54.Part1] = v54.Part1.CFrame;
    end;
    if v17() then
        for _, v56 in v51 do
            local v57 = v15.getPart0(v56.OriginalData);
            local v58 = v15.getPart1(v56.OriginalData);
            if v57 and v58 then
                v52[v57] = v57.CFrame;
                v52[v58] = v58.CFrame;
            end;
        end;
    end;
    return v52;
end;
local function _(v60) --[[ Line: 184 ]] --[[ Name: restoreMotor ]]
    local l_Motor6D_0 = Instance.new("Motor6D");
    l_Motor6D_0.Name = v60.Name;
    l_Motor6D_0.Part0 = v60.Part0;
    l_Motor6D_0.Part1 = v60.Part1;
    l_Motor6D_0.C0 = v60.C0;
    l_Motor6D_0.C1 = v60.C1;
    l_Motor6D_0.Parent = v60.Parent;
end;
local function _(v63) --[[ Line: 194 ]] --[[ Name: restoreAnimConstraint ]]
    v63.OriginalData.Parent = v63.Parent;
end;
local function _(v65, v66, v67, v68) --[[ Line: 199 ]] --[[ Name: calculateTransformHelper ]]
    return v67:Inverse() * v65:Inverse() * v66 * v68;
end;
local function _(v70, v71) --[[ Line: 203 ]] --[[ Name: calculateTransform ]]
    local v72 = v71[v70.Part0];
    local v73 = v71[v70.Part1];
    local l_C0_0 = v70.C0;
    local l_C1_0 = v70.C1;
    return l_C0_0:Inverse() * v72:Inverse() * v73 * l_C1_0;
end;
local function v83(v77, v78) --[[ Line: 207 ]] --[[ Name: calculateTransformFromAnimConstraint ]]
    -- upvalues: v15 (copy)
    assert(v77.OriginalData.Attachment0 ~= nil);
    assert(v77.OriginalData.Attachment1 ~= nil);
    local v79 = v78[v15.getPart0(v77.OriginalData)];
    local v80 = v78[v15.getPart1(v77.OriginalData)];
    local l_CFrame_0 = v77.OriginalData.Attachment0.CFrame;
    local l_CFrame_1 = v77.OriginalData.Attachment1.CFrame;
    return l_CFrame_0:Inverse() * v79:Inverse() * v80 * l_CFrame_1;
end;
local function v100(v84, v85, v86, v87) --[[ Line: 219 ]] --[[ Name: restoreMotors ]]
    -- upvalues: v15 (copy)
    local l_PartNameToConstraint_1 = v15.getRigInfo(v84).PartNameToConstraint;
    for v89, v90 in pairs(v86) do
        if l_PartNameToConstraint_1[v89.Name] ~= nil then
            l_PartNameToConstraint_1[v89.Name].Enabled = false;
        end;
        v89.Anchored = false;
        local l_ipairs_0 = ipairs;
        local v92 = v90.Attachments or {};
        for _, v94 in l_ipairs_0(v92) do
            local l_v89_FirstChild_0 = v89:FindFirstChild(v94.Name);
            if l_v89_FirstChild_0 and l_v89_FirstChild_0:IsA("Attachment") then
                l_v89_FirstChild_0.Axis = v94.Axis;
                l_v89_FirstChild_0.SecondaryAxis = v94.SecondaryAxis;
            end;
        end;
        l_ipairs_0 = Instance.new("Motor6D");
        l_ipairs_0.Name = v90.Name;
        l_ipairs_0.Part0 = v90.Part0;
        l_ipairs_0.Part1 = v90.Part1;
        l_ipairs_0.C0 = v90.C0;
        l_ipairs_0.C1 = v90.C1;
        l_ipairs_0.Parent = v90.Parent;
        l_ipairs_0 = v89.Name;
        local v96 = v85[v90.Part0];
        local v97 = v85[v90.Part1];
        local l_C0_1 = v90.C0;
        local l_C1_1 = v90.C1;
        v87[l_ipairs_0] = l_C0_1:Inverse() * v96:Inverse() * v97 * l_C1_1;
    end;
end;
local function v124(v101, v102, v103, v104, v105) --[[ Line: 243 ]] --[[ Name: restoreParts ]]
    -- upvalues: v15 (copy), v83 (copy)
    local l_PartNameToConstraint_2 = v15.getRigInfo(v101).PartNameToConstraint;
    local function v114(v107, v108) --[[ Line: 253 ]] --[[ Name: restorePart ]]
        -- upvalues: l_PartNameToConstraint_2 (copy)
        if l_PartNameToConstraint_2[v107.Name] ~= nil then
            l_PartNameToConstraint_2[v107.Name].Enabled = false;
        end;
        v107.Anchored = false;
        local l_ipairs_1 = ipairs;
        local v110 = v108.Attachments or {};
        for _, v112 in l_ipairs_1(v110) do
            local l_v107_FirstChild_0 = v107:FindFirstChild(v112.Name);
            if l_v107_FirstChild_0 and l_v107_FirstChild_0:IsA("Attachment") then
                l_v107_FirstChild_0.Axis = v112.Axis;
                l_v107_FirstChild_0.SecondaryAxis = v112.SecondaryAxis;
            end;
        end;
    end;
    for v115, v116 in pairs(v103) do
        v114(v115, v116);
        local l_Motor6D_1 = Instance.new("Motor6D");
        l_Motor6D_1.Name = v116.Name;
        l_Motor6D_1.Part0 = v116.Part0;
        l_Motor6D_1.Part1 = v116.Part1;
        l_Motor6D_1.C0 = v116.C0;
        l_Motor6D_1.C1 = v116.C1;
        l_Motor6D_1.Parent = v116.Parent;
        l_Motor6D_1 = v115.Name;
        local v118 = v102[v116.Part0];
        local v119 = v102[v116.Part1];
        local l_C0_2 = v116.C0;
        local l_C1_2 = v116.C1;
        v105[l_Motor6D_1] = l_C0_2:Inverse() * v118:Inverse() * v119 * l_C1_2;
    end;
    for v122, v123 in pairs(v104) do
        v114(v122, v123);
        v123.OriginalData.Parent = v123.Parent;
        v105[v122.Name] = v83(v123, v102);
    end;
end;
v18.ikDragEnd = function(v125, v126, v127) --[[ Line: 280 ]] --[[ Name: ikDragEnd ]]
    -- upvalues: v59 (copy), v17 (copy), v124 (copy), v100 (copy), v15 (copy)
    local v128 = {};
    local v129 = v59(v126, v127);
    if v17() then
        v124(v125, v129, v126, v127, v128);
    else
        v100(v125, v129, v126, v128);
    end;
    v15.findRootPart(v125).Anchored = true;
    v15.clearCache();
    return v128;
end;
local function v134(v130, v131, v132) --[[ Line: 294 ]] --[[ Name: removeMotors ]]
    if v130 and v131 then
        v132[v130] = {
            Name = v131.Name, 
            Parent = v131.Parent, 
            Part0 = v131.Part0, 
            Part1 = v131.Part1, 
            C0 = v131.C0, 
            C1 = v131.C1, 
            Attachments = {}
        };
        local l_CFrame_2 = v130.CFrame;
        v131:Destroy();
        v130.CFrame = l_CFrame_2;
    end;
end;
local function v139(v135, v136, v137) --[[ Line: 312 ]] --[[ Name: removeAnimConstraints ]]
    if v135 and v136 then
        v137[v135] = {
            OriginalData = v136, 
            Parent = v136.Parent, 
            Attachments = {}
        };
        local l_CFrame_3 = v135.CFrame;
        v136.Parent = nil;
        v135.CFrame = l_CFrame_3;
    end;
end;
local function _(v140, v141, v142) --[[ Line: 326 ]] --[[ Name: getPartParent ]]
    -- upvalues: v17 (copy), v15 (copy)
    if not v142 then
        return nil;
    else
        assert(v142);
        if v140 then
            local v143 = v140[v142.Name];
            if v143 then
                return v143.Part0;
            end;
        end;
        if v17() and v141 then
            local v144 = v141[v142.Name];
            if v144 then
                return v15.getPart0(v144);
            end;
        end;
        return nil;
    end;
end;
local function _(v146, v147, v148) --[[ Line: 350 ]] --[[ Name: distanceFromRoot ]]
    -- upvalues: v17 (copy), v15 (copy)
    local v149 = false;
    local l_v148_0 = v148;
    local v151 = -1;
    while l_v148_0 ~= nil do
        local l_l_v148_0_0 = l_v148_0;
        if not l_l_v148_0_0 then
            l_v148_0 = nil;
        else
            assert(l_l_v148_0_0);
            if v146 then
                local v153 = v146[l_l_v148_0_0.Name];
                if v153 then
                    l_v148_0 = v153.Part0;
                    v149 = true;
                end;
            end;
            if not v149 then
                if v17() and v147 then
                    local v154 = v147[l_l_v148_0_0.Name];
                    if v154 then
                        l_v148_0 = v15.getPart0(v154);
                        v149 = true;
                    end;
                end;
                if not v149 then
                    l_v148_0 = nil;
                end;
            end;
        end;
        v149 = false;
        v151 = v151 + 1;
    end;
    return v151;
end;
v18.pinForLimbMode = function(v156, v157, v158) --[[ Line: 364 ]] --[[ Name: pinForLimbMode ]]
    -- upvalues: v16 (copy), v17 (copy), v15 (copy)
    local v159 = {};
    local v160 = v157[v16.R15_PARTS.UpperTorso];
    local v161 = v157[v16.R15_PARTS.LowerTorso];
    local v162 = v157[v16.R15_PARTS.LeftFoot];
    local v163 = v157[v16.R15_PARTS.RightFoot];
    if v160 and v161 then
        if v156 ~= v160.Part1 and v156 ~= v161.Part1 then
            v159[v160.Part1] = true;
            v159[v161.Part1] = true;
        elseif v162 and v163 then
            v159[v162.Part1] = true;
            v159[v163.Part1] = true;
        end;
    end;
    if v17() and v158 then
        local v164 = v158[v16.R15_PARTS.UpperTorso];
        local v165 = v158[v16.R15_PARTS.LowerTorso];
        if v164 and v165 then
            local v166 = v15.getPart1(v164);
            local v167 = v15.getPart1(v165);
            if v156 ~= v166 and v156 ~= v167 then
                if v166 and v167 then
                    v159[v166] = true;
                    v159[v167] = true;
                    return v159;
                end;
            else
                local v168 = v158[v16.R15_PARTS.LeftFoot];
                local v169 = v158[v16.R15_PARTS.RightFoot];
                if v168 and v169 then
                    local v170 = v15.getPart1(v168);
                    local v171 = v15.getPart1(v169);
                    if v170 and v171 then
                        v159[v170] = true;
                        v159[v171] = true;
                    end;
                end;
            end;
        end;
    end;
    return v159;
end;
v18.getPoseCFrames = function(v172) --[[ Line: 414 ]] --[[ Name: getPoseCFrames ]]
    -- upvalues: v15 (copy), v17 (copy)
    local v173 = {};
    local v174 = v15.getRigInfo(v172);
    local l_PartNameToMotor_2 = v174.PartNameToMotor;
    local l_PartNameToAnimConstraint_2 = v174.PartNameToAnimConstraint;
    for _, v178 in pairs(l_PartNameToMotor_2) do
        if v178.Part0 and v178.Part1 then
            v173[v178.Part0.Name] = v178.Part0.CFrame;
            v173[v178.Part1.Name] = v178.Part1.CFrame;
        end;
    end;
    if v17() and l_PartNameToAnimConstraint_2 then
        for _, v180 in pairs(l_PartNameToAnimConstraint_2) do
            local v181 = v15.getPart0(v180);
            local v182 = v15.getPart1(v180);
            if v181 and v182 then
                v173[v181.Name] = v181.CFrame;
                v173[v182.Name] = v182.CFrame;
            end;
        end;
    end;
    return v173;
end;
local function v200(v183, v184, v185, v186) --[[ Line: 439 ]] --[[ Name: fixRigAttachments ]]
    -- upvalues: v4 (copy), v15 (copy), v17 (copy)
    if not v184 or v184 == v4.None then
        return;
    else
        assert(v184);
        for _, v188 in pairs(v183) do
            local v189 = v15.getPart0(v188);
            local v190 = v15.getPart1(v188);
            if v188:IsA("BallSocketConstraint") and v189 ~= nil and v190 ~= nil and (v185[v189] and v185[v190] or v17() and v186[v189] and v186[v190]) and v188.Attachment0 and v188.Attachment1 then
                local v191 = nil;
                for _, v193 in pairs(v183) do
                    if v15.getPart0(v193) == v190 then
                        v191 = v193;
                    end;
                end;
                local v194 = nil;
                local v195 = v15.getPart1(v191);
                if v195 and v190 then
                    local v196 = v184[v195.Name];
                    local v197 = v184[v190.Name];
                    v194 = (v196.p - v197.p).Unit;
                elseif v190 and v189 then
                    local v198 = v184[v190.Name];
                    local v199 = v184[v189.Name];
                    v194 = (v198.p - v199.p).Unit;
                end;
                assert(v194);
                if v185[v189] and v185[v190] then
                    v185[v189].Attachments = v185[v189].Attachments or {};
                    v185[v190].Attachments = v185[v190].Attachments or {};
                    table.insert(v185[v189].Attachments, {
                        Axis = v188.Attachment0.Axis, 
                        SecondaryAxis = v188.Attachment0.SecondaryAxis, 
                        Name = v188.Attachment0.Name
                    });
                    table.insert(v185[v190].Attachments, {
                        Axis = v188.Attachment1.Axis, 
                        SecondaryAxis = v188.Attachment1.SecondaryAxis, 
                        Name = v188.Attachment1.Name
                    });
                end;
                if v17() and v186[v189] and v186[v190] then
                    v186[v189].Attachments = v186[v189].Attachments or {};
                    v186[v190].Attachments = v186[v190].Attachments or {};
                    table.insert(v186[v189].Attachments, {
                        Axis = v188.Attachment0.Axis, 
                        SecondaryAxis = v188.Attachment0.SecondaryAxis, 
                        Name = v188.Attachment0.Name
                    });
                    table.insert(v186[v190].Attachments, {
                        Axis = v188.Attachment1.Axis, 
                        SecondaryAxis = v188.Attachment1.SecondaryAxis, 
                        Name = v188.Attachment1.Name
                    });
                end;
                v188.Attachment0.Axis = v194;
                v188.Attachment1.Axis = v194;
            end;
        end;
        return;
    end;
end;
v18.ikDragStart = function(v201, v202, v203, v204, v205) --[[ Line: 522 ]] --[[ Name: ikDragStart ]]
    -- upvalues: v15 (copy), v17 (copy), v18 (copy), v134 (copy), v139 (copy), v200 (copy)
    v15.clearCache();
    local v206 = {};
    local v207 = {};
    local v208 = {};
    local v209 = {};
    local v210 = v15.getRigInfo(v201);
    local l_PartNameToMotor_3 = v210.PartNameToMotor;
    local l_PartNameToConstraint_3 = v210.PartNameToConstraint;
    local l_PartNameToAnimConstraint_3 = v210.PartNameToAnimConstraint;
    local function v226(v214) --[[ Line: 541 ]] --[[ Name: addChain ]]
        -- upvalues: l_PartNameToMotor_3 (copy), l_PartNameToAnimConstraint_3 (copy), v17 (ref), v15 (ref), v206 (copy), v207 (copy)
        local v215 = false;
        local v216 = false;
        local l_l_PartNameToMotor_3_0 = l_PartNameToMotor_3;
        local l_l_PartNameToAnimConstraint_3_0 = l_PartNameToAnimConstraint_3;
        local l_v214_0 = v214;
        local v220 = -1;
        while l_v214_0 ~= nil do
            local l_l_v214_0_0 = l_v214_0;
            if not l_l_v214_0_0 then
                l_v214_0 = nil;
            else
                assert(l_l_v214_0_0);
                if l_l_PartNameToMotor_3_0 then
                    local v222 = l_l_PartNameToMotor_3_0[l_l_v214_0_0.Name];
                    if v222 then
                        l_v214_0 = v222.Part0;
                        v215 = true;
                    end;
                end;
                if not v215 then
                    if v17() and l_l_PartNameToAnimConstraint_3_0 then
                        local v223 = l_l_PartNameToAnimConstraint_3_0[l_l_v214_0_0.Name];
                        if v223 then
                            l_v214_0 = v15.getPart0(v223);
                            v215 = true;
                        end;
                    end;
                    if not v215 then
                        l_v214_0 = nil;
                    end;
                end;
            end;
            v215 = false;
            v220 = v220 + 1;
        end;
        local l_v220_0 = v220;
        while l_v220_0 >= 0 do
            if not v206[v214] then
                v207[#v207 + 1] = {
                    Item = v214, 
                    Priority = l_v220_0
                };
                v206[v214] = true;
            end;
            l_l_PartNameToMotor_3_0 = l_PartNameToMotor_3;
            l_l_PartNameToAnimConstraint_3_0 = l_PartNameToAnimConstraint_3;
            local l_v214_1 = v214;
            if not l_v214_1 then
                v214 = nil;
            else
                assert(l_v214_1);
                if l_l_PartNameToMotor_3_0 then
                    l_v214_0 = l_l_PartNameToMotor_3_0[l_v214_1.Name];
                    if l_v214_0 then
                        v214 = l_v214_0.Part0;
                        v216 = true;
                    end;
                end;
                if not v216 then
                    if v17() and l_l_PartNameToAnimConstraint_3_0 then
                        l_v214_0 = l_l_PartNameToAnimConstraint_3_0[l_v214_1.Name];
                        if l_v214_0 then
                            v214 = v15.getPart0(l_v214_0);
                            v216 = true;
                        end;
                    end;
                    if not v216 then
                        v214 = nil;
                    end;
                end;
            end;
            v216 = false;
            l_v220_0 = l_v220_0 - 1;
        end;
    end;
    if v203 then
        v205 = v18.pinForLimbMode(v202, l_PartNameToMotor_3, l_PartNameToAnimConstraint_3);
    end;
    v226(v202);
    for v227, v228 in pairs(v205) do
        if v228 and v227.Name ~= v202.Name then
            v226(v227);
        end;
    end;
    table.sort(v207, function(v229, v230) --[[ Line: 569 ]]
        return v229.Priority > v230.Priority;
    end);
    for v231 = 1, #v207 do
        local l_Item_0 = v207[v231].Item;
        if l_Item_0 then
            v134(l_Item_0, l_PartNameToMotor_3[l_Item_0.Name], v208);
            if v17() and l_PartNameToAnimConstraint_3 then
                v139(l_Item_0, l_PartNameToAnimConstraint_3[l_Item_0.Name], v209);
            end;
            if v205[l_Item_0] and l_Item_0.Name ~= v202.Name then
                l_Item_0.Anchored = true;
            end;
        end;
    end;
    v200(l_PartNameToConstraint_3, v204, v208, v209);
    for v233 in pairs(v208) do
        local v234 = l_PartNameToConstraint_3[v233.Name];
        if v234 then
            v234.Enabled = true;
        end;
    end;
    if v17() then
        for v235 in pairs(v209) do
            local v236 = l_PartNameToConstraint_3[v235.Name];
            if v236 then
                v236.Enabled = true;
            end;
        end;
    end;
    return v208, v209;
end;
return v18;