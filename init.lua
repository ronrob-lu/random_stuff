-- random_stuff/init.lua

local S = minetest.get_translator("random_stuff")

-- Helper function to register falling mesh nodes
local function register_falling_mesh(name, desc, mesh_file, box)
	minetest.register_node("random_stuff:" .. name, {
		description = desc,
		drawtype = "mesh",
		mesh = mesh_file,
		paramtype2 = "facedir",
		paramtype = "light",
		walkable = true,
		buildable_to = false,
		selection_box = {type = "fixed", fixed = box},
		collision_box = {type = "fixed", fixed = box},
		groups = {falling_node = 1, oddly_breakable_by_hand = 3},
		tiles = {"colormap.png"}, -- Dummy tile to suppress missing texture warnings, colored by palette
	})
end

register_falling_mesh("barrel", "Chaos Barrel", "barrel.obj", {-0.78, -0.5, -0.78, 0.78, 0.93, 0.78})
register_falling_mesh("chair", "Chaos Chair", "chair.obj", {-0.52, -0.5, -0.56, 0.52, 0.93, 0.56})
register_falling_mesh("table", "Chaos Table", "table.obj", {-1.31, -0.5, -0.98, 1.31, 0.44, 0.98})
minetest.register_node("random_stuff:wood_structure", {
	description = "Chaos Wood Structure",
	drawtype = "mesh",
	mesh = "wood-structure.obj",
	paramtype2 = "facedir",
	paramtype = "light",
	walkable = true,
	buildable_to = false,
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -1.5, -1.05, 0.5, -1.05},
			{1.05, -0.5, -1.5, 1.5, 0.5, -1.05},
			{-1.5, -0.5, 1.05, -1.05, 0.5, 1.5},
			{1.05, -0.5, 1.05, 1.5, 0.5, 1.5}
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -1.5, -1.05, 0.5, -1.05},
			{1.05, -0.5, -1.5, 1.5, 0.5, -1.05},
			{-1.5, -0.5, 1.05, -1.05, 0.5, 1.5},
			{1.05, -0.5, 1.05, 1.5, 0.5, 1.5}
		}
	},
	groups = {falling_node = 1, oddly_breakable_by_hand = 3},
	tiles = {"colormap.png"},
	on_construct = function(pos)
		local p1 = {x = pos.x, y = pos.y + 1, z = pos.z}
		local p2 = {x = pos.x, y = pos.y + 2, z = pos.z}
		local n1 = minetest.get_node(p1)
		local n2 = minetest.get_node(p2)
		local def1 = minetest.registered_nodes[n1.name]
		local def2 = minetest.registered_nodes[n2.name]
		if def1 and (def1.buildable_to or n1.name == "air") then
			minetest.set_node(p1, {name = "random_stuff:wood_structure_dummy_1"})
		end
		if def2 and (def2.buildable_to or n2.name == "air") then
			minetest.set_node(p2, {name = "random_stuff:wood_structure_dummy_2"})
		end
	end,
	on_destruct = function(pos)
		local p1 = {x = pos.x, y = pos.y + 1, z = pos.z}
		local p2 = {x = pos.x, y = pos.y + 2, z = pos.z}
		local n1 = minetest.get_node(p1)
		local n2 = minetest.get_node(p2)
		if n1.name == "random_stuff:wood_structure_dummy_1" then
			minetest.remove_node(p1)
		end
		if n2.name == "random_stuff:wood_structure_dummy_2" then
			minetest.remove_node(p2)
		end
	end,
})


