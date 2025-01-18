return function(v0, v1) --[[ Line: 46 ]] --[[ Name: Spritesheet ]]
    local v2 = typeof(v1.SpriteSize);
    local v3 = typeof(v1.NumSprites);
    local v4 = typeof(v1.SpritesheetWidth);
    local v5 = true;
    if v2 ~= "number" then
        v5 = v2 == "Vector2";
    end;
    assert(v5, "SpriteSize must be number or Vector2. Got type '" .. v2 .. "'");
    assert(v3 == "number", "NumSprites must be number. Got type'" .. v3 .. "'");
    v5 = true;
    if v4 ~= "number" then
        v5 = v4 == "nil";
    end;
    assert(v5, "SpritesheetWidth must be a number or nil. Got '" .. v4 .. "'");
    local v6 = v2 == "number" and Vector2.new(1, 1) * v1.SpriteSize or v1.SpriteSize;
    v5 = v1.NumSprites;
    local v7 = v1.SpritesheetWidth or 1024;
    local v8 = false;
    if v6.X > 0 then
        v8 = v6.Y > 0;
    end;
    assert(v8, "SpriteSize does not support <= 0 values. Got '" .. tostring(v6) .. "'");
    assert(v5 > 0, "NumSprites must be > 0. Got '" .. v5);
    assert(v7 > 0, "SpritesheetWidth does not support <= 0 values. Got '" .. v7 .. "'");
    local v9 = {};
    v8 = math.floor(v7 / v6.X);
    for v10 = 0, v1.NumSprites - 1 do
        local v11 = math.floor(v10 / v8);
        local v12 = v10 % v8;
        table.insert(v9, {
            Image = v0, 
            ImageRectSize = v6, 
            ImageRectOffset = Vector2.new(v12 * v6.X, v11 * v6.Y)
        });
    end;
    return v9;
end;