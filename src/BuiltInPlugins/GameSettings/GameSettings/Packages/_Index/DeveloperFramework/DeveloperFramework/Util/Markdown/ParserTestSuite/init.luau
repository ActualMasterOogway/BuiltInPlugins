local v0 = {
    [43] = true, 
    [46] = true, 
    [52] = true, 
    [77] = true, 
    [120] = true, 
    [148] = true, 
    [151] = true, 
    [165] = true, 
    [177] = true, 
    [179] = true, 
    [180] = true, 
    [181] = true, 
    [182] = true, 
    [183] = true, 
    [194] = true, 
    [200] = true, 
    [308] = true, 
    [309] = true, 
    [365] = true, 
    [378] = true, 
    [379] = true, 
    [391] = true, 
    [392] = true, 
    [394] = true, 
    [395] = true, 
    [396] = true, 
    [399] = true, 
    [406] = true, 
    [408] = true, 
    [409] = true, 
    [412] = true, 
    [416] = true, 
    [417] = true, 
    [418] = true, 
    [421] = true, 
    [422] = true, 
    [423] = true, 
    [424] = true, 
    [427] = true, 
    [428] = true, 
    [429] = true, 
    [430] = true, 
    [431] = true, 
    [432] = true, 
    [433] = true, 
    [436] = true, 
    [438] = true, 
    [441] = true, 
    [445] = true, 
    [446] = true, 
    [448] = true, 
    [450] = true, 
    [453] = true, 
    [454] = true, 
    [455] = true, 
    [456] = true, 
    [459] = true, 
    [460] = true, 
    [463] = true, 
    [464] = true, 
    [466] = true, 
    [468] = true, 
    [469] = true, 
    [470] = true, 
    [471] = true, 
    [530] = true, 
    [607] = true, 
    [608] = true, 
    [616] = true, 
    [618] = true, 
    [621] = true, 
    [623] = true, 
    [624] = true, 
    [625] = true, 
    [626] = true, 
    [627] = true, 
    [628] = true, 
    [629] = true
};
local v1 = require(script.Spec);
local v2 = require(script.AST2HTMLMapper);
local v3 = require(script.Parent.MarkdownParser);
return function() --[[ Line: 107 ]] --[[ Name: run ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy), v0 (copy)
    local v4 = {};
    local function v9(v5, v6) --[[ Line: 110 ]] --[[ Name: updateStat ]]
        -- upvalues: v4 (copy)
        local l_section_0 = v5.section;
        local l_id_0 = v5.id;
        if not v4[l_section_0] then
            v4[l_section_0] = {
                passed = {}, 
                failed = {}, 
                skipped = {}
            };
        end;
        if v6 == "passed" then
            table.insert(v4[l_section_0].passed, l_id_0);
            return;
        elseif v6 == "failed" then
            table.insert(v4[l_section_0].failed, l_id_0);
            return;
        else
            if v6 == "skipped" then
                table.insert(v4[l_section_0].skipped, l_id_0);
            end;
            return;
        end;
    end;
    local function _(v10) --[[ Line: 130 ]] --[[ Name: runExample ]]
        -- upvalues: v3 (ref), v2 (ref)
        local v11 = v3.parse(v10.markdown);
        return v2.map(v11) == v10.html;
    end;
    for _, v14 in v1 do
        if v0 then
            if not v0[v14.id] and not v0[v14.section] then
                local l_v9_0 = v9;
                local l_v14_0 = v14;
                local v17 = v3.parse(v14.markdown);
                l_v9_0(l_v14_0, v2.map(v17) == v14.html and "passed" or "failed");
            else
                v9(v14, "skipped");
            end;
        else
            local l_v9_1 = v9;
            local l_v14_1 = v14;
            local v20 = v3.parse(v14.markdown);
            l_v9_1(l_v14_1, v2.map(v20) == v14.html and "passed" or "failed");
        end;
    end;
    return v4;
end;