minetest.register_node("random_stuff:wood_structure_dummy_1", {
	on_dig = function(pos, node, digger)
		local p = {x = pos.x, y = pos.y - 1, z = pos.z}
		local n = minetest.get_node(p)
		if n.name == "random_stuff:wood_structure" then
			minetest.node_dig(p, n, digger)
		end
	end,

	description = "Chaos Wood Structure (Middle)",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	buildable_to = true,
	pointable = true,
	drop = "",
	groups = {not_in_creative_inventory = 1, oddly_breakable_by_hand = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.63, 0.4, 1.05, 1.63, 0.5, 1.63},
			{-1.63, 0.4, -1.63, 1.63, 0.5, -1.05},
			{-1.63, 0.4, -1.05, -1.05, 0.5, 1.05},
			{1.05, 0.4, -1.05, 1.63, 0.5, 1.05},
			{-1.5, -0.5, -1.5, -1.05, 0.4, -1.05},
			{1.05, -0.5, -1.5, 1.5, 0.4, -1.05},
			{-1.5, -0.5, 1.05, -1.05, 0.4, 1.5},
			{1.05, -0.5, 1.05, 1.5, 0.4, 1.5},
			{-1.05, 0.4, -1.05, 1.05, 0.5, 1.05}
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-1.63, 0.4, 1.05, 1.63, 0.5, 1.63},
			{-1.63, 0.4, -1.63, 1.63, 0.5, -1.05},
			{-1.63, 0.4, -1.05, -1.05, 0.5, 1.05},
			{1.05, 0.4, -1.05, 1.63, 0.5, 1.05},
			{-1.5, -0.5, -1.5, -1.05, 0.4, -1.05},
			{1.05, -0.5, -1.5, 1.5, 0.4, -1.05},
			{-1.5, -0.5, 1.05, -1.05, 0.4, 1.5},
			{1.05, -0.5, 1.05, 1.5, 0.4, 1.5},
			{-1.05, 0.4, -1.05, 1.05, 0.5, 1.05}
		}
	},
})

minetest.register_node("random_stuff:wood_structure_dummy_2", {
	on_dig = function(pos, node, digger)
		local p = {x = pos.x, y = pos.y - 2, z = pos.z}
		local n = minetest.get_node(p)
		if n.name == "random_stuff:wood_structure" then
			minetest.node_dig(p, n, digger)
		end
	end,

	description = "Chaos Wood Structure (Top)",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	buildable_to = true,
	pointable = true,
	drop = "",
	groups = {not_in_creative_inventory = 1, oddly_breakable_by_hand = 3},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.63, -0.5, 1.05, 1.63, 0.5, 1.63},
			{-1.63, -0.5, -1.63, 1.63, 0.5, -1.05},
			{-1.63, -0.5, -1.05, -1.05, 0.5, 1.05},
			{1.05, -0.5, -1.05, 1.63, 0.5, 1.05}
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-1.63, -0.5, 1.05, 1.63, 0.5, 1.63},
			{-1.63, -0.5, -1.63, 1.63, 0.5, -1.05},
			{-1.63, -0.5, -1.05, -1.05, 0.5, 1.05},
			{1.05, -0.5, -1.05, 1.63, 0.5, 1.05}
		}
	},
})

-- Chaos Chest implementation
local function get_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	return "size[8,9]" ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;8,4;]" ..
		"list[current_player;main;0,4.85;8,1;]" ..
		"list[current_player;main;0,6.08;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]"
end

minetest.register_node("random_stuff:chaos_chest", {
	description = "Chaos Chest",
	drawtype = "mesh",
	mesh = "chest.gltf",
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	buildable_to = true,
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	tiles = {"colormap.png"},

	-- Open/close animation definitions per specification (0.05s buffered)
	-- chest.gltf timings in seconds (continuous timeline):
	-- open = 0.05s - 0.35s
	-- close = 0.40s - 1.40s
	-- open_close = 1.45s - 3.45s
	animation = {
		open_start = 0.05, open_end = 0.35,
		close_start = 0.40, close_end = 1.40,
		open_close_start = 1.45, open_close_end = 3.45,
	},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Chaos Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		inv:add_item("main", "random_stuff:barrel 10")
		inv:add_item("main", "random_stuff:chair 10")
		inv:add_item("main", "random_stuff:table 10")
		inv:add_item("main", "random_stuff:wood_structure 10")
	end,

	can_dig = function(pos, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.show_formspec(clicker:get_player_name(), "random_stuff:chaos_chest_"..minetest.pos_to_string(pos), get_chest_formspec(pos))
		minetest.sound_play("default_chest_open", {pos = pos, gain = 0.3, max_hear_distance = 10}, true)
		if minetest.set_node_animation then
			minetest.set_node_animation(pos, {range = {x = 0.05, y = 0.35}, speed = 1, blend = 0})
		end
	end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local prefix = "random_stuff:chaos_chest_"
	if formname:sub(1, #prefix) == prefix then
		if fields.quit then
			local pos_str = formname:sub(#prefix + 1)
			local pos = minetest.string_to_pos(pos_str)
			if pos then
				minetest.sound_play("default_chest_close", {pos = pos, gain = 0.3, max_hear_distance = 10}, true)
				if minetest.set_node_animation then
					minetest.set_node_animation(pos, {range = {x = 0.40, y = 1.40}, speed = 1, blend = 0})
				end
			end
		end
	end
end)
