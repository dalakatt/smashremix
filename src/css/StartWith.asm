// @ Description
// These constants must be defined for a menu item.
define LABEL("Start With")
constant VALUE_TYPE(CharacterSelectDebugMenu.value_type.STRING)
constant MIN_VALUE(0)
constant MAX_VALUE(Hazards.standard.POKEBALL - Hazards.standard.BEAM_SWORD + 1)
constant DEFAULT_VALUE(0)
// bitmask: [vs] [1p] [training] [bonus1] [bonus2]
constant APPLIES_TO(0b10100)
// bitmask: [human] [cpu]
constant APPLIES_TO_HUMAN_CPU(0b11)
constant VALUE_ARRAY_POINTER(Item.start_with_item)
constant ONCHANGE_HANDLER(0)

// @ Description
// Holds pointers to value labels
string_table:
dw string_none
dw string_beam_sword
dw string_home_run_bat
dw string_fan
dw string_star_rod
dw string_ray_gun
dw string_fire_flower
dw string_motion_sensor_bomb
dw string_bobomb
dw string_bumper
dw string_green_shell
dw string_red_shell
dw string_pokeball
dw string_random

// @ Description
// Value labels
string_none:; String.insert("None")
string_random:; String.insert("Random")
string_beam_sword:; String.insert("B Sword")
string_home_run_bat:; String.insert("HR Bat")
string_fan:; String.insert("Fan")
string_star_rod:; String.insert("Star Rod")
string_ray_gun:; String.insert("Ray Gun")
string_fire_flower:; String.insert("Flower")
string_motion_sensor_bomb:; String.insert("MS Bomb")
string_bobomb:; String.insert("Bobomb")
string_bumper:; String.insert("Bumper")
string_green_shell:; String.insert("Grn Shell")
string_red_shell:; String.insert("Red Shell")
string_pokeball:; String.insert("Pokeball")

// @ Description
// Runs before 1p modes to ensure settings aren't applied.
// @ Arguments
// a0 - port of human player
scope clear_settings_for_1p_: {
    addiu   sp, sp, -0x0010                 // allocate stack space
    sw      t0, 0x0004(sp)                  // ~

	li      t0, VALUE_ARRAY_POINTER         // t0 = address
	sw      r0, 0x0000(t0)                  // clear for 1p
	sw      r0, 0x0004(t0)                  // clear for 2p
	sw      r0, 0x0008(t0)                  // clear for 3p
	sw      r0, 0x000C(t0)                  // clear for 4p

    lw      t0, 0x0004(sp)
    addiu   sp, sp, 0x0010                  // deallocate stack space
    jr      ra
    nop
}
