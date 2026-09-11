minetest.register_node("random_stuff:chaos_chest", {
	description = "Chaos Chest",
	drawtype = "mesh",
	mesh = "chest.gltf",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	tiles = {"texture_colormap.png"},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Chaos Chest")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
	end,

	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
	end,
})
