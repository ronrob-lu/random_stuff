# The issue is "sand is still not stackable or a second wooden structure"
# Sand is a falling block. It falls from the sky.
# Sand checks `buildable_to`.
# If `wood_structure` had `buildable_to = false`, placing something inside it is prevented, EXCEPT `wood_structure` has a collision box at Y=1.5 and Y=2.5.
# If you drop sand, it falls through air.
# The nodes at (0,1,0) and (0,2,0) are AIR!
# Sand falls into (0,2,0). Air is not walkable. So it falls through.
# Sand falls into (0,1,0). Air is not walkable. So it falls through.
# Sand falls into (0,0,0). `wood_structure` IS walkable.
# BUT wait! Minetest falling entity checks `minetest.registered_nodes[n.name].walkable`.
# It checks the node AT its position!
# When sand is at Y=2.0, its rounded position is (0,2,0). The node there is air. Air is not walkable.
# So falling entity just keeps falling!
# It ignores the collision box of `wood_structure` extending into (0,2,0)!
# Minetest's falling node physics ONLY checks the integer node position's `walkable` property, NOT the actual collision box!
# Actually, wait. The falling entity has physical=true, so it collides with collision boxes!
# Yes! `physical = true` means it uses engine collision.
# When it hits the collision box at Y=1.5, its velocity becomes 0.
# In `builtin/game/falling.lua`, if `velocity.y == 0`, it means it landed!
# Then it rounds its position to place the node.
# It rounds Y=2.0 to (0,2,0).
# Then it places the sand node at (0,2,0).
# BUT... if it places the sand node at (0,2,0)...
# The sand node is at (0,2,0). Its bounds are 1.5 to 2.5 absolute.
# It perfectly sits on the platform!
# But then you try to drop ANOTHER sand.
# It falls. It hits the sand at (0,2,0) at Y=2.5!
# Its center is Y=3.0. It rounds to (0,3,0).
# It places sand at (0,3,0)!
# THIS ALL WORKS PERFECTLY in terms of falling logic.
# So WHY is it "not stackable"?
# Maybe because the user is trying to manually place them by right clicking?
# If you right click to place, as established, it targets (0,0,0) and adds normal (0,1,0), trying to place at (0,1,0).
# But (0,1,0) is air! So it PLACES the node at (0,1,0)!
# And when placed at (0,1,0), the sand block is at Y=0.5 to 1.5.
# This visually conflicts with the platform at Y=1.4 to 1.5.
# And if you place a second wood structure, it gets placed at (0,1,0).
# Its legs go from Y=0.5 to 2.4. Which completely clips through the first one!
# So manual stacking is broken because it all goes to (0,1,0).
