--[[override.txt file

default:tinblock bottom default_tin_block_top.png
default:tinblock top default_tin_block_top.png

ethereal:birch_leaves * ethereal_birch_leaves.png
ethereal:palmleaves * ethereal_palm_leaves.png

farming:seed_wheat * farming_wheat_0.png
farming:seed_cotton * farming_cotton_0.png

moreores:silver_block bottom moreores_silver_block_top.png
moreores:silver_block top moreores_silver_block_top.png

caverealms:glow_obsidian_2 * magma_conduits_glow_obsidian.png
caverealms:hot_cobble * magma_conduits_hot_cobble.png
caverealms:mushroom_stem bottom caverealms_mushroom_stem_top.png
caverealms:mushroom_stem top caverealms_mushroom_stem_top.png

default:fence * default_fence_wood.png
default:fence_birch * default_wood_birch.png
default:fence_oak * default_wood_oak.png
]]

--minetest.registered_nodes["default:tinblock"].tiles[1]


modname = minetest.get_current_modname()
modpath = minetest.get_modpath(modname)

--supported_mod_list = minetest.get_dir_list(path, [is_dir])

-- Rewrite mod.conf on startup; register_on_mods_loaded does not work
-- following code from texgen mod by LMD
do
	local conf = Settings(modpath .. "/mod.conf")
	conf:set("name", modname)
	conf:set("description", "rpg16 in mod format")
	conf:set("depends", "")
	local to_depend = {}
	local to_dep_list = {}
	for _, modname in pairs(minetest.get_modnames()) do to_depend[modname] = true end -- luacheck: ignore
	local opt_dep_str = conf:get"optional_depends" or ""
	for opt_depend in opt_dep_str:gmatch"[^%s,]+" do
		table.insert(to_dep_list, opt_depend)
		to_depend[opt_depend] = nil
	end
	to_depend.rpg16 = nil -- no circular dependency
--	to_depend.modlib = nil -- modlib is already a hard dependency
	if next(to_depend) then
		for dep in pairs(to_depend) do table.insert(to_dep_list, dep) end
		conf:set("optional_depends", table.concat(to_dep_list, ", "))
		conf:write()
		error"mod.conf updated to optionally depend on all enabled mods, please restart the game"
	end
end



local override_table = {}

local file = io.open(modpath .. "/override.txt", "r")

-- Read each line of the file
if file then
    for line in file:lines() do
        -- Split the line into the item name, target face, and texture name
        local itemname, face, texture = string.match(line, "^(%S+)%s+(%S+)%s+(%S+%.png)$")
        -- If the line matches the expected format, add it to the table
        if itemname and face and texture then
            override_table[itemname] = { target_face = face, texture = texture }
        end
    end
    file:close()
else
    minetest.log("error", "Could not open override.txt")
end


-- OVERRIDE
local special_drawtype = {
	["flowingliquid"] = true,
	["allfaces_optional"] = true,
	["glasslike_framed"] = true,
	["glasslike_framed_optional"] = true,
	["plantlike_rooted"] = true,
}
local tiles_type = {
	["left"] = "tiles", -- nodes only
	["right"] = "tiles",
	["front"] = "tiles",
	["back"] = "tiles",
	["top"] = "tiles",
	["bottom"] = "tiles",
	["sides"] = "multiple",
	["all"] = "multiple",
	["*"] = "multiple",
	["special1"] = "special_tiles", -- drawtypes flowingliquid allfaces_optional glasslike_framed glasslike_framed_optional plantlike_rooted
	["special2"] = "special_tiles",
	["special3"] = "special_tiles",
	["special4"] = "special_tiles",
	["special5"] = "special_tiles",
	["special6"] = "special_tiles",
	["inventory"] = "inventory_image", -- items + nodes
	["wield"] = "wield_image", -- items+ nodes
}
local tiles_table = {
	["left"] = 1,
	["right"] = 2,
	["front"] = 3,
	["back"] = 4,
	["top"] = 5,
	["bottom"] = 6,
	--["sides"] = ,
	--["all"] = ,
	--["*"] = ,
	["special1"] = 1,
	["special2"] = 2,
	["special3"] = 3,
	["special4"] = 4,
	["special5"] = 5,
	["special6"] = 6,
	--["inventory"] = ,
	--["wield"] = ,
}
for k, v in pairs(override_table) do
	local item = k								--mod:node
	local face = override_table[k].target_face	--node face
	local texture = override_table[k].texture	--texture.png
	-- TILES
	if tiles_type[face] == "tiles" then
		local tiles = table.copy(minetest.registered_nodes[item].tiles)
		tiles[tiles_table[face]] = texture
		minetest.override_item(item, { tiles = tiles })
	-- SPECIAL_TILES
	elseif tiles_type[face] == "special_tiles" then
		if special_drawtype then
			local special_tiles = table.copy(minetest.registered_nodes[item].special_tiles)
			special_tiles[tiles_table[face]] = texture
			minetest.override_item(item, { special_tiles = special_tiles })
		elseif special_drawtype ~= true then
			-- output error message?
		end
	--ALL, SIDES, *
	elseif tiles_type[face] == "multiple" then
		local tiles = table.copy(minetest.registered_nodes[item].tiles)
		if face == "all" or face == "*" then
			for i=6,1,-1 do
				tiles[i] = texture
				minetest.override_item(item, { tiles = tiles })
			end
		elseif face == "sides" then
			for i=6,3,-1 do
				tiles[i] = texture
				minetest.override_item(item, { tiles = tiles })
			end
		end
	-- INVENTORY
	elseif tiles_type[face] == "inventory" then
		local inventory_image = table.copy(minetest.registered_nodes[item].inventory_image )
		inventory_image[tiles_table[face]] = texture
		minetest.override_item(item, { inventory_image = inventory_image })
	--WIELD
	elseif tiles_type[face] == "wield" then
		local wield_image = table.copy(minetest.registered_nodes[item].wield_image )
		wield_image[tiles_table[face]] = texture
		minetest.override_item(item, { wield_image = wield_image })
	end
end

-- Print the list to chat
minetest.after(1, function()
	for k, v in pairs(override_table) do
		minetest.chat_send_all(k .. " " .. override_table[k].target_face .. " " .. override_table[k].texture )
	end
end)