local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function() --[[ Line: 6 ]] --[[ Name: profileEverythingInReact ]]
    -- upvalues: v1 (copy), l_script_FirstAncestor_0 (copy)
    local v2 = setmetatable({}, {
        __mode = "k"
    });
    local v3 = {};
    local function _(v4) --[[ Line: 10 ]] --[[ Name: sanitizeSource ]]
        -- upvalues: v3 (copy)
        local v5 = v3[v4];
        if v5 ~= nil then
            return v5;
        else
            local v6 = string.split(v4, ".");
            local v7 = v6[#v6];
            v3[v4] = v7;
            return v7;
        end;
    end;
    local l_createElement_0 = v1.createElement;
    v1.createElement = function(v10, ...) --[[ Line: 23 ]]
        -- upvalues: v3 (copy), v2 (copy), l_createElement_0 (copy)
        local v11, v12, v13 = debug.info(2, "nsl");
        local l_profilebegin_0 = debug.profilebegin;
        local v15 = "React.createElement from %* (%*:%*)";
        local l_v11_0 = v11;
        local v17 = v3[v12];
        local v18;
        if v17 ~= nil then
            v18 = v17;
        else
            local v19 = string.split(v12, ".");
            local v20 = v19[#v19];
            v3[v12] = v20;
            v18 = v20;
        end;
        l_profilebegin_0((v15:format(l_v11_0, v18, v13)));
        l_profilebegin_0 = v2[v10];
        if l_profilebegin_0 == nil then
            if typeof(v10) == "function" then
                local v21;
                v21, v15 = debug.info(v10, "ns");
                local l_v21_0 = v21 --[[ copy: 5 -> 13 ]];
                l_profilebegin_0 = function(...) --[[ Line: 31 ]]
                    -- upvalues: l_v21_0 (copy), v15 (copy), v3 (ref), v10 (copy)
                    local l_profilebegin_1 = debug.profilebegin;
                    local v24 = "Body of %* (%*)";
                    local l_l_v21_0_0 = l_v21_0;
                    local l_v15_0 = v15;
                    local v27 = v3[l_v15_0];
                    local v28;
                    if v27 ~= nil then
                        v28 = v27;
                    else
                        local v29 = string.split(l_v15_0, ".");
                        local v30 = v29[#v29];
                        v3[l_v15_0] = v30;
                        v28 = v30;
                    end;
                    l_profilebegin_1((v24:format(l_l_v21_0_0, v28)));
                    l_profilebegin_1 = v10(...);
                    debug.profileend();
                    return l_profilebegin_1;
                end;
            else
                l_profilebegin_0 = v10;
            end;
            v2[v10] = l_profilebegin_0;
        end;
        local v31 = l_createElement_0(l_profilebegin_0, ...);
        debug.profileend();
        return v31;
    end;
    local l_useEffect_0 = v1.useEffect;
    v1.useEffect = function(v33, v34) --[[ Line: 51 ]]
        -- upvalues: v3 (copy), l_useEffect_0 (copy)
        local v35, v36 = debug.info(2, "sl");
        local l_profilebegin_2 = debug.profilebegin;
        local v38 = "useEffect(%*:%*)";
        local v39 = v3[v35];
        local v40;
        if v39 ~= nil then
            v40 = v39;
        else
            local v41 = string.split(v35, ".");
            local v42 = v41[#v41];
            v3[v35] = v42;
            v40 = v42;
        end;
        l_profilebegin_2((v38:format(v40, v36)));
        l_useEffect_0(function() --[[ Line: 55 ]]
            -- upvalues: v35 (copy), v3 (ref), v36 (copy), v33 (copy)
            local l_profilebegin_3 = debug.profilebegin;
            local v44 = "body of useEffect(%*:%*)";
            local l_v35_0 = v35;
            local v46 = v3[l_v35_0];
            local v47;
            if v46 ~= nil then
                v47 = v46;
            else
                local v48 = string.split(l_v35_0, ".");
                local v49 = v48[#v48];
                v3[l_v35_0] = v49;
                v47 = v49;
            end;
            l_profilebegin_3((v44:format(v47, v36)));
            l_profilebegin_3 = v33();
            debug.profileend();
            return l_profilebegin_3;
        end, v34);
        debug.profileend();
    end;
    local l_useMemo_0 = v1.useMemo;
    v1.useMemo = function(v51, v52) --[[ Line: 65 ]]
        -- upvalues: l_useMemo_0 (copy), v3 (copy)
        local v53, v54 = debug.info(2, "sl");
        return l_useMemo_0(function() --[[ Line: 68 ]]
            -- upvalues: v53 (copy), v3 (ref), v54 (copy), v51 (copy)
            local l_profilebegin_4 = debug.profilebegin;
            local v56 = "body of useMemo(%*:%*)";
            local l_v53_0 = v53;
            local v58 = v3[l_v53_0];
            local v59;
            if v58 ~= nil then
                v59 = v58;
            else
                local v60 = string.split(l_v53_0, ".");
                local v61 = v60[#v60];
                v3[l_v53_0] = v61;
                v59 = v61;
            end;
            l_profilebegin_4((v56:format(v59, v54)));
            l_profilebegin_4 = table.pack(v51());
            debug.profileend();
            return table.unpack(l_profilebegin_4);
        end, v52);
    end;
    local l_useContext_0 = v1.useContext;
    v1.useContext = function(v63) --[[ Line: 77 ]]
        -- upvalues: l_useContext_0 (copy)
        debug.profilebegin("useContext");
        local v64 = l_useContext_0(v63);
        debug.profileend();
        return v64;
    end;
    local l_useCallback_0 = v1.useCallback;
    v1.useCallback = function(...) --[[ Line: 85 ]]
        -- upvalues: v3 (copy), l_useCallback_0 (copy)
        local v66, v67 = debug.info(2, "sl");
        local l_profilebegin_5 = debug.profilebegin;
        local v69 = "useCallback(%*:%*)";
        local v70 = v3[v66];
        local v71;
        if v70 ~= nil then
            v71 = v70;
        else
            local v72 = string.split(v66, ".");
            local v73 = v72[#v72];
            v3[v66] = v73;
            v71 = v73;
        end;
        l_profilebegin_5((v69:format(v71, v67)));
        l_profilebegin_5 = l_useCallback_0(...);
        debug.profileend();
        return l_profilebegin_5;
    end;
    local v74 = require(l_script_FirstAncestor_0.Packages.Framework);
    local l_joinTags_0 = v74.Styling.joinTags;
    v74.Styling.joinTags = function(...) --[[ Line: 97 ]]
        -- upvalues: l_joinTags_0 (copy)
        debug.profilebegin("joinTags");
        local v76 = l_joinTags_0(...);
        debug.profileend();
        return v76;
    end;
end;