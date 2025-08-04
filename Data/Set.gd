## Version: 1.0
##
## HashSet implementation using a dictionary.
##
## This script is part the [Quark Collection](https://github.com/Brasonite/Quark) under the MIT license.

class_name Set extends RefCounted

signal values_changed

var inner := {}

func add(value: Variant) -> void:
	inner[value] = null
	values_changed.emit()

func remove(value: Variant) -> void:
	inner.erase(value)
	values_changed.emit()

func has(value: Variant) -> bool:
	return inner.has(value)

func single() -> Variant:
	if inner.keys().size() != 1:
		printerr("Tried to use `single` on set, but set has a size other than 1.")
		return null
	
	return inner.keys()[0]

func is_empty() -> bool:
	return inner.is_empty()

func size() -> int:
	return inner.size()

func values() -> Array:
	return inner.keys()
