-- Skin from
-- https://pt.gta5-mods.com/paintjobs/chevrolet-blazer-bope
-- Credits: Rengav, VAAGPNF, MikeCavalcante3D, SMDesigner
-- FXServer Import by DuNOF
-- https://github.com/dunof/DuNOF-vRP

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

files {
	'data/vehicles.meta',
	'data/carcols.meta',
	'data/carvariations.meta',
	'data/handling.meta'
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

client_script 'data/vehicle_names.lua'