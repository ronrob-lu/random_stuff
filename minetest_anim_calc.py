def print_anims(anims, padding=0.05):
    curr = 0.0
    for name, dur in anims:
        start = curr + padding
        end = start + dur
        print(f"  {name.replace('-', '_')} = {{x = {start:.3f}, y = {end:.3f}}},")
        curr = end

print("Chest:")
chest_anims = [
    ("open", 0.300),
    ("close", 1.000),
    ("open-close", 1.300)
]
print_anims(chest_anims)
