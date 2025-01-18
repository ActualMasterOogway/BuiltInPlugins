--!native
local v0 = {
    1116352408, 
    1899447441, 
    3049323471, 
    3921009573, 
    961987163, 
    1508970993, 
    2453635748, 
    2870763221, 
    3624381080, 
    310598401, 
    607225278, 
    1426881987, 
    1925078388, 
    2162078206, 
    2614888103, 
    3248222580, 
    3835390401, 
    4022224774, 
    264347078, 
    604807628, 
    770255983, 
    1249150122, 
    1555081692, 
    1996064986, 
    2554220882, 
    2821834349, 
    2952996808, 
    3210313671, 
    3336571891, 
    3584528711, 
    113926993, 
    338241895, 
    666307205, 
    773529912, 
    1294757372, 
    1396182291, 
    1695183700, 
    1986661051, 
    2177026350, 
    2456956037, 
    2730485921, 
    2820302411, 
    3259730800, 
    3345764771, 
    3516065817, 
    3600352804, 
    4094571909, 
    275423344, 
    430227734, 
    506948616, 
    659060556, 
    883997877, 
    958139571, 
    1322822218, 
    1537002063, 
    1747873779, 
    1955562222, 
    2024104815, 
    2227730452, 
    2361852424, 
    2428436474, 
    2756734187, 
    3204031479, 
    3329325298
};
local v1 = table.create(64);
local function v36(v2, v3, v4, v5) --[[ Line: 122 ]] --[[ Name: processBlocks ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_v1_0 = v1;
    local v7 = v2[1];
    local v8 = v2[2];
    local v9 = v2[3];
    local v10 = v2[4];
    local v11 = v2[5];
    local v12 = v2[6];
    local v13 = v2[7];
    local v14 = v2[8];
    for v15 = v4, v5, 64 do
        local l_v15_0 = v15;
        for v17 = 1, 16 do
            local v18, v19, v20, v21 = string.byte(v3, l_v15_0, l_v15_0 + 3);
            l_v1_0[v17] = bit32.bor(bit32.lshift(v18, 24), bit32.lshift(v19, 16), bit32.lshift(v20, 8), v21);
            l_v15_0 = l_v15_0 + 4;
        end;
        for v22 = 17, 64 do
            local v23 = l_v1_0[v22 - 2];
            local v24 = l_v1_0[v22 - 15];
            l_v1_0[v22] = bit32.bxor(bit32.rrotate(v23, 17), bit32.rrotate(v23, 19), (bit32.rshift(v23, 10))) + l_v1_0[v22 - 7] + bit32.bxor(bit32.rrotate(v24, 7), bit32.rrotate(v24, 18), (bit32.rshift(v24, 3))) + l_v1_0[v22 - 16];
        end;
        local l_v7_0 = v7;
        local l_v8_0 = v8;
        local l_v9_0 = v9;
        local l_v10_0 = v10;
        local l_v11_0 = v11;
        local l_v12_0 = v12;
        local l_v13_0 = v13;
        local l_v14_0 = v14;
        local v33 = nil;
        local v34 = nil;
        for v35 = 1, 64 do
            v33 = l_v14_0 + bit32.bxor(bit32.rrotate(l_v11_0, 6), bit32.rrotate(l_v11_0, 11), (bit32.rrotate(l_v11_0, 25))) + bit32.band(l_v11_0, l_v12_0) + bit32.band(bit32.bnot(l_v11_0), l_v13_0) + v0[v35] + l_v1_0[v35];
            v34 = bit32.band(l_v9_0, l_v8_0) + bit32.band(l_v7_0, (bit32.bxor(l_v9_0, l_v8_0))) + bit32.bxor(bit32.rrotate(l_v7_0, 2), bit32.rrotate(l_v7_0, 13), (bit32.rrotate(l_v7_0, 22)));
            l_v14_0 = l_v13_0;
            l_v13_0 = l_v12_0;
            l_v12_0 = l_v11_0;
            l_v11_0 = l_v10_0 + v33;
            l_v10_0 = l_v9_0;
            l_v9_0 = l_v8_0;
            l_v8_0 = l_v7_0;
            l_v7_0 = v33 + v34;
        end;
        v7 = bit32.bor(l_v7_0 + v7, 0);
        v8 = bit32.bor(l_v8_0 + v8, 0);
        v9 = bit32.bor(l_v9_0 + v9, 0);
        v10 = bit32.bor(l_v10_0 + v10, 0);
        v11 = bit32.bor(l_v11_0 + v11, 0);
        v12 = bit32.bor(l_v12_0 + v12, 0);
        v13 = bit32.bor(l_v13_0 + v13, 0);
        v14 = bit32.bor(l_v14_0 + v14, 0);
    end;
    v2[1] = v7;
    v2[2] = v8;
    v2[3] = v9;
    v2[4] = v10;
    v2[5] = v11;
    v2[6] = v12;
    v2[7] = v13;
    v2[8] = v14;
end;
return function(v37) --[[ Line: 202 ]] --[[ Name: sha256 ]]
    -- upvalues: v36 (copy)
    local v38 = {
        1779033703, 
        3144134277, 
        1013904242, 
        2773480762, 
        1359893119, 
        2600822924, 
        528734635, 
        1541459225
    };
    local v39 = #v37;
    local v40 = v39 % 64;
    if v39 >= 64 then
        v36(v38, v37, 1, v39 - v40);
    end;
    local v41 = bit32.band(v40 + 32, 4294967232);
    local v42 = {
        if v40 ~= 0 then string.sub(v37, -v40) else "", 
        "\128", 
        string.rep("\000", (v41 - v40 - 9) % 64), 
        string.pack(">L", v39 * 8)
    };
    local v43 = table.concat(v42);
    v36(v38, v43, 1, #v43);
    return string.format("%08x%08x%08x%08x%08x%08x%08x%08x", v38[1], v38[2], v38[3], v38[4], v38[5], v38[6], v38[7], v38[8]), table.freeze(v38);
end;